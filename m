Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA13189FA9
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 16:30:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54B5A1745;
	Wed, 18 Mar 2020 16:30:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54B5A1745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584545459;
	bh=Lcz7PncRRvyUqX/qmDBYCIJamL6Zy22m/tAhfMZI8iU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dk4GqSHoaK8VtdpBEefpH7N776CbO782gkWb9IBuxP3Tsl1uWn0FGIQH+IH4I05AN
	 Yy/s1rnOJKu0DJsz14DxH1w/HcpN4A36qUAHwGUuydeM7Teb5zPh3H1Hfn/h40MKP9
	 qLf65BhBZSIYcfRuONUx7jLUCPppURmvfnMJbsro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E78B9F80058;
	Wed, 18 Mar 2020 16:28:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47341F80058; Wed, 18 Mar 2020 16:28:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B7F3F80058
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 16:28:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B7F3F80058
IronPort-SDR: 4Hh3+2UfJ5FdkFyOzX6romk/3RTBkUvzXGLS11D64//BEBhI8YYbd+AwNUjGVgeqTpkjjncOW7
 bFpyrjUu48tw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 08:28:20 -0700
IronPort-SDR: g95JJKA7+7TG6WKZl/SiDDh/sHxUBdTx6vEJqHelvUjXtuVFfJIGubIXgY3vru0vjeqq0pZ4xU
 JHQ6NHbONJfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="417985182"
Received: from nali1-mobl3.amr.corp.intel.com (HELO [10.255.33.194])
 ([10.255.33.194])
 by orsmga005.jf.intel.com with ESMTP; 18 Mar 2020 08:28:19 -0700
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
To: Dominik Brodowski <linux@dominikbrodowski.net>,
 Keyon Jie <yang.jie@linux.intel.com>
References: <20200318063022.GA116342@light.dominikbrodowski.net>
 <41d0b2b5-6014-6fab-b6a2-7a7dbc4fe020@linux.intel.com>
 <20200318123930.GA2433@light.dominikbrodowski.net>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d7a357c5-54af-3e69-771c-d7ea83c6fbb7@linux.intel.com>
Date: Wed, 18 Mar 2020 10:13:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200318123930.GA2433@light.dominikbrodowski.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, alsa-devel@alsa-project.org, curtis@malainey.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org
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



>>> While 5.5.x works fine, mainline as of ac309e7744be (v5.6-rc6+) causes me
>>> some sound-related trouble: after boot, the sound works fine -- but once I
>>> suspend and resume my broadwell-based XPS13, I need to switch to headphone
>>> and back to speaker to hear something. But what I hear isn't music but
>>> garbled output.

It's my understanding that the use of the haswell driver is opt-in for 
Dell XPS13 9343. When we run the SOF driver on this device, we have to 
explicitly bypass an ACPI quirk that forces HDAudio to be used:

https://github.com/thesofproject/linux/commit/944b6a2d620a556424ed4195c8428485fcb6c2bd

Have you tried to run in plain vanilla HDAudio mode?

