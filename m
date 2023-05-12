Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D94877007D5
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 14:26:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9BFA1DD;
	Fri, 12 May 2023 14:25:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9BFA1DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683894377;
	bh=mO4UahnqHBJPAN3TsrL6vpM4Jk/VYgDd65ACi0Kx/YQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c1H7P3EPpOy32AsizhoZaLKkAqQ/Uv109cNvaPwoSCRy/fiFyzdp9rdgjpqyZTNEa
	 5IeH13XpsifbPfblKL66gqJLLMfs++fhsj4KqioosWLQTPl1AQXuVYTL3aadyFnbY5
	 SWRZWOgRAHbJMK7p2ZHIlYYJnAdwDDB0kCWAcTmc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CD13F80542; Fri, 12 May 2023 14:25:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB5DCF8032D;
	Fri, 12 May 2023 14:25:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B76EBF8052E; Fri, 12 May 2023 14:25:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28DF6F80087
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 14:24:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28DF6F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=XoVGJBDy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=o06F/UAC
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7EBDF2054C;
	Fri, 12 May 2023 12:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1683894297;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AIYXPy66OVB6d4+1LkZtEDQ3+74A6vnfthdUf4xHZAU=;
	b=XoVGJBDydWV5zyHkkQrtIi4fB9nTBS4NVgmoqQTj7ZMXTM2Wg9dQSe91JEBAUF62yMAVig
	Lj9eVa91tEvAZa6irjbKwpZh3MokjirxjlrqUwuZrZfLtt5pHR6czz1uKQTNPOs/wNAjl3
	JzOEJZoVbFUj5JIeua+f+AfZuPhQB8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683894297;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AIYXPy66OVB6d4+1LkZtEDQ3+74A6vnfthdUf4xHZAU=;
	b=o06F/UACmk5bapIsYUUo+uXGvVXIC9t+J6fDLQTjOA7toJ+RZgSR9tLa8lpd9pSmPlerCQ
	6bdqTw8KDHBde1AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C45B13466;
	Fri, 12 May 2023 12:24:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +5QzFRkwXmQEHgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 12 May 2023 12:24:57 +0000
Date: Fri, 12 May 2023 14:24:56 +0200
Message-ID: <87bkipag9z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: HDA, power saving and recording
In-Reply-To: <7915b40e-a65a-479d-5a2b-062ee3cb432b@linux.intel.com>
References: <a7478636-af11-92ab-731c-9b13c582a70d@linux.intel.com>
	<878rdwjs1s.wl-tiwai@suse.de>
	<cceaeb53-06df-ced0-1f54-f5c0eb65f824@linux.intel.com>
	<87jzxe5084.wl-tiwai@suse.de>
	<41417b90-1881-0cbb-52e1-d63923dd8cd6@linux.intel.com>
	<87ilcxaj3u.wl-tiwai@suse.de>
	<87fs81ainl.wl-tiwai@suse.de>
	<7915b40e-a65a-479d-5a2b-062ee3cb432b@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KLUCB7DGABDVYSPMDZU5AM3ACS4DR5HT
X-Message-ID-Hash: KLUCB7DGABDVYSPMDZU5AM3ACS4DR5HT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KLUCB7DGABDVYSPMDZU5AM3ACS4DR5HT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 May 2023 14:00:54 +0200,
Amadeusz S³awiñski wrote:
> 
> On 5/12/2023 1:33 PM, Takashi Iwai wrote:
> > On Fri, 12 May 2023 13:23:49 +0200,
> > Takashi Iwai wrote:
> >> 
> >> On Thu, 11 May 2023 19:20:17 +0200,
> >> Amadeusz S³awiñski wrote:
> >>> 
> >>> On 5/11/2023 5:58 PM, Takashi Iwai wrote:
> >>>> On Thu, 11 May 2023 17:31:37 +0200,
> >>>> Amadeusz S³awiñski wrote:
> >>>>> 
> >>>>> On 5/10/2023 2:21 PM, Takashi Iwai wrote:
> >>>>>> On Tue, 09 May 2023 12:10:06 +0200,
> >>>>>> Amadeusz S³awiñski wrote:
> >>>>> Then capture stream starts and seems to assume that
> >>>>> registers were already set, so it doesn't write them to hw.
> >>>> 
> >>>> ... it seems this didn't happen, and that's the inconsistency.
> >>>> 
> >>>> So the further question is:
> >>>> At the point just before you start recording, is the codec in runtime
> >>>> suspended?  Or it's running?
> >>>> 
> >>>> If it's runtime-suspended, snd_hda_regmap_sync() must be called from
> >>>> alc269_resume() via runtime-resume, and this must write out the
> >>>> cached values.  Then the bug can be along with that line.
> >>>> 
> >>>> Or if it's running, it means that the previous check of
> >>>> snd_hdac_keep_power_up() was bogus (or racy).
> >>>> 
> >>> 
> >>> Well, it is in... let's call it semi powered state. When snd_hda_intel
> >>> driver is loaded with power_save=X option it sets timeout to X seconds
> >>> and problem only happens when I start the stream before those X
> >>> seconds pass and it runs first runtime suspend. After it suspends it
> >>> then uses standard pm_runtime_resume and works correctly. That's why
> >>> the pm_runtime_force_suspend(&codec->core.dev);  mentioned in first
> >>> email in thread "fixes" the problem, as it forces it to be instantly
> >>> suspended instead of waiting for timeout and then later normal
> >>> resume-play/record-suspend flow can be followed.
> >> 
> >> Hm, then maybe it's a bad idea to rely on the usage count there.
> >> Even if the usage is 0, the device can be still active, and the update
> >> can be missed.
> >> 
> >> How about the patch like below?
> > 
> > Scratch that, it returns a wrong value.
> > A simpler version like below works instead?
> > 
> 
> Yes it was broken, arecord didn't even start capturing ;)
> 
> > 
> > Takashi
> > 
> > --- a/sound/hda/hdac_device.c
> > +++ b/sound/hda/hdac_device.c
> > @@ -611,10 +611,9 @@ EXPORT_SYMBOL_GPL(snd_hdac_power_up_pm);
> >   int snd_hdac_keep_power_up(struct hdac_device *codec)
> >   {
> >   	if (!atomic_inc_not_zero(&codec->in_pm)) {
> > -		int ret = pm_runtime_get_if_in_use(&codec->dev);
> > -		if (!ret)
> > +		if (!pm_runtime_active(&codec->dev))
> >   			return -1;
> > -		if (ret < 0)
> > +		if (pm_runtime_get_sync(&codec->dev) < 0)
> >   			return 0;
> >   	}
> >   	return 1;
> 
> 
> This one seems to work, as in I'm able to record before first suspend
> hits. However device stays in D0 when no stream is running...
> # cat /sys/devices/pci0000\:00/0000\:00\:0e.0/power_state
> D0

OK, one step forward.  The previous change was bad in anyway, as we
shouldn't sync there at all.

So, the problem becomes clearer now: it's in the lazy update mechanism
that misses the case that has to be written.

Scratch the previous one again, and could you try the following one
instead?


Takashi

--- a/sound/hda/hdac_regmap.c
+++ b/sound/hda/hdac_regmap.c
@@ -293,8 +293,17 @@ static int hda_reg_write(void *context, unsigned int reg, unsigned int val)
 
 	if (verb != AC_VERB_SET_POWER_STATE) {
 		pm_lock = codec_pm_lock(codec);
-		if (pm_lock < 0)
-			return codec->lazy_cache ? 0 : -EAGAIN;
+		if (pm_lock < 0) {
+			/* skip the actual write if it's in lazy-update mode
+			 * and only if the device is actually suspended;
+			 * the usage count can be zero at transition phase
+			 * (either suspending/resuming or auto-suspend sleep)
+			 */
+			if (codec->lazy_cache &&
+			    pm_runtime_suspended(&codec->dev))
+				return 0;
+			return -EAGAIN;
+		}
 	}
 
 	if (is_stereo_amp_verb(reg)) {

