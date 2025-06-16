Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0097ADA9EB
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jun 2025 09:54:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7453960196;
	Mon, 16 Jun 2025 09:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7453960196
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750060447;
	bh=ebymilIdH2RPN1vU7186PFlWF+PCkIs7nw3lXShNXgU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mcIvyMpLmhaJdf8+jXQEwZCBMY1HUzGaqtS5EaFVu6VEvxr8qKQykaxCffYJO8l43
	 2DIydX+jdm8ZVbjTcLIP5cpUZjDSZCDvxzkBL9SMtA1j+2PdnvgXH1iw60pyjb56Bo
	 fisiy5F5eYh9kIRVbH1XDWcPVcUgOdsSm6m6syOg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CBBEF805C6; Mon, 16 Jun 2025 09:53:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DA30F805C6;
	Mon, 16 Jun 2025 09:53:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62D04F80124; Mon, 16 Jun 2025 09:53:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9329EF800E4
	for <alsa-devel@alsa-project.org>; Mon, 16 Jun 2025 09:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9329EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=jA8Tl/bc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=L/xo79Zs;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=jA8Tl/bc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=L/xo79Zs
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C0A6E211FE;
	Mon, 16 Jun 2025 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1750060408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LB1res4W8p6ly24QgM7h7EjascWL4QS0qJXjRzw05QM=;
	b=jA8Tl/bcm1QKccJM+Lx2zE+F5jR85TlQ7FlI5b6T4IhRFkWvzUAoAwMupyjFDtYatgK8Oj
	pSpp4V10oPOstwTxwjNwXYhunLVkn7ekDvT+vTY/CyDashEJUomAyGD2xY3jebA+KqM6Hg
	xspwxd6gLYkK6VrIo61aIJuIio+Qxl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750060408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LB1res4W8p6ly24QgM7h7EjascWL4QS0qJXjRzw05QM=;
	b=L/xo79ZsURSH2a98r12zuA0hZPl/AeTJLT0eHDdrkAUHOP/wOvVojpKQ9GuHz5tHIxgb/f
	cq/qpmhyLeJr3ACg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1750060408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LB1res4W8p6ly24QgM7h7EjascWL4QS0qJXjRzw05QM=;
	b=jA8Tl/bcm1QKccJM+Lx2zE+F5jR85TlQ7FlI5b6T4IhRFkWvzUAoAwMupyjFDtYatgK8Oj
	pSpp4V10oPOstwTxwjNwXYhunLVkn7ekDvT+vTY/CyDashEJUomAyGD2xY3jebA+KqM6Hg
	xspwxd6gLYkK6VrIo61aIJuIio+Qxl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750060408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LB1res4W8p6ly24QgM7h7EjascWL4QS0qJXjRzw05QM=;
	b=L/xo79ZsURSH2a98r12zuA0hZPl/AeTJLT0eHDdrkAUHOP/wOvVojpKQ9GuHz5tHIxgb/f
	cq/qpmhyLeJr3ACg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78F8E13A6B;
	Mon, 16 Jun 2025 07:53:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7fARHHjNT2ieLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Jun 2025 07:53:28 +0000
Date: Mon, 16 Jun 2025 09:53:28 +0200
Message-ID: <87frg0p1fr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdicheng <wangdich9700@163.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/realtek: Fixup ft alc257 rename alc3328
In-Reply-To: <20250616074520.582138-1-wangdich9700@163.com>
References: <20250616074520.582138-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[163.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,alsa-project.org,lists.infradead.org,kylinos.cn];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: 6DEYZA5Q6HQXCRF23D25UJJT5YEDTJHP
X-Message-ID-Hash: 6DEYZA5Q6HQXCRF23D25UJJT5YEDTJHP
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6DEYZA5Q6HQXCRF23D25UJJT5YEDTJHP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 16 Jun 2025 09:45:20 +0200,
wangdicheng wrote:
> 
> Audio ALC3328 recognized as ALC257, updated PCI ID0x10EC12F0 to rename it to 3328
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Try to fix up via either rename_tbl[] or rename_pci_tbl[] instead.


thanks,

Takashi

> ---
>  sound/pci/hda/patch_realtek.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index d3c9ed963588..e18b2a2acba8 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -6712,6 +6712,13 @@ static void alc_fixup_disable_mic_vref(struct hda_codec *codec,
>  		snd_hda_codec_set_pin_target(codec, 0x19, PIN_VREFHIZ);
>  }
>  
> +static void alc_fixup_ft_alc257_rename(struct hda_codec *codec,
> +                                 const struct hda_fixup *fix, int action)
> +{
> +       int err;
> +       if (action == HDA_FIXUP_ACT_PRE_PROBE)
> +               err = alc_codec_rename(codec, "ALC3328");
> +}
>  
>  static void alc294_gx502_toggle_output(struct hda_codec *codec,
>  					struct hda_jack_callback *cb)
> @@ -7799,6 +7806,7 @@ enum {
>  	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
>  	ALC233_FIXUP_MEDION_MTL_SPK,
>  	ALC294_FIXUP_BASS_SPEAKER_15,
> +	ALC257_FIXUP_FT_RENAME,
>  };
>  
>  /* A special fixup for Lenovo C940 and Yoga Duet 7;
> @@ -10143,6 +10151,10 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = alc294_fixup_bass_speaker_15,
>  	},
> +	[ALC257_FIXUP_FT_RENAME] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_ft_alc257_rename,
> +	},
>  };
>  
>  static const struct hda_quirk alc269_fixup_tbl[] = {
> @@ -10715,6 +10727,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x10cf, 0x1757, "Lifebook E752", ALC269_FIXUP_LIFEBOOK_HP_PIN),
>  	SND_PCI_QUIRK(0x10cf, 0x1845, "Lifebook U904", ALC269_FIXUP_LIFEBOOK_EXTMIC),
>  	SND_PCI_QUIRK(0x10ec, 0x10f2, "Intel Reference board", ALC700_FIXUP_INTEL_REFERENCE),
> +	SND_PCI_QUIRK(0x10ec, 0x12f0, "BXC NF271B FT board", ALC257_FIXUP_FT_RENAME),
>  	SND_PCI_QUIRK(0x10ec, 0x118c, "Medion EE4254 MD62100", ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x10ec, 0x119e, "Positivo SU C1400", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x10ec, 0x11bc, "VAIO VJFE-IL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
> -- 
> 2.25.1
> 
