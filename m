Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B6D78C777
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:25:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58EF7DF3;
	Tue, 29 Aug 2023 16:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58EF7DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693319103;
	bh=GtBIoiz9MW+NX7Y+XQCxz94QMJyDa2i+i9As1O5BVJ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qc0vS+aHP5AQhnpj43GPJvTagJzh9R9mfKsmpF1DAFoleMMkkhNGpZY45++4tPX2z
	 q0CPLaUa0BYmJd9cLDhoI6VmpIFFS/gVXVsbYIsIjPzxVTHhUi5LD7UcNExj86a/PC
	 DG2wCybRH4IUsmtSPPDv+jUVMIWbWR4+vQ5i3Gyo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30CF0F80249; Tue, 29 Aug 2023 16:24:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93C5CF8032D;
	Tue, 29 Aug 2023 16:24:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28218F804F3; Tue, 29 Aug 2023 16:24:03 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 333E2F8032D
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 16:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 333E2F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KSwhIA7P;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/9k6qvld
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0D6E51F45B;
	Tue, 29 Aug 2023 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693319040;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4QZU8P2osCmSkpriKLNfy6JUT8TDfICEn6yIWArQYcE=;
	b=KSwhIA7Pv5RJOf7m5yANWw5DOFd/bzEHaV1PBTJxb4D4mWPYjTPvdlb0iiWUz1iehcb+Cd
	Ag8D3ZtkNFREBzD+fo45+vaTyj2/T9b0zC1fYjuNwKnjtYhNqt+NN431zUIHId7cu3VoeN
	cquyBrNhHInma6AlyvVdHjrDwvlCJtI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693319040;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4QZU8P2osCmSkpriKLNfy6JUT8TDfICEn6yIWArQYcE=;
	b=/9k6qvlduoXtcX7AUkAbeshokzOvDIAs8wTFixO+aNELXA4J0n5eAnGmXX6mWdXUOwtkbt
	0DhyFmGOQbOHonAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC6C6138E2;
	Tue, 29 Aug 2023 14:23:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iB8VK3//7WSbfAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 29 Aug 2023 14:23:59 +0000
Date: Tue, 29 Aug 2023 16:23:59 +0200
Message-ID: <87h6oisz9c.wl-tiwai@suse.de>
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
In-Reply-To: <32a62c2f-5000-132c-255c-8ccd135ba60f@opensource.cirrus.com>
References: <20230825120525.1337417-1-sbinding@opensource.cirrus.com>
	<87edjr7218.wl-tiwai@suse.de>
	<32a62c2f-5000-132c-255c-8ccd135ba60f@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: GKEBRX7P2KZJIGEUBQPN3ZZ44MSSGOMF
X-Message-ID-Hash: GKEBRX7P2KZJIGEUBQPN3ZZ44MSSGOMF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKEBRX7P2KZJIGEUBQPN3ZZ44MSSGOMF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 29 Aug 2023 16:18:12 +0200,
Stefan Binding wrote:
> 
> 
> On 25/08/2023 13:13, Takashi Iwai wrote:
> > On Fri, 25 Aug 2023 14:05:25 +0200,
> > Stefan Binding wrote:
> >> From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> >> 
> >> Some laptops require a hardware based mute system, where when a hotkey
> >> is pressed, it forces the amp to be muted.
> >> 
> >> For CS35L41, when the hotkey is pressed, an acpi notification is sent
> >> to the CS35L41 Device Node. The driver needs to handle this notification
> >> and call a _DSM function to retrieve the mute state.
> >> 
> >> Since the amp is only muted during playback, the driver will only mute
> >> or unmute if playback is occurring, otherwise it will save the mute
> >> state for when playback starts.
> >> 
> >> Only one handler can be registered for the acpi notification, but all
> >> amps need to receive that notification, we can register a single handler
> >> inside the Realtek HDA driver, so that it can then notify through the
> >> component framework.
> >> 
> >> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> >> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> > We don't do normally in this way.  The ACPI hot key handling is done
> > via user-space, and user-space daemon triggers the mute of the
> > system.
> > 
> > Can't the ACPI notify the key event on those machines?
> 
> This feature is not the "normal" mute button on a keyboard, it is a
> custom request
> from a manufacturer which only mutes the audio on the speakers.
> On previous generations, this was achieved using a GPIO controlled by
> the BIOS/EC.
> However, since CS35L41 does not have such GPIO, we must control it by
> other means.
> 
> Our solution, which we have to share with the Windows driver, it to use ACPI
> notifications to tell the driver to mute the amps when the shortcut is
> pressed.
> 
> Does this seem like a valid exception to the typical approach?

It's still the question whether we have to do this inevitably in the
kernel in a way like that.  It sounds quite unusual.  Why this must be
handled directly?  IOW, what's the difference from the "normal" mute
button?

And, even if we take this approach, it leaves the device muted without
exposing it to user-space.  Then user wouldn't know what happens.


thanks,

Takashi
