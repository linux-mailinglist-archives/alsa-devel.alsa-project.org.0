Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C38128BAFA3
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 17:17:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35958E72;
	Fri,  3 May 2024 17:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35958E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714749470;
	bh=KJfqZgax64prPMpPNUNofDSkKySTwOCkxTH+UF6nTso=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CRFicBhcQVCxLMytKFLaLTUsMSP4D3i52NCRIXrSGf8m/U2oHb1G7Cit0Db1LGzxx
	 u2/4d5tFTbvHNcP7uzPy0/981WB8ypUPIQIfw3Xu6SadxwHINHQ2JtZFxioEw15gAH
	 HXai2KwfG+MrkDYXHePl4EgCd95B+zDvVRXPu9ok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12E26F8049C; Fri,  3 May 2024 17:17:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C0BEF80578;
	Fri,  3 May 2024 17:17:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4D66F80266; Fri,  3 May 2024 17:17:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C8CCF8023A
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 17:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C8CCF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=b6wBVG10;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5M4/TA5h;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=b6wBVG10;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5M4/TA5h
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 736B533B85;
	Fri,  3 May 2024 15:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714749421;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=isFjC32uACt6O65rKRP2AYTy2BLvdanLyHjx9bEOYoU=;
	b=b6wBVG10rWRDWC/tMakRx+KruYCZjN2543NHu976oIzu0JGN47DSY8iDZfYOyCQ0LwbJxw
	s+enfHldW4I++Y0dmo87OWaS2DQCxwxuMuHZilQL8EvbD7NiN4NIeB9Wo4i+CjdBO8NwAX
	5+EEL737XNZ7oF9NBdDdrSOq10zxrPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714749421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=isFjC32uACt6O65rKRP2AYTy2BLvdanLyHjx9bEOYoU=;
	b=5M4/TA5haAIuk+cA5ivsW29ZmdmtuEVP54jp+f6jhha/Cod1ggUopj4E6dg/Wxu/NonsMV
	QaB1I7uuKiUB0KDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=b6wBVG10;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="5M4/TA5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714749421;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=isFjC32uACt6O65rKRP2AYTy2BLvdanLyHjx9bEOYoU=;
	b=b6wBVG10rWRDWC/tMakRx+KruYCZjN2543NHu976oIzu0JGN47DSY8iDZfYOyCQ0LwbJxw
	s+enfHldW4I++Y0dmo87OWaS2DQCxwxuMuHZilQL8EvbD7NiN4NIeB9Wo4i+CjdBO8NwAX
	5+EEL737XNZ7oF9NBdDdrSOq10zxrPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714749421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=isFjC32uACt6O65rKRP2AYTy2BLvdanLyHjx9bEOYoU=;
	b=5M4/TA5haAIuk+cA5ivsW29ZmdmtuEVP54jp+f6jhha/Cod1ggUopj4E6dg/Wxu/NonsMV
	QaB1I7uuKiUB0KDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4689A139CB;
	Fri,  3 May 2024 15:17:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lxT9D+3/NGa0KQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 03 May 2024 15:17:01 +0000
Date: Fri, 03 May 2024 17:17:15 +0200
Message-ID: <87msp79b7o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda/cs_dsp_ctl: Actually remove ALSA controls
In-Reply-To: <20240503144920.61075-1-rf@opensource.cirrus.com>
References: <20240503144920.61075-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 736B533B85
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 74WZFAAR4W6EYVBZGLVQ37VAZC5I56CA
X-Message-ID-Hash: 74WZFAAR4W6EYVBZGLVQ37VAZC5I56CA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/74WZFAAR4W6EYVBZGLVQ37VAZC5I56CA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 03 May 2024 16:49:20 +0200,
Richard Fitzgerald wrote:
> 
> hda_cs_dsp_control_remove() must remove the ALSA control when
> deleting all the infrastructure for handling the control.
> 
> Without this it is possible for ALSA controls to be left in
> the Soundcard after the amp driver module has been unloaded.
> So the get/set callbacks point to code that no longer exists.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: 3233b978af23 ("ALSA: hda: hda_cs_dsp_ctl: Add Library to support CS_DSP ALSA controls")
> ---
> Note: it would be better to use the control private_free to do the
> cleanup, and that is my plan long-term. But that is a larger change
> to the code.
> 
> I like to keep bugfix patches as simple as possible so they are
> low-risk and easy to cherry-pick into older kernels. So this patch
> fixes the bug. Sometime I will send a patch for future kernel
> versions that reworks the cleanup to use private_free.

I also like to keep as simple as possible :)

One slight concern is whether cs_dsp kctls can be deleted at the
snd_card removal (disconnect) before this function gets called.
That is, snd_card_free() of the main card may delete all associated
kctls, and may this function be called afterwards?
If yes, this change would lead to a UAF.

The structure is so complex and I can't follow immediately,
unfortunately...


thanks,

Takashi

> ---
>  sound/pci/hda/hda_cs_dsp_ctl.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
> index 463ca06036bf..a42653d3473d 100644
> --- a/sound/pci/hda/hda_cs_dsp_ctl.c
> +++ b/sound/pci/hda/hda_cs_dsp_ctl.c
> @@ -203,6 +203,10 @@ void hda_cs_dsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl)
>  {
>  	struct hda_cs_dsp_coeff_ctl *ctl = cs_ctl->priv;
>  
> +	/* Only public firmware controls will have an associated kcontrol */
> +	if (ctl && ctl->kctl)
> +		snd_ctl_remove(ctl->card, ctl->kctl);
> +
>  	kfree(ctl);
>  }
>  EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_control_remove, SND_HDA_CS_DSP_CONTROLS);
> -- 
> 2.39.2
> 
