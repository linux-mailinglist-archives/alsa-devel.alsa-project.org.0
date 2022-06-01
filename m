Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 538F853AC27
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 19:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8775F16E1;
	Wed,  1 Jun 2022 19:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8775F16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654105494;
	bh=O76EMfv/RHibOpFDppwDuUPZWItQ/txbZlbLLYm8wfs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JejLj/oZFLBzZSg5W0/wIIXHWRZ+BfvJ1tq3oA9Ra5rU6zqS9AVN2TF/O43r3O95F
	 8wm9IXU99bBYlBc0T70lUrLSfgBD7bxwYrgl70sj78QbDk/IHHfFyfzFlAKwDoQpfu
	 MrWd4ZQeaZ6tQWFi6coPYAnQfjswzjbmGQa3+JFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF26DF8025A;
	Wed,  1 Jun 2022 19:43:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83F43F80238; Wed,  1 Jun 2022 19:43:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DABB8F80089
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 19:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DABB8F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="US0ULvqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654105432; x=1685641432;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=O76EMfv/RHibOpFDppwDuUPZWItQ/txbZlbLLYm8wfs=;
 b=US0ULvqsWUDxF7BSJS7KYsDaZWyx1XLyvAwFdXMdDSidbMtfJiTQgcqv
 yuxpe+bFowPMv3lN3Rc4AOVT4Ikalga1xLtSiX44cpDoepWnIZZY7eKUm
 lyh8MZsz6bNuZADAy+DVNu6JK/s/X4ylPKLjLRthDyRrwSS9E7fXHpmxW
 dsSEqxoYaakRCtlN+fTO0JdFZewHEeYpflO/w/oGDWPtBcuwLSW8GRogX
 k6iwhYXtUboqTzhtrzu+RulNksKDzrkpbDF+Hz9HMmSI0Q1G3r/TVE8WC
 GBbtWknfw8CWhnOQj2DD/GI3u7OCLmZt06xjcyNT+6Df9vNBOPiC2eVlu g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="274471775"
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; d="scan'208";a="274471775"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 10:43:44 -0700
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; d="scan'208";a="633638944"
Received: from aloney-mobl2.amr.corp.intel.com (HELO [10.209.25.15])
 ([10.209.25.15])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 10:43:43 -0700
Message-ID: <66914bd5-8bed-adba-c7a7-6cbfe1ad3520@linux.intel.com>
Date: Wed, 1 Jun 2022 12:17:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: soundwire: device drivers for PC based hardware
Content-Language: en-US
To: Muni Sekhar <munisekharrms@gmail.com>, vkoul@kernel.org,
 sanyog.r.kale@intel.com, alsa-devel <alsa-devel@alsa-project.org>
References: <CAHhAz+gqRDh=CJseQEhAJcRVEguxQ5c4vdUX8dvzdPNT=Sy3iA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAHhAz+gqRDh=CJseQEhAJcRVEguxQ5c4vdUX8dvzdPNT=Sy3iA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: LKML <linux-kernel@vger.kernel.org>
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



On 5/31/22 10:17, Muni Sekhar wrote:
> Hi all,
> 
> I am looking for the soundwire device drivers which run on x86 CPU for
> PC based platforms.
> 
> linux/drivers/soundwire at master · torvalds/linux · GitHub
> 
> Can the above mentioned mainline tree drivers can be used for this purpose?
> 
> config SOUNDWIRE_INTEL
> depends on ACPI && SND_SOC
> 
> config SOUNDWIRE_QCOM
> depends on SND_SOC
> 
> As per the Kconfig file, both the Intel and Qualcomm SoundWire Master
> driver depend on SND_SOC, does it mean it is only possible to run on
> SoC CPU(Arm chipsets)?

Here's what you need in your .config to use SoundWire on x86-based
hardware. Today this includes mostly Dell platforms, HP x360 convertible
laptops and Intel 'bishop canyon' NUC laptops.

CONFIG_REGMAP_SOUNDWIRE=m

CONFIG_REGMAP_SOUNDWIRE_MBQ=m

CONFIG_SND_INTEL_SOUNDWIRE_ACPI=m

CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH=m

CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE=m

CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE=m

CONFIG_SOUNDWIRE=m

CONFIG_SOUNDWIRE_CADENCE=m

CONFIG_SOUNDWIRE_INTEL=m

# CONFIG_SOUNDWIRE_QCOM is not set

CONFIG_SOUNDWIRE_GENERIC_ALLOCATION=m


I think you can get everything if you select these 3 high-level ones:
CONFIG_SOUNDWIRE
CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE
CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
