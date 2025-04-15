Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A45AA8A29D
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Apr 2025 17:18:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D31FE6A766;
	Tue, 15 Apr 2025 17:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D31FE6A766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744730337;
	bh=WsiZVen01hmKAjOZ2ChAxXZQMdWcpZsL5oQexIMtuPw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=McFzaY3ZFahPie8TdtfyaXlHjBvCoKWlSOzKkjo7JOStRufC5bGDjTbqIgb2oPaG9
	 3etRTvBovR6qtEr93Y9wPWY0FziNGBzgRnQyRNAhfub/y9SA/sGt8aO5/t/4gk9ZNN
	 jSoUss71PBre5f6kbb9xGV0UQzbX91gw5iVIFZd8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5090F805C9; Tue, 15 Apr 2025 17:18:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85210F80075;
	Tue, 15 Apr 2025 17:18:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55ED0F80224; Tue, 15 Apr 2025 17:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 551BEF800B0
	for <alsa-devel@alsa-project.org>; Tue, 15 Apr 2025 17:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 551BEF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=QJKRvT8r;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6N5Mqx5e;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=QJKRvT8r;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6N5Mqx5e
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 918982111F;
	Tue, 15 Apr 2025 15:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1744730294;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zSn5W9sAZYptyp7oa+5YXTZR+pVW3FocpLWZdFK3Ecs=;
	b=QJKRvT8rgtE1f36xdAaLQAej/rtjhc1DbET7dmW+wH8+O7Oc89e9kRVCPyXiapgAHOF8kT
	McumyOKQtHUWI+a8ZAH8vNWc398/ahUYaNIY7KuvCAJWiXFqiYKAaj0z2FrI0Tl3BujCZ/
	+3MjheThOk7BY2x1B8raJYx+PfI50ZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744730294;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zSn5W9sAZYptyp7oa+5YXTZR+pVW3FocpLWZdFK3Ecs=;
	b=6N5Mqx5eQ5Gyjh7U13V0h/100O3NnGEoibFJblgxqvuEp1KTXrtSnkDLwOLJ91dVrTSskG
	OUmwdXkLQmpti4Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1744730294;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zSn5W9sAZYptyp7oa+5YXTZR+pVW3FocpLWZdFK3Ecs=;
	b=QJKRvT8rgtE1f36xdAaLQAej/rtjhc1DbET7dmW+wH8+O7Oc89e9kRVCPyXiapgAHOF8kT
	McumyOKQtHUWI+a8ZAH8vNWc398/ahUYaNIY7KuvCAJWiXFqiYKAaj0z2FrI0Tl3BujCZ/
	+3MjheThOk7BY2x1B8raJYx+PfI50ZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744730294;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zSn5W9sAZYptyp7oa+5YXTZR+pVW3FocpLWZdFK3Ecs=;
	b=6N5Mqx5eQ5Gyjh7U13V0h/100O3NnGEoibFJblgxqvuEp1KTXrtSnkDLwOLJ91dVrTSskG
	OUmwdXkLQmpti4Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 475B5137A5;
	Tue, 15 Apr 2025 15:18:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TPofELZ4/mdxTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Apr 2025 15:18:14 +0000
Date: Tue, 15 Apr 2025 17:18:13 +0200
Message-ID: <87y0w1xxl6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<13564923607@139.com>,
	<13916275206@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<baojun.xu@ti.com>,
	<Baojun.Xu@fpt.com>,
	<robinchen@ti.com>
Subject: Re: [RESEND PATCH v2] ALSA: hda/tas2781: Create a common header for
 both spi and i2c tas2781 hda driver
In-Reply-To: <20250415070913.679-1-shenghao-ding@ti.com>
References: <20250415070913.679-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: 3TRRLM6CYB77U7FFYLHDDRV2CVBQXJMF
X-Message-ID-Hash: 3TRRLM6CYB77U7FFYLHDDRV2CVBQXJMF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3TRRLM6CYB77U7FFYLHDDRV2CVBQXJMF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 15 Apr 2025 09:09:13 +0200,
Shenghao Ding wrote:
> 
> Move the common macro definition of kcontrols into a common header.
> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> ---
> v2:
>  - Follow IWYU principle, add sound/asound.h into the header file.
> v1:
>  - Revise the year of spi and i2c tas2781 hda drivers.
>  - Create a common header for both spi and i2c tas2781 hda driver to define
>    the common macros and declare the common functions.

The code change itself looks fine, but do you need this change for
what purpose?  Is it meant as a code cleanup?  You wrote what the
patch does, but why it's needed isn't mentioned at all.


thanks,

Takashi

> ---
>  sound/pci/hda/tas2781_hda.h     | 44 +++++++++++++++++++++++++++++++++
>  sound/pci/hda/tas2781_hda_i2c.c | 29 ++--------------------
>  sound/pci/hda/tas2781_hda_spi.c | 35 ++------------------------
>  3 files changed, 48 insertions(+), 60 deletions(-)
>  create mode 100644 sound/pci/hda/tas2781_hda.h
> 
> diff --git a/sound/pci/hda/tas2781_hda.h b/sound/pci/hda/tas2781_hda.h
> new file mode 100644
> index 000000000000..fc741fac419a
> --- /dev/null
> +++ b/sound/pci/hda/tas2781_hda.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * HDA audio driver for Texas Instruments TAS2781 smart amp
> + *
> + * Copyright (C) 2025 Texas Instruments, Inc.
> + */
> +#ifndef __TAS2781_HDA_H__
> +#define __TAS2781_HDA_H__
> +
> +#include <sound/asound.h>
> +
> +/*
> + * No standard control callbacks for SNDRV_CTL_ELEM_IFACE_CARD
> + * Define two controls, one is Volume control callbacks, the other is
> + * flag setting control callbacks.
> + */
> +
> +/* Volume control callbacks for tas2781 */
> +#define ACARD_SINGLE_RANGE_EXT_TLV(xname, xreg, xshift, xmin, xmax, xinvert, \
> +	xhandler_get, xhandler_put, tlv_array) { \
> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = (xname), \
> +	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
> +		SNDRV_CTL_ELEM_ACCESS_READWRITE, \
> +	.tlv.p = (tlv_array), \
> +	.info = snd_soc_info_volsw, \
> +	.get = xhandler_get, .put = xhandler_put, \
> +	.private_value = (unsigned long)&(struct soc_mixer_control) { \
> +		.reg = xreg, .rreg = xreg, \
> +		.shift = xshift, .rshift = xshift,\
> +		.min = xmin, .max = xmax, .invert = xinvert, \
> +	} \
> +}
> +
> +/* Flag control callbacks for tas2781 */
> +#define ACARD_SINGLE_BOOL_EXT(xname, xdata, xhandler_get, xhandler_put) { \
> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD, \
> +	.name = xname, \
> +	.info = snd_ctl_boolean_mono_info, \
> +	.get = xhandler_get, \
> +	.put = xhandler_put, \
> +	.private_value = xdata, \
> +}
> +
> +#endif
> diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
> index 29dc4f500580..9d94ae5fcfe0 100644
> --- a/sound/pci/hda/tas2781_hda_i2c.c
> +++ b/sound/pci/hda/tas2781_hda_i2c.c
> @@ -2,7 +2,7 @@
>  //
>  // TAS2781 HDA I2C driver
>  //
> -// Copyright 2023 - 2024 Texas Instruments, Inc.
> +// Copyright 2023 - 2025 Texas Instruments, Inc.
>  //
>  // Author: Shenghao Ding <shenghao-ding@ti.com>
>  // Current maintainer: Baojun Xu <baojun.xu@ti.com>
> @@ -30,35 +30,10 @@
>  #include "hda_component.h"
>  #include "hda_jack.h"
>  #include "hda_generic.h"
> +#include "tas2781_hda.h"
>  
>  #define TASDEVICE_SPEAKER_CALIBRATION_SIZE	20
>  
> -/* No standard control callbacks for SNDRV_CTL_ELEM_IFACE_CARD
> - * Define two controls, one is Volume control callbacks, the other is
> - * flag setting control callbacks.
> - */
> -
> -/* Volume control callbacks for tas2781 */
> -#define ACARD_SINGLE_RANGE_EXT_TLV(xname, xreg, xshift, xmin, xmax, xinvert, \
> -	xhandler_get, xhandler_put, tlv_array) \
> -{	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = (xname),\
> -	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
> -		 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
> -	.tlv.p = (tlv_array), \
> -	.info = snd_soc_info_volsw, \
> -	.get = xhandler_get, .put = xhandler_put, \
> -	.private_value = (unsigned long)&(struct soc_mixer_control) \
> -		{.reg = xreg, .rreg = xreg, .shift = xshift, \
> -		 .rshift = xshift, .min = xmin, .max = xmax, \
> -		 .invert = xinvert} }
> -
> -/* Flag control callbacks for tas2781 */
> -#define ACARD_SINGLE_BOOL_EXT(xname, xdata, xhandler_get, xhandler_put) \
> -{	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = xname, \
> -	.info = snd_ctl_boolean_mono_info, \
> -	.get = xhandler_get, .put = xhandler_put, \
> -	.private_value = xdata }
> -
>  enum calib_data {
>  	R0_VAL = 0,
>  	INV_R0,
> diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
> index 399f2e4c3b62..c6be2be1b53e 100644
> --- a/sound/pci/hda/tas2781_hda_spi.c
> +++ b/sound/pci/hda/tas2781_hda_spi.c
> @@ -2,7 +2,7 @@
>  //
>  // TAS2781 HDA SPI driver
>  //
> -// Copyright 2024 Texas Instruments, Inc.
> +// Copyright 2024 - 2025 Texas Instruments, Inc.
>  //
>  // Author: Baojun Xu <baojun.xu@ti.com>
>  
> @@ -38,38 +38,7 @@
>  #include "hda_component.h"
>  #include "hda_jack.h"
>  #include "hda_generic.h"
> -
> -/*
> - * No standard control callbacks for SNDRV_CTL_ELEM_IFACE_CARD
> - * Define two controls, one is Volume control callbacks, the other is
> - * flag setting control callbacks.
> - */
> -
> -/* Volume control callbacks for tas2781 */
> -#define ACARD_SINGLE_RANGE_EXT_TLV(xname, xreg, xshift, xmin, xmax, xinvert, \
> -	xhandler_get, xhandler_put, tlv_array) { \
> -	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = (xname), \
> -	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
> -		SNDRV_CTL_ELEM_ACCESS_READWRITE, \
> -	.tlv.p = (tlv_array), \
> -	.info = snd_soc_info_volsw, \
> -	.get = xhandler_get, .put = xhandler_put, \
> -	.private_value = (unsigned long)&(struct soc_mixer_control) { \
> -		.reg = xreg, .rreg = xreg, \
> -		.shift = xshift, .rshift = xshift,\
> -		.min = xmin, .max = xmax, .invert = xinvert, \
> -	} \
> -}
> -
> -/* Flag control callbacks for tas2781 */
> -#define ACARD_SINGLE_BOOL_EXT(xname, xdata, xhandler_get, xhandler_put) { \
> -	.iface = SNDRV_CTL_ELEM_IFACE_CARD, \
> -	.name = xname, \
> -	.info = snd_ctl_boolean_mono_info, \
> -	.get = xhandler_get, \
> -	.put = xhandler_put, \
> -	.private_value = xdata, \
> -}
> +#include "tas2781_hda.h"
>  
>  struct tas2781_hda {
>  	struct tasdevice_priv *priv;
> -- 
> 2.34.1
> 
