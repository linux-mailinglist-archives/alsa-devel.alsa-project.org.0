Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D222877AFAE
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 04:54:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62AE87F1;
	Mon, 14 Aug 2023 04:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62AE87F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691981689;
	bh=jYiX4UF2Ji6RPXkUgAp93mlmJdC8u7Q3xrY3ORfGb74=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DYoRWXuAiDCb+LPVju4ZFmb5hXsKjkTELOm2GN5Lkfe8OBCEp7jGQsiAr7DT4OD05
	 qa4bUoPlS5tiBNvLKs9aOeJ1nVG5+puVlE6tfahWb5+lHOMNOJTtnXJO/+jFnLUx4M
	 g7JpMIiIuO2W1OsZgQ/YXxwlA0CTgsJ8CjxA9YD8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91497F80536; Mon, 14 Aug 2023 04:53:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5320F80254;
	Mon, 14 Aug 2023 04:53:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3D8CF8025F; Mon, 14 Aug 2023 04:53:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B0CBF80074
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 04:53:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B0CBF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=uIWDMnTf
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id EE2E6833BF;
	Mon, 14 Aug 2023 04:53:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1691981619;
	bh=lV7bVhPDLY4Nxhzg+uqDkNUFK5eh+AMesuLtIf2K9i4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uIWDMnTfPAx3QESbCKb4oU0RVCcS/hGicTDzwBPtp3J01PSuyly/xilcrfre27nbi
	 zr31B5duhAo7fgKtcG9zX3xn4KQ3tCB+Tx7z6Rzx4KVuADl2EwUBMfKGPowqmD0CDp
	 1yZg4vyZ+F0lYCF8HUo+aPqydjZwjTdiBluJDxnWxy4G77WYq1GqD6OznD6MAO00id
	 v15qnspOuJkzTSuiacXewifoINv/CBej8u8FqyUTirOhTtaRXKfB3iGgblUBuZUrrZ
	 vfViUo28wC4dF3zWtj2mBa8kZvDngk/Zn45LPFLLG7pZ58G74CsejMkJ77VmfEM/wt
	 i5ArMNRuibfrA==
Message-ID: <545844bb-c16e-4675-0f13-d76646d866fd@denx.de>
Date: Mon, 14 Aug 2023 04:26:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] Input: pwm-beeper - Support volume setting via sysfs
Content-Language: en-US
To: John Watts <contact@jookia.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jeff LaBundy <jeff@labundy.com>, Takashi Iwai <tiwai@suse.de>,
 linux-input@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Manuel Traut <manuel.traut@mt.com>, Thierry Reding
 <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <873514d2ju.wl-tiwai@suse.de>
 <63adce9a-df65-b462-9055-0ece5216d680@denx.de> <87tttkjmyu.wl-tiwai@suse.de>
 <0cffe366-75af-d8a8-8920-6fb94c321a89@denx.de> <87h6pkjh7q.wl-tiwai@suse.de>
 <618add56-3675-4efe-5b20-665c10040e03@denx.de> <ZMfgJ3o00nApkXGp@google.com>
 <f4612dc5-a7d4-74ba-2ed8-ea70314625b6@denx.de> <ZMh0Sa9s25JHhWw5@nixie71>
 <ZMi0HT/yaTo9uTyi@google.com> <ZNYsGr6yBeVTtNMK@titan>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ZNYsGr6yBeVTtNMK@titan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Message-ID-Hash: XQHJMT7EPBLYHV3JVIB4BIW2THFR5IVW
X-Message-ID-Hash: XQHJMT7EPBLYHV3JVIB4BIW2THFR5IVW
X-MailFrom: marex@denx.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQHJMT7EPBLYHV3JVIB4BIW2THFR5IVW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/11/23 14:39, John Watts wrote:
> On Tue, Aug 01, 2023 at 12:28:29AM -0700, Dmitry Torokhov wrote:
>> If we want to extend the API we will need to define exactly how it will
>> all work. I.e. what happens if userspace mixes the old SND_TONE and
>> SND_BELL with the new SND_BELL_VOL or whatever. Does it play with
>> previously set volume? The default one? How to set the default one? How
>> to figure out what the current volume is if we decide to make volume
>> "sticky"?
>>
>> As far as userspace I expect it is more common to have one program (or
>> component of a program) to set volume and then something else requests
>> sound, so having one-shot API is of dubious value to me.
>>
>> I hope we can go with Takashi's proposal downthread, but if not I wonder
>> if the sysfs approach is not the simplest one. Do we expect more beepers
>> that can control volume besides pwm-beeper?
>>
>> Thanks.
>>
>> -- 
>> Dmitry
> 
> (Just to duck in as someone that has written a little program to play beeps and
> tones using the EV_TONE API)
> 
> It might be worth distinguishing between the goals of having some beeps with
> different volumes compared to all beeps with different volumes.
> 
> Sound card mixers generally control some sort of global volume while I would
> imagine the tone API would control per-tone volume. I don't know too much about
> safety guarantees but writing an input then sysfs or mixer then input again
> seems like it could get jumbled up.
> 
> In that speicfic case I think it would make more sense to send volume and tone
> from whatever beep API is being used, with the volume being a multiplier of the
> loudest volume. This is similar to how audio works with PCM output. Existing
> beeps would have the volume set to 100%.

I agree binding tone frequency and volume together would be better.
The API would be nicer and easier to use in my opinion too.
