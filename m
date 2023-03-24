Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B56C80EE
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 16:14:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53B90E91;
	Fri, 24 Mar 2023 16:13:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53B90E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679670864;
	bh=ny0mQ3SAXK+PY+9gPkS7781xCct7bSODSCyo1xu9Ouw=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=SIQoWnG+WVMEAGC8TUEXkiPcDx0/Wl8xRS93LXHF1CHD8E66Fsqmjzj4pjGYmKFRc
	 YRQJWqsJcW6q2CfKV3XLXCitFmHizx7+S7MBtm2M6PTdEtBZdwL8riZ2tLsmklIO67
	 gYZRby4ALPcNxAVTJ/5GjpEE5oeca/9BcU0tpCMA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4A9CF8027B;
	Fri, 24 Mar 2023 16:13:33 +0100 (CET)
Date: Fri, 24 Mar 2023 15:13:19 +0000
Subject: Re: [PATCH next] ASoC: cs35l56: Remove redundant return statement in
 cs35l56_spi_probe()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
References: <20230324145535.3951689-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20230324145535.3951689-1-harshit.m.mogalapalli@oracle.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AWJNOEA3PI5TX2VB3JGEVWQFWEK7U3MB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167967081288.26.13303471790898624841@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: error27@gmail.com, James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Simon Trimmer <simont@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECFCBF802E8; Fri, 24 Mar 2023 16:13:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43A77F800C9
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 16:13:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43A77F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hukVNPJx
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32OCMYLV023795;
	Fri, 24 Mar 2023 10:13:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=OY6gbhc5rqK8NYwaF/FMiViAq5PqtbZQ2uVGYmYXC0I=;
 b=hukVNPJxDWEhPwK5RMrGrnxDcVcMD01NYtmPDO2Tm1dQuHvPKKOmKxUC9+029W/NzHcX
 2fNpBiUSSqWvpbmx/WisDoN7XE0n2fDg6Sp5Wol8ykJGEAaU1DyvzH1rYTGn4VJ7mNgJ
 fXYQBHO2KHAUWw2xTihwNxrVNBaABWW/WF0fcidAkhWsKJFKS9XIGcdqeqSIYyv1iYqn
 IY/9SyyRAjNVPRwJUogpuGUVeuXdWRGHuZjyHV5dum+bHqtlyLLBnHK8Ozpd1yfaX9v/
 l11byvjchL6FKUG4UDShLo7ktPQGCxQyfi7VtfvvM3raMWhai5qU5ZkkeA8aGqrZNS2J nQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pgy30h0qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 10:13:22 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Fri, 24 Mar
 2023 10:13:20 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Fri, 24 Mar 2023 10:13:20 -0500
Received: from [198.90.251.127] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D206511D4;
	Fri, 24 Mar 2023 15:13:19 +0000 (UTC)
Message-ID: <11a0b85f-d705-145d-fc6a-1bcbb78d3686@opensource.cirrus.com>
Date: Fri, 24 Mar 2023 15:13:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH next] ASoC: cs35l56: Remove redundant return statement in
 cs35l56_spi_probe()
Content-Language: en-US
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
References: <20230324145535.3951689-1-harshit.m.mogalapalli@oracle.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20230324145535.3951689-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ScCh2NKqnHL0z9szIBr078J_Gg_bgyKa
X-Proofpoint-ORIG-GUID: ScCh2NKqnHL0z9szIBr078J_Gg_bgyKa
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: AWJNOEA3PI5TX2VB3JGEVWQFWEK7U3MB
X-Message-ID-Hash: AWJNOEA3PI5TX2VB3JGEVWQFWEK7U3MB
X-MailFrom: prvs=8447a757ae=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: error27@gmail.com, James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Simon Trimmer <simont@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AWJNOEA3PI5TX2VB3JGEVWQFWEK7U3MB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/03/2023 14:55, Harshit Mogalapalli wrote:
> We have unreachable 'return ret' statement in cs35l56_spi_probe(),
> delete it as its dead code..
> 
> This is found by static analysis with smatch.
> 
> Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> Only compile tested.
> ---
>   sound/soc/codecs/cs35l56-spi.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs35l56-spi.c b/sound/soc/codecs/cs35l56-spi.c
> index 80dcf37daae2..4b2084e85f29 100644
> --- a/sound/soc/codecs/cs35l56-spi.c
> +++ b/sound/soc/codecs/cs35l56-spi.c
> @@ -29,7 +29,6 @@ static int cs35l56_spi_probe(struct spi_device *spi)
>   	if (IS_ERR(cs35l56->regmap)) {
>   		ret = PTR_ERR(cs35l56->regmap);
>   		return dev_err_probe(&spi->dev, ret, "Failed to allocate register map\n");
> -		return ret;
>   	}
>   
>   	cs35l56->dev = &spi->dev;
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
