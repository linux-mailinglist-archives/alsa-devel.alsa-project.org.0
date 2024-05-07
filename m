Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF2C8BFE62
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 15:17:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 155B9EAB;
	Wed,  8 May 2024 15:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 155B9EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715174264;
	bh=XNeckRnANZcfLQNUQ8Z5GX84AOZZtK3YH+F5AxvIfmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jAKaeo+fncYwVzf5l6DOq/JX0cNTB5uWWO05jzY6npD7J9SWWZqc18FmwC8k2q1zT
	 Xkj0Mnhq5HEDZXS+JTsdQUtZMoZM3aRPwQj8Aj7ygNDpe8qOouCSSVNY2z98mXjIF0
	 0xZr3VpbP1UVfBZG2heVCFcNghEE3XaBDolMNKu0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CB72F80619; Wed,  8 May 2024 15:16:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33184F80614;
	Wed,  8 May 2024 15:16:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1599CF805AC; Wed,  8 May 2024 15:16:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C5F3F800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 15:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C5F3F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UA7XPef9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174177; x=1746710177;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XNeckRnANZcfLQNUQ8Z5GX84AOZZtK3YH+F5AxvIfmQ=;
  b=UA7XPef9s+xQZf9+k5QQloxmO0X1OkaN1rEzJyDMajfWyp57c5gPhqhR
   EFXOE6cY7KJtIRRV0Xm1QS9xU6/QN5eDHsuhTdOTmi0lHxm3xsZxfX5Yc
   Pc/i979aSQUzjcf3Rio1HlogQ1pJppKqwvbSmPdm56LvBkaAuvn8FL7cD
   4Njj/u/XCZbTlIGllNMRpTpf7Qct5qsnLqNvfK2S+JcxneRWriCHsh69m
   PepmYJxA47y2wLe/g3FgTh4I+sL0eSnl2Fs8+5Rod4uGR665F8H4iZzeT
   iU1x8jz6BVxqrcilyP2LK0Rmam8ukp4F55PQ020hjXOWzVLKAjvehNgwB
   w==;
X-CSE-ConnectionGUID: ZrdvdDvZRuWE09uyecftYw==
X-CSE-MsgGUID: rUpw0nlJQIKK9UeNX6yVUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36413245"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000";
   d="scan'208";a="36413245"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:16:13 -0700
X-CSE-ConnectionGUID: k1L20U8iT+SrjOlDKwEB5A==
X-CSE-MsgGUID: hl5X9CpDQOm8ex+CqCP06g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000";
   d="scan'208";a="33356774"
Received: from sskolar-mobl.amr.corp.intel.com (HELO [10.212.67.115])
 ([10.212.67.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:16:12 -0700
Message-ID: <1e98935e-e35a-49e0-bbbf-ff326d40b581@linux.intel.com>
Date: Tue, 7 May 2024 16:20:26 -0500
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240507195116.9464-23-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VE2VNCQQYPJE4YF4O7IVJ3AZZGAGSDDR
X-Message-ID-Hash: VE2VNCQQYPJE4YF4O7IVJ3AZZGAGSDDR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VE2VNCQQYPJE4YF4O7IVJ3AZZGAGSDDR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> If a PCM device is already in use, the check will return an error to
> userspace notifying that the stream is currently busy.  This ensures that
> only one path is using the USB substream.

What was the point of having a "USB Mixer" then?
