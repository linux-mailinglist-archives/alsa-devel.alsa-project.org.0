Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DFA180D99
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 02:37:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3D4F1661;
	Wed, 11 Mar 2020 02:36:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3D4F1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583890668;
	bh=3siIEQTnhr7Q+yDHBEbDwbI78RZR9a3zfrKjkw98NCs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S5rdmjeppQLZDNdw7J26Br2Es94ppioqGX6dLiKnce85vcUD1kFaLX3fp9KjXj1m2
	 na/ATwyFCVG9Nr/ywQAYK2a0gy192Muy2q9WrDPaYwbWXg4M2D98kVJiX/i8EyuNwJ
	 TCwOY5EGHTw9n7eFrW2SzpzEDllUmHku+oFjA4TM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6C61F8021C;
	Wed, 11 Mar 2020 02:36:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 292C7F80217; Wed, 11 Mar 2020 02:36:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C25B1F800BC
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 02:36:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C25B1F800BC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 18:35:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,539,1574150400"; d="scan'208";a="389112738"
Received: from vssomaya-mobl1.amr.corp.intel.com (HELO [10.252.138.210])
 ([10.252.138.210])
 by orsmga004.jf.intel.com with ESMTP; 10 Mar 2020 18:35:57 -0700
Subject: Re: [alsa-devel] [PATCH 3/6] ASoC: Intel: common: add match tables
 for ICL w/ SoundWire
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20200110222530.30303-1-pierre-louis.bossart@linux.intel.com>
 <20200110222530.30303-4-pierre-louis.bossart@linux.intel.com>
 <d5e15895-7d10-7255-692c-c5c89d3ae1be@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b49c010b-5b90-4ad6-58b8-9e43f9fc949f@linux.intel.com>
Date: Tue, 10 Mar 2020 20:35:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d5e15895-7d10-7255-692c-c5c89d3ae1be@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 3/10/20 5:12 PM, Jaroslav Kysela wrote:
> Dne 10. 01. 20 v 23:25 Pierre-Louis Bossart napsal(a):
>> From: Bard Liao <yung-chuan.liao@linux.intel.com>
>>
>> The two configurations are with the Realtek 3-in-1 board requiring all
>> 4 links to be enabled, or basic configuration with the on-board RT700
>> using link0.
>>
>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> Signed-off-by: Pierre-Louis Bossart 
>> <pierre-louis.bossart@linux.intel.com>
> 
> Hi,
> 
>    I just looking to this code and I miss the Kconfig selection for RT 
> codecs in the SOF SDW driver. How we can enable this driver without 
> selecting SND_SOC_ALL_CODECS ?
> 
>    I believe that those changes should be in sync with the machine 
> description.

Sorry Jaroslav, I don't fully understand your question.

These tables are just used to
a) select a firmware file
b) select a topology file
c) select a machine driver.

The codec selections are not made in this module but handled by the 
machine drivers in sound/soc/intel/boards/. It's the same mechanism as 
for all other machine drivers.

One caveat is that the SOF parts and machine drivers for SoundWire have 
not been provided upstream just yet, since they would not build without 
patches in drivers/soundwire. GregKH mentioned the patches are 'sane' 
and provided his Reviewed-by tag. Vinod Koul still has objections to our 
proposals but has yet to make proposals that would work for Intel, so if 
you need SoundWire support in the near-term you will need to have a 
conversation with Vinod. The code is ready and fully-tested.

If you want to look at the machine drivers for SOF+Realtek drivers, see

https://github.com/thesofproject/linux/blob/topic/sof-dev/sound/soc/intel/boards/sdw_rt711_rt1308_rt715.c

and the Kconfig that selects the relevant codec drivers is here:

https://github.com/thesofproject/linux/blob/d05959d5021cefbbd841773ee25f6c7387e6bfd9/sound/soc/intel/boards/Kconfig#L556

Hope this helps
-Pierre
