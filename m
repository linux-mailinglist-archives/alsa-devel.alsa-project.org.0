Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE619719756
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 11:44:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94C9820C;
	Thu,  1 Jun 2023 11:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94C9820C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685612649;
	bh=EKbd9mpNJlQuwFsO8F+ktp+h3b16wSDr7XEsPzb0xTs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ng89m6ILuDDaheMU0TONMPDpBqUsV8/PjPI8ABxR6FE6B5HhRvWnHMvy+zmFqFbsX
	 hPD47cdG6HJqiMx1gJG5c818P1KDeS6L6BG5xgMSOR2iiuWOwjDYcLffvYUtUE+dpl
	 aYSSKRM6q/BvIUd3ejSIfQjJ96aFV9gkKkjzA6oE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE0F1F804DA; Thu,  1 Jun 2023 11:43:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 796A9F80132;
	Thu,  1 Jun 2023 11:43:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD84DF80149; Thu,  1 Jun 2023 11:43:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E268CF800C1
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 11:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E268CF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=QsDRgCTB
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3515TBNB016524;
	Thu, 1 Jun 2023 04:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=8slAiQhtNeEDPH5cE2i6jmsGl9SnzMbGOVBPNnG5StQ=;
 b=QsDRgCTBFtDzm+U2RhfKxqISLvpAdcBvJLxn1OBMIjtbZz+TJrBNQyQCwVpcx37oWgly
 Grr7uqq/g9B5WkWboIK5GJ5ayKOrz0btQbggtnHN0hVvTBzxBZR3yLSlpoISBJi6A4aW
 VKionq2LYUI3Kcn7OtZl4+VGsyKr3qtNOZfIchWRwR2zNFc3NF0sqMWBvbx8DZicXQDR
 ykauWIX2J3OOy/00HExLWTl6F13ZNinWvY9PYfNAeSEPiXHUthOoZp71MSmrSzc9cOcI
 1hI+83D9F3hlfRZjo+G/NjPcwUtP5PLsCbm1bcOzfy4SRolc8kFTDt1A6HtbTyPOMTyS 1Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3que9mx33j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 04:42:58 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 1 Jun
 2023 10:42:56 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 1 Jun 2023 10:42:56 +0100
Received: from [198.90.251.45] (EDIN6T9W333.ad.cirrus.com [198.90.251.45])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 92A8745;
	Thu,  1 Jun 2023 09:42:56 +0000 (UTC)
Message-ID: <78488c71-eef5-1a44-0b85-73c7ad0848c9@opensource.cirrus.com>
Date: Thu, 1 Jun 2023 10:42:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: CSC3551 and devices missing related _DSD bits
To: Armas Spann <armas@codux.tech>, Luke Jones <luke@ljones.dev>,
        Takashi Iwai
	<tiwai@suse.de>
CC: <linux-kernel@vger.kernel.org>, <tiwai@suse.com>,
        <sbinding@opensource.cirrus.com>, <perex@perex.cz>,
        <tangmeng@uniontech.com>, <andy.chi@canonical.com>,
        <p.jungkamp@gmx.net>, <kasper93@gmail.com>, <yangyuchi66@gmail.com>,
        <ealex95@gmail.com>, <james.schulman@cirrus.com>,
        <david.rhodes@cirrus.com>, <tanureal@opensource.cirrus.com>,
        <rf@opensource.cirrus.com>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>
References: <1991650.PYKUYFuaPT@fedora> <87jzx3zaf8.wl-tiwai@suse.de>
 <b4c202b2-ab29-e2aa-b141-0c967b2c1645@opensource.cirrus.com>
 <19d69a5da8f1d4017ac14ed87f927ab82278073d.camel@ljones.dev>
 <12102f7419c5e44cd2133aa769e25dbd16f4e0c9.camel@codux.tech>
From: Stuart Henderson <stuarth@opensource.cirrus.com>
In-Reply-To: <12102f7419c5e44cd2133aa769e25dbd16f4e0c9.camel@codux.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PgAw9JbGgD11sbnj0iAibcqjVuEEYWGw
X-Proofpoint-ORIG-GUID: PgAw9JbGgD11sbnj0iAibcqjVuEEYWGw
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XQR5BA7OOGRJK6CX6YLASKT5DIIB57W2
X-Message-ID-Hash: XQR5BA7OOGRJK6CX6YLASKT5DIIB57W2
X-MailFrom: prvs=15163cbc69=stuarth@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQR5BA7OOGRJK6CX6YLASKT5DIIB57W2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> Hi Takashi, Hi Stuart (and of course, all others in here),
>
> would you mind to evaluate this small (pseudo-)patch to be harmless?
> (concerning the blow-up theory the first answer in this converstion)
>
> I won't push it upstream right now but I want to know if this patch
> might be harmfull. I'm owning a GA402XY myself and we digged out that
> the initial setting of the cr3551 can be done via:
>
> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> index 75020edd39e7..eaa06751bd48 100644
> --- a/sound/pci/hda/cs35l41_hda.c
> +++ b/sound/pci/hda/cs35l41_hda.c
> @@ -1243,6 +1243,12 @@ static int cs35l41_no_acpi_dsd(struct
> cs35l41_hda *cs35l41, struct device *physd
>   		hw_cfg->bst_type = CS35L41_EXT_BOOST;
>   		hw_cfg->gpio1.func = CS35l41_VSPK_SWITCH;
>   		hw_cfg->gpio1.valid = true;
> +	} else if (strncmp(hid, "CSC3551", 7) == 0 && strcmp(cs35l41-
>> acpi_subsystem_id, "10431463") == 0) {
> +		// TESTING - (Hook for GA402X)
> +		dev_warn(cs35l41->dev, "Warning: ASUS didn't provide
> the needed ACPI _DSD properties for GA402X series, using defaults..");
> +		hw_cfg->bst_type = CS35L41_EXT_BOOST;
> +		hw_cfg->gpio1.func = CS35l41_VSPK_SWITCH;
> +		hw_cfg->gpio1.valid = true;
>   	} else {
>   		/*
>   		 * Note: CLSA010(0/1) are special cases which use a
> slightly different design.
I wouldn't recommend making speculative changes like the above. There 
are no "default" values as these attributes describe the hardware for 
the particular device and these can be different on each SKU.  In this 
case, it looks like the boost is being set incorrectly.  We're looking 
into how we can support these older devices, so please bear with us 
while we investigate.

