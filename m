Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3C459F49A
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 09:56:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CFA615C1;
	Wed, 24 Aug 2022 09:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CFA615C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661327810;
	bh=LqeA44e0s1YgXUHt9917oOHWEVJ8rkKa9fdQohJrry8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BQ+NYkylD81RL/Q2unzwrSCuugh8BVBWs+wNGjaGEyRAIC7kI6ICob+e+euu+QoqX
	 FOrwS2a7XzFYWbBG2VSVP7F6JeVvLOEEvzwz+AoVOrJwlHZDkUvSy9FGu+SwJhF06b
	 uUb4lVanwTiHJ9RaeGK3x14+AaBRkAozl6UXFbu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85F02F8014B;
	Wed, 24 Aug 2022 09:55:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A8BFF804C1; Wed, 24 Aug 2022 09:55:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8261AF8014B
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 09:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8261AF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="L757ufEX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661327746; x=1692863746;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LqeA44e0s1YgXUHt9917oOHWEVJ8rkKa9fdQohJrry8=;
 b=L757ufEXfg79116P42C0Wai3kD0i6lhOFTy/F8QHXusgrGiiwjBBj0DL
 6rax0mD7eO7M0aAd/lsYmmAYQmDDgFI/dbAsCmYiq475DXQlqOLgQ0se/
 BnPKziB4xYIi+Y3Q2o/W9jisj9KzoimX1TRJRqnFigvi0dL+ujicK4EaZ
 1Lj5Yka3QNzZnLypHZ75YxxiwccieiG6dl73Xq+3RcLNf11ht10kg1eQi
 BtlQUYvKDQ6KqoVRnB5a3V17jr69TUZVhIsw+i5IpkbC3o/kyoAvLm/wH
 gnzpyGOUzyX46YaL6TFfYuErEPQScjSSS39FXPLqcBS4DMUqNJBoz0VPM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="319955039"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="319955039"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 00:55:33 -0700
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="639008184"
Received: from tleistix-mobl2.ger.corp.intel.com (HELO [10.249.43.72])
 ([10.249.43.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 00:55:30 -0700
Message-ID: <6a9ad9b1-a6f2-c380-77a9-f10317f7054f@linux.intel.com>
Date: Wed, 24 Aug 2022 09:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] soundwire: allocate device_number with IDA
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20220823045004.2670658-1-yung-chuan.liao@linux.intel.com>
 <YwUHp3ivSktx6/Lo@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YwUHp3ivSktx6/Lo@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Vinod,

>> The device_number is currently allocated in the scope of each bus and does
>> not need to be unique at the system level.
>> This leads e.g. on Dell devices with three or four Device1 on different
>> bus segments. 
> 
> And how is that an issue that should be fixed?

1. this makes things simpler for debug. You can look at the logs and see
what the device is without having to look at the link. It's been much
easier to track complicated issues when each device is tracked with a
unique system level number.

2. Intel hardware has a requirement that the device number be unique for
all links managed by  a given controller. This patch prepares that
transition. I cannot disclose more details at the moment, you will have
to trust me on this one.

>> To make the device_number unique at the system level, and
> 
> Why should we do that...
>> unified with the HDaudio/iDISP SDI values, this series allocates the
>> dev_number with an IDA restricted between 4 and 11 (inclusive).
> 
> Does this not place an artificial restriction that a system can have
> only 12 devices if we have unique device

It does indeed, but it simplifies debug and it allows future hardware to
be supported.

In practice, the most we've seen on Intel platforms is 4 devices at the
system level. Even if the SoundWire spec does allow for 11 devices per
link, it's way over-engineered due to capacitive load and signal
integrity issues. We've seen an absolute maximum of 4 devices on a
single link in test rigs, and that was never deployed. Two devices per
link were also only used in prototypes which never hit the market.

At any rate, this in an opt-in solution, not a requirement for non-Intel
platforms at all. Others can keep using as many devices as they wish,
within the bounds allowed by the standard.

Note that the device_number creates a de-facto priority, and it would be
perfectly acceptable for some platforms to tweak the current first-come
first-serve allocation to improve interrupt response time on each link,
etc. The standard says nothing about how the device numbers should be
allocated, only that they be unique on each link. In other words, you
should expect additional changes to the existing way of allocating
device numbers.

> Perhaps a better way would be to use dus:dev combination while dealing
> with a device always..??

That is not compatible with Intel hardware requirements. This wasn't a
decision where Bard and I were consulted, it is what it is.

Does this clarify things?
Thanks
-Pierre


