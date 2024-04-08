Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C3089CAB3
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 19:23:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CEC5238C;
	Mon,  8 Apr 2024 19:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CEC5238C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712597021;
	bh=cx3lvZtVCA4R6BXGBfL5aNQwMBLv2iVL2cgfzIFw1G4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d1SkTQhmCiatqyO3iUnpHmiKwUCGxoi1N8sDsBsyOANpNoYYjW84IS3YV/5PgHORi
	 1LkerLzJLJjdJJgvJKejIQl7r1CKlyIzosLVHm28uBJjovBoHQZERiUR7ZqaJkpO0t
	 VS3gkR3mlQB9T4C9u02mcp+T5gfAupcKF/PKbok4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12CE0F805A1; Mon,  8 Apr 2024 19:23:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE091F805A8;
	Mon,  8 Apr 2024 19:23:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27055F80423; Mon,  8 Apr 2024 19:23:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 419FEF8013D
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 19:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 419FEF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Wbb1NfHu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712596979; x=1744132979;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cx3lvZtVCA4R6BXGBfL5aNQwMBLv2iVL2cgfzIFw1G4=;
  b=Wbb1NfHuFLGIeA29WeXC7m+XaH0hrKo9u2CvP0VP0Nd5N8OYpoZ+HGmg
   diiBkMBXtmyAr0s7jT5bFzxuWgxdZOm49A+xkvnd30iK/7rWtRYH+uZli
   IuxdrefzfsNGWDsSpbZvQ8Vz64+6cQ2bkoDqiKjQ2++l2wAV22CCsxLKV
   ZPeKOkNqd4dAoDeTFdN3Ljet8fvRuvQS8+AJmKEjjP9rgQl2Ikt6m5C6S
   VvFGcN5BD/VTUttZpOA10I3djSuaauDMe+tlw4He31DuLPIjlajDPIPJN
   GE7z75Cz2kmasXzFbDtA+/d3XNh37UO10HWPp3DW/0WF6jdRZ7DRDatvI
   g==;
X-CSE-ConnectionGUID: xXcCTULCQ+WxAsrFJgAncg==
X-CSE-MsgGUID: 2VYpEUW/Qz6WQZUvwOLwmA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7757421"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000";
   d="scan'208";a="7757421"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:22:56 -0700
X-CSE-ConnectionGUID: k+CtTFHrSM2tzYeIf8lcEQ==
X-CSE-MsgGUID: GCF7GdmZT/GEnKt73nGffw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000";
   d="scan'208";a="24697432"
Received: from shahsmit-mobl1.amr.corp.intel.com (HELO [10.212.101.141])
 ([10.212.101.141])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:22:55 -0700
Message-ID: <697e9cb7-8e10-469b-8d9a-6209ec7faf5a@linux.intel.com>
Date: Mon, 8 Apr 2024 10:29:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Apply Asus T100TA quirk to
 Asus T100TAM too
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20240407191559.21596-1-hdegoede@redhat.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240407191559.21596-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AP4WVSQHFKYBBFOXGTIUOQELBHAWGFU5
X-Message-ID-Hash: AP4WVSQHFKYBBFOXGTIUOQELBHAWGFU5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AP4WVSQHFKYBBFOXGTIUOQELBHAWGFU5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/7/24 14:15, Hans de Goede wrote:
> The Asus T100TA quirk has been using an exact match on a product-name of
> "T100TA" but there are also T100TAM variants with a slightly higher
> clocked CPU and a metal backside which need the same quirk.
> 
> Sort the existing T100TA (stereo speakers) below the more specific
> T100TAF (mono speaker) quirk and switch from exact matching to
> substring matching so that the T100TA quirk will also match on
> the T100TAM models.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

