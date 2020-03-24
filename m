Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED82A1903E3
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 04:42:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70C4715F8;
	Tue, 24 Mar 2020 04:41:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70C4715F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585021328;
	bh=ISzvoINRWyOubaRFeP4tv27fOomfgjXpcqnsZpCynCA=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=puM56n0ccxQah3d3Phsh7lihjkVeykZwaUXi89PdcMuYS+tMSb4e5aCgwyB6TdJfs
	 EwFSFTFrnST2NKy2gGOLGP/Qu14Jh/o/cwyKNFZtNJUpD73t9U5yim4l5b6QGv2goj
	 5Pbx0GeTf1GJAVq4OX2dX0Apjc74SPTMgEqPgm8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75381F80227;
	Tue, 24 Mar 2020 04:40:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1299F801F9; Tue, 24 Mar 2020 04:40:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BD41F800FE
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 04:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BD41F800FE
IronPort-SDR: J+p+IfQc8U7rxTq8HH2KNS+fBzbQHd8X6Uz9Ny/NndxxO8v9DN8vPy+NEJZzwSfOso/i1rcYxa
 ECWBSLlblDEw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 20:40:15 -0700
IronPort-SDR: Oz2Cs+8ZFG8ghLkuJgLVF8bqsKfJMSRIHsfec49xmZJeL0FJeYlpNHrBY4GjUQ9h9o0SDkHA2z
 4o1Lq7sI0a0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,298,1580803200"; d="scan'208";a="238088986"
Received: from chialinh-mobl1.amr.corp.intel.com (HELO [10.134.83.72])
 ([10.134.83.72])
 by fmsmga007.fm.intel.com with ESMTP; 23 Mar 2020 20:40:14 -0700
Subject: Re: [PATCH] ALSA: core: sysfs: show components string
To: alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org
References: <20200323193623.3587-1-pierre-louis.bossart@linux.intel.com>
 <20200324015331.GA3679@workstation>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d31659cc-d528-345f-1e56-b0cfae36be5c@linux.intel.com>
Date: Mon, 23 Mar 2020 22:34:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200324015331.GA3679@workstation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 3/23/20 8:53 PM, Takashi Sakamoto wrote:
> Hi,
> 
> On Mon, Mar 23, 2020 at 02:36:23PM -0500, Pierre-Louis Bossart wrote:
>> Add attribute and show the components string. This is useful to see
>> what is provided to userspace and e.g. used by UCM to understand the
>> card configuration:
>>
>> root@plb:~# more /sys/class/sound/card0/components
>> HDA:8086280b,80860101,00100000 cfg-spk:2 hs:rt711 spk:rt1308 mic:rt715
>>
>> Note that the style uses what's recommended by checkpatch.pl and is
>> slightly different from other sysfs attributes.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   sound/core/init.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>   
> I have a concern about this patch in a point of userspace interface.
> 
> The 'component' field of 'struct snd_ctl_card_info' is just defined to
> have strings with space-separated chunks, and its actual value is not
> so fine-documented, thus it's largely different depending of developers
> of each driver.

In case you missed it, the components are used by machine drivers to 
report e.g. number of speakers, mics, etc, so that UCM can find the 
right configuration. For a given family of products, the syntax will be 
fixed, e.g. hs stands for headset codec, etc.

> $ cat include/uapi/sound/asound.h
>       ...
>   941 struct snd_ctl_card_info {
>           ...
>   950     unsigned char components[128];  /* card components / fine identification, delimited with one space (AC97 etc..) */
>   951 };
> 
> On the other hand, the node of sysfs is quite common in Linux because
> it's tightly coupled to kernel objects. Let you see files under
> 'Documentation/ABI/'. We can find efforts to maintain sysfs node so
> safe and stable. Due to this reason, it's better to take more care when
> adding new node.
> 
> Would I request you the reason to add this node and the reason that
> current ALSA control interface doesn't satisfy your requirement?

simplicity for user support. Anyone can peak at a sysfs file, not 
everyone is familiar with the alsa control interface.

We get lots of bug reports from people who are asking for configuration 
help, and the simpler the command is the better.

>> diff --git a/sound/core/init.c b/sound/core/init.c
>> index b02a99766351..decaf944a8ad 100644
>> --- a/sound/core/init.c
>> +++ b/sound/core/init.c
>> @@ -695,9 +695,21 @@ card_number_show_attr(struct device *dev,
>>   
>>   static DEVICE_ATTR(number, 0444, card_number_show_attr, NULL);
>>   
>> +static ssize_t
>> +components_show(struct device *dev,
>> +		struct device_attribute *attr, char *buf)
>> +{
>> +	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
>> +
>> +	return scnprintf(buf, PAGE_SIZE, "%s\n", card->components);
>> +}
>> +
>> +static DEVICE_ATTR_RO(components);
>> +
>>   static struct attribute *card_dev_attrs[] = {
>>   	&dev_attr_id.attr,
>>   	&dev_attr_number.attr,
>> +	&dev_attr_components.attr,
>>   	NULL
>>   };
>>   
>> -- 
>> 2.20.1
>   
> 
> Regards
> 
> Takashi Sakamoto
> 
