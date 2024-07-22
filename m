Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8BE939093
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 16:22:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73F8EE80;
	Mon, 22 Jul 2024 16:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73F8EE80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721658140;
	bh=BZ9zVGteGyw7KM+ePl27FW6gWSzQRxLfIhCKf+ZtPuM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fMWSrwxTDQ5j7X2pLdSWDuX7qcc75to19Eq+ZchFOq38UkS669izjvO3CM70RLOA6
	 GbYwz2bSx7nqc6Z6CMQRf+NV3lLtCKgcWdyD/hqQhzX4ZUqIsTYShoGgM9AaRYtDcW
	 BPBKkMH2OTHTNAolElmzizwOS9K9Jhiq5ceN8Tto=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63DC5F80580; Mon, 22 Jul 2024 16:21:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45F30F805B0;
	Mon, 22 Jul 2024 16:21:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B9F9F801F5; Mon, 22 Jul 2024 16:12:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9B4BF8007E
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 16:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9B4BF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WQkJX4vF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721657230; x=1753193230;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BZ9zVGteGyw7KM+ePl27FW6gWSzQRxLfIhCKf+ZtPuM=;
  b=WQkJX4vFLkEnPY2Cdkcicv9cZaBkkI5KovDwyhpbeB+LOwlwk2U2JxQk
   1ghOMaxMZMeSTrdsa/6Xm6ON6dWt8Pt8ssCpfMEC4BwSkJq5xCmQ9bUwm
   1LmFlhIVXtwqgt3OwjPlYzJscOFJm4+CAkb4GvtiGLQc9Lhf7VDX0BJ5s
   gs3jNMq+JmKNc0nur/BZfUE98IhJP7hePPKKwB28YPhLz5lcJEQjXNksO
   QMXQJE6qiTAgW8whuntPsDnpbfKezZ++BNtQxsoBRWRSLaP+I+RibKqzO
   lXbKM7PJkk3W+eA7xaE+x3H5js410/Hiveg+ZRO8fll4TAaTePKr3FunA
   w==;
X-CSE-ConnectionGUID: Lpan1Ls5RmaB1yxbz0sPOg==
X-CSE-MsgGUID: Smlqi5nmQ06m0f4PFcsnhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19042529"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800";
   d="scan'208";a="19042529"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 07:07:03 -0700
X-CSE-ConnectionGUID: sIn4xKfaSBu87WaP9FFVog==
X-CSE-MsgGUID: AZpDnaaHRrqUDj+rsfTi8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800";
   d="scan'208";a="52630203"
Received: from ettammin-desk.ger.corp.intel.com (HELO [10.245.246.242])
 ([10.245.246.242])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 07:07:01 -0700
Message-ID: <c7572302-7d78-4e72-a470-57f2aa0c8537@linux.intel.com>
Date: Mon, 22 Jul 2024 16:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] ASoC: Intel: cht_bsw_rt5645: Set card.components
 string
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: alsa-devel@alsa-project.org,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
References: <918944d2-3d00-465e-a9d1-5d57fc966113@stanley.mountain>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <918944d2-3d00-465e-a9d1-5d57fc966113@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5XRMRDPKUEM7BP7LXSLH2RK7FJ4QETUH
X-Message-ID-Hash: 5XRMRDPKUEM7BP7LXSLH2RK7FJ4QETUH
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XRMRDPKUEM7BP7LXSLH2RK7FJ4QETUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks Dan for the report.


> Commit f87b4402163b ("ASoC: Intel: cht_bsw_rt5645: Set
> card.components string") from Nov 26, 2023 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	sound/soc/intel/boards/cht_bsw_rt5645.c:587 snd_cht_mc_probe()
> 	error: we previously assumed 'adev' could be null (see line 581)
> 
> sound/soc/intel/boards/cht_bsw_rt5645.c
>     570         /* set correct codec name */
>     571         for (i = 0; i < ARRAY_SIZE(cht_dailink); i++)
>     572                 if (cht_dailink[i].codecs->name &&
>     573                     !strcmp(cht_dailink[i].codecs->name,
>     574                             "i2c-10EC5645:00")) {
>     575                         dai_index = i;
>     576                         break;
>     577                 }
>     578 
>     579         /* fixup codec name based on HID */
>     580         adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
>     581         if (adev) {
>                     ^^^^
> The old code assumes adev can be NULL
> 
>     582                 snprintf(cht_rt5645_codec_name, sizeof(cht_rt5645_codec_name),
>     583                          "i2c-%s", acpi_dev_name(adev));
>     584                 cht_dailink[dai_index].codecs->name = cht_rt5645_codec_name;
>     585         }
>     586         /* acpi_get_first_physical_node() returns a borrowed ref, no need to deref */
> --> 587         codec_dev = acpi_get_first_physical_node(adev);
>                                                          ^^^^
> Unchecked dereference

This looks like a problem in multiple machine drivers sharing similar
code, if we want to consistently check the output we probably need
something like https://github.com/thesofproject/linux/pull/5117 ?


