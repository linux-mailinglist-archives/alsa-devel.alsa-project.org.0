Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B02E51C0A77
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 00:38:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AF42168C;
	Fri,  1 May 2020 00:37:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AF42168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588286289;
	bh=ThB8tUHoPze9TgTm//xVsh3HcVriGhcjw25khWTDGGs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QkBfnj8kCj5l5NbPXOkC8gQllCNzy/M2EFXX0RYfDOtHSZ0dRXFqTsolvjjcFmTGe
	 44Xj++/MN7ZeB7OB8NESnIAkOwFriBwe2hsSFqKdaejXjyqEvmbCwai7dR7ZAaBq4U
	 lJLlELkXRWOrsR2mCpWJaLhzdGxGmUv8x+6o5BTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2EB7F801F7;
	Fri,  1 May 2020 00:36:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BBBCF801DB; Fri,  1 May 2020 00:36:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_1,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mupuf.org (mupuf.org [167.71.42.210])
 by alsa1.perex.cz (Postfix) with ESMTP id DEB01F800B6
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 00:36:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEB01F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=spliet.org header.i=@spliet.org
 header.b="a3LJi6CM"
Received: from [10.249.163.62] (global-5-181.nat-2.net.cam.ac.uk
 [131.111.5.181])
 by Neelix.spliet.org (Postfix) with ESMTPSA id 339F960040;
 Thu, 30 Apr 2020 23:36:06 +0100 (BST)
DKIM-Filter: OpenDKIM Filter v2.11.0 Neelix.spliet.org 339F960040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spliet.org;
 s=default; t=1588286166;
 bh=mAYCq6SwMehYdTI3mtH0OjWKuuvEEz7e13q+p2AAlYc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=a3LJi6CM20lYKOOOEcb9ovSGV3HB7MjuYPkEgoYEPrDAEeTXvAT695bvcpzXdUHU6
 mVExCA7Xh8anvFOXwHun6Fk3Y7Oh0astY6eoFgNFp0KZ4rYtu1Z0KHaaCqylbAPRGE
 Km7qRT7U/2vODCJ3mNd6tgGT9pHcFsN5C89uoffM=
Subject: Re: [PATCH AUTOSEL 5.6 12/38] ALSA: hda: Skip controller resume if
 not needed
To: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>
References: <20200424122237.9831-1-sashal@kernel.org>
 <20200424122237.9831-12-sashal@kernel.org> <s5himhprr32.wl-tiwai@suse.de>
From: Roy Spliet <nouveau@spliet.org>
Message-ID: <f5f301c7-a74d-7c2e-d182-3f003bfc061b@spliet.org>
Date: Thu, 30 Apr 2020 23:36:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <s5himhprr32.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at Neelix
X-Virus-Status: Clean
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
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

(Minus "Linux kernel", that list has enough volume)

Op 24-04-2020 om 13:44 schreef Takashi Iwai:
> On Fri, 24 Apr 2020 14:22:10 +0200,
> Sasha Levin wrote:
>>
>> From: Takashi Iwai <tiwai@suse.de>
>>
>> [ Upstream commit c4c8dd6ef807663e42a5f04ea77cd62029eb99fa ]
>>
>> The HD-audio controller does system-suspend and resume operations by
>> directly calling its helpers __azx_runtime_suspend() and
>> __azx_runtime_resume().  However, in general, we don't have to resume
>> always the device fully at the system resume; typically, if a device
>> has been runtime-suspended, we can leave it to runtime resume.
>>
>> Usually for achieving this, the driver would call
>> pm_runtime_force_suspend() and pm_runtime_force_resume() pairs in the
>> system suspend and resume ops.  Unfortunately, this doesn't work for
>> the resume path in our case.  For handling the jack detection at the
>> system resume, a child codec device may need the (literally) forcibly
>> resume even if it's been runtime-suspended, and for that, the
>> controller device must be also resumed even if it's been suspended.
>>
>> This patch is an attempt to improve the situation.  It replaces the
>> direct __azx_runtime_suspend()/_resume() calls with with
>> pm_runtime_force_suspend() and pm_runtime_force_resume() with a slight
>> trick as we've done for the codec side.  More exactly:
>>
>> - azx_has_pm_runtime() check is dropped from azx_runtime_suspend() and
>>    azx_runtime_resume(), so that it can be properly executed from the
>>    system-suspend/resume path
>>
>> - The WAKEEN handling depends on the card's power state now; it's set
>>    and cleared only for the runtime-suspend
>>
>> - azx_resume() checks whether any codec may need the forcible resume
>>    beforehand.  If the forcible resume is required, it does temporary
>>    PM refcount up/down for actually triggering the runtime resume.
>>
>> - A new helper function, hda_codec_need_resume(), is introduced for
>>    checking whether the codec needs a forcible runtime-resume, and the
>>    existing code is rewritten with that.
>>
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207043
>> Link: https://lore.kernel.org/r/20200413082034.25166-6-tiwai@suse.de
>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> This commit is known to cause a regression, and the fix patch is
> included in today's pull request.  If we apply this, better to wait
> for the next batch including its fix.

These six patches, plus Takashi's fix on top of them, do not seem to 
have made it to 5.6.7 or 5.6.8 in the end. Is there a plan to include 
them in 5.6.9?
Thanks,

Roy

> 
> 
> thanks,
> 
> Takashi
> 
> 
>> ---
>>   include/sound/hda_codec.h |  5 +++++
>>   sound/pci/hda/hda_codec.c |  2 +-
>>   sound/pci/hda/hda_intel.c | 38 +++++++++++++++++++++++++++-----------
>>   3 files changed, 33 insertions(+), 12 deletions(-)
>>
>> diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
>> index 3ee8036f5436d..225154a4f2ed0 100644
>> --- a/include/sound/hda_codec.h
>> +++ b/include/sound/hda_codec.h
>> @@ -494,6 +494,11 @@ void snd_hda_update_power_acct(struct hda_codec *codec);
>>   static inline void snd_hda_set_power_save(struct hda_bus *bus, int delay) {}
>>   #endif
>>   
>> +static inline bool hda_codec_need_resume(struct hda_codec *codec)
>> +{
>> +	return !codec->relaxed_resume && codec->jacktbl.used;
>> +}
>> +
>>   #ifdef CONFIG_SND_HDA_PATCH_LOADER
>>   /*
>>    * patch firmware
>> diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
>> index 53e7732ef7520..aed1f8188e662 100644
>> --- a/sound/pci/hda/hda_codec.c
>> +++ b/sound/pci/hda/hda_codec.c
>> @@ -2951,7 +2951,7 @@ static int hda_codec_runtime_resume(struct device *dev)
>>   static int hda_codec_force_resume(struct device *dev)
>>   {
>>   	struct hda_codec *codec = dev_to_hda_codec(dev);
>> -	bool forced_resume = !codec->relaxed_resume && codec->jacktbl.used;
>> +	bool forced_resume = hda_codec_need_resume(codec);
>>   	int ret;
>>   
>>   	/* The get/put pair below enforces the runtime resume even if the
>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>> index aa0be85614b6c..02c6308502b1e 100644
>> --- a/sound/pci/hda/hda_intel.c
>> +++ b/sound/pci/hda/hda_intel.c
>> @@ -1027,7 +1027,7 @@ static int azx_suspend(struct device *dev)
>>   	chip = card->private_data;
>>   	bus = azx_bus(chip);
>>   	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
>> -	__azx_runtime_suspend(chip);
>> +	pm_runtime_force_suspend(dev);
>>   	if (bus->irq >= 0) {
>>   		free_irq(bus->irq, chip);
>>   		bus->irq = -1;
>> @@ -1044,7 +1044,9 @@ static int azx_suspend(struct device *dev)
>>   static int azx_resume(struct device *dev)
>>   {
>>   	struct snd_card *card = dev_get_drvdata(dev);
>> +	struct hda_codec *codec;
>>   	struct azx *chip;
>> +	bool forced_resume = false;
>>   
>>   	if (!azx_is_pm_ready(card))
>>   		return 0;
>> @@ -1055,7 +1057,20 @@ static int azx_resume(struct device *dev)
>>   			chip->msi = 0;
>>   	if (azx_acquire_irq(chip, 1) < 0)
>>   		return -EIO;
>> -	__azx_runtime_resume(chip, false);
>> +
>> +	/* check for the forced resume */
>> +	list_for_each_codec(codec, &chip->bus) {
>> +		if (hda_codec_need_resume(codec)) {
>> +			forced_resume = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (forced_resume)
>> +		pm_runtime_get_noresume(dev);
>> +	pm_runtime_force_resume(dev);
>> +	if (forced_resume)
>> +		pm_runtime_put(dev);
>>   	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
>>   
>>   	trace_azx_resume(chip);
>> @@ -1102,12 +1117,12 @@ static int azx_runtime_suspend(struct device *dev)
>>   	if (!azx_is_pm_ready(card))
>>   		return 0;
>>   	chip = card->private_data;
>> -	if (!azx_has_pm_runtime(chip))
>> -		return 0;
>>   
>>   	/* enable controller wake up event */
>> -	azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) |
>> -		  STATESTS_INT_MASK);
>> +	if (snd_power_get_state(card) == SNDRV_CTL_POWER_D0) {
>> +		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) |
>> +			   STATESTS_INT_MASK);
>> +	}
>>   
>>   	__azx_runtime_suspend(chip);
>>   	trace_azx_runtime_suspend(chip);
>> @@ -1118,17 +1133,18 @@ static int azx_runtime_resume(struct device *dev)
>>   {
>>   	struct snd_card *card = dev_get_drvdata(dev);
>>   	struct azx *chip;
>> +	bool from_rt = snd_power_get_state(card) == SNDRV_CTL_POWER_D0;
>>   
>>   	if (!azx_is_pm_ready(card))
>>   		return 0;
>>   	chip = card->private_data;
>> -	if (!azx_has_pm_runtime(chip))
>> -		return 0;
>> -	__azx_runtime_resume(chip, true);
>> +	__azx_runtime_resume(chip, from_rt);
>>   
>>   	/* disable controller Wake Up event*/
>> -	azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
>> -			~STATESTS_INT_MASK);
>> +	if (from_rt) {
>> +		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
>> +			   ~STATESTS_INT_MASK);
>> +	}
>>   
>>   	trace_azx_runtime_resume(chip);
>>   	return 0;
>> -- 
>> 2.20.1
>>
