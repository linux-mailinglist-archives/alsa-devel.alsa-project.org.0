Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CFA79C121
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:30:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F5A0E81;
	Tue, 12 Sep 2023 02:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F5A0E81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694478644;
	bh=NT0igPUaqXUrlEzLPjsu0IEnx8SqEPXynrBlbgMaU38=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rM2jBZE0JqsRlq3/QkjqC1ORPqO/UEBwUyD1q/+Fr3NJAbmUFtKlvui9iUF438to3
	 Ufy/7Si3NFWR/dJzeZw04zwmPkacwbV3BPnHeno2EQ0UUUgB9UJBo3/jy9zyhYcqg5
	 OV4lsEQSO1mcVL8/2njhKpXt3ZtOpLIhRaFMBEJE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4E91F8047D; Tue, 12 Sep 2023 02:29:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DAF8F80212;
	Tue, 12 Sep 2023 02:29:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 505A0F80246; Tue, 12 Sep 2023 02:29:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE3DEF800AA;
	Tue, 12 Sep 2023 02:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE3DEF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z+EFVhBI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694478581; x=1726014581;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NT0igPUaqXUrlEzLPjsu0IEnx8SqEPXynrBlbgMaU38=;
  b=Z+EFVhBI5b0XXaJmU64ZEG25oz6uk11nW9fVxMJVm5cmjIu49m0UWASP
   PfM5Twe/JdA5PMXlT1mHlLcpoeyJ4BxCfSdiDtP/JNiU6bggDZTd0e9oo
   wtTUIwFZfzJ3Xpn9S8ksEB+6qwcbgfrEJBApFnBYidgNarRlc6hB4V4Ih
   rxWZ3d/Nm68kH/HhgGg5Tr6G5GAYj2Xp/qehI78Z440vS+QD4whUOWqVC
   vfbkkr5uLcSQFQJH/VsbvCKFlagiE6sZZC6/kmQ2yRLUO8BteEcyOK6HD
   WAvq6tXsW33qT0pBLaT7VWLrFHB4W3yrNOsn3SJRcVywEqvL2Lsg9spt0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="357676958"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000";
   d="scan'208";a="357676958"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 17:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="886739584"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000";
   d="scan'208";a="886739584"
Received: from sbeyer-mobl.amr.corp.intel.com (HELO [10.212.76.33])
 ([10.212.76.33])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 17:29:05 -0700
Message-ID: <34d34e99-c6a3-2d08-2c4b-c548b6b87e9a@linux.intel.com>
Date: Mon, 11 Sep 2023 20:25:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Subject: Re: [PATCH v4 01/11] ASoC: SOF: core: add 'no_wq' probe and remove
 callbacks
Content-Language: en-US
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20230830153652.217855-1-maarten.lankhorst@linux.intel.com>
 <20230830153652.217855-2-maarten.lankhorst@linux.intel.com>
 <alpine.DEB.2.22.394.2309011509200.3532114@eliteleevi.tm.intel.com>
 <4252a4dc-0cf3-4ff2-aa55-c03e56345276@linux.intel.com>
 <4d84a799-c07e-e917-7c82-2f24456e3ac2@linux.intel.com>
 <6d39eac7-06c7-45f0-0318-72be1753641f@linux.intel.com>
 <e8880daf-8f74-4350-96c4-d625272aed35@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <e8880daf-8f74-4350-96c4-d625272aed35@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QKNPFVKLZVO222Z5LV7ROQDYP4IMU6G4
X-Message-ID-Hash: QKNPFVKLZVO222Z5LV7ROQDYP4IMU6G4
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKNPFVKLZVO222Z5LV7ROQDYP4IMU6G4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> What we have atm:
> snd_sof_probe - might be called from wq
> snd_sof_remove - might be called from wq (cleans up the snd_sof_probe
> 		 step)

I don't think it's correct, snd_sof_remove cannot be called from a wq.
The device core knows nothing about workqueues.

> We want a callbacks for hardware/device probing, right, split the
> snd_sof_probe (and remove) to be able to support a sane level of
> deferred probing support.
> 
> With that in mind:
> snd_sof_device_probe - Not called from wq (to handle deferred probing)
> snd_sof_probe - might be called from wq
> 
> snd_sof_remove - might be called from wq (cleans up the snd_sof_probe
> 		 step)
> snd_sof_device_remove - Not called from wq (to up the
> 			snd_sof_device_probe step)
> 
> Naming option: s/device/hardware

I like the 'device' hint since it's directly related to the device (or
subsystem) callbacks.

> However, I think the snd_sof_device_remove itself is redundant and we
> might not need it at all as in case we have wq and there is a failure in
> there we do want to release resources as much as possible. The module
> will be kept loaded (no deferred handling in wq) and that might block
> PM, other devices to behave correctly. Iow, if the wq has failure we
> should do a cleanup to the best effort to reach a level like the driver
> is not even loaded.

If we have a failure in a workqueue used for probe, then we have to
clean-up everything since nothing in the device core will do so for us.
