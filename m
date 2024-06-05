Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1418FD309
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 18:39:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B496BDEE;
	Wed,  5 Jun 2024 18:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B496BDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717605551;
	bh=uL7aI20oiazFrZ5/VDheOhVKNskuvycNSWBkOuz27Cw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m0X9e6Uz3SJrgB4BZnF0cyhnZlwBAyY69Fo4KTEKkqcfC3PYYz2uE/bnxPOJlfrb7
	 tOKkcg0cKojLqf+ZpcTKUESilLtvnGMQAUbFQfAcM5G6EcFtzfntH/iVnpMA3UTE/w
	 GHnIKcLLwW3ZE9fgksVKQJ0fOCVHj6QTikDHCJ4Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39CD8F8051D; Wed,  5 Jun 2024 18:38:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE99F805A1;
	Wed,  5 Jun 2024 18:38:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F14D0F802DB; Wed,  5 Jun 2024 18:38:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5AE0F800AC
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 18:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5AE0F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=H1wJakIG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717605509; x=1749141509;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uL7aI20oiazFrZ5/VDheOhVKNskuvycNSWBkOuz27Cw=;
  b=H1wJakIGpDqohuIDMwof7s/BsJkSCz5rPrETMJFtoePDNlc+/74SdvSR
   hPyDSN9Y4ENnwxyusrZr25Rjd/uzulyBgLmym7Ozx/LCzCQgybSSnxycb
   xTrqLg5E280PspnPBobGRRYm2pCRvc+bBPAUC06QYOQhTSEW6AvGFGMq/
   dCoNMg3enH40foz0pn4x4tMEGiDESZYeg7KdySzY2RxFL1FRwylCaCRut
   689NEHkNu5EPea8AZjMXk/odBLBXdDsGJ8O5BMEH2dlW2G03NZu/7Jxil
   Q918/5FqEgQ0ewCifCT6b34sVCZyALLCnkcfKcFVVapfbc2VUaYCzQP2j
   Q==;
X-CSE-ConnectionGUID: ZqfaBJ3VQ/GZwenTe+0R0w==
X-CSE-MsgGUID: QSa55k5dRziYfllII0p/Dw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14350096"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000";
   d="scan'208";a="14350096"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 09:38:25 -0700
X-CSE-ConnectionGUID: ImKNfvy4T+mCcE1NhCJZuA==
X-CSE-MsgGUID: VYrnmylNTkyAjT5botKiYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000";
   d="scan'208";a="37775914"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.246.201])
 ([10.245.246.201])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 09:38:22 -0700
Message-ID: <bc781eb4-ac0b-4750-83fa-44bf371cea5b@linux.intel.com>
Date: Wed, 5 Jun 2024 18:10:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: rt1318: Add RT1318 audio amplifier driver
To: Jack Yu <jack.yu@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
 <shumingf@realtek.com>, =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
 <derek.fang@realtek.com>
References: <11f7e2c1a77f418a9965b96b81f6e660@realtek.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <11f7e2c1a77f418a9965b96b81f6e660@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3ABEXRY4KN57LA25KINWWQO5Z52PEPZU
X-Message-ID-Hash: 3ABEXRY4KN57LA25KINWWQO5Z52PEPZU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ABEXRY4KN57LA25KINWWQO5Z52PEPZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> +static struct reg_sequence init_list[] = {
> +	{ 0x41001888, 0x00},
> +	{ 0x0000C121, 0x0B},

+	{ 0x0000C121, 0x0B, 100},

in the v1, this register needed a 100us delay, is this no longer required?


