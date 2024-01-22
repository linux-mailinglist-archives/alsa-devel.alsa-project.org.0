Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8ED836744
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 16:13:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73B0386F;
	Mon, 22 Jan 2024 16:12:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73B0386F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705936383;
	bh=o205dA9KTuKJnFXhFeL4SaTHyssuKFB0zM0G0NFc6Dc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LRAgko7KA469bcHgIMd1r1LhHP/Hmj3YVtWh4LnBmNrD17vx5V3JXo2ZWSKAtqW8t
	 M7hPhCrClm3rkroaPxuVGSRMyVwJse/4ugIYmem+rt7BBKF7hxEdohmgw89XPU324V
	 IkT9GppsLrmVgbqZR2Qc62yeuyu9XY6GTlqxjRD0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65928F8059F; Mon, 22 Jan 2024 16:12:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81DFDF8055B;
	Mon, 22 Jan 2024 16:12:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C198F8025F; Mon, 22 Jan 2024 16:12:25 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D7982F8020D
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 16:12:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7982F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=joUCGuQr
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40M6XGBI015332;
	Mon, 22 Jan 2024 09:12:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=+iHALaXLYA4PNuX
	W2xwffrmv76Pc5m+6eQ7rN8n4yUU=; b=joUCGuQrbAiS9epo0w4DT6gwxCTLMGd
	RUo7xWc54xxvTQe7ly0QDbt402qnW6pMD+t5abbtA/qg0um7a7Vp4xto4RSK51EB
	sPQcql+eftDQVb2nLz05GOZDvlPdkJJCmBsw0wxK3Kf6fXjxszEMYaxZXG4Crlf7
	x2rxJ8GeUPvrApgypnflCRLz3peLFdiuKwjqRnI8Bu7vYvnDfw7drB0QrfFu3E0C
	JDimN5FAPUSfq2nfrKXXTcJKnqqqgY1RvU03PkDZGcdnA+LcxZKENlQAv3Blny3j
	Jx765v2RduX3Hjf42Z/oJOp1nzqpkddTwf9HyHj1kMSllq1IkoOoGPA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vrbfptn44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 09:12:20 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 22 Jan
 2024 15:12:18 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Mon, 22 Jan 2024 15:12:18 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B385915B7;
	Mon, 22 Jan 2024 15:12:18 +0000 (UTC)
Date: Mon, 22 Jan 2024 15:12:18 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>,
        Cezary Rojewski
	<cezary.rojewski@intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen
	<kai.vehmanen@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: Intel: mtl-match: Add cs42l43_l0 cs35l56_l23 for
 MTL
Message-ID: <20240122151218.GD16899@ediswmail.ad.cirrus.com>
References: <20240122150156.68983-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240122150156.68983-1-mstrozek@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: MkOKC_22gdf3RxtPlb-7QnD4K_IGM8IL
X-Proofpoint-GUID: MkOKC_22gdf3RxtPlb-7QnD4K_IGM8IL
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: OH4KMCVDYK6YFEPQ4BZTY34MYTY6DGFO
X-Message-ID-Hash: OH4KMCVDYK6YFEPQ4BZTY34MYTY6DGFO
X-MailFrom: prvs=875137619d=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OH4KMCVDYK6YFEPQ4BZTY34MYTY6DGFO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jan 22, 2024 at 03:01:56PM +0000, Maciej Strozek wrote:
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---
>  .../intel/common/soc-acpi-intel-mtl-match.c   | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> index feb12c6c85d1..625f991b1ad4 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> @@ -377,6 +377,36 @@ static const struct snd_soc_acpi_adr_device cs35l56_2_adr[] = {
>  	}
>  };
>  
> +static const struct snd_soc_acpi_adr_device cs35l56_2_r_adr[] = {
> +	{
> +		.adr = 0x00023301FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_r_endpoint,
> +		.name_prefix = "AMP3"
> +	},
> +	{
> +		.adr = 0x00023201FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_3_endpoint,
> +		.name_prefix = "AMP4"
> +	}
> +};

Sorry the amp ordering is still weird here, can we have:

static const struct snd_soc_acpi_adr_device cs35l56_2_r_adr[] = {
	{
		.adr = 0x00023201FA355601ull,
		.num_endpoints = 1,
		.endpoints = &spk_r_endpoint,
		.name_prefix = "AMP3"
	},
	{
		.adr = 0x00023301FA355601ull,
		.num_endpoints = 1,
		.endpoints = &spk_3_endpoint,
		.name_prefix = "AMP4"
	}
};

Thanks,
Charles

> +
> +static const struct snd_soc_acpi_adr_device cs35l56_3_l_adr[] = {
> +	{
> +		.adr = 0x00033001fa355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_l_endpoint,
> +		.name_prefix = "AMP1"
> +	},
> +	{
> +		.adr = 0x00033101fa355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_2_endpoint,
> +		.name_prefix = "AMP2"
> +	}
> +};
