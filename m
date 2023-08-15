Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D877CA01
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 11:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51E43741;
	Tue, 15 Aug 2023 11:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51E43741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692090573;
	bh=DAm7Rz6BHJu2dSDt8JwB6HE7695iAkp/haezV5XxKb0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=etBdCTa972ygiH3FphVWQNyo64tSj2Xce9nYE6JvtCJgi6kqT1PpgD99U0/aUoSok
	 185Y/uk/n72v/DGQ48yh+uXBIhyqoTFcbduxlT1F1OfWNx5QMEJN/XmzaZlp6OoziS
	 zZcCKsEp6a4Fn8/Ns6lGDqqpTqddqSQyPJ4OKt+I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE418F80536; Tue, 15 Aug 2023 11:08:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53A65F80074;
	Tue, 15 Aug 2023 11:08:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CB8AF8016D; Tue, 15 Aug 2023 11:08:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 62E2DF800EE
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 11:08:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62E2DF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=2LfddeV4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fXcCg+4F
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 841C61FD63;
	Tue, 15 Aug 2023 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692090500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HPoS8JqXii/KwORwMKx0+xL5N/z3rN2C0U7fbw4tIlk=;
	b=2LfddeV4bH+EF3M8KhWlNZ7QX7arTaRa+wyboM2EFSKFGIIIh51my1B3zI4dF0Bqc8yVoM
	VfseohAj6LC6/pT+VHvFOMIBr/Qd+v9pNrJhmwdQRmkT6sGpB70cX2J8r9LcLDPnh1PUZt
	9IYY30lChZEr0Pgobn6/lZh3G0A7hwg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692090500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HPoS8JqXii/KwORwMKx0+xL5N/z3rN2C0U7fbw4tIlk=;
	b=fXcCg+4FPeIpF2u8lAYK4ybREChy1kv6mpegUpXlggNG5wy2qx/rwpLKLhenB3hgVvcH8C
	7m1pkiB1tlzvM8BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 535601353E;
	Tue, 15 Aug 2023 09:08:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Y8W4EoRA22SFNQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 15 Aug 2023 09:08:20 +0000
Date: Tue, 15 Aug 2023 11:08:19 +0200
Message-ID: <87il9gzn98.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: "Joseph C. Sible" <josephcsible@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	"regressions@lists.linux.dev"
	<regressions@lists.linux.dev>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
In-Reply-To: <01e212a538fc407ca6edd10b81ff7b05@realtek.com>
References: <87o7jshxch.wl-tiwai@suse.de>
	<CABpewhEG9ViuoCwZHmTN0Up-3jwZ1M-jfC+dAqo0zhqLOZtQ6g@mail.gmail.com>
	<01e212a538fc407ca6edd10b81ff7b05@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QEQRNXAGD7FJ7WPHF3LMW5M7JEKTGCGA
X-Message-ID-Hash: QEQRNXAGD7FJ7WPHF3LMW5M7JEKTGCGA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QEQRNXAGD7FJ7WPHF3LMW5M7JEKTGCGA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 15 Aug 2023 10:08:48 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> I think maybe attach patch is what you want.

Looks good.  Let's ask the reporter to test with it.


Thanks!

Takashi

> 
> > -----Original Message-----
> > From: Joseph C. Sible <josephcsible@gmail.com>
> > Sent: Friday, August 4, 2023 10:35 PM
> > To: Takashi Iwai <tiwai@suse.de>
> > Cc: Kailang <kailang@realtek.com>; Bagas Sanjaya <bagasdotme@gmail.com>;
> > regressions@lists.linux.dev; perex@perex.cz; tiwai@suse.com;
> > alsa-devel@alsa-project.org
> > Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP
> > 15z-fc000 on warm boot
> > 
> > 
> > External mail.
> > 
> > 
> > 
> > On Mon, Jul 31, 2023 at 12:14 PM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > ... and now we receive a regression report due to this change :-<
> > >   https://bugzilla.kernel.org/show_bug.cgi?id=217732
> > >
> > > I believe the problem is that the patch disabled the 3kpull-low
> > > behavior too much while some codecs still need it.
> > >
> > > The patch changes like:
> > >
> > > @@ -3638,8 +3640,7 @@ static void alc256_shutup(struct hda_codec
> > *codec)
> > >         /* If disable 3k pulldown control for alc257, the Mic detection will
> > not work correctly
> > >          * when booting with headset plugged. So skip setting it for the
> > codec alc257
> > >          */
> > > -       if (codec->core.vendor_id != 0x10ec0236 &&
> > > -           codec->core.vendor_id != 0x10ec0257)
> > > +       if (spec->en_3kpull_low)
> > >                 alc_update_coef_idx(codec, 0x46, 0, 3 << 12);
> > >
> > >         if (!spec->no_shutup_pins)
> > >
> > > ... while the only place setting spec->en_3kpull_low is:
> > >
> > > @@ -10682,6 +10683,8 @@ static int patch_alc269(struct hda_codec
> > *codec)
> > >                 spec->shutup = alc256_shutup;
> > >                 spec->init_hook = alc256_init;
> > >                 spec->gen.mixer_nid = 0; /* ALC256 does not have any
> > > loopback mixer path */
> > > +               if (codec->bus->pci->vendor == PCI_VENDOR_ID_AMD)
> > > +                       spec->en_3kpull_low = true;
> > >                 break;
> > >         case 0x10ec0257:
> > >                 spec->codec_variant = ALC269_TYPE_ALC257;
> > >
> > > Since spec->3n_3kpull_low is false as default, it means that, except
> > > for ALC230/236/256 and PCI vendor AMD, the flag is never set, hence
> > > it's no longer called.
> > >
> > > Shouldn't spec->en_3kpull_low be enabled rather as default?  Or which
> > > models can set it?
> > 
> > In both my original bug and this new bug, the problem was that we're not
> > calling it when we should be. Given that, wouldn't a simple fix be to call it if
> > either the old condition or the new condition is true?
> > E.g., something like this:
> > 
> > if ((codec->core.vendor_id != 0x10ec0236 && codec->core.vendor_id !=
> > 0x10ec0257) || spec->en_3kpull_low)
> > 
> > Joseph C. Sible
> > 
> > ------Please consider the environment before printing this e-mail.
> 
> 
