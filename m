Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0DF84F38C
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 11:37:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7254C83E;
	Fri,  9 Feb 2024 11:36:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7254C83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707475022;
	bh=nvztNhp7X0S6Y2yxrs+3c0zWNvdowtA6+SOHFeM8a8w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j8jDu4gdgEk5wsbYQCWy2aO/Td01dWYak8B9T4riO8zfB7up1ahrOyMwzyKCWQCGS
	 w7K87IMGrxm7GvhLSSjLc+HZisb2BdrSkFOLKlPsNja8DU9EyVU72v2BU703AXX25n
	 XQmuDSucqlHNsNMKH2PhZWngtHS/1Y2uISe6yuFs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62DE1F8057D; Fri,  9 Feb 2024 11:36:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F4F7F80578;
	Fri,  9 Feb 2024 11:36:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BAEBF801EB; Fri,  9 Feb 2024 11:36:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 425C3F800EE
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 11:36:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 425C3F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=lPS4896Q;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4yE7nRz7;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=lPS4896Q;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4yE7nRz7
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7334D1F7F9;
	Fri,  9 Feb 2024 10:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707474976;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xSm7XsOm/8PdNpZJ4ZKFj5+Aa8A+E6krzaBF3pYG804=;
	b=lPS4896QkRWG2ro/r12OJVDVX8cfQjF1aPwm9OZv2LIRozc+IK8FBhG5cnvAQwnl1V49Ay
	KvEAdRjJs7RP2/89Jt1Ne18NP/LMkzcqa4VQ6uOJcq8tXpLUe+UOe4HyzY5ASK0Guz06yN
	TAr9dXI7nH9Zf55hGwOLcPV2eOKfzCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707474976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xSm7XsOm/8PdNpZJ4ZKFj5+Aa8A+E6krzaBF3pYG804=;
	b=4yE7nRz7uvV57v+FhhNr302GQ+ly7ThKYX2jbc72HpnR0v/Wn3kjRuGpsCURnC4hVX+vFU
	8SI42tlkhFD9FjCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707474976;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xSm7XsOm/8PdNpZJ4ZKFj5+Aa8A+E6krzaBF3pYG804=;
	b=lPS4896QkRWG2ro/r12OJVDVX8cfQjF1aPwm9OZv2LIRozc+IK8FBhG5cnvAQwnl1V49Ay
	KvEAdRjJs7RP2/89Jt1Ne18NP/LMkzcqa4VQ6uOJcq8tXpLUe+UOe4HyzY5ASK0Guz06yN
	TAr9dXI7nH9Zf55hGwOLcPV2eOKfzCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707474976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xSm7XsOm/8PdNpZJ4ZKFj5+Aa8A+E6krzaBF3pYG804=;
	b=4yE7nRz7uvV57v+FhhNr302GQ+ly7ThKYX2jbc72HpnR0v/Wn3kjRuGpsCURnC4hVX+vFU
	8SI42tlkhFD9FjCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E372B1326D;
	Fri,  9 Feb 2024 10:36:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ot5lNh8AxmVHJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 09 Feb 2024 10:36:15 +0000
Date: Fri, 09 Feb 2024 11:36:15 +0100
Message-ID: <87y1bt2acg.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v14 48/53] ALSA: usb-audio: mixer: Add USB offloading
 mixer control
In-Reply-To: <20240208231406.27397-49-quic_wcheng@quicinc.com>
References: <20240208231406.27397-1-quic_wcheng@quicinc.com>
	<20240208231406.27397-49-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lPS4896Q;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4yE7nRz7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
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
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[dt];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[23];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,quicinc.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[linaro.org,intel.com,perex.cz,kernel.org,lwn.net,gmail.com,linuxfoundation.org,synopsys.com,quicinc.com,suse.com,vger.kernel.org,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Queue-Id: 7334D1F7F9
Message-ID-Hash: CQWM5V2EIMSFMQCRMFJ3USPTYXAV7RBF
X-Message-ID-Hash: CQWM5V2EIMSFMQCRMFJ3USPTYXAV7RBF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQWM5V2EIMSFMQCRMFJ3USPTYXAV7RBF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 09 Feb 2024 00:14:01 +0100,
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

Now looking at this again, I noticed that this will bring the
hard-dependency on ASoC stuff to USB-audio driver, since it adds the
call of snd_soc_usb_device_offload_available().

Maybe we can let the add-on platform adding/removing the control
element on the fly instead?


thanks,

Takashi

> ---
>  sound/usb/Kconfig             |  4 ++
>  sound/usb/Makefile            |  1 +
>  sound/usb/mixer.c             |  5 +++
>  sound/usb/mixer_usb_offload.c | 72 +++++++++++++++++++++++++++++++++++
>  sound/usb/mixer_usb_offload.h | 17 +++++++++
>  5 files changed, 99 insertions(+)
>  create mode 100644 sound/usb/mixer_usb_offload.c
>  create mode 100644 sound/usb/mixer_usb_offload.h
> 
> diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
> index 4c842fbe6365..3e7be258d0e3 100644
> --- a/sound/usb/Kconfig
> +++ b/sound/usb/Kconfig
> @@ -176,10 +176,14 @@ config SND_BCD2000
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called snd-bcd2000.
>  
> +config SND_USB_OFFLOAD_MIXER
> +	bool
> +
>  config SND_USB_AUDIO_QMI
>  	tristate "Qualcomm Audio Offload driver"
>  	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND
>  	select SND_PCM
> +	select SND_USB_OFFLOAD_MIXER
>  	help
>  	  Say Y here to enable the Qualcomm USB audio offloading feature.
>  
> diff --git a/sound/usb/Makefile b/sound/usb/Makefile
> index 246788268ddd..8c54660a11b0 100644
> --- a/sound/usb/Makefile
> +++ b/sound/usb/Makefile
> @@ -22,6 +22,7 @@ snd-usb-audio-objs := 	card.o \
>  			stream.o \
>  			validate.o
>  
> +snd-usb-audio-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
>  snd-usb-audio-$(CONFIG_SND_USB_AUDIO_MIDI_V2) += midi2.o
>  snd-usb-audio-$(CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER) += media.o
>  
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index 409fc1164694..09229e623469 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -48,6 +48,7 @@
>  #include "mixer.h"
>  #include "helper.h"
>  #include "mixer_quirks.h"
> +#include "mixer_usb_offload.h"
>  #include "power.h"
>  
>  #define MAX_ID_ELEMS	256
> @@ -3609,6 +3610,10 @@ int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif)
>  	if (err < 0)
>  		goto _error;
>  
> +	err = snd_usb_offload_init_mixer(mixer);
> +	if (err < 0)
> +		goto _error;
> +
>  	err = snd_device_new(chip->card, SNDRV_DEV_CODEC, mixer, &dev_ops);
>  	if (err < 0)
>  		goto _error;
> diff --git a/sound/usb/mixer_usb_offload.c b/sound/usb/mixer_usb_offload.c
> new file mode 100644
> index 000000000000..61b17359b987
> --- /dev/null
> +++ b/sound/usb/mixer_usb_offload.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/usb.h>
> +
> +#include <sound/core.h>
> +#include <sound/control.h>
> +#include <sound/soc-usb.h>
> +
> +#include "card.h"
> +#include "mixer.h"
> +#include "mixer_usb_offload.h"
> +#include "usbaudio.h"
> +
> +static int
> +snd_usb_offload_create_mixer(struct usb_mixer_interface *mixer,
> +		       const struct snd_kcontrol_new *new_kctl)
> +{
> +	struct snd_usb_audio *chip = mixer->chip;
> +	struct usb_device *udev = chip->dev;
> +
> +	return snd_ctl_add(chip->card,
> +			   snd_ctl_new1(new_kctl, udev->bus->sysdev));
> +}
> +
> +static int
> +snd_usb_offload_available_get(struct snd_kcontrol *kcontrol,
> +		      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct device *sysdev = snd_kcontrol_chip(kcontrol);
> +	int ret;
> +
> +	ret = snd_soc_usb_device_offload_available(sysdev);
> +	ucontrol->value.integer.value[0] = ret < 0 ? -1 : ret;
> +
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static int snd_usb_offload_available_info(struct snd_kcontrol *kcontrol,
> +			      struct snd_ctl_elem_info *uinfo)
> +{
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +	uinfo->count = 1;
> +	uinfo->value.integer.min = -1;
> +	uinfo->value.integer.max = SNDRV_CARDS;
> +
> +	return 0;
> +}
> +
> +static const struct snd_kcontrol_new snd_usb_offload_available_ctl = {
> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
> +	.access = SNDRV_CTL_ELEM_ACCESS_READ,
> +	.name = "USB Offload Playback Capable Card",
> +	.info = snd_usb_offload_available_info,
> +	.get = snd_usb_offload_available_get,
> +};
> +
> +/**
> + * snd_usb_offload_init_mixer() - Add USB offload bounded mixer
> + * @mixer - USB mixer
> + *
> + * Creates a sound control for a USB audio device, so that applications can
> + * query for if there is an available USB audio offload path, and which
> + * card is managing it.
> + */
> +int snd_usb_offload_init_mixer(struct usb_mixer_interface *mixer)
> +{
> +	return snd_usb_offload_create_mixer(mixer, &snd_usb_offload_available_ctl);
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_offload_init_mixer);
> diff --git a/sound/usb/mixer_usb_offload.h b/sound/usb/mixer_usb_offload.h
> new file mode 100644
> index 000000000000..fb88e872d8fa
> --- /dev/null
> +++ b/sound/usb/mixer_usb_offload.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __USB_OFFLOAD_MIXER_H
> +#define __USB_OFFLOAD_MIXER_H
> +
> +#if IS_ENABLED(CONFIG_SND_USB_OFFLOAD_MIXER)
> +int snd_usb_offload_init_mixer(struct usb_mixer_interface *mixer);
> +#else
> +static int snd_usb_offload_init_mixer(struct usb_mixer_interface *mixer)
> +{
> +	return 0;
> +}
> +#endif
> +#endif /* __USB_OFFLOAD_MIXER_H */
