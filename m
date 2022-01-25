Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F2149B7D1
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 16:42:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C1772037;
	Tue, 25 Jan 2022 16:41:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C1772037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643125348;
	bh=miMZOwd5bKC0Or0DykIpzXNDbiB3oXzAqUnhdMv8zcE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TV4uGmkdYYNuXHRQ73EaStq+9WFiDKe0bGkCzrRP2GdPjsIhQJj4jEvd8N0WZAKBo
	 561kGLT27DhoqHnoHPQrzr0Wq4HN7exSAecObSief52kT/s93d8n1YWCau6RYydc9E
	 zOOZJSTEMs8hGH8t4nZUn/u5ZZ2WSGeL9VD0ukLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E8D4F804CF;
	Tue, 25 Jan 2022 16:41:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95463F804C3; Tue, 25 Jan 2022 16:41:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCEB9F800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 16:41:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCEB9F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GfXc78SH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643125276; x=1674661276;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=miMZOwd5bKC0Or0DykIpzXNDbiB3oXzAqUnhdMv8zcE=;
 b=GfXc78SH9uOb/zp+M8nHJz8Y3Kxa4SUNQ3F3uipHcnmPBck6tZLh8ae7
 d4egAOmFSJdWKdUBV6a+djjYEzIpcJjzV9AuZRsnvTRBxo9QzPNcCnBA9
 zjFJPyw8KqVnaazi3FSLf5Rc4m6Hwtoicvz2MiBD2bsfvlxV065GuaoFU
 clkW5Rzy6hg1KRyIMbWVkNv3wt7Tt5mM3sLqU1AifhNWCYfAxBWcpkY5s
 OF2VzPEX7QdsEGqzM3761FGHekRGQ3dONt5QdsOxrFA5FS7Gh2GIRtanq
 MEX/qSwUKdL72V/PgE3MP3HW2Ghwk2qW08Wbz2DX5FwZM1QNdxR2F0Umy g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="233702384"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="233702384"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 07:41:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="477147955"
Received: from rchapman-mobl1.amr.corp.intel.com (HELO [10.212.41.185])
 ([10.212.41.185])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 07:41:08 -0800
Message-ID: <de932fa4-516e-c7d7-c3cd-388fa199bf23@linux.intel.com>
Date: Tue, 25 Jan 2022 09:41:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: No sound on gpd pocket 3
Content-Language: en-US
To: anthony tonitch <d.tonitch@gmail.com>
References: <CAAEBy7fQ6x95H5XkaKmXWsB1KCDbYAFtA5zUZ03ToJSegHb05w@mail.gmail.com>
 <d08bfba6-3aa8-e0d6-6d21-8734eed55978@linux.intel.com>
 <CAAEBy7exurcqZ+7Js27O7bWHsJQ9tQ_2yWXDeA3_smr5BDc5RA@mail.gmail.com>
 <1164c015-46b3-1efc-b5ce-044cc3492b78@linux.intel.com>
 <CAAEBy7f8z1LRr_EjRZtsFhj7c9hkfEkm+kGAw-yhCA-j0TvYOA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAAEBy7f8z1LRr_EjRZtsFhj7c9hkfEkm+kGAw-yhCA-j0TvYOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>
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



On 1/25/22 03:07, anthony tonitch wrote:
> Le lun. 24 janv. 2022 à 20:02, Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> a écrit :
>> ah, now it's starting to make sense.
>>
>> I am afraid you have the ES8316 codec, or one of its variants.
>> /sys/bus/acpi/devices/ESSX8326:00/status         15
>>
>> so no you don't want to use options snd-intel-dspcfg dsp_driver=1 but
>>
>> options snd-intel-dspcfg dsp_driver=3
>>
>> The auto-detection don't work because we use a different codec HID for
>> the driver selection
>>
>>
>>         {
>>                 .flags = FLAG_SOF,
>>                 .device = 0x5a98,
>>                 .codec_hid = "ESSX8336",
>>         },
>>
>> as well as the machine driver selection
>>
>>         {
>>                 .id = "ESSX8336",
>>                 .drv_name = "sof-essx8336",
>>                 .sof_tplg_filename = "sof-glk-es8336.tplg",
>>         },
>>
>> This is really a problematic set of devices, where absolutely all
>> possible I2S links have been used, along with GPIO settings and DMICs.
>>
>> Please file a bug on https://github.com/thesofproject/linux/issues so
>> that we can keep track of this and suggest solution.
>>
>> Thanks!
> 
> I will file the bug issue later in the day but I have two question here,
> 
> 1. does the dsp_driver=3 is supposed to work then because it doesn't
> seems to ^^ maybe I did it wrong but here is the alsa info again if
> you see anything
> http://alsa-project.org/db/?f=847cdba9058170337515f57b460ed7bcae964af7
> 
> 2. Because it works for everyone else and not for me, does this mean
> the chip is different and then that I have a "faulty one"? I will
> obviously still try to make the sound work if I can but at least I can
> contact gpd hk for an explaination
> 
> Thanks a lot for your quick response!

All the solutions we suggested will not work because of a change in your
BIOS. We've only see "ESSX8336" so far and hard-coded this value, now
the BIOS writers in their infinite wisdom chose a different HID
(ESSX8326) which breaks all the existing matching.

if you can install a new kernel, please try and provide feedback on
https://github.com/thesofproject/linux/pull/3338, where I added support
for more BIOS variations of the same device. I don't have any hardware
to test so have to crowd-source the tests to the community, thanks for
your understanding if this isn't a turn-key solution.
