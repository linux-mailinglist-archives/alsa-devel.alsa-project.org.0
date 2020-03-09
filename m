Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 268E617E551
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 18:05:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC4011681;
	Mon,  9 Mar 2020 18:04:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC4011681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583773547;
	bh=FoOwwCQwBQ7+akQDaFfkvZpdTFbgSqpasMhJoTDpalk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tpn2FGLdpk7hQ6gO6AP2qNpRK190WXfFoKJStI3UWd1IVy7wVXP+QQtAyOi29kT1H
	 kWQy0VnJ9aCpjGiAEfptEEEfQ3dW5YmhDD4cQxcNDlSOPybOa5dA+zzGqfhs8K/Vd3
	 tEkPUss9Ldp64qV1ABB49ij1qCvMcnySUMD8QL64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCA62F801F8;
	Mon,  9 Mar 2020 18:04:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCD9AF801F7; Mon,  9 Mar 2020 18:04:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89670F800DA
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 18:03:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89670F800DA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 10:03:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="230996418"
Received: from jdbostic-mobl1.amr.corp.intel.com (HELO [10.251.152.35])
 ([10.251.152.35])
 by orsmga007.jf.intel.com with ESMTP; 09 Mar 2020 10:03:50 -0700
Subject: Re: [PATCH 2/7] ASoC: Intel: Skylake: Select hda configuration
 permissively
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
 <20200305145314.32579-3-cezary.rojewski@intel.com>
 <ab7ad0e3-bc46-c761-4357-65d8563df5cc@linux.intel.com>
 <7a04e8af-6ee0-394a-6802-c193777ad87c@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ffe33017-5b2d-0c63-4a15-33df8831f29c@linux.intel.com>
Date: Mon, 9 Mar 2020 12:03:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7a04e8af-6ee0-394a-6802-c193777ad87c@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vkoul@kernel.org, broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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



On 3/9/20 8:47 AM, Cezary Rojewski wrote:
> On 2020-03-06 21:57, Pierre-Louis Bossart wrote:
>> On 3/5/20 8:53 AM, Cezary Rojewski wrote:
>>> With _reset_link removed from the probe sequence, codec_mask at the time
>>> skl_find_hda_machine() is invoked will always be 0, so hda machine will
>>> never be chosen. Rather than reorganizing boot flow, be permissive about
>>> invalid mask. codec_mask will be set to proper value during probe_work -
>>> before skl_codec_create() ever gets called.
>>
>> humm, what would happen e.g. if you have select the SKL driver but 
>> there is no ACPI information to select an I2S-based machine driver, 
>> and HDaudio/iDISP are disabled? You would have no error checks then?
>>
> 
> Laptops I've been testing this with have had Realtek + iDisp present 
> onboard. Now, if you disable Realtek + HDMI/DP modules within legacy 
> HDaudio Kconfig and HD audio support within Intel Skylake tree then you 
> end up with no required modules for said configuration at all. Nothing 
> will happen really: no warnings, no sound card either.

I meant enable the HDaudio controller but disable HDaudio codecs/HDMI at 
the BIOS level. In that case the codec_mask will never be set.

> Just run such kernel on my setup and results are quite obvious:
> - skl boots
> - no machines present
> - drv stays dormant
> 
> Czarek
