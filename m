Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEBF8D32EE
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2024 11:28:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F26D85D;
	Wed, 29 May 2024 11:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F26D85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716974914;
	bh=FnKd5nzM8mR2FvKTirbhBssTJd+tTuzMgMhZji/i2vg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kWZp8PH0Z4VpFbM+2i3iJT932ruJV0gI2yGnszlGld9vYArUDsopK18XZ3ITZrXbV
	 VsT8O2UTlOAFQpr5DMg2NLMc4wFMwNtawVhQ8OWcfe71kd9zs5kCQhBoKDifNJlTf9
	 7gJs3Hkr8tLvyAGDqLDML8TfRZq0oxhYE1MPlV88=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C6E9F805AC; Wed, 29 May 2024 11:28:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D98DCF8051D;
	Wed, 29 May 2024 11:28:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FE4CF80149; Wed, 29 May 2024 11:27:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67585F8003A
	for <alsa-devel@alsa-project.org>; Wed, 29 May 2024 11:27:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67585F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=CNygjdhq
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44T71lYf017078;
	Wed, 29 May 2024 04:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=WlccN8jb3Q5to6M1Eg
	/oq2y4/iT4u5AUxawzHNNeQbI=; b=CNygjdhqwbMv3X5jbA88rlXBo4vRPoLY4x
	KpTRbIqGAhYoNvMopEuu7mU3MsgeWkjsmpTBR2ciuXnXtv3jVQx5lj4wdkVz5nZi
	aQWM8/IO5LB0Nco+eonvd9X850AmoC1SPhWVaCuO+58x3WFx7NBIZ5EEQhoPK6TM
	HR7pvznvVcfQ5F8m+xJd7v6wFJeQY5GOm83zxfb9/eRbgCiMR+Sp3oiky+ek+tpW
	l8r0eAAOvVbaHu5n0vMTKdZRh9tOZMQsvSsxWVvnCTOjRnB18pjFCLHQwrPCynMg
	fzmnFGPCHKMx1G88bBA2rvWXbXBe0615O2y4j/uhwO/ZY3y24XWA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ybdcwubdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 04:27:50 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 10:27:48 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 29 May 2024 10:27:48 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 66448820270;
	Wed, 29 May 2024 09:27:48 +0000 (UTC)
Date: Wed, 29 May 2024 09:27:47 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <tiwai@suse.de>, <broonie@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof-sdw: fix missing SPI_MASTER dependency
Message-ID: <Zlb1E1KWt9zNVj0s@opensource.cirrus.com>
References: <20240527191940.30107-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240527191940.30107-1-pierre-louis.bossart@linux.intel.com>
X-Proofpoint-GUID: 6S_Ye5YPmcC-XCDvqhj8du9Xmp-iezy3
X-Proofpoint-ORIG-GUID: 6S_Ye5YPmcC-XCDvqhj8du9Xmp-iezy3
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 24OERAWACZASHZP7B6C5RMQP23G3KIFX
X-Message-ID-Hash: 24OERAWACZASHZP7B6C5RMQP23G3KIFX
X-MailFrom: prvs=3879dd8593=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/24OERAWACZASHZP7B6C5RMQP23G3KIFX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, May 27, 2024 at 02:19:40PM -0500, Pierre-Louis Bossart wrote:
> The addition of the Cirrus Logic 'sidecar' amps adds a dependency on SPI_MASTER.
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for SND_SOC_CS35L56_SPI
>    Depends on [n]:
>      SOUND [=y] && SND [=y] && SND_SOC [=y] && SPI_MASTER [=n] &&
>      (SOUNDWIRE [=y] || !SOUNDWIRE [=y])
>    Selected by [y]:
>     - SND_SOC_INTEL_SOUNDWIRE_SOF_MACH [=y] && SOUND [=y] && SND [=y]
>       && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] &&
>       SND_SOC_SOF_INTEL_SOUNDWIRE [=y] && I2C [=y] && ACPI [=y] &&
>       (MFD_INTEL_LPSS [=y] || COMPILE_TEST [=n]) &&
>       (SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES [=y] || COMPILE_TEST
>       [=n]) && SOUNDWIRE [=y]
> 
> Fixes: b831b4dca48d ("ASoC: intel: sof_sdw: Add support for cs42l43-cs35l56 sidecar amps")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202405140758.o2HY4nYD-lkp@intel.com/
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
