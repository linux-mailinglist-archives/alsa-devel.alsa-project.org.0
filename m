Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5689D76504E
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 11:53:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00FED82A;
	Thu, 27 Jul 2023 11:52:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00FED82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690451588;
	bh=CN29GPFcJFjZ2c56PzWCOYhOLEb0X60LomUOSMxIV6c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s9e8MxEQ8niHTsgS9uXim+7OUbhHHWbBySl94oBdh/ygDLynqZHcqFYataRJZb1v4
	 x49Kd3hYCk0Txqh+5aa7D50xfMl90xvAeUVfAE9O2jeQFzqciNVcOzwALSrz0Q9dN2
	 dTvdRbB3qTNktOxSy1QTQ2NfA+jr0eyNItTi7gso=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83363F80163; Thu, 27 Jul 2023 11:52:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46FBDF80163;
	Thu, 27 Jul 2023 11:52:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C100CF8019B; Thu, 27 Jul 2023 11:52:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6B95F80149
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 11:52:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6B95F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=AHazICh5
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36R9ggbV020713;
	Thu, 27 Jul 2023 04:51:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=y9h5w3kgmuNZ6VZiUFw3aKCfaW0c+5Bld4TOeOpz9UU=; b=
	AHazICh5tRi4cJGekA/HbdN7FiT8MVP8iFV+anzRlM+vouTxLT1c/XLhO6Lym4VJ
	rw87fpWcVASILVF86JJmQy5/xfA1F3qEXw3tjEmgM/s3GbIY2Mq8cCw+NfEXG2pO
	9nNAdA8b0a+mYuezC3uu/qCUTlmu1/OgOPdsHwGUi51JLPXdiELXyIP8+IrbtSjD
	x9gk/HTAQQrYPoKZZayCRwcWQaZ9/VLJEMyibi5DjZsGXBKZUvVywr23/+8zRAdE
	tixNh1gGtR/9nOlLCzmXYSKW5r60/2fnQ8B83RWj/Lca+9DT4hOrsM6w9tvEVPv/
	Fc2nqh2kes4+OmGIEtEgIA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3s1nm9bsmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 04:51:59 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 27 Jul
 2023 10:51:34 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Thu, 27 Jul 2023 10:51:34 +0100
Received: from [198.61.65.196] (EDIN4L06LR3.ad.cirrus.com [198.61.65.196])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A093A45;
	Thu, 27 Jul 2023 09:51:33 +0000 (UTC)
Message-ID: <1bcfb2f4-f893-98a3-6919-132cb4ebbd1f@opensource.cirrus.com>
Date: Thu, 27 Jul 2023 10:51:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ALSA: hda/cs35l56: Do some clean up on probe error
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Simon Trimmer
	<simont@opensource.cirrus.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mark
 Brown <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <kernel-janitors@vger.kernel.org>
References: <465160f4-b7cf-41d5-931e-d6c9e68fa3c7@moroto.mountain>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <465160f4-b7cf-41d5-931e-d6c9e68fa3c7@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OFtSwBymQZyL1os5hbf0l72vMwEz-7qQ
X-Proofpoint-GUID: OFtSwBymQZyL1os5hbf0l72vMwEz-7qQ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YIP5UKPFLYCQNLD2DO2Q2Z3FPIO32PMF
X-Message-ID-Hash: YIP5UKPFLYCQNLD2DO2Q2Z3FPIO32PMF
X-MailFrom: prvs=25724d2f4b=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YIP5UKPFLYCQNLD2DO2Q2Z3FPIO32PMF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/7/23 08:16, Dan Carpenter wrote:
> Smatch complains that this return should be a goto:
> 
>      sound/pci/hda/cs35l56_hda.c:910 cs35l56_hda_common_probe()
>      warn: missing unwind goto?
> 
> The goto error disables cansleep so that seems reasonable.
> 
> Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   sound/pci/hda/cs35l56_hda.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
> index 71e95e64f8a4..4c3279f61b94 100644
> --- a/sound/pci/hda/cs35l56_hda.c
> +++ b/sound/pci/hda/cs35l56_hda.c
> @@ -907,7 +907,7 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int id)
>   
>   	ret = cs35l56_set_patch(&cs35l56->base);
>   	if (ret)
> -		return ret;
> +		goto err;
>   
>   	regcache_mark_dirty(cs35l56->base.regmap);
>   	regcache_sync(cs35l56->base.regmap);

Thanks.

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
