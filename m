Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 566F4721F99
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 09:32:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90AF9823;
	Mon,  5 Jun 2023 09:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90AF9823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685950323;
	bh=TIJalOf8+T5rAY62Ub+IDCEvgoWLUkQMNI7Cip1+oY0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=If3nwFvP9RLvERQazhAlfwZh/pvFOBwv9CACzV9YTuBDVZB9s9taOY/3yGN59tXV1
	 udkp5hPhilz09beHYoBFE+bZ1QOkPzQqOFfmEBuFJr6q4hKaGdhXhvTOYyZDzyclyi
	 tC7GTQBfqUBnXB0GBrJg4DGNq/IrSp4Fm11AIm48=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF11FF804DA; Mon,  5 Jun 2023 09:31:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2A6AF8016C;
	Mon,  5 Jun 2023 09:31:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB9ADF80199; Mon,  5 Jun 2023 09:31:09 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 318C9F80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 09:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 318C9F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=VY0Djl+7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TdCI6Uzk
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3895821B1F;
	Mon,  5 Jun 2023 07:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1685950265;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Jmf7XzZ6h9aCxC16xkUyUnRwecLdWwuUEp4LEcica0=;
	b=VY0Djl+7VSdzHMG7bezTN7LrUn87WHiv1De4ZD/jWdFfcQ6yM3wiIk60h21ZWn9NH/TQ0c
	saqB3HrJSiq7g54/hwqXM2rNPvF7RYxwJlS1ZW5jzB2cBC/B/D4a3PIrBb+rifxOWcx98E
	fzf1ETw612n+bspxEsqvwHNRpXAxwV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685950265;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Jmf7XzZ6h9aCxC16xkUyUnRwecLdWwuUEp4LEcica0=;
	b=TdCI6UzkJjcRkK8q4tyu9IK7dRtA9bEyEIAEJlQY+FfD+yf993aG+UfUJ9vZ/NdYJGs2K2
	PZJbiBO4RTCHFuCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 03D03139C7;
	Mon,  5 Jun 2023 07:31:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 3g99OziPfWSQbQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 05 Jun 2023 07:31:04 +0000
Date: Mon, 05 Jun 2023 09:31:04 +0200
Message-ID: <87v8g2icw7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1] ALSA: hda/realtek: Add quirks for Asus ROG 2024
 laptops using CS35L41
In-Reply-To: <20230526151605.2114720-1-sbinding@opensource.cirrus.com>
References: <20230526151605.2114720-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: LZ3OAC4IMSVF4KN3S7HYG7TEJMGMA27C
X-Message-ID-Hash: LZ3OAC4IMSVF4KN3S7HYG7TEJMGMA27C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LZ3OAC4IMSVF4KN3S7HYG7TEJMGMA27C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 26 May 2023 17:16:05 +0200,
Stefan Binding wrote:
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

An empty git log is often a sign of bad changes.
Although it's a trivial change in this case, you must still have some
words -- whether they have been tested or they are fully compatible
with those quirks, etc.

About the code change:
> @@ -9547,6 +9547,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1043, 0x1a8f, "ASUS UX582ZS", ALC245_FIXUP_CS35L41_SPI_2),
>  	SND_PCI_QUIRK(0x1043, 0x1b11, "ASUS UX431DA", ALC294_FIXUP_ASUS_COEF_1B),
>  	SND_PCI_QUIRK(0x1043, 0x1b13, "Asus U41SV", ALC269_FIXUP_INV_DMIC),
> +	SND_PCI_QUIRK(0x1043, 0x1b93, "ASUS G614JVR/JIR", ALC245_FIXUP_CS35L41_SPI_2),
>  	SND_PCI_QUIRK(0x1043, 0x1bbd, "ASUS Z550MA", ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x1043, 0x1c23, "Asus X55U", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
>  	SND_PCI_QUIRK(0x1043, 0x1c62, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
> @@ -9565,6 +9566,11 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1043, 0x1f12, "ASUS UM5302", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x1043, 0x1f92, "ASUS ROG Flow X16", ALC289_FIXUP_ASUS_GA401),
>  	SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE", ALC256_FIXUP_ASUS_AIO_GPIO2),
> +	SND_PCI_QUIRK(0x1043, 0x3A20, "ASUS G614JZR", ALC245_FIXUP_CS35L41_SPI_2),
> +	SND_PCI_QUIRK(0x1043, 0x3A30, "ASUS G814JVR/JIR	", ALC245_FIXUP_CS35L41_SPI_2),
> +	SND_PCI_QUIRK(0x1043, 0x3A40, "ASUS G814JZR", ALC245_FIXUP_CS35L41_SPI_2),
> +	SND_PCI_QUIRK(0x1043, 0x3A50, "ASUS G834JYR/JZR", ALC245_FIXUP_CS35L41_SPI_2),
> +	SND_PCI_QUIRK(0x1043, 0x3A60, "ASUS G634JYR/JZR", ALC245_FIXUP_CS35L41_SPI_2),

We use lower letters for hex numbers, so please use 0x3a* instead.


thanks,

Takashi
