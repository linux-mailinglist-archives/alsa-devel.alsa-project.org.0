Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BED5C75EE91
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 10:59:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B01C204;
	Mon, 24 Jul 2023 10:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B01C204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690189148;
	bh=R8KkfKzhufDFa5woKM13yAwURwRAseZ6QlOcOIp0NSI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vFOr4TXxxz1HH2vE1jsmGyA/paTcZPf90VJYt2dSuLushhqG+rNv4Yk/rvZPzNd4v
	 6LeSYAC0NSr7Eac4inMd7KApCyNwvjCf3LHyDKTrhzxDPjQesPa1J5FNDJ3wzva2i9
	 gin+gERXmcis83SHRsIFITbshA1GJni+o/dNLIY0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6B7AF80153; Mon, 24 Jul 2023 10:58:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AABCAF80163;
	Mon, 24 Jul 2023 10:58:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E3BDF8019B; Mon, 24 Jul 2023 10:58:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A681FF80153
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 10:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A681FF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bI/FzUv1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gosouUha
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A95F3223FE;
	Mon, 24 Jul 2023 08:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690189084;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9EvjjZlQPgHxFVIKNFR8Sfe27pKYyXd+MzSkP/fcee4=;
	b=bI/FzUv1k8LE+M1rM4e9M5SGPHJ5rAn4c3pgisvUJRP1QDoe0plSVyaRo6C2o0VN1JWZJr
	/jCX5U8Dd3xkfMiuvDUHeBXUPQU/NOgChNZd1dUrzR2DDhjPAji/N+jI5WfW3UvqdjAjof
	hvblnRuhGzH93i5ZUn+5XmC/nB/WlZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690189084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9EvjjZlQPgHxFVIKNFR8Sfe27pKYyXd+MzSkP/fcee4=;
	b=gosouUha2gNTtf4J9TXdBKOeo3Zvbl+98xb7tkqS6j421B7yTBwKMHBXzu2fNhs/L1EdM6
	iAiv25LvOMgwUqDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E13D13476;
	Mon, 24 Jul 2023 08:58:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id nAvzGRw9vmRPFgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 24 Jul 2023 08:58:04 +0000
Date: Mon, 24 Jul 2023 10:58:04 +0200
Message-ID: <87mszlwusj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Matthias Ostermaier <github@ostermaier.online>
Cc: alsa-devel@alsa-project.org,
    Stefan Binding <sbinding@opensource.cirrus.com>,
    Stuart Henderson <stuarth@opensource.cirrus.com>,
    James Schulman <james.schulman@cirrus.com>,
    David Rhodes <david.rhodes@cirrus.com>,
    Richard Fitzgerald <rf@opensource.cirrus.com>,
    patches@opensource.cirrus.com
Subject: Re: [PATCH] Make snd-hda-intel work for newest HP laptop models with
 Realtek codec ALC245 and CSC3551 chipset
In-Reply-To: <e0981726-6e05-6cff-eea6-bf10f23bc795@ostermaier.online>
References: <e0981726-6e05-6cff-eea6-bf10f23bc795@ostermaier.online>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K26PRXZVBKX7MEEH7ENMTZYAMNQU6E5B
X-Message-ID-Hash: K26PRXZVBKX7MEEH7ENMTZYAMNQU6E5B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K26PRXZVBKX7MEEH7ENMTZYAMNQU6E5B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 22 Jul 2023 16:44:01 +0200,
Matthias Ostermaier wrote:
> 
> 
> Hardware:
> HP laptop models
> - HP Dragonfly Folio 13.5 inch
> - HP Envy x360 15-ew0xxx
> - HP Envy 16-h0xxx
> 
> all with codec Realtek ALC245 (ALC287 variant) and Cirrus Logic Smart
> Amplifier chipset CSC3551)
> codec vendor_id: 0x10ec0245, subsystem_id: 0x103c8a29, revision_id:0x100001
> 
> Kernel version: 6.2+
> 
> Output of alsa-info.sh attached (with the patch applied)
> 
> Problem description:
> The CSC3551 chipset does not get initialized correctly in aforementioned
> laptop models. While the rest of snd-hda-intel recognizes the hardware
> correctly, the smart amplifier does not get initialized so that the built-in
> loudspeakers do not work. The patches originate from discussions and tests
> under https://github.com/xoocoon/hp-15-ew0xxx-snd-fix.
> 
> Patches:
> ----------------------------------------------------------------------------
> --- sound/pci/hda/cs35l41_hda.c.orig    2023-07-22 15:43:12.016044919 +0200
> +++ sound/pci/hda/cs35l41_hda.c    2023-07-22 16:10:23.937995251 +0200
> @@ -1244,6 +1244,10 @@
>          hw_cfg->bst_type = CS35L41_EXT_BOOST;
>          hw_cfg->gpio1.func = CS35l41_VSPK_SWITCH;
>          hw_cfg->gpio1.valid = true;
> +  } else if (strncmp(hid, "CSC3551", 7) == 0) {
> +     hw_cfg->bst_type = CS35L41_EXT_BOOST;
> +     hw_cfg->gpio1.func = CS35l41_VSPK_SWITCH;
> +     hw_cfg->gpio1.valid = true;
>      } else {
>          /*
>           * Note: CLSA010(0/1) are special cases which use a slightly
> different design.

Thanks for the patch, but note that this change can't be taken.
It's dangerous and may burn speakers on other machines that don't use
this configuration.

For now, those info relies on the BIOS ACPI setup with _DSD entry, and
vendors should fix it with BIOS updates.

There have been already discussions how to deal with vendors who don't
cooperate well, but the fix must be in a different form to be applied
more safely.  For example, see threads at:
  https://lore.kernel.org/all/SY4P282MB18352D4FD343A2E8290EA9BEE037A@SY4P282MB1835.AUSP282.PROD.OUTLOOK.COM/


> --- sound/pci/hda/patch_realtek.c.orig    2023-07-22 15:43:58.711204631 +0200
> +++ sound/pci/hda/patch_realtek.c    2023-07-22 15:51:23.224124227 +0200
> @@ -9452,6 +9452,9 @@
>      SND_PCI_QUIRK(0x103c, 0x89c6, "Zbook Fury 17 G9",
> ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
>      SND_PCI_QUIRK(0x103c, 0x89ca, "HP",
> ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
>      SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)",
> ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
> +  SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio 13.5 inch G3 2-in-1
> Notebook PC", ALC245_FIXUP_CS35L41_SPI_2),
> +  SND_PCI_QUIRK(0x103c, 0x8a29, "HP Envy x360 15-ew0xxx",
> ALC287_FIXUP_CS35L41_I2C_2),
> +    SND_PCI_QUIRK(0x103c, 0x8a2c, "HP Envy 16-h0xxx",

Those quirk entries look OK, though.

Adding Cirrus people to Cc for further checking.


thanks,

Takashi
