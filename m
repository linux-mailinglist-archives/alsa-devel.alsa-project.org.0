Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE097031A3
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 17:35:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 570D911C;
	Mon, 15 May 2023 17:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 570D911C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684164904;
	bh=ZnUoVhS/FE35yax+V1YDQO6qUJoK8TIlWnJ14gUSFPc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JhlEkIthO3NyDOR4u+883uBbr/3xsW23Ul1sNeYk7MS1bmh3rSXHm9Zh+y/IjVN3A
	 cma6CAkD4dhZfpCq6iF9CzRbHXx4d+KVIwA65liyFKBRIjuVUQojEs6cKG6EyQPud/
	 TMf6G3qu1zYbeuUeBYVFGOUSgdEpByPVHXloULZU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DCA6F8016D; Mon, 15 May 2023 17:33:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDD43F8025A;
	Mon, 15 May 2023 17:33:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9431CF80272; Mon, 15 May 2023 17:33:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9AF5F8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 17:33:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9AF5F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xT5O2slO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vz4hwPG8
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 260CC21B4D;
	Mon, 15 May 2023 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684164811;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FG4JPolXSJ4uCDdowSA2souVtePrsqtIkN9B3gJ2zEI=;
	b=xT5O2slOGyKEcgOHlDbc8NBfElxPI6SAqpG2fONJM8CKg/iPmen3dD0JJqmc7ThJ4OqdI/
	yJMh3GldzK56dadmX/HuKpLnhdoAA/HEQe/Qpwm4kX3awr5dbNDDnJhe/YXTKjf1MGkO+x
	2CcbZ3z8s4418135AEEdK8shiDnHP+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684164811;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FG4JPolXSJ4uCDdowSA2souVtePrsqtIkN9B3gJ2zEI=;
	b=vz4hwPG8bKOec4GE9+amvVR7TWt/g3kUZJdRvJVGuyQ7VErH2pnheoUC0K5mDWGzMMIE3s
	EnqNWPRm+KGa8iAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F2DBF138E5;
	Mon, 15 May 2023 15:33:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qXwUOspQYmSxBgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 15 May 2023 15:33:30 +0000
Date: Mon, 15 May 2023 17:33:30 +0200
Message-ID: <87cz31pq2d.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: HDA, power saving and recording
In-Reply-To: <63790c96-215b-bc8c-3ad6-7acbe487d85a@linux.intel.com>
References: <a7478636-af11-92ab-731c-9b13c582a70d@linux.intel.com>
	<878rdwjs1s.wl-tiwai@suse.de>
	<cceaeb53-06df-ced0-1f54-f5c0eb65f824@linux.intel.com>
	<87jzxe5084.wl-tiwai@suse.de>
	<41417b90-1881-0cbb-52e1-d63923dd8cd6@linux.intel.com>
	<87ilcxaj3u.wl-tiwai@suse.de>
	<87fs81ainl.wl-tiwai@suse.de>
	<7915b40e-a65a-479d-5a2b-062ee3cb432b@linux.intel.com>
	<87bkipag9z.wl-tiwai@suse.de>
	<98943bc1-c56c-45aa-06d2-80c618d0585c@linux.intel.com>
	<878rdplpci.wl-tiwai@suse.de>
	<63790c96-215b-bc8c-3ad6-7acbe487d85a@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5FMISDRLSHM4XRH6KPWAATK6UMU6UWZR
X-Message-ID-Hash: 5FMISDRLSHM4XRH6KPWAATK6UMU6UWZR
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5FMISDRLSHM4XRH6KPWAATK6UMU6UWZR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 15 May 2023 16:49:48 +0200,
Amadeusz S³awiñski wrote:
> 
> On 5/15/2023 3:02 PM, Takashi Iwai wrote:
> > On Mon, 15 May 2023 13:19:29 +0200,
> > Amadeusz S³awiñski wrote:
> >> 
> >> On 5/12/2023 2:24 PM, Takashi Iwai wrote:
> >>> On Fri, 12 May 2023 14:00:54 +0200,
> >>> Amadeusz S³awiñski wrote:
> >>>> 
> >>>> On 5/12/2023 1:33 PM, Takashi Iwai wrote:
> >>>>> On Fri, 12 May 2023 13:23:49 +0200,
> >>>>> Takashi Iwai wrote:
> >>>>>> 
> >>>>>> On Thu, 11 May 2023 19:20:17 +0200,
> >>>>>> Amadeusz S³awiñski wrote:
> >>>>>>> 
> >>>>>>> On 5/11/2023 5:58 PM, Takashi Iwai wrote:
> >>>>>>>> On Thu, 11 May 2023 17:31:37 +0200,
> >>>>>>>> Amadeusz S³awiñski wrote:
> >>>>>>>>> 
> >>>>>>>>> On 5/10/2023 2:21 PM, Takashi Iwai wrote:
> >>>>>>>>>> On Tue, 09 May 2023 12:10:06 +0200,
> >>>>>>>>>> Amadeusz S³awiñski wrote:
> >>>>>>>>> Then capture stream starts and seems to assume that
> >>>>>>>>> registers were already set, so it doesn't write them to hw.
> >>>>>>>> 
> >>>>>>>> ... it seems this didn't happen, and that's the inconsistency.
> >>>>>>>> 
> >>>>>>>> So the further question is:
> >>>>>>>> At the point just before you start recording, is the codec in runtime
> >>>>>>>> suspended?  Or it's running?
> >>>>>>>> 
> >>>>>>>> If it's runtime-suspended, snd_hda_regmap_sync() must be called from
> >>>>>>>> alc269_resume() via runtime-resume, and this must write out the
> >>>>>>>> cached values.  Then the bug can be along with that line.
> >>>>>>>> 
> >>>>>>>> Or if it's running, it means that the previous check of
> >>>>>>>> snd_hdac_keep_power_up() was bogus (or racy).
> >>>>>>>> 
> >>>>>>> 
> >>>>>>> Well, it is in... let's call it semi powered state. When snd_hda_intel
> >>>>>>> driver is loaded with power_save=X option it sets timeout to X seconds
> >>>>>>> and problem only happens when I start the stream before those X
> >>>>>>> seconds pass and it runs first runtime suspend. After it suspends it
> >>>>>>> then uses standard pm_runtime_resume and works correctly. That's why
> >>>>>>> the pm_runtime_force_suspend(&codec->core.dev);  mentioned in first
> >>>>>>> email in thread "fixes" the problem, as it forces it to be instantly
> >>>>>>> suspended instead of waiting for timeout and then later normal
> >>>>>>> resume-play/record-suspend flow can be followed.
> >>>>>> 
> >>>>>> Hm, then maybe it's a bad idea to rely on the usage count there.
> >>>>>> Even if the usage is 0, the device can be still active, and the update
> >>>>>> can be missed.
> >>>>>> 
> >>>>>> How about the patch like below?
> >>>>> 
> >>>>> Scratch that, it returns a wrong value.
> >>>>> A simpler version like below works instead?
> >>>>> 
> >>>> 
> >>>> Yes it was broken, arecord didn't even start capturing ;)
> >>>> 
> >>>>> 
> >>>>> Takashi
> >>>>> 
> >>>>> --- a/sound/hda/hdac_device.c
> >>>>> +++ b/sound/hda/hdac_device.c
> >>>>> @@ -611,10 +611,9 @@ EXPORT_SYMBOL_GPL(snd_hdac_power_up_pm);
> >>>>>     int snd_hdac_keep_power_up(struct hdac_device *codec)
> >>>>>     {
> >>>>>     	if (!atomic_inc_not_zero(&codec->in_pm)) {
> >>>>> -		int ret = pm_runtime_get_if_in_use(&codec->dev);
> >>>>> -		if (!ret)
> >>>>> +		if (!pm_runtime_active(&codec->dev))
> >>>>>     			return -1;
> >>>>> -		if (ret < 0)
> >>>>> +		if (pm_runtime_get_sync(&codec->dev) < 0)
> >>>>>     			return 0;
> >>>>>     	}
> >>>>>     	return 1;
> >>>> 
> >>>> 
> >>>> This one seems to work, as in I'm able to record before first suspend
> >>>> hits. However device stays in D0 when no stream is running...
> >>>> # cat /sys/devices/pci0000\:00/0000\:00\:0e.0/power_state
> >>>> D0
> >>> 
> >>> OK, one step forward.  The previous change was bad in anyway, as we
> >>> shouldn't sync there at all.
> >>> 
> >>> So, the problem becomes clearer now: it's in the lazy update mechanism
> >>> that misses the case that has to be written.
> >>> 
> >>> Scratch the previous one again, and could you try the following one
> >>> instead?
> >>> 
> >>> 
> >>> Takashi
> >>> 
> >>> --- a/sound/hda/hdac_regmap.c
> >>> +++ b/sound/hda/hdac_regmap.c
> >>> @@ -293,8 +293,17 @@ static int hda_reg_write(void *context, unsigned int reg, unsigned int val)
> >>>      	if (verb != AC_VERB_SET_POWER_STATE) {
> >>>    		pm_lock = codec_pm_lock(codec);
> >>> -		if (pm_lock < 0)
> >>> -			return codec->lazy_cache ? 0 : -EAGAIN;
> >>> +		if (pm_lock < 0) {
> >>> +			/* skip the actual write if it's in lazy-update mode
> >>> +			 * and only if the device is actually suspended;
> >>> +			 * the usage count can be zero at transition phase
> >>> +			 * (either suspending/resuming or auto-suspend sleep)
> >>> +			 */
> >>> +			if (codec->lazy_cache &&
> >>> +			    pm_runtime_suspended(&codec->dev))
> >>> +				return 0;
> >>> +			return -EAGAIN;
> >>> +		}
> >>>    	}
> >>>      	if (is_stereo_amp_verb(reg)) {
> >>> 
> >> 
> >> With this one we are back to same behavior as without it. When capture
> >> is started before first suspend it records silence. After waiting for
> >> timeout and suspend it records correctly.
> > 
> > Hm, interesting.  Does it mean that the pm_runtime_get_if_in_use() (in
> > snd_hdac_keep_power_up()) returns a non-zero value?
> > Or is pm_runtime_suspended() returns really true there?
> > 
> > 
> 
> So I've tested with vanilla kernel, where pm_runtime_get_if_in_use
> returns -22 until loaded and then 13 times "0" until arecord.
> 
> With above patch it returns 13 times "0" and then one more time "1".
> 
> pm_runtime_suspended() returns 0 (needed to modify patch a bit)
> 
> Patch:
> 
> diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
> index 035b720bf602..62880952e398 100644
> --- a/sound/hda/hdac_device.c
> +++ b/sound/hda/hdac_device.c
> @@ -612,6 +612,7 @@ int snd_hdac_keep_power_up(struct hdac_device *codec)
>  {
>         if (!atomic_inc_not_zero(&codec->in_pm)) {
>                 int ret = pm_runtime_get_if_in_use(&codec->dev);
> +               pr_err("DEBUG:%s:%d %s ret=%d\n", __FILE__, __LINE__,
> __func__, ret);
>                 if (!ret)
>                         return -1;
>                 if (ret < 0)
> diff --git a/sound/hda/hdac_regmap.c b/sound/hda/hdac_regmap.c
> index fe3587547cfe..d6cf3fa2d4e7 100644
> --- a/sound/hda/hdac_regmap.c
> +++ b/sound/hda/hdac_regmap.c
> @@ -293,8 +293,19 @@ static int hda_reg_write(void *context, unsigned
> int reg, unsigned int val)
> 
>         if (verb != AC_VERB_SET_POWER_STATE) {
>                 pm_lock = codec_pm_lock(codec);
> -               if (pm_lock < 0)
> -                       return codec->lazy_cache ? 0 : -EAGAIN;
> +               if (pm_lock < 0) {
> +                       bool x;
> +                       /* skip the actual write if it's in lazy-update mode
> +                        * and only if the device is actually suspended;
> +                        * the usage count can be zero at transition phase
> +                        * (either suspending/resuming or auto-suspend
> sleep)
> +                        */
> +                       x = pm_runtime_suspended(&codec->dev);
> +                       pr_err("DEBUG: %s:%d x = %d\n", __FILE__,
> __LINE__, x);
> +                       if (codec->lazy_cache && x)
> +                               return 0;
> +                       return -EAGAIN;
> +               }
>         }
> 
>         if (is_stereo_amp_verb(reg)) {
> 
> 
> Part of vanilla dmesg (contains only first chunk):
(snip)
> Part of fully patched dmesg:
(snip)
> [   79.556191] DEBUG:sound/hda/hdac_device.c:615
> snd_hdac_keep_power_up ret=0
> [   79.556234] DEBUG:sound/hda/hdac_device.c:615
> snd_hdac_keep_power_up ret=0

If here ret==0, hdac_keep_power_up() should return -1, and it's the
return value of codec_pm_lock().  So it must print out the value of
"x" (pm_runtime_suspend() result), but I don't see it.
What's the missing piece...?


> I think there are two problems:
> 
> 1. After probe codec is powered down
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/pci/hda/hda_codec.c#n833),
> even though according to power management it is still running

I guess it's in the auto-suspend state, so it's still not suspended
but the device itself is active, while the usage count is 0.

That's fine, and I thought my second patch handling it.  That is, if
the usage count is 0 and the device is not suspended, it should return
-EAGAIN and make the caller retry with the full power up.
The code path is with CALL_RUN_FUNC() macro in hdac_regmap.c, and with
-EAGAIN return value, it tries snd_hdac_power_up_pm() and call the
function again.

> 2. When stream is started before first suspend, resume function
> doesn't run and it is a function which syncs cached registers. By
> resume function I mean
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/pci/hda/hda_codec.c#n2899
> which calls snd_hda_regmap_sync() or through in case of the platform I
> test it on codec->patch_ops.resume(codec) -> alc269_resume, which also
> calls snd_hda_regmap_sync().

It's also expected, per se.  Since it's been not suspended, it assumes
that the value got already written, and no resume is needed.


Takashi
