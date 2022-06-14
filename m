Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EF654B6C2
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 18:52:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA2818BB;
	Tue, 14 Jun 2022 18:51:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA2818BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655225532;
	bh=tweFyPk/njzR5tcmhEBpD/R6XhDNmpa7aMJhnL5alkQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kFJggnTmQm2gAwugKAWee0mEThrDVa2sHPkv7RWDQwEIYfTyF3R8+1vIntgkd+pen
	 ehW/wV9KMuxftBoftwCqnE6zoYmjgsh9AhgEBmKCtCHjUAu9MSXrpIcaF2fwKAlF27
	 pAX4xgt7/FYw2FkqgQobwqxa6cAvVjSP1KtejnWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D929BF80165;
	Tue, 14 Jun 2022 18:51:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28A9AF80139; Tue, 14 Jun 2022 18:51:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97166F800D8
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 18:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97166F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kHjL31BB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655225468; x=1686761468;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tweFyPk/njzR5tcmhEBpD/R6XhDNmpa7aMJhnL5alkQ=;
 b=kHjL31BBbnIH/T+KbLaZubsZ4vhIlswbOQJq71zzsLiZoVSRsSkvf+dJ
 NeEPUGszbxJDcB3DKJqeRTh3hVf6NWPGCwN+3s+7EfOdw18BAiOoVEGEs
 Fkv1t7tYiYxqJJ6wNSI1UtWLPJWbg1GY0J5L/QyfwqMPOxlydYmgCKb9f
 s27id6tWcnFE6CPIFfOCT/umDFLhE9EZGC3Y/s2RW57NIOTiKfOmtsz+q
 41fOYbq2qA/gz3/iaOnU1roAuc53ZQY1Hp7MqEkKg139Ybwk5xFvaMKU5
 Khx/WOfTY8fsQ/z+Bou1VZn2r5800ZNbg6pRNLfxZNyMNDFS2T1R/wViW A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="342638963"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="342638963"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 09:51:03 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="652146566"
Received: from mburny-mobl1.amr.corp.intel.com (HELO [10.213.163.91])
 ([10.213.163.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 09:51:02 -0700
Message-ID: <398e4885-736c-d9a9-a18d-34f69f2b63ca@linux.intel.com>
Date: Tue, 14 Jun 2022 11:51:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: ACPI REV override for Dell XPS 13 9343
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
 Mark Brown <broonie@kernel.org>
References: <29a2ca0f-bc0a-04b0-d0c9-8658359d365c@intel.com>
 <47431e56-9acb-7c7d-307f-83d81956ec5c@linux.intel.com>
 <fb13198a-3d38-4304-6212-966561725d55@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <fb13198a-3d38-4304-6212-966561725d55@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Hans de Goede <hdegoede@redhat.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>
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


>>> It's been a while since catpt-driver [1] has been introduced to provide
>>> full support for Broadwell (BDW) machines with Intel DSP. For BDW, audio
>>> devices can make use of DSP only in I2S mode. In 2015 Rafael and Dominik
>>> provided quirk [2] for Dell XPS 13 9343. Given the description:
>>>
>>> _For example, based on what ACPI exports as the supported revision, Dell
>>> XPS 13 (2015) configures its audio device to either work in HDA mode or
>>> in I2S mode, where the former is supposed to be used on Linux until the
>>> latter is fully supported (in the kernel as well as in user space)._
>>>
>>> It's clear that such configuration was not fully supported back then. I
>>> believe now it is. Perhaps it is time to let the quirk in mention go? By
>>> that I mean just the relevant entry, not the ACPI_REV_OVERRIDE_POSSIBLE
>>> functionality as a whole.
>>
>> This should be a distribution or power-user decision to enable the I2S
>> version IMHO.
>>
>> There is nothing new in terms of functionality with the I2S version, so
>> limited added-value that doesn't offset the added risk due to the
>> dependencies on mixer settings that may or may not be installed (UCM,
>> etc).
>>
>> If it ain't broke don't fix it.

to clarify: the HDaudio mode works just fine, there are currently zero
issues or missing functionality reported by users.

> Not much of a fan of the last statement. I believe challenging status
> quo is the right thing to do. We do not want to bloat the kernel with
> unnecessary quirks.
> 
> The broadwell-rt286 UCM is part of alsa-ucm-conf repo for years now.

The hardware supports two modes (HDaudio and DSP + I2S), the former has
been in use without any issues for years.

Even if you make DSP + I2S the default, you've got to leave HDaudio as a
fallback, so there would be no change at the kernel level.

It' very very hard to remove stuff, and in this case there is limited
evidence that distributions use the DSP + I2S mode. You could deprecate
the ACPI_OVERRIDE but you've got to leave time for distributions to switch.

Challenging the status quo is great, but let's keep downstream in mind,
shall we?

The only option we removed was Medfield several years ago, but we had
clear evidence that no one would be affected by such a change in the
upstream kernel.
