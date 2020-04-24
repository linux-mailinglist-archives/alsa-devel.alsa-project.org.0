Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 109211B7C7D
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 19:13:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEE8616B5;
	Fri, 24 Apr 2020 19:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEE8616B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587748427;
	bh=+VE+NQ81YVYV4TXqAM/mUrG7qUrEibWFYaZTQVK1Njc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aIBqtEjGu6yGTm4gcPyMimF6E2GhRgyYs3FphZj2L5x6DFQd5bcvSOeTQK7B0UNLZ
	 jYnPQuMRJCla+/mGbCu8k95HCAgFGnRsyULtAkvB4CpH+vv0wYTh1MtUVx9iVqL9FI
	 L9khlnxIFi85Je6ugC4VnyidW3MX56P76BX3OM7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA8F4F801D9;
	Fri, 24 Apr 2020 19:12:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55965F80142; Fri, 24 Apr 2020 19:11:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4505AF800BE
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 19:11:52 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4DE3FA003F;
 Fri, 24 Apr 2020 19:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4DE3FA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1587748311; bh=K6mkBJaiCHT3DGoG7CC90jy66cm0Spxv//I393xsgFs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=3re/tz74jQyCyvv5cWLA7mNfyBfKepP/zdSnGK1B00+tEPOY4+AcRM7u9U3g0nf+R
 GDabq2MN1l390p7y9YTpH8KNlFZya0qk6317HfakinULcGsMOANblrkphNq3zUSzvl
 8QIczkUsw8vKTBeyrO4ufcIHV57VGc+Ryqie4cd0=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 24 Apr 2020 19:11:46 +0200 (CEST)
Subject: Re: ASoC driver names
To: Mark Brown <broonie@kernel.org>
References: <c57f21dc-412d-3057-6150-b96d96a20727@perex.cz>
 <20200423110437.GF4808@sirena.org.uk>
 <e31a20e6-91ab-2f30-f496-064bea07762a@perex.cz>
 <7b44a625-fe88-5eac-280f-daa15a7c83dc@linux.intel.com>
 <20200423184056.GS4808@sirena.org.uk>
 <aaff591f-9f3a-257b-4fba-71c39b3bf3ea@perex.cz>
 <20200424164944.GI5850@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <0a1b7396-f7d9-b6a9-2e85-70517b5dc718@perex.cz>
Date: Fri, 24 Apr 2020 19:11:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424164944.GI5850@sirena.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Dne 24. 04. 20 v 18:49 Mark Brown napsal(a):
> On Fri, Apr 24, 2020 at 10:52:38AM +0200, Jaroslav Kysela wrote:
>> Dne 23. 04. 20 v 20:40 Mark Brown napsal(a):
> 
>>> My instinct is that the machine driver name is being used as a
>>> proxy for something else here and that if we need to change the ABI
>>> perhaps we need to extend it rather than trying to shoehorn things into
>>> what's there.
> 
>> My point is that this information is duplicated in the sense, that we have
>> three fields with the similar contents passed from the audio driver by the
>> ASoC drivers whose set only snd_soc_card->name from the device tree.
> 
>> For generic drivers: They can pass a generic driver name (like 'ASoC
>> Simple') for the simple card driver (soc/generic/simple-card.c).
> 
>> So my proposal is to change the driver_name to the right contents (it was
>> the initial intention for this field - changed somehow for ASoC). An
>> information about the used driver which is independent on the real
>> configuration (device tree, ACPI, component enumeration etc.). In other
>> words, the name should be more close to the source (top-level driver) code
>> name than the hardware configuration.
> 
> So if it's not really going to be used for anything particularly
> concrete then I'm having a hard time summoning the enthusiasm for a
> change.

The driver name is used as the directory name in UCM / UCM2. For DT, it means 
thousands possible directories (one per board / board + codec variant and so 
on..). The generic simple asoc card is a good example.

>  It feels more like a neatness thing than anything else and the
> postitive case just isn't jumping out at me, certainly not as a thing to
> force for everything.  New stuff, sure.  I guess I'm not bothered enough
> to block any platform that has a burning desire to convert either though
> if users start coming and complaining about kernel upgrades breaking
> things we'd have to revert.

:-( I don't propose to force one way. We can conditionally change the driver 
names using a well documented CONFIG_ option to keep compatibility with the 
older user space code. The new driver names may be selected manually in the 
kernel config.

>> I would prefer to have the sound hardware description in the long name field
>> than the whole hardware platform info here, too.
> 
> Does it also cope with the DT equivalents (and I guess there's nothing
> we can do for board file based systems)?  This stuff does get used for
> embedded systems where the plastics are often important for the
> configuration.

The author of DT config knows what hardware is described, thus this person 
should be resposible for the nice GUI sound part name.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
