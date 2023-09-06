Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C48BC794401
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Sep 2023 21:56:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94933200;
	Wed,  6 Sep 2023 21:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94933200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694030191;
	bh=2KxpuPLY69OjJIbp80A3wlXtunQ/auxoaIoxRETzcuo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k4HqMhu2mNhEE5O/PlU7Gup0Yilo8fgYjMp8DRFjc4nhXzY4Jl41lOk7KHHQgqZxG
	 GnUvGhYsqdGbIYYp/u7Kx9Eq8DN0PWNG9tc3hDk6mQJeH6fVA1OIKmHCb1IPYxkRbh
	 nMJvfCj6GZIaCDdP7taEyPdOCjfG5yNYlNaY0d8w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5810FF80431; Wed,  6 Sep 2023 21:55:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 169AFF8047D;
	Wed,  6 Sep 2023 21:55:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9B61F80494; Wed,  6 Sep 2023 21:55:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B823EF80431
	for <alsa-devel@alsa-project.org>; Wed,  6 Sep 2023 21:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B823EF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=bUF3pS9k
Received: from [192.168.1.90] (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 37D2566071C9;
	Wed,  6 Sep 2023 20:55:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694030131;
	bh=2KxpuPLY69OjJIbp80A3wlXtunQ/auxoaIoxRETzcuo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bUF3pS9kNsMeA4GBVV8oVlUYwxPRUWLBPxbqecxYcS0mYabXunx6WVfxjTL4ho4/F
	 yuOb4doBJcKy6J2Vcp7RQvyMDkTOYJ2/aT+386cgbUwO4C0C+p25A0Z09jMKvxvewV
	 lbth5G93KdU0O9RmP3klpasFQUR7LikYGpIKrHtqo8pzoWD3EuZuPtwPQsuwzgwlAS
	 cT6iJbx6Z9zHrnlvn7vtvdASjk7sb42vKKinJiWmZPGluUiowWKvhyi+gpAHhOxk1p
	 onlaJyYm1rY9CxiHXQEw7ZC8GVhSrMXZtAkmu8rt46H5rWiMNCBytR51VkF+RpOqkU
	 D8YAKplrqyscw==
Message-ID: <de9bf872-16ca-4b4e-9543-87f463b985a0@collabora.com>
Date: Wed, 6 Sep 2023 22:55:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] ASoC: cs35l41: Use devm_pm_runtime_enable()
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
 <20230902210621.1184693-10-cristian.ciocaltea@collabora.com>
 <20230905094535.GK103419@ediswmail.ad.cirrus.com>
 <953eb242-4d52-4cdc-8f7d-71af003778c5@collabora.com>
 <20230906163725.GN103419@ediswmail.ad.cirrus.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20230906163725.GN103419@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: X5ELDPJ66CC7TZ2FBR5MK36IRVFSTDQV
X-Message-ID-Hash: X5ELDPJ66CC7TZ2FBR5MK36IRVFSTDQV
X-MailFrom: cristian.ciocaltea@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5ELDPJ66CC7TZ2FBR5MK36IRVFSTDQV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/6/23 19:37, Charles Keepax wrote:
> On Tue, Sep 05, 2023 at 10:15:46PM +0300, Cristian Ciocaltea wrote:
>> On 9/5/23 12:45, Charles Keepax wrote:
>>> On Sun, Sep 03, 2023 at 12:06:21AM +0300, Cristian Ciocaltea wrote:
>>>> Simplify runtime PM during probe by converting pm_runtime_enable() to
>>>> the managed version.
>>>>
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>> ---
>>>> @@ -1376,7 +1379,6 @@ void cs35l41_remove(struct cs35l41_private *cs35l41)
>>>>  	cancel_work_sync(&cs35l41->mdsync_up_work);
>>>>  
>>>>  	pm_runtime_get_sync(cs35l41->dev);
>>>> -	pm_runtime_disable(cs35l41->dev);
>>>>  
>>>>  	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1, 0xFFFFFFFF);
>>>>  	if (cs35l41->hw_cfg.bst_type == CS35L41_SHD_BOOST_PASS ||
>>>
>>> Are we sure this is safe? The remove handler appears to be
>>> written to disable pm_runtime at the start presumably to stop the
>>> resume/suspend handler running during the remove callback.
>>> Whereas after this change the pm_runtime isn't disabled until
>>> after the remove callback has run. Does this open a window were
>>> we could get an erroneous pm_runtime suspend after the
>>> pm_runtime_put_noidle?
>>
>> I've just made a test adding a 6s sleep before returning from the remove 
>> handler: 
>>
>> [14444.894316] cs35l41 spi-VLV1776:00: Runtime resume
>> [14444.894469] cs35l41 spi-VLV1776:00: sleep 6s before return of cs35l41_remove()
>> [14448.338994] cs35l41 spi-VLV1776:00: Runtime suspend
>> [14451.079649] cs35l41 spi-VLV1776:00: return from cs35l41_remove()
>> [14451.080129] cs35l41 spi-VLV1776:00: Runtime resume
>> [14451.080165] cs35l41 spi-VLV1776:00: ASoC: Unregistered DAI 'cs35l41-pcm'
>> [14451.080181] cs35l41 spi-VLV1776:00: Runtime suspend
>> [14451.813639] acp5x_i2s_playcap acp5x_i2s_playcap.0: ASoC: Unregistered DAI 'acp5x_i2s_playcap.0'
>>
>> As expected, suspend triggered, but a resume was issued later, before DAI
>> got unregistered.
>>
>> I didn't notice any issues while repeating the test several times, hence 
>> I wonder what would be the reason to prevent getting suspend/resume events 
>> at this point?
> 
> The enter/exit hibernate code might run, which at the very
> least might result in a bunch of unexpected and failing bus
> traffic. Having a bit of a poke through the code, I guess the
> most dangerous thing would if you actually got as far as an
> extra runtime resume. This might cause cs35l41_init_boost
> to run which would undo the work done by the call to
> cs35l41_safe_reset in remove, which could leave the boost in a
> dangerous state when we enable reset/power down the supplies,
> which I think was not considered good. But its just likely
> simpler/cleaner if we don't have to think about all the
> possible implications of such things by just not allowing
> it to happen.

Agree, let's keep it simple. I will revert the change and instead ensure
a proper cleanup of pm_runtime_use_autosuspend(), according to the
documentation:

"It's important to undo this with pm_runtime_dont_use_autosuspend() at
driver exit time unless your driver initially enabled pm_runtime with
devm_pm_runtime_enable() (which handles it for you)."

Thanks for the clarifications,
Cristian
