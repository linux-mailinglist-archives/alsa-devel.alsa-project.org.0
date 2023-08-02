Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6688E76D307
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:55:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65641827;
	Wed,  2 Aug 2023 17:54:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65641827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690991728;
	bh=upJl/13Fu32BNaGtPx+p8dLdnLdEVxUa/qRH02wm4IA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XO/X3QC4YooL+IpukCgY+0yUlhiruc25EWXqYBdl5kav5m0117b9uJ7qJTpB+MG7/
	 CPraJGULVwo8V0c3t3xjz4+VcfmKtb870g4xC9CwFd/BIAvpiyDdu4MJj/Kjj+ygmP
	 YPsrHXQ4a1Nr7rPeQKDlh+j9KiJtr4jm/5LP9BLs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 255DCF8016D; Wed,  2 Aug 2023 17:54:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8382F801D5;
	Wed,  2 Aug 2023 17:54:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16FC3F8025A; Wed,  2 Aug 2023 17:54:35 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A7284F80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:54:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7284F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xp7T6BbW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=i98CGzjH
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E3C9F1F37C;
	Wed,  2 Aug 2023 15:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690991668;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DpvkF7h/6CHY1yRubkDyJc0q7vYwpDpt2jComXffOdQ=;
	b=xp7T6BbWPDzODxs+8z1dlCsYH2dEpvz+dKStQDFNSv/XuDNKaBwWCS+Y3pxaCDSJ3xHZze
	QI9FXGwZoOEU3RYP2DT6U4DJthtkEcjGOPXCvadjOuEiiiA4k//yT5X8XvtlN/623HSXnJ
	W3hg/2dZq4jgC2dPFY12uzLEG7CqIs0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690991668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DpvkF7h/6CHY1yRubkDyJc0q7vYwpDpt2jComXffOdQ=;
	b=i98CGzjHOQKbfazm2d3tzxMuoDpRAzJVLI79wUtG0ZXxmsMKXUYqOLTCAs05BXdhUIrhx3
	zFw03QK0cW8V39BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B064A13909;
	Wed,  2 Aug 2023 15:54:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cDJCKjR8ymROOwAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 02 Aug 2023 15:54:28 +0000
Date: Wed, 02 Aug 2023 17:54:28 +0200
Message-ID: <87il9xcudn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Matthew Anderson <ruinairas1992@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ALSA: hda/realtek: Add headphone quirk for Aya Neo 2
In-Reply-To: <20230802153730.39273-3-ruinairas1992@gmail.com>
References: <20230802153730.39273-1-ruinairas1992@gmail.com>
	<20230802153730.39273-3-ruinairas1992@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: ZL6Y3VBHLQOYJ4KBETCIKVWRC4DQUL7N
X-Message-ID-Hash: ZL6Y3VBHLQOYJ4KBETCIKVWRC4DQUL7N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZL6Y3VBHLQOYJ4KBETCIKVWRC4DQUL7N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 02 Aug 2023 17:37:30 +0200,
Matthew Anderson wrote:
> 
> This fixes the headphones on the Aya Neo 2 handheld.
> Signed-off-by: Matthew Anderson <ruinairas1992@gmail.com>
> ---
>  sound/pci/hda/patch_realtek.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 33f9beec8179..5d31cbe5d40b 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -7030,6 +7030,7 @@ enum {
>  	ALC269_FIXUP_DELL3_MIC_NO_PRESENCE,
>  	ALC269_FIXUP_DELL4_MIC_NO_PRESENCE,
>  	ALC269_FIXUP_DELL4_MIC_NO_PRESENCE_QUIET,
> +	ALC269_FIXUP_HEADSET_AYA_2,
>  	ALC269_FIXUP_HEADSET_AYA_GEEK,
>  	ALC269_FIXUP_HEADSET_MODE,
>  	ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC,
> @@ -8455,6 +8456,10 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.chained = true,
>  		.chain_id = ALC256_FIXUP_ASUS_HEADSET_MODE
>  	},
> +	[ALC269_FIXUP_HEADSET_AYA_2] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc269_fixup_headphone_volume,
> +	},
>  	[ALC269_FIXUP_HEADSET_AYA_GEEK] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = alc269_fixup_headphone_volume,
> @@ -9953,6 +9958,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1d72, 0x1901, "RedmiBook 14", ALC256_FIXUP_ASUS_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1d72, 0x1945, "Redmi G", ALC256_FIXUP_ASUS_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1d72, 0x1947, "RedmiBook Air", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
> +	SND_PCI_QUIRK(0x1f66, 0x0101, "AYANEO 2", ALC269_FIXUP_HEADSET_AYA_2),
>  	SND_PCI_QUIRK(0x1f66, 0x0101, "GEEK", ALC269_FIXUP_HEADSET_AYA_GEEK),
>  	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
>  	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),

Hmm, both devices have the very same SSID (1f66:0101)?  Then it's
superfluous.

And, if you have two devices that require the same quirk but with
different SSIDs, both can use the same ALC269_FIXUP_HEADSET_AYA_GEEK,
instead of defining two.


thanks,

Takashi
