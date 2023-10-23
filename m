Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1113B7D3F7A
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 20:46:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D48584B;
	Mon, 23 Oct 2023 20:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D48584B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698086798;
	bh=jDwciitYmk8u5u8zSmhyK5TzvFy4ruKbgSjxwCQTnn4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oCy1FeWGbElP8Z2xtqQn4lc4RqU/D6mO9atc6ngUSB6Qoh9k4qokDGdL1hbvBsJaX
	 Hinao7hXFUe0uKWcxqmeU5JltQ+lOOGqowU9pc+gOO3mUR7J5psQ1taJMXZEulWhGj
	 Lgwctx8cFS5mp4dCQE5P7gTsu20R1IhQIT6ocQh0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0959AF8032D; Mon, 23 Oct 2023 20:45:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABAF0F8032D;
	Mon, 23 Oct 2023 20:45:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD439F804F3; Mon, 23 Oct 2023 20:45:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60768F8024E
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 20:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60768F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HbsFlgC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698086713; x=1729622713;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jDwciitYmk8u5u8zSmhyK5TzvFy4ruKbgSjxwCQTnn4=;
  b=HbsFlgC434nJ2kuYpQaKYnyDKhZBzxLnFHKByoyD1cuTszmO3RyXKgBl
   lK05Gb7bbAJv3G6cwZY/St57lw0hv3c5Sn/TUUpRzPGWWfz5ooKqw5VY+
   OSmWs634F1qvWGpfy8e6L9ixpEoFdnvMFaVR3nfEVVB4uX6HvkEMfptqL
   AexmpBOlvkOfKCy2o4i8rHrq/TcKKciisRb4IomhhVC5bTW1jBQuN5cvl
   2YDSmm2SCYjloL424djWhHUXaOvXjaQNxHkY9NKbBHxFVCQoXB5ioc9mp
   jKyP25MUtPfdQia57crP8Rmq04qnUVYKma00IU8nc3brBUnQRHTYIARRQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="390789272"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200";
   d="scan'208";a="390789272"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 11:45:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="848857211"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200";
   d="scan'208";a="848857211"
Received: from weiyiwil-mobl.amr.corp.intel.com (HELO [10.212.122.211])
 ([10.212.122.211])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 11:45:09 -0700
Message-ID: <fb56b3fd-769c-4524-acf4-3324424c4b5a@linux.intel.com>
Date: Mon, 23 Oct 2023 13:45:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga Tab 3 Pro
 YT3-X90 quirk
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
References: <20231021211534.114991-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231021211534.114991-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PD5EE54LPH2MEUG3G3BLZETBT7KS3HM7
X-Message-ID-Hash: PD5EE54LPH2MEUG3G3BLZETBT7KS3HM7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PD5EE54LPH2MEUG3G3BLZETBT7KS3HM7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/21/23 16:15, Hans de Goede wrote:
> The Lenovo Yoga Tab 3 Pro YT3-X90 x86 tablet, which ships with Android with
> a custom kernel as factory OS, does not list the used WM5102 codec inside
> its DSDT.
> 
> Workaround this with a new snd_soc_acpi_intel_baytrail_machines[] entry
> which matches on the SST id instead of the codec id like nocodec does,
> combined with using a machine_quirk callback which returns NULL on
> other machines to skip the new entry on other machines.

The work-around sounds fine, but out of curiosity what causes the codec
driver to probe if there's no ACPI HID?

Really wondering how we avoid the -517 error code with the deferred
probe never completing because the codec driver never probed and
registered the needed components?

