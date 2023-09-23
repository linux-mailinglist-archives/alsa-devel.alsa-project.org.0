Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FC27AC1FF
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Sep 2023 14:23:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F28A3886;
	Sat, 23 Sep 2023 14:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F28A3886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695471803;
	bh=XCn3g6VrtWVvCyfdM5/ATwi/EFcM272P3JkBTJvdl9w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hiwc2fin+9/ZRm0OPHWzjw9tNIPjKVE8y9asWir9yC+LPi0kWQR93tg0uUI5HVxVn
	 +yVqWZLHwqCkh4CId6SjuspCs4ZBH8x2JWogI3Pzgk3sHTmv5taU5rWuvPdgJYNWTT
	 zTsnsxYVQ+8e9LWMBkeMoD5KEE3YWXjt6Hw8l91k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47196F800AA; Sat, 23 Sep 2023 14:22:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA28DF80125;
	Sat, 23 Sep 2023 14:22:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6623AF8025A; Sat, 23 Sep 2023 14:22:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DATE_IN_FUTURE_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from omta40.uswest2.a.cloudfilter.net
 (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2630CF80124
	for <alsa-devel@alsa-project.org>; Sat, 23 Sep 2023 14:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2630CF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.a=rsa-sha256 header.s=default header.b=h3eHSGpp
Received: from eig-obgw-6001a.ext.cloudfilter.net ([10.0.30.140])
	by cmsmtp with ESMTP
	id jkvmqGuTYbK1Vk1eFql75C; Sat, 23 Sep 2023 12:22:11 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id k1eEqSdMxuMYjk1eFq2tPA; Sat, 23 Sep 2023 12:22:11 +0000
X-Authority-Analysis: v=2.4 cv=RtrWkQqK c=1 sm=1 tr=0 ts=650ed873
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=NwbpVL58AAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8
 a=foHCeV_ZAAAA:8 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=tNWvAHffTtQgx3ZTRG8Q:22 a=AjGcO6oz07-iQ99wixmX:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=h8a9FgHX5U4dIE3jaWyr:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MSqzGt9UPF/qfrZg382/BJIq8GRlN4t6fuaOHKqouVk=; b=h3eHSGppG8aL2sTqNmwGzFk8RX
	bCel+HJ6ZDApjZGTwxq6N6Y4051hjdcyd9Z/364iEtKUFRiodOhNGBiU9g0JmzsatzaMG7Vr+rmFk
	rEbNLVLT97eRpw57p7VaUE4JvXh/FByGB7FVtAbd9fCCmOBMWUznMij6EuaOb1b/WrzBa23gZZg27
	uIdBaDQVcrLzZ1DnI98JiaovZq+wJ6C5meVeTi5za/74sJ90ySNgsUdtaNXQrDAbd+rBCrVpeRYbf
	NU7AmJk7ac6oM7dJQqXfFKbna27k6FKOOXtpz9FurtiBD5p7NRnBofkQNypLKa2kLipwFOKSuYedm
	7EZUSL7A==;
Received: from [94.239.20.48] (port=49974 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qjy1T-003YxY-0f;
	Sat, 23 Sep 2023 03:29:55 -0500
Message-ID: <5b288203-e26d-9fd2-fc5f-e30e78f0202e@embeddedor.com>
Date: Sat, 23 Sep 2023 10:30:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] ASoC: apple: mca: Annotate struct mca_data with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, =?UTF-8?Q?Martin_Povi=c5=a1er?=
 <povik+lin@cutebit.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 asahi@lists.linux.dev, alsa-devel@alsa-project.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922175050.work.819-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175050.work.819-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.239.20.48
X-Source-L: No
X-Exim-ID: 1qjy1T-003YxY-0f
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:49974
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: 
 MS4xfGXugUWTtXOCkAlZWDtEStJprlRFzPrd3CRfjMwJ7Q+zn9I5OvM38kpFN0v8a+X2eryJs+gwtJHRYJ5p3pmR91CaL2FyWHxD0l/rMCo58LvhdSMkBMVS
 v6P2VaQDMIeKIagzTHhNOxaLGmlEuC1yAceEz/kgwrdh3UeAbi7omAsWskosDWAjBE7gcdpE0fWhaqtzQ4530gbcDBnBQKBrb7snSS58IOVdbCYDpT6ylJD4
Message-ID-Hash: ZMW4XGWZTFDPSSO42NBHXV44WZWA2DPE
X-Message-ID-Hash: ZMW4XGWZTFDPSSO42NBHXV44WZWA2DPE
X-MailFrom: gustavo@embeddedor.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZMW4XGWZTFDPSSO42NBHXV44WZWA2DPE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/22/23 11:50, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct mca_data.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: "Martin Povišer" <povik+lin@cutebit.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: asahi@lists.linux.dev
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   sound/soc/apple/mca.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
> index ce77934f3eef..99e547ef95e6 100644
> --- a/sound/soc/apple/mca.c
> +++ b/sound/soc/apple/mca.c
> @@ -161,7 +161,7 @@ struct mca_data {
>   	struct mutex port_mutex;
>   
>   	int nclusters;
> -	struct mca_cluster clusters[];
> +	struct mca_cluster clusters[] __counted_by(nclusters);
>   };
>   
>   static void mca_modify(struct mca_cluster *cl, int regoffset, u32 mask, u32 val)
