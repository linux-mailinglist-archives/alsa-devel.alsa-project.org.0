Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 437258260E5
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jan 2024 18:29:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2DB5EA6;
	Sat,  6 Jan 2024 18:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2DB5EA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704562171;
	bh=ZnCSDEVUUBYCWGioB3vX1cbTgSLukQmtJwwlUzLInDQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZsZoFuCsT/K86qzksNHurTV2JUeY0Nc++oSyPpjZ4jYsuEHmuzL0cJJldFv83Ig+a
	 0fGYsgjrbVwfd3b3IcjDlPQjAxfs3AhQJn11eK/ztp1lqwaON0pymhatXmiJCPsUUB
	 Zqu/TI+Lssw3fMk7P5IA3gd9SzNX22zDcsD1NgiY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D5F9F80564; Sat,  6 Jan 2024 18:28:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE741F80587;
	Sat,  6 Jan 2024 18:28:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C4AFF804B0; Sat,  6 Jan 2024 18:28:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from omta040.useast.a.cloudfilter.net
 (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEBF9F802DB
	for <alsa-devel@alsa-project.org>; Sat,  6 Jan 2024 18:28:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEBF9F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.a=rsa-sha256 header.s=default header.b=gowa6Gk2
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTPS
	id M343rQJU6THHuMATNrO9I7; Sat, 06 Jan 2024 17:28:37 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id MATLrxkPsKleDMATMrvV9V; Sat, 06 Jan 2024 17:28:36 +0000
X-Authority-Analysis: v=2.4 cv=KcbBDCUD c=1 sm=1 tr=0 ts=65998dc4
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=GfQleyYEO+cc22AUyTT7qQ==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=dEuoMetlWLkA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=7YfXLusrAAAA:8 a=VwQbUJbxAAAA:8 a=3gf6MFcAdpgbip9PbcIA:9 a=QEXdDO2ut3YA:10
 a=SLz71HocmBbuEhFRYD3r:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jqbX15IrQLQ95FamULlsdlZsBzcnY9l7VxFlPvs2xck=; b=gowa6Gk2iiQNWan/JlPXQpunW0
	JPEGeHxCpmxiNUaJFG1hrEEL/H+UHDClk6YUK04blgYe6y3ls55iWqSbiOjE8jM+nsH8lmDf64A2B
	EU/Bptw8Qn09Itv9E2lA9R2z4zzu55/jNPz4VvpdMqLMKj5jK1uHylWgtlReif2G0u6BkJNAfWTw5
	u05V4MCK5ymyXYbnrnEN+plo/imTUq4UBGloGM2TL5Zde9Yjt5yiwK/mv5xWLkwtITAo6XovpAElG
	F9Nm1KHOze/dLMH9zkk6qf0qrU1kDjWntuijVFA7aUEc7rz4VlwW2vVAKJ3A3B+TS7e2egImVjxqB
	cu2xrHAQ==;
Received: from 187.184.157.186.cable.dyn.cableonline.com.mx
 ([187.184.157.186]:54571 helo=[192.168.0.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rMATK-002YaE-2e;
	Sat, 06 Jan 2024 11:28:34 -0600
Message-ID: <1b3c3242-d239-465b-990c-33680291ec46@embeddedor.com>
Date: Sat, 6 Jan 2024 11:28:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: ti: Use devm_kcalloc() instead of devm_kzalloc()
Content-Language: en-US
To: Erick Archer <erick.archer@gmx.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20240106162752.18599-1-erick.archer@gmx.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240106162752.18599-1-erick.archer@gmx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.184.157.186
X-Source-L: No
X-Exim-ID: 1rMATK-002YaE-2e
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187.184.157.186.cable.dyn.cableonline.com.mx ([192.168.0.10])
 [187.184.157.186]:54571
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: 
 MS4xfCV3yv9BxzTQu9nwuCnQjYD0GQQvaBJcxyzm6CA76V0Z+4M0iFARU89RpzVXSXKZTN4cxKoeQ2CSjeyB/0K6mSUS4C9YDW1xV8xzMV55vd8XupdjeuKx
 sl0tCpNA1oYwJbpaO/hoPe+iSRDhHUfiQLgL73JY4kV9nXA1oUX0tu/R6Zf2QpVfnGLR3YIFnwjNv+/QHG/07SMF3lJiFSi5qDNOSDDwox78cyLyqaNrleL3
Message-ID-Hash: VXU234VSBP2ICBYNVFE4DJMC3TDFCZ3T
X-Message-ID-Hash: VXU234VSBP2ICBYNVFE4DJMC3TDFCZ3T
X-MailFrom: gustavo@embeddedor.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VXU234VSBP2ICBYNVFE4DJMC3TDFCZ3T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 1/6/24 10:27, Erick Archer wrote:
> Use 2-factor multiplication argument form devm_kcalloc() instead
> of devm_kzalloc().
> 
> Link: https://github.com/KSPP/linux/issues/162
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
-- 
Gustavo

> ---
>   sound/soc/ti/j721e-evm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
> index b4b158dc736e..d9d1e021f5b2 100644
> --- a/sound/soc/ti/j721e-evm.c
> +++ b/sound/soc/ti/j721e-evm.c
> @@ -649,7 +649,7 @@ static int j721e_soc_probe_cpb(struct j721e_priv *priv, int *link_idx,
>   	 * Link 2: McASP10 <- pcm3168a_1 ADC
>   	 */
>   	comp_count = 6;
> -	compnent = devm_kzalloc(priv->dev, comp_count * sizeof(*compnent),
> +	compnent = devm_kcalloc(priv->dev, comp_count, sizeof(*compnent),
>   				GFP_KERNEL);
>   	if (!compnent) {
>   		ret = -ENOMEM;
> @@ -763,7 +763,7 @@ static int j721e_soc_probe_ivi(struct j721e_priv *priv, int *link_idx,
>   	 *		   \ pcm3168a_b ADC
>   	 */
>   	comp_count = 8;
> -	compnent = devm_kzalloc(priv->dev, comp_count * sizeof(*compnent),
> +	compnent = devm_kcalloc(priv->dev, comp_count, sizeof(*compnent),
>   				GFP_KERNEL);
>   	if (!compnent) {
>   		ret = -ENOMEM;
> --
> 2.25.1
> 
> 
