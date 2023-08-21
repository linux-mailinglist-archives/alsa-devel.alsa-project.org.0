Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B845782758
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 12:46:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA3E082C;
	Mon, 21 Aug 2023 12:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA3E082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692614791;
	bh=kmFK3H7dtK4Z5P7y1vgXnW3f8UuRgN1rxuFFZTOHgww=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F3c4eXQjtK0n/f2FvKpuhZes2TaZ1YPD4dopErOtHPq9MWiwRrHNWZGn31u3b5AAo
	 e0utTJyKSFUwJZreCmixvH+OdTsjZoxW7hqm4zrJ+y+ADwLOkEkO+pE320TSQFnEWn
	 /RXl9ijV3luQYc+LY8cPNd03rdaYOr1zPsUiEgEU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61917F80510; Mon, 21 Aug 2023 12:45:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF975F8016C;
	Mon, 21 Aug 2023 12:45:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82A57F80199; Mon, 21 Aug 2023 12:45:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1B6DF800BF
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 12:45:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B6DF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qrNPFTtQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tU2Xu416
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 315BC22B4C;
	Mon, 21 Aug 2023 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692614712;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8CJGyVd3ydfb92IXro+w307wkpy0iSbtKlxDMJzwr10=;
	b=qrNPFTtQpOAB4NYAk0eWQn5cLFio6wyAQJe6/KNMhv9bfiSDbtvz9C5Nrj9ooqyGXPII2/
	d5CBz2noTVz95hNFG0vcRtT/p/Z6BTS5/t3S7G5chIrnRPhdErrPmGjqko5G3SsAJ7iSAi
	zro8mN1FacwgzujOBR7CZo/GTNm0IHE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692614712;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8CJGyVd3ydfb92IXro+w307wkpy0iSbtKlxDMJzwr10=;
	b=tU2Xu416mlEgiD+5WxIL2LXE0InDOPmu0Nde5swq4B45taor9VYHI6wM7Zfmzln21TlKSU
	4l7m4PBp/47KdgDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0597F13421;
	Mon, 21 Aug 2023 10:45:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id i8ZDADhA42SHBgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 21 Aug 2023 10:45:12 +0000
Date: Mon, 21 Aug 2023 12:45:11 +0200
Message-ID: <87a5uk8yiw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rohit Pidaparthi <rohitpid@gmail.com>
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	luke@ljones.dev,
	sbinding@opensource.cirrus.com
Subject: Re: [PATCH] fix: Add quirk for Asus Zenbook Pro 14 UX6404 laptop
In-Reply-To: 
 <CAGmPKz5OeC6UVBif6ySevZEvaY_XwKh7A29K7k_Yq_D0CQJkCA@mail.gmail.com>
References: 
 <CAGmPKz5OeC6UVBif6ySevZEvaY_XwKh7A29K7k_Yq_D0CQJkCA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: WTIKIZRY62NNKBPEWRCK3QEGBEFHPSYH
X-Message-ID-Hash: WTIKIZRY62NNKBPEWRCK3QEGBEFHPSYH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WTIKIZRY62NNKBPEWRCK3QEGBEFHPSYH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 19 Aug 2023 12:18:48 +0200,
Rohit Pidaparthi wrote:
> 
> >From 4f14cdad4f526f45747c4f0b71e24a46ebe3885c Mon Sep 17 00:00:00 2001
> From: Rohit Pidaparthi <rohitpid@gmail.com>
> Date: Sat, 19 Aug 2023 02:15:16 -0700
> Subject: [PATCH] fix: Add quirk for Asus Zenbook Pro 14 UX6404 laptop
> 
> The Asus Zenbook Pro 14 UX6404 (1043:1863) needs binding to the
> CS35L41 codec over spi1 rather than spi0. This is similar to
> existing quirks for many ASUS Laptops.
> 
> Signed-off-by: Rohit Pidaparthi <rohitpid@gmail.com>

The patch isn't applicable cleanly, likely your mailer broke the
tabs and spaces.  Could you resubmit properly?

Also, the quirk table entries are sorted in PCI SSID order.  Please
put the new entry at the right position.


thanks,

Takashi

> ---
> sound/pci/hda/patch_realtek.c | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index dc7b7a407638..c44464b1619f 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -9681,6 +9681,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>        SND_PCI_QUIRK(0x1043, 0x1d42, "ASUS Zephyrus G14 2022",
> ALC289_FIXUP_ASUS_GA401),
>        SND_PCI_QUIRK(0x1043, 0x1d4e, "ASUS TM420", ALC256_FIXUP_ASUS_HPE),
>        SND_PCI_QUIRK(0x1043, 0x1e02, "ASUS UX3402", ALC245_FIXUP_CS35L41_SPI_2),
> +     SND_PCI_QUIRK(0x1043, 0x1863, "ASUS UX6404", ALC245_FIXUP_CS35L41_SPI_2),
>        SND_PCI_QUIRK(0x1043, 0x1e11, "ASUS Zephyrus G15",
> ALC289_FIXUP_ASUS_GA502),
>        SND_PCI_QUIRK(0x1043, 0x1e12, "ASUS UM3402", ALC287_FIXUP_CS35L41_I2C_2),
>        SND_PCI_QUIRK(0x1043, 0x1e51, "ASUS Zephyrus M15",
> ALC294_FIXUP_ASUS_GU502_PINS),
> --
> 2.39.2
> 
