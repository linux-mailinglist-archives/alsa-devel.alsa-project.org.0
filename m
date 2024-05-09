Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C918C15B6
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 21:57:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74C5810BE;
	Thu,  9 May 2024 21:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74C5810BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715284629;
	bh=pqJGDudG3EtP+HKlIxczhzYllZ6fjisuemy8gyrPPqI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AUb1zrV5/8PEve9Cp74k2OqfB572J2rnmtejXQUejP6PilkmPwn7LDqZaVV6ME5WY
	 Hcjo5HG6wHORDwvgJXq7J2drIIGaqor/aNQmcx9cFMDkcSNwPLB5Wy9bAlgTGJixiW
	 brEPlmgp/a4KRcWxi4oNSp+q0tFskcn57VIB0NeM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B08DF805E1; Thu,  9 May 2024 21:56:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F4C7F805D2;
	Thu,  9 May 2024 21:56:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B2DEF8049C; Thu,  9 May 2024 21:56:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A356F8024C
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 21:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A356F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MEFaNDuy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715284582; x=1746820582;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pqJGDudG3EtP+HKlIxczhzYllZ6fjisuemy8gyrPPqI=;
  b=MEFaNDuyPdug6MbvR99+D7mTsDKlE/dIKRYt3WnY7MsX4MuybnBWKi8i
   O8w8tn3JSqVVQVEVSAmh+K2TlMOzi05ZLE1aZr2LS+mBILFQygfiuTWrV
   o+KMjeuFcdODW8E3xqEVYdjX+UC8qHvOABOZb1Ii9zeTPQsujSnAl7BnA
   yG3WmnCa6zgz7Qqf3PHXaw9tjnPVx+N4nSxsCw4nJy2OVbtCK3sj4jL06
   E7eyD8gaA/1znDapbJ1h4cAE/0E9GlTm9wAvbRWClrH2Y5L85ejp0zmGQ
   Kj62d2KSYwJuvRJnfh1yr+Fqv/SFF/FVlRWx7KMfl8WEwQuvgfKxZuHfg
   A==;
X-CSE-ConnectionGUID: +RHCQLGTQi2wt4pzBLStHQ==
X-CSE-MsgGUID: oPZsxtp+QkqGf4tppcdElw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11454263"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="11454263"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:56:17 -0700
X-CSE-ConnectionGUID: hRhLxpRCQlCZGrFg1s62Zg==
X-CSE-MsgGUID: m1N3f5RbQ+yjnemil+4Tng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="34213076"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO [10.213.181.85])
 ([10.213.181.85])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:56:14 -0700
Message-ID: <c97a0563-c4ce-45cd-8141-ee9be1e01899@linux.intel.com>
Date: Thu, 9 May 2024 08:01:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 22/39] ALSA: usb-audio: Prevent starting of audio
 stream if in use
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzk+dt@kernel.org, gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
 broonie@kernel.org, bgoswami@quicinc.com, tiwai@suse.com,
 bagasdotme@gmail.com, robh@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
 <20240507195116.9464-23-quic_wcheng@quicinc.com>
 <1e98935e-e35a-49e0-bbbf-ff326d40b581@linux.intel.com>
 <066fe096-a9d3-2498-275d-185f709e9a02@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <066fe096-a9d3-2498-275d-185f709e9a02@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4KXSVNIU5KBOY2MEUTEVE32HZPLCLIBP
X-Message-ID-Hash: 4KXSVNIU5KBOY2MEUTEVE32HZPLCLIBP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KXSVNIU5KBOY2MEUTEVE32HZPLCLIBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/8/24 18:40, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 5/7/2024 2:20 PM, Pierre-Louis Bossart wrote:
>>
>>> If a PCM device is already in use, the check will return an error to
>>> userspace notifying that the stream is currently busy.  This ensures
>>> that
>>> only one path is using the USB substream.
>>
>> What was the point of having a "USB Mixer" then?
> 
> The USB mixer is intended to enable/route the USB offloading path to the
> audio DSP, and is for controlling the ASoC specific entities.  This
> change is needed to resolve any contention between the USB SND PCM
> device (non offload path) and the ASoC USB BE DAI (offload path).

Not following, sorry. Is the "USB Mixer" some sort of hardware entity
related to USB offload or just a pure DAPM processing widget handling
volume and actual mixing between streams?

I was trying to get clarity on whether there can be multiple streams
mixed before going to the USB endpoint. The commit message "only one
path is using the USB substream" is ambiguous, not sure if you are
referring to mutual exclusion between offloaded and non-offloaded paths,
or number of streams when offloaded is supported. Different concepts/levels.
