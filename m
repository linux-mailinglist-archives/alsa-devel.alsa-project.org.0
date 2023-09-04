Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9328E791993
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 16:22:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B54447F1;
	Mon,  4 Sep 2023 16:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B54447F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693837339;
	bh=Xjy3ru46y99v6q376i7P2nyexQt2ii3PhBb6bRCbX8c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gGLqGn0IjZ977bpNf+RDJreJmOt4Jw0klDxr0TK+oGB1LLz7hBZoVvYCSEbZfq5YB
	 u1xpES1m7baR6HHUVJ34+I2s7qghANUfbQSlrkhHGh0FKUZTBETtMIIE1Xl9N0G9lF
	 nsO9iBxnFucmGqOxJGSfFFx1fBn2CL2iI8ZelfCc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBAA0F80236; Mon,  4 Sep 2023 16:21:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A51C1F80431;
	Mon,  4 Sep 2023 16:21:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F89EF8047D; Mon,  4 Sep 2023 16:17:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C32F7F80236
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 16:16:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C32F7F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KvFHAzhK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bzwJWhwp
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E25791F74D;
	Mon,  4 Sep 2023 14:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693837007;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yEZ8h5RKVkZ5GMWrOTMkGhGici2eVvsuoRrsxnDtWn0=;
	b=KvFHAzhKXyYkma3yTjsBG0pADjX8+N0XpoIgYdGqG8wUALMfWMWfYVDZoWYxCF2thtrY2i
	i+bCtFqcAXvozqnYzOcEcQQZrfcgQWHqN1R3h6Lb+e9aEwKmC5rnc0PcWmy+A58WznWr2t
	hxZPT7dZIlTpV4yLqFyLu7gbkZUXQh4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693837007;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yEZ8h5RKVkZ5GMWrOTMkGhGici2eVvsuoRrsxnDtWn0=;
	b=bzwJWhwpyjZnCyKhbX498fyQvKxuSjbH/aH43HsGSKXelnUa3X2AO0iLnYDr/Ct6phqL3M
	yXz/UO86XyNfsmCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC97F13425;
	Mon,  4 Sep 2023 14:16:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id XXULKc/m9WTkJwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 04 Sep 2023 14:16:47 +0000
Date: Mon, 04 Sep 2023 16:16:47 +0200
Message-ID: <87jzt6ja5s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>,
	Vitaly Rodionov
	<vitalyr@opensource.cirrus.com>
Subject: Re: [PATCH v1] ALSA: hda: cs35l41: Support mute notifications for
 CS35L41 HDA
In-Reply-To: <6f75a424-2c0c-be95-fad3-0da8b3ac3477@opensource.cirrus.com>
References: <20230825120525.1337417-1-sbinding@opensource.cirrus.com>
	<87edjr7218.wl-tiwai@suse.de>
	<32a62c2f-5000-132c-255c-8ccd135ba60f@opensource.cirrus.com>
	<87h6oisz9c.wl-tiwai@suse.de>
	<71808adb-bf54-a34b-5a63-70d454e3d426@opensource.cirrus.com>
	<87zg22jf53.wl-tiwai@suse.de>
	<0dc89771-07d5-6a3a-3ca6-7b99cf53ab98@opensource.cirrus.com>
	<87o7iijb4r.wl-tiwai@suse.de>
	<6f75a424-2c0c-be95-fad3-0da8b3ac3477@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: YXID3Z4OPKIOYLFT46MT6SLSOUGOL2TD
X-Message-ID-Hash: YXID3Z4OPKIOYLFT46MT6SLSOUGOL2TD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YXID3Z4OPKIOYLFT46MT6SLSOUGOL2TD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Sep 2023 16:05:59 +0200,
Stefan Binding wrote:
> 
> 
> On 04/09/2023 14:55, Takashi Iwai wrote:
> > On Mon, 04 Sep 2023 15:47:49 +0200,
> > Stefan Binding wrote:
> >> 
> >> On 04/09/2023 13:29, Takashi Iwai wrote:
> >>> On Mon, 04 Sep 2023 14:00:20 +0200,
> >>> Stefan Binding wrote:
> >>>> On 29/08/2023 15:23, Takashi Iwai wrote:
> >>>>> On Tue, 29 Aug 2023 16:18:12 +0200,
> >>>>> Stefan Binding wrote:
> >>>>>> On 25/08/2023 13:13, Takashi Iwai wrote:
> >>>>>>> On Fri, 25 Aug 2023 14:05:25 +0200,
> >>>>>>> Stefan Binding wrote:
> >>>>>>>> From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> >>>>>>>> 
> >>>>>>>> Some laptops require a hardware based mute system, where when a hotkey
> >>>>>>>> is pressed, it forces the amp to be muted.
> >>>>>>>> 
> >>>>>>>> For CS35L41, when the hotkey is pressed, an acpi notification is sent
> >>>>>>>> to the CS35L41 Device Node. The driver needs to handle this notification
> >>>>>>>> and call a _DSM function to retrieve the mute state.
> >>>>>>>> 
> >>>>>>>> Since the amp is only muted during playback, the driver will only mute
> >>>>>>>> or unmute if playback is occurring, otherwise it will save the mute
> >>>>>>>> state for when playback starts.
> >>>>>>>> 
> >>>>>>>> Only one handler can be registered for the acpi notification, but all
> >>>>>>>> amps need to receive that notification, we can register a single handler
> >>>>>>>> inside the Realtek HDA driver, so that it can then notify through the
> >>>>>>>> component framework.
> >>>>>>>> 
> >>>>>>>> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> >>>>>>>> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> >>>>>>> We don't do normally in this way.  The ACPI hot key handling is done
> >>>>>>> via user-space, and user-space daemon triggers the mute of the
> >>>>>>> system.
> >>>>>>> 
> >>>>>>> Can't the ACPI notify the key event on those machines?
> >>>>>> This feature is not the "normal" mute button on a keyboard, it is a
> >>>>>> custom request
> >>>>>> from a manufacturer which only mutes the audio on the speakers.
> >>>>>> On previous generations, this was achieved using a GPIO controlled by
> >>>>>> the BIOS/EC.
> >>>>>> However, since CS35L41 does not have such GPIO, we must control it by
> >>>>>> other means.
> >>>>>> 
> >>>>>> Our solution, which we have to share with the Windows driver, it to use ACPI
> >>>>>> notifications to tell the driver to mute the amps when the shortcut is
> >>>>>> pressed.
> >>>>>> 
> >>>>>> Does this seem like a valid exception to the typical approach?
> >>>>> It's still the question whether we have to do this inevitably in the
> >>>>> kernel in a way like that.  It sounds quite unusual.  Why this must be
> >>>>> handled directly?  IOW, what's the difference from the "normal" mute
> >>>>> button?
> >>>>> 
> >>>>> And, even if we take this approach, it leaves the device muted without
> >>>>> exposing it to user-space.  Then user wouldn't know what happens.
> >>>>> 
> >>>>> 
> >>>>> thanks,
> >>>>> 
> >>>>> Takashi
> >>>> We spoke to the ODM for this system to get a more detailed explanation
> >>>> of this feature.
> >>>> The keyboard shortcut enables something called "Unobtrusive
> >>>> Mode". According to their explanation:
> >>>> 
> >>>> - Unobtrusive mode is distinct to normal mute, as it only mutes the speakers
> >>>> - There is no requirement to update the volume controls, as the screen
> >>>> backlight will be off anyway in this mode
> >>>> - All other unobtrusive mode functions are enabled without user-space
> >>>> dependencies, and they would prefer not to make speaker mute an
> >>>> exception
> >>> Thanks, it gives a bit better clue.
> >>> The remaining question is rather the exact behavior of this
> >>> "unobtrusive mode".  How is it triggered, and what's the exact
> >>> expectation?  e.g. It must secretly mute the speaker?  That is, it
> >>> must not  expose the mixer state change to user-space?  Or is it tied
> >>> with the normal mixer state and user may unmute again?
> >>> 
> >>> 
> >>> Takashi
> >>  From what we understand, unobtrusive mode, which is activated by a
> >> keyboard shortcut (not a single key), performs several operations,
> >> such as:
> >> - muting the speaker (headphones remain unmuted)
> >> - dimming/shutting down the LCD backlight
> >> - turning off keyboard backlight and any keyboard LEDs
> >> Apart from muting the speaker, all of these operations are done in
> >> hardware, as the keyboard shortcut still works in the BIOS.
> >> Previous laptops with this feature appear to use a GPIO to mute the
> >> speaker, and we are informed that on those laptops userspace was not
> >> informed of the mute.
> >> Since CS35L41 does not have a GPIO mute, we had to use a different
> >> solution, involving ACPI notifications, which request the driver to
> >> mute.
> >> The same mechanism is used in Windows.
> >> Our understanding is that it is not intended for the mute to be
> >> overridden by userspace.
> >> Similarly, on previous laptops, userspace could not override this
> >> mute, since it was not informed of it.
> > OK, thanks for explanation.
> > 
> > I still don't like the idea to hide this completely, though.  The mode
> > should be somehow exposed even if the mute isn't controllable via
> > mixer, but currently there is no indication at all.
> > 
> > 
> > Takashi
> 
> We could create and expose a read-only ALSA control which would
> display the mute status of the amp.
> This way its possible to see the status of the amp, without breaking
> the mechanism.
> Would this be acceptable?

Yeah, that's a compromise.

BTW, the acpi notification handling is enabled for all devices?  I
don't see the conditional enablement.


thanks,

Takashi
