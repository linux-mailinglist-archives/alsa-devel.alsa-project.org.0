Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEC21B7015
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 10:54:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45B5F168F;
	Fri, 24 Apr 2020 10:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45B5F168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587718473;
	bh=9kc4fqZpxm2A3eq/9p/t4JGw+yjMH0yvI5bjUHpN0Q4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j+TazytRxhwAFNBi5cZKk0m/uGEeL30JDCjOe6IwKPlqtiAyJEQgbKGUIPumGnAZo
	 SdEsqx2FB+6VEqmIe07UVCujRWpZthaU9Zds+NKy+6aqRD36teLD5/J8Z4Lhg4N3nw
	 Uvm4tIeGIVEklSXUgKEvJfggVw8yeu1aX2hxvGEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69211F800BE;
	Fri, 24 Apr 2020 10:52:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0457FF80116; Fri, 24 Apr 2020 10:52:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57962F80116
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 10:52:44 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2A0C3A003F;
 Fri, 24 Apr 2020 10:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2A0C3A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1587718364; bh=umrPAMGw3M7BHZG2RNGg/QheJdXlZfgOZZX0SQIMA+g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=J+Tf9Oq642SP46Suqngod29j3Z7NP1u8p5t0L78a/0awfGKxmzG2r8NtTTNScw7uZ
 yE/qhHY3ZOoNcQw/NRkgQegnVMoLf5WOM+96gcSotmKbA97MSGKVqar89SQD8Vou6L
 LYklpWtQVoq4CN2IeHcweCRYSXuPuSCVPdGcZW+U=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 24 Apr 2020 10:52:39 +0200 (CEST)
Subject: Re: ASoC driver names
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <c57f21dc-412d-3057-6150-b96d96a20727@perex.cz>
 <20200423110437.GF4808@sirena.org.uk>
 <e31a20e6-91ab-2f30-f496-064bea07762a@perex.cz>
 <7b44a625-fe88-5eac-280f-daa15a7c83dc@linux.intel.com>
 <20200423184056.GS4808@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <aaff591f-9f3a-257b-4fba-71c39b3bf3ea@perex.cz>
Date: Fri, 24 Apr 2020 10:52:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423184056.GS4808@sirena.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Dne 23. 04. 20 v 20:40 Mark Brown napsal(a):
> On Thu, Apr 23, 2020 at 11:17:30AM -0500, Pierre-Louis Bossart wrote:
> 
>> I am all for Jaroslav's proposal of making the driver name the basis for UCM
>> identification. we've been working on this since e.g. the addition of the
>> sof- prefix creates a driver name that makes no sense after a truncation of
>> the card name to 16 characters [1] [2] - still WIP.
> 
>> Making the card name more user-friendly is also a good thing, there's also a
>> nice hidden feature when the card name contains spaces, the last word -
>> typically the codec - is used for the card ID.
> 
>> But reporting an error when the driver name is not set is a bit extreme and
>> would break all Intel boards. I think we want to encourage people to move to
>> the suggested solution, but do we want to break existing setups?
> 
> That's an issue, yes - it makes me think we need a really strong case to
> change things.

I just wanted to point to the source location, where the check should be 
added. If you remove the return, then only the warning will be printed.

Also, we can add the .driver_name to all Intel drivers without the driver name 
change for the stable drivers. I would prefer the massive change (cleanup also 
those driver names conditionally), but I know, you're a bit paranoid here ;-)

>> I must admit I also don't see a generic solution when the card is generated
>> from a DT description, it's not straightforward to translate parsed elements
>> into human-readable ones.
> 
> We do let people just fill in an arbatrary string in the generic cards,
> not actually checked how many do something sensible though.  This is a
> big worry for me, if we're solving the problem by doing something that
> doesn't work for generic cards that means that as the generic cards get
> better and we need fewer custom cards whatever issues the current
> situation causes in userspace will get worse.  For them the commonality
> is likely to come from one or more of the components in the card and the
> card itself isn't really interesting.
> 
> My instinct is that the machine driver name is being used as a
> proxy for something else here and that if we need to change the ABI
> perhaps we need to extend it rather than trying to shoehorn things into
> what's there.

My point is that this information is duplicated in the sense, that we have 
three fields with the similar contents passed from the audio driver by the 
ASoC drivers whose set only snd_soc_card->name from the device tree.

For generic drivers: They can pass a generic driver name (like 'ASoC Simple') 
for the simple card driver (soc/generic/simple-card.c).

So my proposal is to change the driver_name to the right contents (it was the 
initial intention for this field - changed somehow for ASoC). An information 
about the used driver which is independent on the real configuration (device 
tree, ACPI, component enumeration etc.). In other words, the name should be 
more close to the source (top-level driver) code name than the hardware 
configuration.

The hardware configuration may be described in the card names and components 
string field (struct snd_ctl_card_info), so that the user space can do a more 
finer usage decision later.

>> While I am at it, I think we should probably avoid using the DMI information
>> for the long card name. It's just awful. It might be a better idea to add it
>> in the component strings (if it fits) so that UCM can use it internally, but
>> it's really horrible. Even with the clean-ups suggested by Jaroslav I
>> ended-up with this horror of a long name on my test device:
> 
>> root@Zotac:~# cat /proc/asound/cards
>>   0 [rt5640         ]: SOF - sof-bytcht rt5640
>>                        ZOTAC-XXXXXX-XX-CherryTrailFFD
> 
> I don't actually appear to have any DMI equipped systems with non-HDA
> sound cards but looking at the systems I have (a mix of Lenovo and Dell)
> they all have sensible display names in the DMI corresponding to the
> model name.  But yeah, outside of enterprise users nobody really pays
> attention to DMI so there's serious QoI issues in general.
> 
>> If we really wanted to be user-friendly we'd use something like
> 
>> "SOF card for Baytrail/Cherrytrail devices with Realtek RT5640 codec"
> 
>> and apply the same pattern for all machine drivers.
> 
> It kind of depends on how well filled in the DMI stuff is - if it's
> badly filled in it's obviously not useful but if you have a clear model
> name it works fairly well and matches what a lot of Windows systems do.

The question is if we resist to use this information in this form. UCM2 can 
read DMI over sysfs (e.g. /sys/class/dmi/id/product_name can be read using 
${sys:class/dmi/id/product_name} substitution and do the string / regex 
matching on it).

I would prefer to have the sound hardware description in the long name field 
than the whole hardware platform info here, too.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
