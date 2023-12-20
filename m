Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD83A81A031
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Dec 2023 14:48:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3754B857;
	Wed, 20 Dec 2023 14:48:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3754B857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703080093;
	bh=4gog4OUmW0WFIM+V697BaEfBtzY1hR9SwAqwTYFGutM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eRxyiWYhglCnvbtPR1QxYrqTsWlwxvqH8AlBK0J57e7xcGWxkSSE6qfVnnT2DKrvZ
	 xQKpEV6obfxwgNbHnsAcmEpJL04pGHpqhrUUtPxC3LsL+qksrLdhtPAYXNom/vSdks
	 kF2vFG5GdATSLKRALh72otVMBwu1mlSzS0acfNTQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 981C2F805A1; Wed, 20 Dec 2023 14:47:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C419F8057A;
	Wed, 20 Dec 2023 14:47:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5CD1F80425; Wed, 20 Dec 2023 14:47:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B92C7F8016E
	for <alsa-devel@alsa-project.org>; Wed, 20 Dec 2023 14:47:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B92C7F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=rAMkc3gV
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BKC0E8C006041;
	Wed, 20 Dec 2023 07:47:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=Tp6g2CdyJwpZ2rNo6ZpKnHmwqi+/RP+c3zOGdaQf9uk=; b=
	rAMkc3gVZ+otKNsagQchlCiQ7pI7TuMrAmBZsWoFPYK9ylOEINL904OlN9jFOtN2
	5mqr5rd3tKqUjE42h1jYr7oEM+dRIG37ZzRG5eLvWG6PT4RaS2d9UP9tOTy0adxc
	UCO9aaQgPB84PF3FNfXRHtM09VjwQ6Ul6UYdzozE3V8Nnc8+sUYhWaKd8ySsa+P4
	RLGH+KKZU0ecYQmjts4rkl0bIopSejSmCmXETjuoBRblaQdUyB+ljZ95/BvVMKs7
	r4GrETDyKGsAYFv5uqUyLffKBWA/xEufVSyWmmmT8q1kGfAAXQEhDeacK5JPD/Br
	Wdjb/QUhn5r5X4auVEQ0lA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3v196ndekg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 07:47:29 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Dec
 2023 13:47:27 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Wed, 20 Dec 2023 13:47:27 +0000
Received: from [198.61.64.132] (LONN2DGDQ73.ad.cirrus.com [198.61.64.132])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8BA75468;
	Wed, 20 Dec 2023 13:47:27 +0000 (UTC)
Message-ID: <4c43e702-aea0-4f61-9b05-57f0621937a2@opensource.cirrus.com>
Date: Wed, 20 Dec 2023 13:47:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ALSA: hda: cs35l41: Support Dell XPS 9530 (2023)
Content-Language: en-GB
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, <tiwai@suse.de>
CC: <alsa-devel@alsa-project.org>, <david.rhodes@cirrus.com>,
        <james.schulman@cirrus.com>, <josbeir@gmail.com>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <perex@perex.cz>, <stuarth@opensource.cirrus.com>, <tiwai@suse.com>
References: <87ttokpyws.wl-tiwai@suse.de>
 <20231220073809.22027-1-alex.vinarskis@gmail.com>
 <20231220073809.22027-3-alex.vinarskis@gmail.com>
From: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <20231220073809.22027-3-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5FABrB1xRosgoQIBWrmgHxCk30_SCchI
X-Proofpoint-GUID: 5FABrB1xRosgoQIBWrmgHxCk30_SCchI
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JBV7UFGQQEHZLTOP6H6FKCMLGBF4RPBB
X-Message-ID-Hash: JBV7UFGQQEHZLTOP6H6FKCMLGBF4RPBB
X-MailFrom: prvs=7718def8b8=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JBV7UFGQQEHZLTOP6H6FKCMLGBF4RPBB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 20/12/2023 07:38, Aleksandrs Vinarskis wrote:
> Add new model entries into configuration table.
>
> Co-developed-by: Jasper Smet <josbeir@gmail.com>
> Signed-off-by: Jasper Smet <josbeir@gmail.com>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>   sound/pci/hda/cs35l41_hda_property.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
> index cb305b093311..ee105743333f 100644
> --- a/sound/pci/hda/cs35l41_hda_property.c
> +++ b/sound/pci/hda/cs35l41_hda_property.c
> @@ -41,6 +41,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
>    * Since this laptop has valid ACPI, we do not need to handle cs-gpios, since that already exists
>    * in the ACPI. The Reset GPIO is also valid, so we can use the Reset defined in _DSD.
>    */
> +	{ "10280BEB", SPI, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 0, 0, 0 },

The configuration is correct, however the comment above it applies to 
the laptop below, so the entry needs to be above the comment.

I was planning on pushing up a patch myself (hopefully today) which 
includes this laptop, as well as a couple of other Dell laptops.
In the same chain is a patch to prevent firmware loading on systems with 
slow SPI speed.

It may be wise to wait for those patches instead.

Thanks,

Stefan

>   	{ "103C89C6", SPI, 2, INTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, 0, 0 }, -1, -1, -1, 1000, 4500, 24 },
>   	{ "104312AF", SPI, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
>   	{ "10431433", I2C, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
> @@ -355,6 +356,7 @@ struct cs35l41_prop_model {
>   static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
>   	{ "CLSA0100", NULL, lenovo_legion_no_acpi },
>   	{ "CLSA0101", NULL, lenovo_legion_no_acpi },
> +	{ "CSC3551", "10280BEB", generic_dsd_config },
>   	{ "CSC3551", "103C89C6", generic_dsd_config },
>   	{ "CSC3551", "104312AF", generic_dsd_config },
>   	{ "CSC3551", "10431433", generic_dsd_config },
