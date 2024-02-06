Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A843A84B5C2
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 13:58:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B99B82A;
	Tue,  6 Feb 2024 13:58:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B99B82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707224315;
	bh=iL0HRojAzYDaeWoChYZcGEd6ts/epCRxUVQaIOugMFE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MXUca7lEV3cszx3Fv+iudMNCcMb4RS9UTJzWi5AR8KHvlJpDQw0X29O8KxZ+a6mXU
	 aJqCxsXhhKKvUfiNX/wl0TB3wKdx2OF+1tXT39x74ZIIU9SwNBmFWAl38QGBbdbmYD
	 9PD+Xr7f2xFSkLkwk6oz+pfZ0PfGPD3UiD0SESo4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD2E7F8057F; Tue,  6 Feb 2024 13:58:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CDC3F80571;
	Tue,  6 Feb 2024 13:58:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD03AF801EB; Tue,  6 Feb 2024 13:57:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D738F80153
	for <alsa-devel@alsa-project.org>; Tue,  6 Feb 2024 13:57:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D738F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Vu0o+OOJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=so+rAKsH;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Vu0o+OOJ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=so+rAKsH
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 63FFE21F97;
	Tue,  6 Feb 2024 12:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707224267;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hrPdcscD82ZUY6PH9OM5wcI+tI4zDbEnOTR3kzNVpoY=;
	b=Vu0o+OOJCFymyujwpECX00A2LCtfKTRvohJSFlRp2HCQDi2ASSyoXDk1TRT9PKwu321lSM
	DQQMpThrEAdi3gZ19WRBx0XyssIohW0LukqZnIfCIJJNNC5o5z/QvL6R32M7/sAqM4cQR1
	EAoGKcKPoWnRCVoChWgr7HnZqBqnH7E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707224267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hrPdcscD82ZUY6PH9OM5wcI+tI4zDbEnOTR3kzNVpoY=;
	b=so+rAKsHbAGYwYUwwIrZetLGZ3KJ5tk2kB6NITrgOAmtmPCU6vhDIr769baVDdI9a+KnWu
	RA/S6XqmGkLW6GDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707224267;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hrPdcscD82ZUY6PH9OM5wcI+tI4zDbEnOTR3kzNVpoY=;
	b=Vu0o+OOJCFymyujwpECX00A2LCtfKTRvohJSFlRp2HCQDi2ASSyoXDk1TRT9PKwu321lSM
	DQQMpThrEAdi3gZ19WRBx0XyssIohW0LukqZnIfCIJJNNC5o5z/QvL6R32M7/sAqM4cQR1
	EAoGKcKPoWnRCVoChWgr7HnZqBqnH7E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707224267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hrPdcscD82ZUY6PH9OM5wcI+tI4zDbEnOTR3kzNVpoY=;
	b=so+rAKsHbAGYwYUwwIrZetLGZ3KJ5tk2kB6NITrgOAmtmPCU6vhDIr769baVDdI9a+KnWu
	RA/S6XqmGkLW6GDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A5CB139D8;
	Tue,  6 Feb 2024 12:57:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jP2zBcsswmXfMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Feb 2024 12:57:47 +0000
Date: Tue, 06 Feb 2024 13:57:46 +0100
Message-ID: <871q9pwy0l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <srinivas.kandagatla@linaro.org>,
	<mathias.nyman@intel.com>,
	<perex@perex.cz>,
	<conor+dt@kernel.org>,
	<corbet@lwn.net>,
	<lgirdwood@gmail.com>,
	<andersson@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>,
	<gregkh@linuxfoundation.org>,
	<Thinh.Nguyen@synopsys.com>,
	<broonie@kernel.org>,
	<bgoswami@quicinc.com>,
	<tiwai@suse.com>,
	<robh+dt@kernel.org>,
	<konrad.dybcio@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
Subject: Re: [PATCH v13 48/53] ALSA: usb-audio: mixer: Add USB offloading
 mixer control
In-Reply-To: <20240203023645.31105-49-quic_wcheng@quicinc.com>
References: <20240203023645.31105-1-quic_wcheng@quicinc.com>
	<20240203023645.31105-49-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Vu0o+OOJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=so+rAKsH
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.60 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 R_RATELIMIT(0.00)[to_ip_from(RLe67txhfobum3fqdb5xx8e3au)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.09)[64.59%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[dt];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[23];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,quicinc.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[linaro.org,intel.com,perex.cz,kernel.org,lwn.net,gmail.com,linuxfoundation.org,synopsys.com,quicinc.com,suse.com,vger.kernel.org,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Queue-Id: 63FFE21F97
Message-ID-Hash: BALETLY3TPUK7IGTEVITFKXQ5T4FK6N6
X-Message-ID-Hash: BALETLY3TPUK7IGTEVITFKXQ5T4FK6N6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BALETLY3TPUK7IGTEVITFKXQ5T4FK6N6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 03 Feb 2024 03:36:40 +0100,
Wesley Cheng wrote:
> 
> In order to allow userspace/applications know about USB offloading status,
> expose a sound kcontrol that fetches information about which sound card
> index is associated with the ASoC platform card supporting offloading.  In
> the USB audio offloading framework, the ASoC BE DAI link is the entity
> responsible for registering to the SOC USB layer.  SOC USB will expose more
> details about the current offloading status, which includes the USB sound
> card and USB PCM device indexes currently being used.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

The concept is understandable, but the control element name ("SNDUSB
OFFLD playback available") looks non-intrusive and non-conformant.
Use a bit more understandable name instead.

This provides a card number where the offload driver is bound, and the
name should indicate something about that.

Also, about the implementation:

> +static int
> +snd_usb_offload_create_mixer(struct usb_mixer_interface *mixer,
> +		       const struct snd_kcontrol_new *new_kctl)
> +{
> +	struct snd_kcontrol *kctl;
> +	struct usb_mixer_elem_info *elem;
> +
> +	elem = kzalloc(sizeof(struct usb_mixer_elem_info), GFP_KERNEL);
> +	if (!elem)
> +		return -ENOMEM;
> +
> +	elem->head.mixer = mixer;
> +	elem->val_type = USB_MIXER_S32;
> +	elem->control = 0;
> +	elem->head.id = 0;
> +	elem->channels = 1;
> +
> +	kctl = snd_ctl_new1(new_kctl, elem);
> +	if (!kctl) {
> +		kfree(elem);
> +		return -ENOMEM;
> +	}
> +	kctl->private_free = snd_usb_mixer_elem_free;
> +
> +	return snd_usb_mixer_add_control(&elem->head, kctl);

This control has almost little to do with the standard USB interface,
and it'll be much simpler if you create a raw control element.
Pass the bus or the sysdev to private_data, and that's all you need in
the get callback.

Also, don't forget to set the proper access bits (it's read-only).


thanks,

Takashi
