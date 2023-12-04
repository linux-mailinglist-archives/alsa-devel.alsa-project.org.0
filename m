Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB4A803905
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 16:39:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E34AB7F4;
	Mon,  4 Dec 2023 16:39:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E34AB7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701704370;
	bh=XBcZSIrjn5oE4UWz+MqT3i45GCbZYKpojF6IsD9Gkr0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kggF61uAxwAWPNRDMev8HFSENqOMCNwJ8aDrmkeaL60zenVd8tgI98tsEU15r4G32
	 aMszsUdHX6QKkvnLdVAf3Rbh+5e6VsLXA4AvxNlH3ic2xo7CQN4r5MGfPEilTJTpuw
	 vTpit0Cj03923VcLvrIvHs3NapE9G81oOw+DOX4c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71352F80571; Mon,  4 Dec 2023 16:39:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77CA9F8056F;
	Mon,  4 Dec 2023 16:38:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55794F8025A; Mon,  4 Dec 2023 16:38:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A19BF800AC
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 16:38:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A19BF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=atnr9vid
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701704327; x=1733240327;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XBcZSIrjn5oE4UWz+MqT3i45GCbZYKpojF6IsD9Gkr0=;
  b=atnr9vidgSZ25kIrPFKD8jtP1jMJGK+cbKEkJDUWxTveZXFYDCLF/txe
   VlpMdEJ/l6Nf2PwK2wO2GY3vLWahHU+jbp95B3TGcRxL3+2u9Oea8pPz8
   cbWDRJFTNhaqSzsFm+8tcAHNcbbVwPQ7FSM/xLBAUGnlaSV+WUMVp2h6M
   1fVv54tGtUpsqlBUcyOigsJOaXvrKGUlTYm+NZEcqohoiR3s3M1u4rfDS
   /M1ADhQP122Ce3E13KwWum7lRKM2b5VJdBHBMS9XHaxJHr0zGfr9B+t2x
   ZAII97+mm36TDbCozdeFq9lb2Wj33f9qwDsieKnWTIsAWrsD/y5mLx0yz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="794492"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600";
   d="scan'208";a="794492"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 07:38:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="914473980"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600";
   d="scan'208";a="914473980"
Received: from sdneilso-mobl1.amr.corp.intel.com (HELO [10.212.147.197])
 ([10.212.147.197])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 07:38:41 -0800
Message-ID: <835278f4-d18d-4e1d-8ada-0f8f19bfab2d@linux.intel.com>
Date: Mon, 4 Dec 2023 08:46:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ASoC: Intel: bytcht_es8316: Determine
 quirks/routing through ACPI DSM
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Yang <yangxiaohua@everest-semi.com>, alsa-devel@alsa-project.org
References: <20231202123946.54347-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231202123946.54347-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: S4PAIJMMKFBYXDAON3B7SLQ3WJDESZXJ
X-Message-ID-Hash: S4PAIJMMKFBYXDAON3B7SLQ3WJDESZXJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S4PAIJMMKFBYXDAON3B7SLQ3WJDESZXJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/2/23 06:39, Hans de Goede wrote:
> Hi All,
> 
> This takes some of the work done to auto-configure quirks/routing
> for ESS83xx codecs by getting the info from ACPI from:
> https://github.com/thesofproject/linux/pull/4112
> 
> And then builds on top of this to add auto-configuration to
> the bytcht_es8316 board driver.
> 
> Changes in v2:
> - Move es83xx-dsm-common.c back to sound/soc/codecs like the original
>   version from: https://github.com/thesofproject/linux/pull/4112/
> 
> Note compared to the pull-request, which deals with the ES8336, this
> series deals with the ES8316 (for which I have several devices to test
> on) and this moves handling of the _DSM from the codec driver to
> the board driver since with the ES8316 the board driver takes
> care of setting up various routes for things like the mic and
> speakers.
> 
> After this series audio now works properly on a CHT Chuwi Hi12
> tablet without needing to add an extra quirk for that model.
> 
> This has also been tested on the following devices, where things
> are unchanged from before (the ACPI autoconfiguration gives the
> same results as the old defaults) :
> 
> Onda V80 plus (CHT)
> GP-electronic T701 (BYT)
> 
> I also tested this on a Nanote UMPC-01, here the _DSM result
> for PLATFORM_SPK_TYPE_ARG wrongly returns 1 (mono) while
> the device actually has 2 speakers, so this model needs to keep
> its DMI quirk.
> 
> I don't have an IRBIS NB41 nor a TECLAST X98 Plus II,
> so the DMI quirks for those are left in place too on
> a better safe then sorry basis.

Thanks Hans!

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
