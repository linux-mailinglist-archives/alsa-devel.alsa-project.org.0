Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD481B43F9
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 14:06:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FE4B16CA;
	Wed, 22 Apr 2020 14:05:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FE4B16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587557197;
	bh=ih0HWmrnyAdc2p0NRtlkt5nz1wQ+UguxwhDpLTOpqYA=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nRKn1WwjGxsJEZhhxTIkrvEhmV4q3M6IUEXcw6a5X5Am1i/mGhbZV97/BOVmJGC+L
	 exNVGHNx958WrPESBTr9iUU/j88ziVV+hlymDMHJNZQeHKqHRwABrhS32yW4PteGyV
	 4dam16c9V5UnUt4G70siIunA3jwQwqnJ6UC9dYt8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 288A0F8025E;
	Wed, 22 Apr 2020 14:04:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 970B3F80142; Wed, 22 Apr 2020 14:04:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5D1EF80108
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 14:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5D1EF80108
IronPort-SDR: duovQvjqVRmQt+A4yUThXwHGqbBrXjGy0HT7C5o8DKPBdlpTmmld+ZBPEUi79n/LMOeOuIPux7
 Pyaz2zZlJfQQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 05:04:03 -0700
IronPort-SDR: kkFWjxmlIDPI7Fk4GBqIPSCdmaVcW+Ljvb5StC28S92/bnWaQvH+j4ncq2ymID2Zx8rKoytuAd
 ISgM7XPPAE8w==
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; d="scan'208";a="429887161"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.252.52.93])
 ([10.252.52.93])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 05:04:01 -0700
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Subject: Re: [PATCH 4/4] ASoC: Intel: Skylake: Automatic DMIC format
 configuration according to information from NHLT
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200421202519.4008-1-mateusz.gorski@linux.intel.com>
 <20200421202519.4008-5-mateusz.gorski@linux.intel.com>
 <5530780f-9e86-1db3-b83b-9940560d27a2@linux.intel.com>
Message-ID: <6dcd229f-7477-01a5-9e73-8874a6234a5d@linux.intel.com>
Date: Wed, 22 Apr 2020 14:04:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5530780f-9e86-1db3-b83b-9940560d27a2@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: pl
Cc: cezary.rojewski@intel.com, tiwai@suse.com
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


>> @@ -3123,12 +3141,15 @@ static int skl_tplg_control_load(struct 
>> snd_soc_component *cmpnt,
>>       case SND_SOC_TPLG_CTL_ENUM:
>>           tplg_ec = container_of(hdr,
>>                   struct snd_soc_tplg_enum_control, hdr);
>> -        if (kctl->access & SNDRV_CTL_ELEM_ACCESS_READWRITE) {
>> +        if (kctl->access & SNDRV_CTL_ELEM_ACCESS_READ) {
>>               se = (struct soc_enum *)kctl->private_value;
>>               if (tplg_ec->priv.size)
>> -                return skl_init_enum_data(bus->dev, se,
>> -                        tplg_ec);
>> +                skl_init_enum_data(bus->dev, se, tplg_ec);
>>           }
>> +
>> +        if (hdr->ops.get == SKL_CONTROL_TYPE_MULTI_IO_SELECT_DMIC)
>> +            kctl->access = SNDRV_CTL_ELEM_ACCESS_READ;
>> +
>
> Is it intentional that you first test the kctrl->access as READ only, 
> and then later set it to READ only for DMICs? The sequence looks 
> rather odd?


This basiccally checks if given control has READ access right, it will 
pass for both READ and READWRITE (since READWRITE = READ|WRITE).

And when the control has READWRITE access we change it to READ-only, to 
prevent interference from user.

