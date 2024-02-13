Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2146385305C
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 13:18:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23BA5B65;
	Tue, 13 Feb 2024 13:18:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23BA5B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707826725;
	bh=TNsmmxa+6HeFCAOCpipUzX2RGd7pxLJG/+tp3ucMPnc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=okmNS2hdSwh02aMBdaCdhFwjBEG0MOmsDxER+aJf4drOoRUm0sCpeDBMWZtGluHE/
	 vTfAq9C65SVYaV8UYueWB4mf+adcIxIPjc/5ONk/um+0+uEUt9n21ms60LkS7UseiF
	 na6Jr/aSbntd2MUCx3dfMP2KImVcRy9EvUx5otzs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54BC6F805AD; Tue, 13 Feb 2024 13:18:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EBC6F805A1;
	Tue, 13 Feb 2024 13:18:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 618F5F80238; Tue, 13 Feb 2024 13:18:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE107F8015B
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 13:18:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE107F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BgCj2Olw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=W8XscNEP;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=BgCj2Olw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=W8XscNEP
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B656A1FCA1;
	Tue, 13 Feb 2024 12:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707826681;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OenRm4KDcWLHzJQS8tkPl+f9jR79iIvkYkLzvmSq+jQ=;
	b=BgCj2Olw566Htu1EG2uF4EUwJZX2KMFBPnMyUuNwpbspUfqPlZCrVcM+5f4d9F1JjJ4zBl
	KV4iug0fvq/hE34snF6uaTD8kGQOfXEOdncvZ4OAr63p3vPOHonWljidbMGbOxFR+KiArC
	up6sUx6mW6fZPM1R/pzPK0TGsvBG5bU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707826681;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OenRm4KDcWLHzJQS8tkPl+f9jR79iIvkYkLzvmSq+jQ=;
	b=W8XscNEPtOb8qP2wQeAZwA9zewFvjRHHl52AQn5bsIQEvWUltf3QWdCfya5b5TY8A6Mrwd
	+TWbSDJRKATZNkCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707826681;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OenRm4KDcWLHzJQS8tkPl+f9jR79iIvkYkLzvmSq+jQ=;
	b=BgCj2Olw566Htu1EG2uF4EUwJZX2KMFBPnMyUuNwpbspUfqPlZCrVcM+5f4d9F1JjJ4zBl
	KV4iug0fvq/hE34snF6uaTD8kGQOfXEOdncvZ4OAr63p3vPOHonWljidbMGbOxFR+KiArC
	up6sUx6mW6fZPM1R/pzPK0TGsvBG5bU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707826681;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OenRm4KDcWLHzJQS8tkPl+f9jR79iIvkYkLzvmSq+jQ=;
	b=W8XscNEPtOb8qP2wQeAZwA9zewFvjRHHl52AQn5bsIQEvWUltf3QWdCfya5b5TY8A6Mrwd
	+TWbSDJRKATZNkCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6AEFA1370C;
	Tue, 13 Feb 2024 12:18:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J4IgGPldy2XVBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Feb 2024 12:18:01 +0000
Date: Tue, 13 Feb 2024 13:18:01 +0100
Message-ID: <87o7cky2va.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v15 46/50] ALSA: usb-audio: Add USB offloading capable
 kcontrol
In-Reply-To: <20240213005422.3121-47-quic_wcheng@quicinc.com>
References: <20240213005422.3121-1-quic_wcheng@quicinc.com>
	<20240213005422.3121-47-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [2.18 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-0.22)[72.28%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[dt];
	 MIME_GOOD(-0.10)[text/plain];
	 R_RATELIMIT(0.00)[to_ip_from(RLjs3ec4aura4kmsd6wxjjm4hg)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[23];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[linaro.org,intel.com,perex.cz,kernel.org,lwn.net,gmail.com,linuxfoundation.org,synopsys.com,quicinc.com,suse.com,vger.kernel.org,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
Message-ID-Hash: IVH6ZJT74RNNVJ5PLNBSXGCR7U6KFREP
X-Message-ID-Hash: IVH6ZJT74RNNVJ5PLNBSXGCR7U6KFREP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IVH6ZJT74RNNVJ5PLNBSXGCR7U6KFREP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Feb 2024 01:54:18 +0100,
Wesley Cheng wrote:
> 
> --- a/sound/usb/Makefile
> +++ b/sound/usb/Makefile
> @@ -22,6 +22,7 @@ snd-usb-audio-objs := 	card.o \
>  			stream.o \
>  			validate.o
>  
> +snd-usb-audio-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
>  snd-usb-audio-$(CONFIG_SND_USB_AUDIO_MIDI_V2) += midi2.o
>  snd-usb-audio-$(CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER) += media.o

This puts the code into snd-usb-audio driver, and that causes a
dependency mess, since...

> +snd_usb_offload_available_get(struct snd_kcontrol *kcontrol,
> +		      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct device *sysdev = snd_kcontrol_chip(kcontrol);
> +	int ret;
> +
> +	ret = snd_soc_usb_device_offload_available(sysdev);

... here you call snd_soc_usb_*() stuff that belongs to snd-soc-usb.
That is, with this patch, snd-usb-audio driver will depend on
snd-soc-usb, while snd-soc-usb also depends on snd-usb-audio for its
helpers again.

I believe the better way would be to move this whole miser_usb_offload
code into sound/usb/qcom/.  You need only usb_device and snd_card
objects at the creation, and you can get them in qcom driver side,
too.


thanks,

Takashi
