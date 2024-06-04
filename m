Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 487898FB728
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 17:29:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EDA9E68;
	Tue,  4 Jun 2024 17:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EDA9E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717514968;
	bh=6Lm4Cpx0IXqdaeRnzESh+Y/gl5O3f6wUtD7Dxu8/IjQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fnwjnHfOjdWowig6xlg6SGhKhjTOBRnvLGqElVg70NwMXS+vVErvJ4Mk2IATToNsQ
	 zAwJdDgRy0200e9NTWuYChWXug3uTqV/AYG/0bwa71oK2wViU5ZKrQfqeF7ISKkCzr
	 8+EMUZArs5RjIXpVB0VVj0H1dULRzYXs12CeIP8I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BE91F8051D; Tue,  4 Jun 2024 17:28:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52445F805A1;
	Tue,  4 Jun 2024 17:28:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13699F802DB; Tue,  4 Jun 2024 17:28:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48C48F800FA
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 17:28:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48C48F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jdhlkN9a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717514923; x=1749050923;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6Lm4Cpx0IXqdaeRnzESh+Y/gl5O3f6wUtD7Dxu8/IjQ=;
  b=jdhlkN9a5UthM1c2P1krgzbnDd2XhL1TxxbVFtU4Sr2Bhi0q/YSc0GYB
   lWV17TaZUvKk6F8VmEoVq2d5P0CVIxnIVKafPdTTHFZ2egA0+4ynXjnUf
   NerAdtAlU8TjEMvXobSr8tyWdOhUTfFYDV0Vdr+JhVcbC8WxuPwkeV60u
   WdtmYN1fccmWGNOV4VvSYx8hA/rok9m2V20ZmEgkOSB6RrKwhs5+Tk/xZ
   7ojJCGHpxyafUZH0s/zL6M9CJIh/UDmqmRLTbnnip8W9hnViFx1iYvMCy
   EiBsgZZDDO5YCvapVYGxsw5KAh4nIukohBEb8yyA6XX5iILdOGjPn2Dq6
   w==;
X-CSE-ConnectionGUID: utXCilDgRieo96yHRwLsiQ==
X-CSE-MsgGUID: dWyKP0vcQvq7vujeoz/S8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="17009112"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000";
   d="scan'208";a="17009112"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 08:28:36 -0700
X-CSE-ConnectionGUID: vVH0LlogSWC7zc65PVmjgg==
X-CSE-MsgGUID: dkoNEcCzT1CAuQmbLgwWow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000";
   d="scan'208";a="37742169"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.143])
 ([10.245.246.143])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 08:28:33 -0700
Message-ID: <b5ee74bc-5dfd-4355-b9a4-3b5603ca5a1c@linux.intel.com>
Date: Tue, 4 Jun 2024 17:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: rt1318: Add RT1318 audio amplifier driver
To: Jack Yu <jack.yu@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
 <shumingf@realtek.com>, =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
 <derek.fang@realtek.com>
References: <c6d0e09de01c4804bfff6efe92fff04c@realtek.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c6d0e09de01c4804bfff6efe92fff04c@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YPWWIBOK3YMAA6ES6TFLB5LF5MXPLIKT
X-Message-ID-Hash: YPWWIBOK3YMAA6ES6TFLB5LF5MXPLIKT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YPWWIBOK3YMAA6ES6TFLB5LF5MXPLIKT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/4/24 08:17, Jack Yu wrote:
> This is the initial amplifier driver for rt1318.

There is already a driver for the rt1318 in SoundWire mode, contributed
back in November 2022, this seems to be an I2S-based version.

Are all parts independent and interface-specific, or would there be
opportunities to share common parts, if any?

