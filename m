Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AF017E1A3
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 14:49:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81735166D;
	Mon,  9 Mar 2020 14:48:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81735166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583761743;
	bh=HwC2fws35BVUu/sW8W0kceM38WpUOb82VppqDD8MrW0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=df5KiPlWKEufz2x7uo7L2FvHX1dQ5zBHbS093goUtQ6dkIKkJTZQ/SFR64AyjhiLq
	 Lu5cevEskixh3DW9A3bJtXU79Ri8GI4WYxx4BI3hW0iFLzj8gEPG1lCMH+cC+X5hNz
	 hc+uz+nEApZuoxUEymYAKbzsaP3EBN60sPIGu9gM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7223EF801F7;
	Mon,  9 Mar 2020 14:47:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89D89F801EB; Mon,  9 Mar 2020 14:47:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4442F80123
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 14:47:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4442F80123
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 06:47:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,533,1574150400"; d="scan'208";a="234016684"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by fmsmga007.fm.intel.com with ESMTP; 09 Mar 2020 06:47:10 -0700
Subject: Re: [PATCH 2/7] ASoC: Intel: Skylake: Select hda configuration
 permissively
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
 <20200305145314.32579-3-cezary.rojewski@intel.com>
 <ab7ad0e3-bc46-c761-4357-65d8563df5cc@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <7a04e8af-6ee0-394a-6802-c193777ad87c@intel.com>
Date: Mon, 9 Mar 2020 14:47:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ab7ad0e3-bc46-c761-4357-65d8563df5cc@linux.intel.com>
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

On 2020-03-06 21:57, Pierre-Louis Bossart wrote:
> On 3/5/20 8:53 AM, Cezary Rojewski wrote:
>> With _reset_link removed from the probe sequence, codec_mask at the time
>> skl_find_hda_machine() is invoked will always be 0, so hda machine will
>> never be chosen. Rather than reorganizing boot flow, be permissive about
>> invalid mask. codec_mask will be set to proper value during probe_work -
>> before skl_codec_create() ever gets called.
> 
> humm, what would happen e.g. if you have select the SKL driver but there 
> is no ACPI information to select an I2S-based machine driver, and 
> HDaudio/iDISP are disabled? You would have no error checks then?
> 

Laptops I've been testing this with have had Realtek + iDisp present 
onboard. Now, if you disable Realtek + HDMI/DP modules within legacy 
HDaudio Kconfig and HD audio support within Intel Skylake tree then you 
end up with no required modules for said configuration at all. Nothing 
will happen really: no warnings, no sound card either.

Just run such kernel on my setup and results are quite obvious:
- skl boots
- no machines present
- drv stays dormant

Czarek
