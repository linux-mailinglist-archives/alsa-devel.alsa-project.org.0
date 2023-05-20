Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E11970A651
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 10:15:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AB397F8;
	Sat, 20 May 2023 10:15:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AB397F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684570554;
	bh=rRIFxTUZ6S3q0lSxGhHjbSyTlSqppBgWtruKB685xOY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oIF76ocSqxFIugUjFMwWQbZgOm/3f+WF8ftU6zpQZkSERFGIlXF+lFiScD/gnR8PO
	 84jQ+B3wLY1yX9/v3hHXeIoMZCQEp2bDBPWaotAeAmeF9t124aanjbXwdPh0pT5jxq
	 9NTRr0F8Qgjxl9LXL8EUeINFpQzsNo4qkT7XL91w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A6D7F8053D; Sat, 20 May 2023 10:15:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40960F8025A;
	Sat, 20 May 2023 10:15:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 737E7F80272; Sat, 20 May 2023 10:15:00 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ECEACF8016D
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 10:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECEACF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=IoG/z5mT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=eWrQdHoa
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1668C21E9A;
	Sat, 20 May 2023 08:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684570492;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iPRJUtW+RTZfRnJcov7RdMbBJjkESZBBD8yCDMtMyjA=;
	b=IoG/z5mTs7/tLu8Z/Q+PHgbP/rGU6ZqhF2olFtnpD/aMTRp02I6HgkM1vb/y3p8LWRN8Y+
	HdZPjr91x0oY6+srErH2ksNdtI0KsFDJkTxiZ5ZaabQT7S/ap087Wfc4JQru+X+RdEFiE4
	qXqORgzZGSiMdhq/0Nz89m/cl2A6omw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684570492;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iPRJUtW+RTZfRnJcov7RdMbBJjkESZBBD8yCDMtMyjA=;
	b=eWrQdHoakkgClDGanexpYZrIo7ihL85dMq0+r4uDcJuxO6ltJxNid9UmzYp17Fg4Z/jgHb
	sG0ge3kHq17G4KCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE4B41358F;
	Sat, 20 May 2023 08:14:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id PturKXuBaGQHNwAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 20 May 2023 08:14:51 +0000
Date: Sat, 20 May 2023 10:14:51 +0200
Message-ID: <87jzx3zaf8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Luke Jones <luke@ljones.dev>
Cc: linux-kernel@vger.kernel.org,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	perex@perex.cz,
	tangmeng@uniontech.com,
	andy.chi@canonical.com,
	p.jungkamp@gmx.net,
	kasper93@gmail.com,
	yangyuchi66@gmail.com,
	armas@codux.tech,
	ealex95@gmail.com,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	tanureal@opensource.cirrus.com,
	rf@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org
Subject: Re: CSC3551 and devices missing related _DSD bits
In-Reply-To: <1991650.PYKUYFuaPT@fedora>
References: <1991650.PYKUYFuaPT@fedora>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: WYL7YFAWX7V3FU5F4T37Q75S2HAJLAV6
X-Message-ID-Hash: WYL7YFAWX7V3FU5F4T37Q75S2HAJLAV6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WYL7YFAWX7V3FU5F4T37Q75S2HAJLAV6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 May 2023 00:26:22 +0200,
Luke Jones wrote:
> 
> Hi Takashi (and all others),
> 
> We're beginning to encounter more and more laptops from ASUS in the ROG range 
> where the bass speakers are connected to a cirrus amp, and the driver for 
> cirrus is unable to pick this up due to being missing a _DSD section in the 
> ACPI (SSDT). I've emailed engineers at ASUS I have contact with about this but 
> it is unlikely that we will see corrections for each and every model + variant 
> they have. The models we have seen so far are:
> - GX650P
> - GU604V
> - GA402X
> And there have been numerous forum postings in various places with the exact 
> same issue for other models from ASUS that are not in the ROG group I deal 
> with - oh and also some Lenovo and HP devices also.
> 
> Some of the logs are:
> 
> [    5.542312] Serial bus multi instantiate pseudo device driver CSC3551:00: 
> Instantiated 2 I2C devices.
> [    5.717261] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Error: ACPI _DSD 
> Properties are missing for HID CSC3551.
> [    5.717269] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: error -EINVAL: 
> Platform not supported
> [    5.717286] cs35l41-hda: probe of i2c-CSC3551:00-cs35l41-hda.0 failed with 
> error -22
> [    5.717734] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Error: ACPI _DSD 
> Properties are missing for HID CSC3551.
> [    5.717737] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: error -EINVAL: 
> Platform not supported
> [    5.717750] cs35l41-hda: probe of i2c-CSC3551:00-cs35l41-hda.1 failed with 
> error -22
> 
> and:
> 
> [    3.343851] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: Error: ACPI _DSD 
> Properties are missing for HID CSC3551.
> [    3.343854] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: error -EINVAL: 
> Platform not supported
> [    3.343855] cs35l41-hda: probe of spi1-CSC3551:00-cs35l41-hda.0 failed with 
> error -22
> [    3.345544] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.1: Error: ACPI _DSD 
> Properties are missing for HID CSC3551.
> [    3.345546] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.1: error -EINVAL: 
> Platform not supported
> [    3.345548] cs35l41-hda: probe of spi1-CSC3551:00-cs35l41-hda.1 failed with 
> error -22
> 
> So there are SPI connected, and I2C connected.
> 
> Alex has already submitted the related patch_realtek work for the GU604V and 
> no doubt there will be some follow up patches from myself or others for the 
> other models. Alex has attempted to patch the Cirrus related parts in kernel 
> direct with:
> 1. https://github.com/bno1/linux-xanmod-gu604/blob/acpi-hack/
> patch03_gu604v_speaker_acpi_hack.patch
> 2. https://github.com/bno1/linux-xanmod-gu604/blob/acpi-hack/
> patch04_gu604v_spi_cs_gpio_hack.patch
> both of these patches have been tested and working for over a week.
> 
> >From what I see the patch04_gu604v_spi_cs_gpio_hack patch needs to shift to 
> the cirrus driver sound/pci/hda/cs35l41_hda.c, and that driver must now have a 
> quirk table - unless we can somehow add the cirrus related bits to the realtek 
> code? I've personally not played with this beyond keeping an eye on it all and 
> am reluctant to begin work on a solution until I've had some input on the 
> direction it should take.
> 
> In any case, this is not an isolated issue and we could benefit from putting 
> in place some quirk or similar to accommodate for laptops where the vendor for 
> some reason does not include the _DSD parts for use with the cirrus driver. 
> The trend is looking so far like this practice will continue regardless of the 
> vendor.
> 
> Known reports:
> - https://bugzilla.kernel.org/show_bug.cgi?id=216194
> - https://www.spinics.net/lists/alsa-devel/msg146434.html
> - https://gist.github.com/lamperez/862763881c0e1c812392b5574727f6ff
> - https://forums.linuxmint.com/viewtopic.php?t=392762
> - https://h30434.www3.hp.com/t5/Notebook-Operating-System-and-Recovery/Envy-x360-2022-13-b0074TU-Audio-not-working-in-Linux-Fedora/td-p/8644641

The problem is that this can really easily blow up your machine if
some incorrect bit is applied.  And more easily applicable, more
chance to break by novice users, simply by believing what a chat bot
speaks :)
That's the very reason why this kind of change should be via ACPI
table officially set up by the vendor.  That said, the question is
only who and how can be responsible for this kind of change.  It's
no technical issue, per se.

If BIOS can't be updated, at least, the configuration change has to be
confirmed by ASUS people.  If ASUS still ignores the inquires and
requests, we may put the quirk but with a bit fat warning (and maybe
complaints to ASUS) to be shown in the log as a very last resort.

Let's see what happens.


thanks,

Takashi
