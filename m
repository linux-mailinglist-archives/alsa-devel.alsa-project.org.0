Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78829696DCA
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 20:24:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA211E10;
	Tue, 14 Feb 2023 20:23:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA211E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676402689;
	bh=MwWMU+rMHLjigK24HlxQlmHYNQyOiL5KfCQk3L4iDY0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hJ3VEEsaOvL+UqIEvuzqAMS03r2SGBCNghN+xi+vRvgs6HKYmCxWOvhpDZJ9SE/IJ
	 HfI9jPmFuEIjMF6uuXAoW+CkbMlSPpKYVxfPuf9qC0x2ssIxe6JDvOLCpubdOhHfpP
	 1gqpMjcWr2wxdNoe5Wa9epZXTmR8WueObnFqEpdg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5B09F80527;
	Tue, 14 Feb 2023 20:23:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC76AF801C0; Tue, 14 Feb 2023 20:23:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4872F800F0
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 20:22:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4872F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hYOn++LA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676402581; x=1707938581;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MwWMU+rMHLjigK24HlxQlmHYNQyOiL5KfCQk3L4iDY0=;
  b=hYOn++LAaz4jCc99s02AvvahvFcoUyXhbqyhS+tKdZ4eqkr/HZCr5R1y
   av7ejE6bXGB0xdZhUluhLLAdIeBxgHwSaJMAYvcIojO4/D/HfZ+2mzqlG
   1PqA5Ae+ZvDDSBv2Pl0UYcErrPAVU2yAoYr5diCh23cxFafYNMEZUdMdG
   L5Hn6B6f2yLCEeBLsFCI6lfuaJehhOILhsI8aORuVUkj4Yg3oB6IKbgGm
   RpEAZZdAQsebIwOcFqCgjUaynF4ZLo0DeqGhOGVQBXeEQIwoo+JGZmGNU
   5AeYT/3wLuVec/F4pvE3QRogJ6Z0c+2BNJ/r62do7mFYCo8YMAH66OLyU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="314893718"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000";
   d="scan'208";a="314893718"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 11:22:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="778485242"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000";
   d="scan'208";a="778485242"
Received: from parthgup-mobl2.amr.corp.intel.com (HELO [10.209.175.23])
 ([10.209.175.23])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 11:22:52 -0800
Message-ID: <37fbb1d4-60f1-5cba-180a-ba51922fdca8@linux.intel.com>
Date: Tue, 14 Feb 2023 07:33:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V2 6/8] soundwire: amd: add runtime pm ops for AMD
 soundwire manager driver
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, vkoul@kernel.org
References: <20230213094031.2231058-1-Vijendar.Mukunda@amd.com>
 <20230213094031.2231058-7-Vijendar.Mukunda@amd.com>
 <383a8166-bc60-8557-e76b-f6287c967598@linux.intel.com>
 <65ec1f29-2ad2-acd6-feff-7d1d6f40ef8b@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <65ec1f29-2ad2-acd6-feff-7d1d6f40ef8b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RY2XJKFLDPIPODZJIXRNYNND74GHW5DC
X-Message-ID-Hash: RY2XJKFLDPIPODZJIXRNYNND74GHW5DC
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: amadeuszx.slawinski@linux.intel.com, Mario.Limonciello@amd.com,
 Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RY2XJKFLDPIPODZJIXRNYNND74GHW5DC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



>>> +/* AMD pm_runtime quirk definitions */
>>> +
>>> +/*
>>> + * Force the clock to stop(ClockStopMode0) when suspend callback
>>> + * is invoked.
>>> + */
>>> +#define AMD_SDW_CLK_STOP_MODE		1
>>> +
>>> +/*
>>> + * Stop the bus when runtime suspend/system level suspend callback
>>> + * is invoked. If set, a complete bus reset and re-enumeration will
>>> + * be performed when the bus restarts.
>>> + */
>>> +#define AMD_SDW_POWER_OFF_MODE		2
>> You need to clarify this mode, can you deal with device in-band wakes if
>> the power is off?
> On the Current platform, in-band wakes are not supported if the power is off.

Humm, that's an important clarification.

Does this mean your link0 will never use the POWER_OFF_MODE since it
includes support for headset codecs and you want the ability to detect
jacks status changes?

Or is this more like CLK_STOP_MODE is used in runtime pm and POWER_OFF
in system suspend?
