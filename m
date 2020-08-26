Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBDF253318
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 17:12:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D74B1706;
	Wed, 26 Aug 2020 17:11:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D74B1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598454751;
	bh=7iMHTYe45blgfJcMVq89d8ewVsAO/mInqqEvO9Dccp8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aYrWxRNgHsG68UHJqN0W2MPGF7rgLpc21aIYmJBMyJV4/VT7WNDDR0WxDNdZ2DZ5m
	 Ww3ATQRLMvTj3m8xnd17H2jFgFJ+Q7wdgzYjyN9WHzpUHjTWsSlb2Sfc9kgt707dZu
	 zMVVtKzro6WZzwj5CLY2ZNRSOQGAdq8ITVQ66Oeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6A8AF800EB;
	Wed, 26 Aug 2020 17:11:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 990DFF802A0; Wed, 26 Aug 2020 17:11:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D40A8F8016F
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 17:11:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D40A8F8016F
IronPort-SDR: JAJ/Zp2VtWuw2390dxiBxQvdRGXQgdzT74SfY5iX6NjIs9FRhUugT/GO94K5tGliIEz62QZ1jb
 ztO/02dZIGDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="143970560"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="143970560"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 08:11:18 -0700
IronPort-SDR: n8Fk4Q9CKxbnEO0LAV3Eh96gjzazs6sn7KtHO5iaKfDhiWwuHYSsPVumYhsKWlAwH/48vu/D9A
 lAiAuUByOwqw==
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="299505077"
Received: from gillelas-mobl1.amr.corp.intel.com (HELO [10.255.231.51])
 ([10.255.231.51])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 08:11:16 -0700
Subject: Re: [PATCH 4/4] regmap: sdw: add support for SoundWire 1.2 MBQ
To: Mark Brown <broonie@kernel.org>
References: <20200825171656.75836-1-pierre-louis.bossart@linux.intel.com>
 <20200825171656.75836-5-pierre-louis.bossart@linux.intel.com>
 <20200826101637.GC4965@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e66a9e95-7846-f353-8ebd-e35458c79797@linux.intel.com>
Date: Wed, 26 Aug 2020 09:54:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200826101637.GC4965@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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



>> One possible objection is that this code could have been handled with
>> regmap-sdw.c. However this is a new spec addition not handled by every
>> SoundWire 1.1 and non-SDCA device, so there's no reason to load code
>> that will never be used.
> 
>> Also in practice it's extremely unlikely that CONFIG_REGMAP would not
>> be selected with CONFIG_REGMAP_MBQ selected. However there's no
>> functional dependency between the two modules so they can be selected
>> separately.
> 
> The other thing I'm wondering here is about compatibility - is this
> something we can enumerate at runtime and if so couldn't this be done
> more like how we handle the various I2C and SMBus variants so the driver
> just says it wants a SoundWire regmap and then based on the capabilities
> of the device and the controller the regmap decides if it can use MBQ or
> not on the current system?

An SDCA device will have two regmaps, one for 'regular' registers and 
one for MBQ-based ones. There is no known case where a codec can use 
ONLY an MBQ-based regmap.

It's different from I2C/SMB since the bus is really identical, the 
interface is the same, the difference is really the sequence by which 
you access registers allocated to SDCA and how the address is constructed.

Each SDCA control will be described with a firmware property, and based 
on their range and purpose you would know how if the control is a 
regular one or an MBQ-based one. Alternatively, the driver might 
hard-code things and define addresses for each.

Does this answer to your question?

