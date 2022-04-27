Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D9251140D
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 11:05:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 713F7172A;
	Wed, 27 Apr 2022 11:04:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 713F7172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651050307;
	bh=uFX2bvitmP4pW8VmflAeit2Lr83gOG3fPtWs3cuPHJI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qt60MDb2pKjEmS6J+pS/tIa/R0i7O9q8+9IfaCac+zYIPuEmkWJVNqXGlElXd1c0D
	 s7bNRsvf1tMVqrv5AGdkKgWYIzWZwpbejGYVvdOtSttsu5rkH0tni+alfR2kVSm6sD
	 a/hJ/4Y0BitYzs75ubgc+WDb9MwbHBfjjuMbx7X8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D95BEF800AE;
	Wed, 27 Apr 2022 11:04:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EB0EF8016E; Wed, 27 Apr 2022 11:04:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CCFEF80152;
 Wed, 27 Apr 2022 11:04:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CCFEF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GDkkS6Tt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651050245; x=1682586245;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uFX2bvitmP4pW8VmflAeit2Lr83gOG3fPtWs3cuPHJI=;
 b=GDkkS6TttkezXDVLLxy/+jdeOPsyJ0WOovU+wsm3j9r4WY/r5DGU4i8W
 6lj6l4qPZGErnasYjFLicuH/cPon35ZLqrUlrJlrcf84rZK/3Huy5Mj8A
 NFgIBOT+jYhS7EkwkcYOPpoA5LBupcxvjk2KABUM5CUNmYYkiw4TcseCv
 8Xce5k8MCSUA7jJ/Ph1CBPAVt1l6aiIp0ys0GqXbZH3jp/gs04PdYy9Ta
 rgzL6llMqp/PJBryB53F2WhmX4sFtReuKnanTkXlsmScRzvcqkVQFLb2x
 MTl87COz63P6yQbmEu0gJ/iMD1egtEM8fF+MC0sMOIoyYKju8kjFjFUWM Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="253249617"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="253249617"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 02:03:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="705453310"
Received: from rdegreef-mobl1.ger.corp.intel.com (HELO [10.252.32.27])
 ([10.252.32.27])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 02:03:58 -0700
Message-ID: <8b81a90f-e72a-be9f-6187-64d5cc1191df@linux.intel.com>
Date: Wed, 27 Apr 2022 12:04:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [bug report] ASoC: SOF: Intel: hda: Revisit IMR boot sequence
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <YmkDss9WDmk3zjyl@kili>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YmkDss9WDmk3zjyl@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Dan,

On 27/04/2022 11:49, Dan Carpenter wrote:
> Hello Peter Ujfalusi,
> 
> The patch 2a68ff846164: "ASoC: SOF: Intel: hda: Revisit IMR boot
> sequence" from Apr 21, 2022, leads to the following Smatch static
> checker warning:
> 
> 	sound/soc/sof/intel/hda-loader.c:397 hda_dsp_cl_boot_firmware()
> 	info: return a literal instead of 'ret'
> 
> sound/soc/sof/intel/hda-loader.c
>     381 int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
>     382 {
>     383         struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
>     384         struct snd_sof_pdata *plat_data = sdev->pdata;
>     385         const struct sof_dev_desc *desc = plat_data->desc;
>     386         const struct sof_intel_dsp_desc *chip_info;
>     387         struct hdac_ext_stream *hext_stream;
>     388         struct firmware stripped_firmware;
>     389         struct snd_dma_buffer dmab;
>     390         int ret, ret1, i;
>     391 
>     392         if (hda->imrboot_supported && !sdev->first_boot) {
>     393                 dev_dbg(sdev->dev, "IMR restore supported, booting from IMR directly\n");
>     394                 hda->boot_iteration = 0;
>     395                 ret = hda_dsp_boot_imr(sdev);
>     396                 if (ret >= 0)
> --> 397                         return ret;
> 
> The hda_dsp_boot_imr() has some similar stuff where it checks for
> positive returns.  As far as I can see, this code never returns positive
> values.  Normally kernel code returns zero on success and negative
> error codes on failure.  When code returns non-standard things then it
> really should be documented what the positive returns mean.  Nothing
> complicated, just add a comment at the start of the function.
> 
> The TLDR back story of this Smatch check is that it's not published but
> it regularly finds bugs.  The issue is that it's more readable, plus it
> looks more deliberate and intentional to write:
> 
> 	if (!ret)
> 		return 0;

Yes, this should be the correct one to use and also in hda_dsp_boot_imr().

cl_dsp_init() return 0 on success and negative errno on failure.
There is no bug with the current code other than it is juts misleading
the reader to think that a success can be a positive return value when
positive number never going to be received.

> instead of:
> 
> 	if (!ret)
> 		return ret;
> 
> With the latter format, the bug is that people intended to write:
> 
> 	if (ret)
> 		return ret;
> 
> Obviously this kind of bug would get caught in testing, but testing is
> often impossible in the kernel because it depends on hardware
> availability.
> 
>     398 
>     399                 dev_warn(sdev->dev, "IMR restore failed, trying to cold boot\n");
>     400         }
>     401 
>     402         chip_info = desc->chip_info;
>     403 
> 
> regards,
> dan carpenter

-- 
Péter
