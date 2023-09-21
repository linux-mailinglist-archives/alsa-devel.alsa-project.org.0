Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 328547A9217
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 09:34:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C602A4B;
	Thu, 21 Sep 2023 09:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C602A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695281680;
	bh=DerIu20h6RBl2gcgibA+wY3sFuz9Ef46GHfqjt0FjEM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CQQTqxWmWdiebC6wAuLq2LYmPQvN1Caugk29tTSVqnMFnyJrHhleP6Nl4xVrituJk
	 UXMJor939zhWtYKr3XtYJW3KDBl7pDrhxRRnJIEgTrqQ4fUBpnl+I3zUpAFijdL6jC
	 6h2UVPPGwCcYgrdde5er4KBmmOMVGv+cIX375YFU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0948F80552; Thu, 21 Sep 2023 09:33:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54319F80125;
	Thu, 21 Sep 2023 09:33:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3061CF8025A; Thu, 21 Sep 2023 09:33:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8150EF800AA
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 09:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8150EF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sXR5FTPp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xKpK1wTn
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1CE6921DC8;
	Thu, 21 Sep 2023 07:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695281594;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CtSTnaLnaJEKj1j/kHsXGQg1xrJm7Dcrziia39euvc8=;
	b=sXR5FTPpsdCvHSV+3Wzc4Y6SiatA8kkX6IiI7WOIyCqhMeHhr3QuVOdEG0zlOOSd2zZ7n3
	c+saM0Mglh7dZdSU7E4tk3Ul50x4Go/KUcT3XBxYOApwavRGjYT+aqPPonG17IR8mnEC3M
	rovvX2DwbFkS4NrbK1FLv2Fa8bL24Qc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695281594;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CtSTnaLnaJEKj1j/kHsXGQg1xrJm7Dcrziia39euvc8=;
	b=xKpK1wTn4RIo7c8vmiuZaUc+CgsXh2MO8LeeV4LA5c/ObebGrnW4lWO5cubah1FYxWeU9g
	XErNPssYEffDlsAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E854713513;
	Thu, 21 Sep 2023 07:33:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id tMmyN7nxC2VpegAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 21 Sep 2023 07:33:13 +0000
Date: Thu, 21 Sep 2023 09:33:13 +0200
Message-ID: <87sf78t1za.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Abelardo Ricart <aricart@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCHv3] ALSA: hda/realtek: Add quirk for ASUS ROG G533Q
In-Reply-To: <2436e7f2-b986-4dda-9d4d-0f73845c1ffc@gmail.com>
References: <2436e7f2-b986-4dda-9d4d-0f73845c1ffc@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MMCX3MY5FVXEGWMG6XNPOCEAL7EMCNIB
X-Message-ID-Hash: MMCX3MY5FVXEGWMG6XNPOCEAL7EMCNIB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MMCX3MY5FVXEGWMG6XNPOCEAL7EMCNIB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 21 Sep 2023 09:22:57 +0200,
Abelardo Ricart wrote:
> 
> The same quirk applied to the ASUS G533Z is also applicable to the ASUS
> G533Q (of which I am an owner and have thus tested).
> 
> Signed-off-by: Abelardo Ricart <aricart@gmail.com>

Unfortunately it's still a problem; tabs are converted to 4 spaces.

I recommend you to try sending to yourself locally and verify whether
it works before resubmitting v4.


thanks,

Takashi

> ---
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index dc7b7a407638..fdc3560ad951 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -9649,6 +9649,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>      SND_PCI_QUIRK(0x1043, 0x1493, "ASUS GV601V", ALC285_FIXUP_ASUS_HEADSET_MIC),
>      SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
>      SND_PCI_QUIRK(0x1043, 0x1573, "ASUS GZ301V", ALC285_FIXUP_ASUS_HEADSET_MIC),
> +    SND_PCI_QUIRK(0x1043, 0x1602, "ASUS ROG Strix G15 (G533Q)", ALC285_FIXUP_ASUS_G533Z_PINS),
>      SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
>      SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", ALC287_FIXUP_CS35L41_I2C_2),
>      SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
> 
