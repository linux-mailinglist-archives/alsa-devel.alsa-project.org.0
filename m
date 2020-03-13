Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E094818443E
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 11:01:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 808D217B1;
	Fri, 13 Mar 2020 11:00:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 808D217B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584093687;
	bh=QIQGlGlYba4F+A8X2gzQVv9DbBwsVHam1ML8fquw7ts=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LUwBPKrlL6z+YGO111wk54EcyhkKez6KFyHic6/woq4588BrwVrTEyI834JwNXQ+I
	 +YTaiNv7z6SNnJv7p0/lDYlKPtvg0DU4+rLGhSAPlPpz2MzUvpXmbNFXLEPLEv8Alk
	 kYL3kdOVtjSR1qvI3PppzpEZ52l/6MbwAxTveBbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97B4FF8013E;
	Fri, 13 Mar 2020 10:59:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2510F80086; Fri, 13 Mar 2020 10:59:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7661F80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 10:59:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7661F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="JcICvkbW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LEoFcXfkO1Urb14iAKuMsZCHpDwvAc8QD9xP7ws/9Ow=; b=JcICvkbW85osvXIJKia0mPJ4Q6
 vANH4V7W9LxsT504wUfte46U5xHnvYmoObbWAK8mXPuYjEFmSfIWcQC3ZCiyYE0OJJXyUD9TgU2GN
 MSGjTe8FN+E7Au8/uF7lJyypvdndoZQU5ajDelUHs/KNwtdr9eYTFUYRr6VrxgjDM53nCIsKY4o/+
 clf7r07q3WvWYXKSVlM2XkOOc+biu/RXKMfmC07hTBIrdWfiJR90265AGfF5UhuLzcTMMHVseLN1D
 4x73aO2D+//9xp60ODWDwoW+ed5+pguMHf4OWW/3rYbv4H7qsxOwIrQLjoAXCa1mNjmTHQOPU5Wd6
 4wCB/t4Q==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www381.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <lars@metafoo.de>)
 id 1jCh6E-0002y7-5x; Fri, 13 Mar 2020 10:59:26 +0100
Received: from [93.104.108.183] (helo=[192.168.178.20])
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1jCh6D-000LkB-UU; Fri, 13 Mar 2020 10:59:26 +0100
Subject: Re: ASoc: soc_core.c stream direction from snd_soc_dai
To: Matt Flax <flatmax@flatmax.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <5598a2fc-9b49-ad5e-2265-fbc0593ead1b@flatmax.org>
 <0d9a9459-9cd7-d384-b1ff-72860895ad13@linux.intel.com>
 <73148789-58f7-2228-ae42-465cdafcff4c@flatmax.org>
 <52e1a640-b46f-b494-2047-849c1999eb28@flatmax.org>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <7607dd99-0d54-2bab-7407-836a42647f4c@metafoo.de>
Date: Fri, 13 Mar 2020 10:59:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <52e1a640-b46f-b494-2047-849c1999eb28@flatmax.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.2/25749/Thu Mar 12 14:09:06 2020)
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

On 3/13/20 4:56 AM, Matt Flax wrote:
>
> On 13/3/20 10:19 am, Matt Flax wrote:
>>
>> On 13/3/20 9:55 am, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 3/11/20 5:54 PM, Matt Flax wrote:
>>>> Hi there,
>>>>
>>>> A large number of audio codecs allow different formats for playback 
>>>> and capture. This becomes very useful when there are different 
>>>> latencies between playback and capture hardware data lines. For 
>>>> example digital isolation chips typically have a 1 bit delay in 
>>>> propagation as the bit clock rate gets faster for higher sample 
>>>> rates. By setting the capture and playback formats to differ by one 
>>>> or two bit clock cycles, the delay problem is solved.
>>>>
>>>> There doesn't seem to be a simple way to detect stream direction in 
>>>> the codec driver's set_fmt function.
>>>>
>>>> The snd_soc_runtime_set_dai_fmt function :
>>>>
>>>> https://github.com/torvalds/linux/blob/master/sound/soc/soc-core.c#L1480 
>>>>
>>>>
>>>> calls the snd_soc_dai_set_fmt function :
>>>>
>>>> https://github.com/torvalds/linux/blob/master/sound/soc/soc-dai.c#L101
>>>>
>>>> which calls the set_fmt function :
>>>>
>>>> https://github.com/torvalds/linux/blob/master/include/sound/soc-dai.h#L189 
>>>>
>>>>
>>>>
>>>> The snd_soc_dai_ops set_fmt function is defined as :
>>>>
>>>>      int (*set_fmt)(struct snd_soc_dai *dai, unsigned int fmt);
>>>>
>>>>
>>>> Is there a simple way to find the stream direction from a 
>>>> snd_soc_dai ?
>>>>
>>>> If the stream direction can be detected then the playback and 
>>>> capture formats can be set independently for the codec.
>>>>
>>>> It there a different way to set the playback and capture formats 
>>>> for the codec independently at runtime, depending on the sample rate ?
>>>
>>> FWIW I remember a discussion in the past on how to deal with 
>>> interfaces that may have different clocks sources for capture and 
>>> playback (typically with the 6-pin version of I2S/TDM), and the 
>>> answer was: use two dais, with one dealing with capture and the 
>>> other with playback.
>>>
>>> I would bet this applies for the format as well. If you use a DAI 
>>> that can do both directions, then indeed there's no obvious way to 
>>> specify that formats or clock ownership could be different between 
>>> the two directions.
>>>
>>> It would probably make sense anyway to have a representation with 
>>> two dais, e.g. the codec capture dai receives data from somewhere 
>>> and the codec playback dai forwards it to another destination.
>>>
>> I think I get it ...
>>
>> This approach would keep extra stream selective functionality out of 
>> soc-dai.c. That is probably a good thing for the simplicity of the core.
>>
>> A machine driver could then call snd_soc_dai_set_fmt passing in the 
>> correct codec_dai from the codec_dais array for the stream they want 
>> to operate on.
>>
> In an example case, cs4271 ... how do we enforce symmetric rates ?

You'd have to do this manually in your driver. The core itself does not 
support synchronizing streams on different DAIs.

You can do this by saving the rate when it is set on the first stream 
and then apply a constraint to the second stream using 
snd_pcm_hw_constraint_single() it the driver's startup() callback.

Have a look at the uda134x.c or twl4030.c driver as an example.

But I think Pierre was mainly talking about the case where there are 
separate clocks for each direction and the rates don't have to be the 
same. I believe long term it might make sense to extend the core to 
allow different formats for input and output direction on the same DAI.

- Lars

