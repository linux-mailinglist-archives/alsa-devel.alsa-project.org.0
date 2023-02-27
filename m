Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E10D46A4FBB
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Feb 2023 00:39:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B85D220C;
	Tue, 28 Feb 2023 00:38:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B85D220C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677541173;
	bh=ixxBTf5Ocgi76s8GFyE+uxGzNzt2DbcOET9UuIiMt50=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VC7QAn4qE/HKwcorxJoGpkUgklNZLZjzKkFL8Q+VWXt8IzjH1nRsrmLCehLVVMZkb
	 PizGO+JmuzpBCPh1SxnmFMEKSAD2BevbP8F7xrFyoKo2lxBCrlVSddn0q6dYHH06G3
	 zwU721ma/JDIMv2zLlj6/mpRWZJwnDr1wBGeoT2Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C2CAF802BE;
	Tue, 28 Feb 2023 00:38:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1F0BF8049C; Tue, 28 Feb 2023 00:38:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F3E0F800FA
	for <alsa-devel@alsa-project.org>; Tue, 28 Feb 2023 00:38:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F3E0F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gFodlIVp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677541111; x=1709077111;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ixxBTf5Ocgi76s8GFyE+uxGzNzt2DbcOET9UuIiMt50=;
  b=gFodlIVpBRzQc+ItM+FcOcobKhI/hGaVBMsNIjafxyIo+i9xXtvyUeZc
   ZoWjUcNgX+zsrS4IWvPFMGL3zg9N9dBz2trIbJVhjh+P3AEmhLZZ0HDif
   1M6IhkhiHlmxZt2mztO76EzTIwyY15/19KuenzPuF04Us865zxLm0urTS
   rGi/XaVDqHyxaG0cslC17C0fWpAJbkeLY/uxRrMbhOWpKCzlfQGDIP90A
   VFkQM5bV3BShYinLkgQBxBrwHBaWtGVLoRxhmH/9ZA1tC2tGTiY6/2KiP
   M/JtEIbqNYb0i1oPHB8ePPlTjMhrgds4wYbiQptv5SFGvwjlPafhgiy3z
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="313672719"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400";
   d="scan'208";a="313672719"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 15:38:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="1002997697"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400";
   d="scan'208";a="1002997697"
Received: from jaidenno-mobl.amr.corp.intel.com (HELO [10.212.85.4])
 ([10.212.85.4])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 15:38:10 -0800
Message-ID: <5d78bbc6-340e-dea8-40c6-d065c7e7a878@linux.intel.com>
Date: Mon, 27 Feb 2023 18:38:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] ASoC: max98363: add soundwire amplifier driver
To: "Lee, RyanS" <RyanS.Lee@analog.com>, Mark Brown <broonie@kernel.org>
References: <20230224010814.504016-1-ryan.lee.analog@gmail.com>
 <0fb47fe7-719b-0773-fc14-3d62d7d33619@linux.intel.com>
 <Y/zsqjOWFKrpDtl8@sirena.org.uk>
 <d95d15f3-34c3-32df-1a50-0ebce35bf81f@linux.intel.com>
 <Y/z6EB+0beX2Ji2h@sirena.org.uk>
 <SJ0PR03MB66814E588528C771D7BEAB3D8AAF9@SJ0PR03MB6681.namprd03.prod.outlook.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <SJ0PR03MB66814E588528C771D7BEAB3D8AAF9@SJ0PR03MB6681.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: INPCOUEXJSNFB6F4KWWGB44LHGQPX5KT
X-Message-ID-Hash: INPCOUEXJSNFB6F4KWWGB44LHGQPX5KT
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?UTF-8?B?4oCcUnlhbg==?= <ryan.lee.analog@gmail.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "herve.codina@bootlin.com" <herve.codina@bootlin.com>,
 "wangweidong.a@awinic.com" <wangweidong.a@awinic.com>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 "shumingf@realtek.com" <shumingf@realtek.com>,
 "povik+lin@cutebit.org" <povik+lin@cutebit.org>,
 "flatmax@flatmax.com" <flatmax@flatmax.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/INPCOUEXJSNFB6F4KWWGB44LHGQPX5KT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>> Put differently, SoundWire codec drivers should only deal with
>>> non-standard vendor-specific registers.
>>
>> OK, it'd be good to be clear about what the issue is when reviewing things.
>> The registers *are* in the device's register map but the driver shouldn't be
>> referencing them at all and should instead be going via the SoundWire core
>> for anything in there.
> 
> Thanks for the comment.
> The only reason I added standard SoundWire registers to the amp driver is
> to check the values for the debugging purpose because these registers values are
> important to understand the device status, but it is not visible from the regmap
> debugfs if those registers are not included on the regmap table of the driver.
> The driver never controls the standard SoundWire registers by itself.
> Do you recommend removing the standard SoundWire registers from the driver
> or keeping it non-volatile?
> (The reg_default values in the table are all amp reset values and those registers
> are treated as volatile. I shall clear 'unique ID' field because it is determined by
> the hardware pin connection.)

We already have debugfs support for those registers, see
sdw_slave_reg_show() in drivers/soundwire/debugfs.c

It's not the same file as regmap debugfs but the information is already
there, see e.g. an example on the SOF CI devices:

cd /sys/kernel/debug/soundwire/master-0-1/sdw:1:025d:0700:00
more registers

Register  Value

DP0
  0	 0
  1	 0
  2	 0
  3	 0
  4	 0
  5	 1
Bank0
 20	 0
 22	 0
 23	 0
 24	 0
 25	 0
 26	 0
 27	XX
 28	XX
Bank1
 30	 0
 32	 0
 33	 0
 34	 0
 35	 0
 36	 0
 37	XX
 38	XX

SCP
 40	 0
 41	 7
 42	 0
 43	 0
 44	20
 45	 9
 46	 4
 47	XX
 48	XX
 49	XX
 4a	XX
 4b	XX
 50	10
 51	 2
 52	5d
 53	 7
 54	 0
 55	 0

DP1
100	 0
101	 0
102	 0

