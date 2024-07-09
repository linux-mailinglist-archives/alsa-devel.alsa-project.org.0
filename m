Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF4A92BE86
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:35:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7AFADFA;
	Tue,  9 Jul 2024 17:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7AFADFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720539308;
	bh=FvWdonThAmJ/q75JTUddBwM9tvlSfcVWOIEazl2kr/I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pqH2XReiS9tWCcsQbsXO+Z7IjalndpXybbOaEGRyhiACaES8zSSJ65it4lEaP9rLk
	 WJJQWG+MO4MyaU2RFWfTRAkwBqudQ9akPn2XFirtd0lodzmpMflM5W5tnb+pBuGL8s
	 DTs55ZtcTMGfWoI09MSX9ylu0NO87Kie4o3ajXMo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACD0DF805B2; Tue,  9 Jul 2024 17:34:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C95C0F8058C;
	Tue,  9 Jul 2024 17:34:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 800F0F801F5; Tue,  9 Jul 2024 17:34:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A3E7F8013D
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 17:34:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A3E7F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=IV16cnaW
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4699T296013261;
	Tue, 9 Jul 2024 10:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=6Xe73+JU2eVQQ8xYXG
	t1Vn3w9CgNx65jHpc54wpvgKw=; b=IV16cnaWsSggxGT2sPvUjQSCnusIo7kGAe
	KmPur7U0780Xmq1vgMGMC8W2fQCWRqSkkoEd54VxA9lkyMUtw8FeyRSv5S9IEcEV
	P7OXD2QnC6dl3a05WFjyQXBvtdvWddhNxwlpl2L9cnQKN2Lo0yPUV2ByaCmMdLbn
	x8rkDgGD2SAGRdzo1UUUODr47n4+2PZSkFJ/GV49ILMvOXtQcFX3YdkDNXKQ630e
	TGW2/QLE8Psbfm9qnOJEcomZX3ceWuFNJh0IgNKaDlPnBScQGn0Rh2VEyJ7jYeT6
	rsAVzzH7K99CkuLyF59fCrj7YbIM9K/IUJ/48xjB873dc1C+8/XA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4072bjaumh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 10:34:16 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 16:33:57 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 9 Jul 2024 16:33:57 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 644CE820244;
	Tue,  9 Jul 2024 15:33:57 +0000 (UTC)
Date: Tue, 9 Jul 2024 16:33:56 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
CC: <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>
Subject: Re: [PATCH 3/4] firmware: cs_dsp: Merge wmfw format log message into
 INFO message
Message-ID: <Zo1YZHiE6WK3d8rm@opensource.cirrus.com>
References: <20240709145156.268074-1-rf@opensource.cirrus.com>
 <20240709145156.268074-4-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240709145156.268074-4-rf@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: hRAaVAlz16HcPybssSt-C_PeHfg3_Xgs
X-Proofpoint-GUID: hRAaVAlz16HcPybssSt-C_PeHfg3_Xgs
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: AW344QXGG6ZGP4P2JMTHGJSKBNFDELNF
X-Message-ID-Hash: AW344QXGG6ZGP4P2JMTHGJSKBNFDELNF
X-MailFrom: prvs=4920ac58a6=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AW344QXGG6ZGP4P2JMTHGJSKBNFDELNF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 09, 2024 at 03:51:55PM +0100, Richard Fitzgerald wrote:
> Log the WMFW file format version with the INFO_TEST message.
> 
> The behaviour of firmware controls depends on the WMFW format version,
> so this is useful information to log for debugging. But there's no
> need to use a separate log line just for this value.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  drivers/firmware/cirrus/cs_dsp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
> index 1bc2e0b6d40b..141a6c9d6737 100644
> --- a/drivers/firmware/cirrus/cs_dsp.c
> +++ b/drivers/firmware/cirrus/cs_dsp.c
> @@ -1502,7 +1502,6 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
>  		goto out_fw;
>  	}
>  
> -	cs_dsp_info(dsp, "Firmware version: %d\n", header->ver);
>  	dsp->fw_ver = header->ver;
>  
>  	if (header->core != dsp->type) {
> @@ -1552,7 +1551,7 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
>  		case WMFW_INFO_TEXT:
>  		case WMFW_NAME_TEXT:
>  			region_name = "Info/Name";
> -			cs_dsp_info(dsp, "%s: %.*s\n", file,
> +			cs_dsp_info(dsp, "%s (rev %d): %.*s\n", file, dsp->fw_ver,
>  				    min(le32_to_cpu(region->len), 100), region->data);

Are we sure on this one? I don't think a WMFW is required to
include an INFO/NAME block so it is now possible for this to not
get printed. Granted I have not seen one that doesn't include
at least one of these blocks but it isn't required. I think I
would lean towards keening the separate print personally.

Thanks,
Charles
