Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30277702E8C
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 15:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C54881EC;
	Mon, 15 May 2023 15:40:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C54881EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684158053;
	bh=YAF1aObMIgXzBYR23f4kLdqR1xrcj0OH5P1lpTvFI1I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cT26QDxp93iNXfv+a+aMNsZR3tYSUZpb5q+L22hEfX18op66BO7u8p6eET/Gw0P03
	 NRRggh3F1HQFKKjCTkNjURAov9X9COhzC2FOhoCHmJujdC+ZgrrmUDHFsa9V2+hv0M
	 JZJGePUpJ8QlCdqDp/7VdUMWW6TnuV2bKn8m3cf4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 559F0F8016D; Mon, 15 May 2023 15:40:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE577F8025A;
	Mon, 15 May 2023 15:40:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD12FF80272; Mon, 15 May 2023 15:39:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 262CCF8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 15:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 262CCF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BcztabH5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=qsVZTHcf
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9C08821C3D;
	Mon, 15 May 2023 13:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684157990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NdD+9F73a1JS19ma9M2nove4HcijJ9yFsVmb4aGVZcc=;
	b=BcztabH5QC++MdEKV3K1+zOxP6OWeApIQ4XWGM1A/Fv1EWqLcEXpIPEgzw8FOJHn5gwM2H
	24tgUnpuaVNZwwIpLLjOHr3vXjdimWlvmpTC1c9tbZKLltQHbpUAUtz93WXbtXDmHXUC2V
	RkOM3J3m8iwUiVMKfB/UP1k9M1fy0Eg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684157990;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NdD+9F73a1JS19ma9M2nove4HcijJ9yFsVmb4aGVZcc=;
	b=qsVZTHcfig2RpF1wQUPUppfHKlCGrvqsgpK912mb5WqDHYJQVJSh7xcX1b4SYkeD3gi8xt
	h0Oj4wWucaGhzKAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 667EF138E5;
	Mon, 15 May 2023 13:39:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0X7dFyY2YmSlTQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 15 May 2023 13:39:50 +0000
Date: Mon, 15 May 2023 15:39:49 +0200
Message-ID: <874jodlnmi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Joseph C. Sible" <josephcsible@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	regressions@lists.linux.dev,
	kailang@realtek.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
In-Reply-To: 
 <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
References: <bug-217440-225600@https.bugzilla.kernel.org/>
	<CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
	<ZGB0cVVI7OgaJU6t@debian.me>
	<CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
	<87cz338ix4.wl-tiwai@suse.de>
	<CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: A24OXICV3MIGIDVVA3FNYDBRNP2VXBKA
X-Message-ID-Hash: A24OXICV3MIGIDVVA3FNYDBRNP2VXBKA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A24OXICV3MIGIDVVA3FNYDBRNP2VXBKA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 14 May 2023 23:48:55 +0200,
Joseph C. Sible wrote:
> 
> On 5/14/23, Takashi Iwai wrote:
> > The patch changes two places (the change in alc_shutup_pins() and
> > alc256_shutup()), and I guess the latter is the culprit.  Could you
> > verify that only reverting the latter fixes the problem?
> 
> Yes, only reverting the latter fixes the problem. I just tried a
> kernel consisting of 6.3.2 plus the below change, and it works fine:
> 
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -3638,8 +3638,7 @@ static void alc256_shutup(struct hda_codec *codec)
>         /* If disable 3k pulldown control for alc257, the Mic
> detection will not work correctly
>          * when booting with headset plugged. So skip setting it for
> the codec alc257
>          */
> -       if (codec->core.vendor_id != 0x10ec0236 &&
> -           codec->core.vendor_id != 0x10ec0257)
> +       if (codec->core.vendor_id != 0x10ec0257)
>                 alc_update_coef_idx(codec, 0x46, 0, 3 << 12);
> 
>         if (!spec->no_shutup_pins)

OK, thanks for confirmation.

Kailang, could you check this issue?
Judging from the comment there:

	/* 3k pull low control for Headset jack. */
	/* NOTE: call this before clearing the pin, otherwise codec stalls */
	/* If disable 3k pulldown control for alc257, the Mic detection will not work correctly
	 * when booting with headset plugged. So skip setting it for the codec alc257
	 */

... it seems that the codec got screwed with this setup, which leaded
to the non-response at the probe after reboot.

In the worst case, I'll revert that part.


thanks,

Takashi
