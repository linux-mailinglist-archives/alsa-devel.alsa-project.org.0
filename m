Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AFE1810EE
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 07:41:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D3BA1668;
	Wed, 11 Mar 2020 07:40:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D3BA1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583908887;
	bh=NymtMMUrXqlgWSmRX1M1shu+sMidvfvZ/m7jfgBW+Dk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JLmY96/9IDMIeg/yF3lvXTyr0YbJFSOyurct1orDksSi7wowdtHB96bNyqexgQLnU
	 ftPcd2uNdyi9FlTPXaon4rBuQhlqO6Rxi4f6sWsUxtC5885vHJGxipGojOhy/gnv3t
	 VDwO9aJFkkQGlgv227WZBupPzUtWdNw8zxkPfRNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A3D6F801F7;
	Wed, 11 Mar 2020 07:39:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 244BEF801EB; Wed, 11 Mar 2020 07:39:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D992F800B5
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 07:39:38 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 14DB9A003F;
 Wed, 11 Mar 2020 07:39:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 14DB9A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1583908776; bh=9hjvRT32myG0xMFDNUKYrXKA/SX4EoeMgS6STwn28Cg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mzDFwXkiPGBojVnRUeSYt6IYhhWRVaitdhwe5deqDR/qH3OHUuPoSJ7cazC+9h0f+
 VWcWpy4p3i2VynaFSpg7M00/CzqrJx+H8r8JLec07HpsfnwtsAeRlWksU/7VYWBgnq
 wR27j3A1Hqcfh5tIn/pA17mURzb7JEz6DTLOphW8=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 11 Mar 2020 07:39:29 +0100 (CET)
Subject: Re: [alsa-devel] [PATCH 3/6] ASoC: Intel: common: add match tables
 for ICL w/ SoundWire
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200110222530.30303-1-pierre-louis.bossart@linux.intel.com>
 <20200110222530.30303-4-pierre-louis.bossart@linux.intel.com>
 <d5e15895-7d10-7255-692c-c5c89d3ae1be@perex.cz>
 <b49c010b-5b90-4ad6-58b8-9e43f9fc949f@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <e8df8119-d88b-69b7-fd7a-890f1eb06dbf@perex.cz>
Date: Wed, 11 Mar 2020 07:39:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b49c010b-5b90-4ad6-58b8-9e43f9fc949f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Vinod <vkoul@kernel.org>, broonie@kernel.org,
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

Dne 11. 03. 20 v 2:35 Pierre-Louis Bossart napsal(a):
> 
> 
> On 3/10/20 5:12 PM, Jaroslav Kysela wrote:
>> Dne 10. 01. 20 v 23:25 Pierre-Louis Bossart napsal(a):
>>> From: Bard Liao <yung-chuan.liao@linux.intel.com>
>>>
>>> The two configurations are with the Realtek 3-in-1 board requiring all
>>> 4 links to be enabled, or basic configuration with the on-board RT700
>>> using link0.
>>>
>>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>>> Signed-off-by: Pierre-Louis Bossart
>>> <pierre-louis.bossart@linux.intel.com>
>>
>> Hi,
>>
>>     I just looking to this code and I miss the Kconfig selection for RT
>> codecs in the SOF SDW driver. How we can enable this driver without
>> selecting SND_SOC_ALL_CODECS ?
>>
>>     I believe that those changes should be in sync with the machine
>> description.
> 
> Sorry Jaroslav, I don't fully understand your question.
> 
> These tables are just used to
> a) select a firmware file
> b) select a topology file
> c) select a machine driver.
> 
> The codec selections are not made in this module but handled by the
> machine drivers in sound/soc/intel/boards/. It's the same mechanism as
> for all other machine drivers.
> 
> One caveat is that the SOF parts and machine drivers for SoundWire have
> not been provided upstream just yet, since they would not build without
> patches in drivers/soundwire. GregKH mentioned the patches are 'sane'
> and provided his Reviewed-by tag. Vinod Koul still has objections to our
> proposals but has yet to make proposals that would work for Intel, so if
> you need SoundWire support in the near-term you will need to have a
> conversation with Vinod. The code is ready and fully-tested.
> 
> If you want to look at the machine drivers for SOF+Realtek drivers, see
> 
> https://github.com/thesofproject/linux/blob/topic/sof-dev/sound/soc/intel/boards/sdw_rt711_rt1308_rt715.c
> 
> and the Kconfig that selects the relevant codec drivers is here:
> 
> https://github.com/thesofproject/linux/blob/d05959d5021cefbbd841773ee25f6c7387e6bfd9/sound/soc/intel/boards/Kconfig#L556

Ohh, it explains all. I was looking for the 'select SND_SOC_RT711_SDW' lines 
in Kconfig. It's really bad to merge those pieces randomly to the ASoC tree, 
because this code in the patch is dead without the machine driver code.

Vinod, any ETA? It seems that the Intel's soundwire hardware is reaching the 
market.

			Thanks for the clarification,
						Jaroslav


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
