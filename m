Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4C0419F40
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 21:35:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C916B169A;
	Mon, 27 Sep 2021 21:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C916B169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632771342;
	bh=sBItfhWSdZ1ZImRC1nDdXL3Mo6vewdWJTBFJki/eBJk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HKCMWjwi9Wbz2dsRBtXDT5G6BYOod7Dct5iWYiX9r74MWKFePyaW8j1O9RGoFKnzK
	 yT2Eq4mbnmRt9CUJsjkPoj6ylcLZycol++gA8OzFfyn+Nmeec5CoNuOXydK5jOnElY
	 8HnTjG59BW/q0vfje1wayisq2Arsm75TRIj5TC0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21E9FF8026D;
	Mon, 27 Sep 2021 21:34:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 275F0F80227; Mon, 27 Sep 2021 21:34:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65B6BF80147
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 21:34:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65B6BF80147
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="247048955"
X-IronPort-AV: E=Sophos;i="5.85,327,1624345200"; d="scan'208";a="247048955"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 12:34:13 -0700
X-IronPort-AV: E=Sophos;i="5.85,327,1624345200"; d="scan'208";a="486263448"
Received: from asen4-mobl2.amr.corp.intel.com (HELO [10.212.27.2])
 ([10.212.27.2])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 12:34:11 -0700
Subject: Re: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
To: Ryan Lee <RyanS.Lee@maximintegrated.com>, Mark Brown <broonie@kernel.org>
References: <20210924221305.17886-1-ryans.lee@maximintegrated.com>
 <1b21bbf1-12c7-726d-bff8-76ec88ff8635@linux.intel.com>
 <SJ0PR11MB566107A6AB3D18ABDEDCF245E7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
 <20210927160622.GE4199@sirena.org.uk>
 <7b8c3875-3f12-f3cb-7da8-4e850e59ee2b@linux.intel.com>
 <SJ0PR11MB5661814BCC6B79EDE1B0967AE7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c5031731-dd58-ff7a-857e-b9e1b748d3b2@linux.intel.com>
Date: Mon, 27 Sep 2021 14:34:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <SJ0PR11MB5661814BCC6B79EDE1B0967AE7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "guennadi.liakhovetski@linux.intel.com"
 <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
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


>> Instead of changing the suspend sequence, can we please try to modify the
>> max98373_io_init() routine to unconditionally flag the cache as dirty, maybe
>> this points to a problem with the management of the
>> max98373->first_hw_init flag.
> 
> max98373_io_init() is not called because ' sdw_slave_status' remains
> ' SDW_SLAVE_ATTACHED' and 'max98373->hw_init' is already true.
> Removing 'if (max98373->hw_init || status != SDW_SLAVE_ATTACHED)'
> condition in max98373_update_status() function instead of adding
> regcache_mark_dirty() into max98373_suspend() can be an alternative way.
> I think it is all about where regcache_mark_dirty() is called from.
> The difference is that max98373_io_init() really do the software reset and
> do amp initialization again which could be an overhead.

that description is aligned with my analysis that there's something very
wrong happening here, it's not just a simple miss in the regmap handling
but a major conceptual bug or misunderstanding in the way reset is handled.

First, there's the spec: on a reset initiated by the host or if the
device loses sync for ANY reason, its status cannot remain ATTACHED.
There's got to be a 16-frame period at least where the device has to
monitor the sync pattern and cannot drive anything on the bus.

Then there's the hardware behavior on resume: on resume by default the
Intel host will toggle the data pin for at least 4096 frames, which by
spec means severe reset.

And last, there's the software init: we also force the status as
UNATTACHED in drivers/soundwire/intel.c:

	/*
	 * make sure all Slaves are tagged as UNATTACHED and provide
	 * reason for reinitialization
	 */
	sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);

But we've also seen the opposite effect of an amplifier reporting
attached but losing sync immediately after the end of enumeration and
never coming back on the bus, see issue
https://github.com/thesofproject/linux/issues/3063

In other words, we need to check what really happens on resume and why
the amplifier keeps reporting its status as ATTACHED despite the spec
requirements and software init, or loses this status after
enumeration....Something really does not add-up, again it's not just a
regmap management issue.




