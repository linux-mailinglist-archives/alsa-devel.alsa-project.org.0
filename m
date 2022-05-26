Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 967855350F0
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 16:46:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 311E116C8;
	Thu, 26 May 2022 16:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 311E116C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653576372;
	bh=8XG+0blNgVMb8NruV2TK4QNUsj/L0AlJfFrTQVMub7Q=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EBGK4w+TUlzKKTKL4KOXkpGjByup88KNg6YR0MxNcg9sh8ZDCpAC26FhV4GZxDhgS
	 MY7MvOZ8B94pTgDfpjWAquopQ7SCJwuyn/IR2buak/ds1G53NHvZter+7ITfgkecLO
	 NhYdmxL/w+CP5XM6CG7xLkDWrbrWcUyewxuhSKRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97DB5F80171;
	Thu, 26 May 2022 16:45:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85AE6F800D0; Thu, 26 May 2022 16:45:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B849F800D0
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 16:45:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B849F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SRx0HYFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653576309; x=1685112309;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8XG+0blNgVMb8NruV2TK4QNUsj/L0AlJfFrTQVMub7Q=;
 b=SRx0HYFVnKSFpuRHdvPhGYLGKT7gLysioODdoFDRX16tXoQ0MDYBt5Ug
 yES21kPobPi4XTjLYrNsLiXEi3kbbFXksALZ1YnQ5fOuQE0V0MWeEKFjw
 ephETKIZHQTgAnNiWVGljGdTXf1DdWbCPNClecRSZ6jtJPeF0A1qjDwHA
 lActvGsagyWT5vliFaDH7gTMmKFzen+4Jx6kNdA2Ogqjapu83iRimJQPE
 9MsNqMRgucMMofIt3ymevK5MH4UUEXUsfpu136OY49HU/y/B79ZdEX3PD
 j5lt3WwHGEE1WDNl2NFpFMF/jJwxnbrguHncigbMsNS3UzcTEZDiCY+bj Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="334820264"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="334820264"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 07:45:02 -0700
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="603122706"
Received: from sgourshe-mobl1.amr.corp.intel.com (HELO [10.251.3.95])
 ([10.251.3.95])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 07:45:01 -0700
Message-ID: <3861ca9a-6444-6f23-f447-64cd610b4d34@linux.intel.com>
Date: Thu, 26 May 2022 09:45:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: About Cleanup ASoC
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
 <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
 <a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>
 <87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>
 <349ddb89-6f1e-f087-2399-795cf82b92b3@linux.intel.com>
 <87ilptqbvx.wl-kuninori.morimoto.gx@renesas.com>
 <021e4cc3-f67e-865f-0d8b-5b07fce97623@linux.intel.com>
 <2f60063a-4c99-89f4-4e14-938bb9383844@linux.intel.com>
 <498833ad-dd6a-8952-d569-d1ed726f4eed@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <498833ad-dd6a-8952-d569-d1ed726f4eed@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>
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



On 5/26/22 09:17, Cezary Rojewski wrote:
> On 2022-05-26 3:48 PM, Pierre-Louis Bossart wrote:
>> On 5/26/22 04:57, Amadeusz Sławiński wrote:
>>> Well, this sounds like what we did in avs, namely we split cards
>>> separately based on endpoint. Main driver decides what endpoints to
>>> expose, based on ACPI detection and ACPI match rules, see [1]. For
>>> example in our model it is possible to have 2 separate i2s codecs
>>> connected and each having its own card. From avs driver we expose
>>> snd_soc_dai_driver with 2 streams (playback and capture), see [2] and
>>> then tell machine driver to just connect them to codec [3] - look for
>>> "SSP%d Pin", "ssp%d Tx" and "ssp%d Rx". Connections between "ssp%d
>>> Tx"/"ssp%d Rx" and userspace FE are handled by topology in our case, but
>>> should be easy to expose without it, if you don't use topologies.
>>
>> It works for ACPI because the platform driver can check if specific
>> _HIDs are present or not, and decide to create different platform
>> devices for different cards, with resources split in different
>> components. In other words, there is no strict boundary between platform
>> and machine driver, the platform has all the information needed.
>>
>> I don't know if it's feasible in a Device Tree environment: the DT blob
>> exposes the machine device, which uses *references* to resources exposed
>> by platform and codec drivers. If there were multiple machine devices
>> for different cards, how would that split of resources between different
>> components be done?
>>
>> The current ACPI approach will also not work if we move to a generic
>> machine driver for SoundWire platform, with one or more devices exposed
>> in ACPI for the board-level composition. If the machine devices are NOT
>> created by the platform driver, I don't see a clear solution to support
>> multiple cards.
> 
> 
> Hmm.. I don't see why SDW is a problem here. Could you elaborate? I
> could boost avs-driver to support SDW configurations if we need a POC.
> Why would machine devices not be created by the platform (e.g. PCI) driver?

Because there will be at some point an ACPI device for the machine
driver. I can't give more details on a public mailing list just yet, but
the approach based on the PCI driver creating a platform device is NOT
future-proof.
