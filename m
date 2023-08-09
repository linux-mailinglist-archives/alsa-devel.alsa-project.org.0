Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC0277623D
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 16:20:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86C7482B;
	Wed,  9 Aug 2023 16:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86C7482B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691590805;
	bh=j6/jjqKVMDSAyKiL2ssHwoOVSIUO68WoQfolDmY+dQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GC4EPFB1Cdjmopb3ZjzD2EjUJtsjQ38fNxHhhWoyN1id0QoIfODyPLdJ0LpbXWN7Y
	 jggWl5Vq++EItGOg974ee6ON33FmS75Ec8SdMZiFNC7oeRtiR/Wx4J0WMN2lsHUcNm
	 tPDtTOQ4WDDCTa/hfDohrliCHdUqYcdWFKhRMrw8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4978F801EB; Wed,  9 Aug 2023 16:19:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99F9AF80116;
	Wed,  9 Aug 2023 16:19:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41106F80134; Wed,  9 Aug 2023 16:19:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F753F800FB
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 16:19:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F753F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=MFdavzV0;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=O73azHnp
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 626963200077;
	Wed,  9 Aug 2023 10:19:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 09 Aug 2023 10:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1691590739; x=
	1691677139; bh=gvDkw4lvvn8yEfr9qCFo8Xb2xsrl7+7DFwPiiLoKgIk=; b=M
	FdavzV0mUnT1okHDqwGno5batVkLmvBMujO4TQzDHjvMnqHj4ExypD1nXX6QnpRG
	uxyCYO4PAaqIpQh/SmtWzMyRi6Bh3EE5mfdk1jbBjqi1cbNXsced0xXfX5R4bx9L
	FvFLA+djUQvJHe4lZnzRNmCd2Mfit4+0UUzvYWkd+uKzmqYfVSLpBXr+WGheo9BR
	OV28IBtBcZRbVGtC7AhN/cop0xLFquo/KPsxkuEUBLd8CdFGEBKOAbntrN9kegJR
	8/BUVY0ZuDygakYCrsEaqJ0AMPBMOC5qPr/jFAf0Qg9gHkGCRpsql5uTJqM2ihNX
	n2IW9cXcmNXZbqJBMxJMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691590739; x=1691677139; bh=gvDkw4lvvn8yE
	fr9qCFo8Xb2xsrl7+7DFwPiiLoKgIk=; b=O73azHnpEN/BtxacITcwp/wxQI0KY
	KdGT7RlKScsyAF3BXMSegvx+j5J88LDvJx2myBlBPnEyD+rRCcYSwGjgb26RIi1K
	0UeZsw2bk8NUAxidJJx+1B6Egd5npxh56mlDhpb7oDtOnezKRAplO7dbnm8hAUTO
	cpEy32eijz+ntISON8H7EFqWSMpvC/DKQG3PkbJ4PtepmjLrb0l3kqzLi/xajHQ3
	PB+GoWDq4FErSISrt6dTwOvFaWbpSWR92NETd2sX692VHKfUYptlLasN7HFUWNvP
	jv8r/1ZZBzGgf3Tr+uSNxbYcZnetloKw5ICIFqYdiVtAuWzw6kVj/v4Ew==
X-ME-Sender: <xms:U6DTZOw3biODemNDSxQfT1P_IkfTgHzGD6B1qoF8ab5Log4g4IRrWA>
    <xme:U6DTZKTzsZk0ycPlnEv4FvHdnJjW4quu4i4KKz_2jc2dophDbikkuPgPzlDCvTIyW
    8wPDtXuDxYFUxbGjTU>
X-ME-Received: 
 <xmr:U6DTZAVtOhxyZE2mSNieSk5JQo9P3Kmb1cK6Z2oDIT6F5jPPEcE8UWYyuf5s_Jlxmzo6JvXEto3eptl8z9tl0tArzmlTwGUYiw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrleeggdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeehhffhteetgfekvdeiueffveevueeftdelhfejieei
    tedvleeftdfgfeeuudekueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:U6DTZEhVUp6dgdNHvKJnG6K-TqPHDoRvJFAD6-e6dfH649gK9uDJ7w>
    <xmx:U6DTZADEUKxmzOMpcen1FM4ji-8COY40oKxfy8abbH8YJ24wppZMxA>
    <xmx:U6DTZFIQYh9HVaieCNgNZi7LLUygr_1fQXlOcun0mvJWXgVOc4vAYQ>
    <xmx:U6DTZDNR8HC7CTSQKFrDxreWWScCspICuxQ6Ptp0kKmIMP11XS84qg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Aug 2023 10:18:58 -0400 (EDT)
Date: Wed, 9 Aug 2023 23:18:54 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Rolf Anderegg <rolf.anderegg@weiss.ch>,
	Michele Perrone <michele.perrone@weiss.ch>
Subject: Re: [PATCH] ALSA: dice: add stream format parameters for Weiss
 devices
Message-ID: <20230809141854.GA892647@workstation.local>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Rolf Anderegg <rolf.anderegg@weiss.ch>,
	Michele Perrone <michele.perrone@weiss.ch>
References: <20230809002631.750120-1-o-takashi@sakamocchi.jp>
 <87msz0e2jv.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87msz0e2jv.wl-tiwai@suse.de>
Message-ID-Hash: VNDDTQ5Y5V3ZB42RWXATBYQQULXF5QYF
X-Message-ID-Hash: VNDDTQ5Y5V3ZB42RWXATBYQQULXF5QYF
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VNDDTQ5Y5V3ZB42RWXATBYQQULXF5QYF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Wed, Aug 09, 2023 at 04:03:00PM +0200, Takashi Iwai wrote:
> On Wed, 09 Aug 2023 02:26:31 +0200,
> Takashi Sakamoto wrote:
> > 
> > This patch is for kernel prepatch v6.5.
> 
> Why it must be included in 6.5?  This sounds more like a new
> implementation, rather than an urgent but fix that is needed for rc.

Thanks for your notice to the patch. Indeed, it is neither urgent nor
bug fix. It is a kind of 'adding support for new device with slight
change', like adding new entries in mod device table. The overall change
and new lines are quite typical in ALSA dice driver, like TC Electronic
devices in 'sound/firewire/dice/dice-tcelectronic.c'. Things are
prepared and not brand-new.

Precisely, current ALSA dice driver supports the Weiss models already,
while the functionality is limited that the part of sampling transfer
frequencies are available as the initial author said (e.g. when 44.1/48.0
kHz are available, 88.2/96.0 kHz are not, vise versa). The patch extends
the functionality by hard-coding stream formats following to the design
of ALSA dice driver.

Of cource, I don't mind postponing the patch to v6.6 kernel, but in my
point of view, it is worth to v6.5 since users got benefits from the
code which is not so novel.


Thanks

Takashi Sakamoto

> > Hard-coded stream format parameters are added for Weiss Engineering
> > FireWire devices. When the device vendor and model match, the parameters
> > are copied into the stream format cache. This allows for setting all
> > supported sampling rates up to 192kHz, and consequently adjusting the
> > number of available I/O channels.
> > 
> > Signed-off-by: Rolf Anderegg <rolf.anderegg@weiss.ch>
> > Signed-off-by: Michele Perrone <michele.perrone@weiss.ch>
> > Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > ---
> >  sound/firewire/dice/Makefile     |   2 +-
> >  sound/firewire/dice/dice-weiss.c | 104 +++++++++++++++++++++++++++++++
> >  sound/firewire/dice/dice.c       |  63 +++++++++++++++++++
> >  sound/firewire/dice/dice.h       |   1 +
> >  4 files changed, 169 insertions(+), 1 deletion(-)
> >  create mode 100644 sound/firewire/dice/dice-weiss.c
> > 
> > diff --git a/sound/firewire/dice/Makefile b/sound/firewire/dice/Makefile
> > index a5f3fbf28b8c..bac8712f9014 100644
> > --- a/sound/firewire/dice/Makefile
> > +++ b/sound/firewire/dice/Makefile
> > @@ -2,5 +2,5 @@
> >  snd-dice-objs := dice-transaction.o dice-stream.o dice-proc.o dice-midi.o \
> >  		 dice-pcm.o dice-hwdep.o dice.o dice-tcelectronic.o \
> >  		 dice-alesis.o dice-extension.o dice-mytek.o dice-presonus.o \
> > -		 dice-harman.o dice-focusrite.o
> > +		 dice-harman.o dice-focusrite.o dice-weiss.o
> >  obj-$(CONFIG_SND_DICE) += snd-dice.o
> > diff --git a/sound/firewire/dice/dice-weiss.c b/sound/firewire/dice/dice-weiss.c
> > new file mode 100644
> > index 000000000000..129d43408956
> > --- /dev/null
> > +++ b/sound/firewire/dice/dice-weiss.c
> > @@ -0,0 +1,104 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// dice-weiss.c - a part of driver for DICE based devices
> > +//
> > +// Copyright (c) 2023 Rolf Anderegg and Michele Perrone
> > +
> > +#include "dice.h"
> > +
> > +struct dice_weiss_spec {
> > +	unsigned int tx_pcm_chs[MAX_STREAMS][SND_DICE_RATE_MODE_COUNT];
> > +	unsigned int rx_pcm_chs[MAX_STREAMS][SND_DICE_RATE_MODE_COUNT];
> > +};
> > +
> > +// Weiss DAC202: 192kHz 2-channel DAC
> > +static const struct dice_weiss_spec dac202 = {
> > +	.tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> > +	.rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> > +};
> > +
> > +// Weiss MAN301: 192kHz 2-channel music archive network player
> > +static const struct dice_weiss_spec man301 = {
> > +	.tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> > +	.rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> > +};
> > +
> > +// Weiss INT202: 192kHz unidirectional 2-channel digital Firewire nterface
> > +static const struct dice_weiss_spec int202 = {
> > +	.tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> > +	.rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> > +};
> > +
> > +// Weiss INT203: 192kHz bidirectional 2-channel digital Firewire nterface
> > +static const struct dice_weiss_spec int203 = {
> > +	.tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> > +	.rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> > +};
> > +
> > +// Weiss ADC2: 192kHz A/D converter with microphone preamps and line nputs
> > +static const struct dice_weiss_spec adc2 = {
> > +	.tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> > +	.rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> > +};
> > +
> > +// Weiss DAC2/Minerva: 192kHz 2-channel DAC
> > +static const struct dice_weiss_spec dac2_minerva = {
> > +	.tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> > +	.rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> > +};
> > +
> > +// Weiss Vesta: 192kHz 2-channel Firewire to AES/EBU interface
> > +static const struct dice_weiss_spec vesta = {
> > +	.tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> > +	.rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> > +};
> > +
> > +// Weiss AFI1: 192kHz 24-channel Firewire to ADAT or AES/EBU interface
> > +static const struct dice_weiss_spec afi1 = {
> > +	.tx_pcm_chs = {{24, 16, 8}, {0, 0, 0} },
> > +	.rx_pcm_chs = {{24, 16, 8}, {0, 0, 0} },
> > +};
> > +
> > +int snd_dice_detect_weiss_formats(struct snd_dice *dice)
> > +{
> > +	static const struct {
> > +		u32 model_id;
> > +		const struct dice_weiss_spec *spec;
> > +	} *entry, entries[] = {
> > +		{0x000007, &dac202},
> > +		{0x000008, &dac202}, // Maya edition: same audio I/O as DAC202.
> > +		{0x000006, &int202},
> > +		{0x00000a, &int203},
> > +		{0x00000b, &man301},
> > +		{0x000001, &adc2},
> > +		{0x000003, &dac2_minerva},
> > +		{0x000002, &vesta},
> > +		{0x000004, &afi1},
> > +	};
> > +	struct fw_csr_iterator it;
> > +	int key, val, model_id;
> > +	int i;
> > +
> > +	model_id = 0;
> > +	fw_csr_iterator_init(&it, dice->unit->directory);
> > +	while (fw_csr_iterator_next(&it, &key, &val)) {
> > +		if (key == CSR_MODEL) {
> > +			model_id = val;
> > +			break;
> > +		}
> > +	}
> > +
> > +	for (i = 0; i < ARRAY_SIZE(entries); ++i) {
> > +		entry = entries + i;
> > +		if (entry->model_id == model_id)
> > +			break;
> > +	}
> > +	if (i == ARRAY_SIZE(entries))
> > +		return -ENODEV;
> > +
> > +	memcpy(dice->tx_pcm_chs, entry->spec->tx_pcm_chs,
> > +	       MAX_STREAMS * SND_DICE_RATE_MODE_COUNT * sizeof(unsigned int));
> > +	memcpy(dice->rx_pcm_chs, entry->spec->rx_pcm_chs,
> > +	       MAX_STREAMS * SND_DICE_RATE_MODE_COUNT * sizeof(unsigned int));
> > +
> > +	return 0;
> > +}
> > diff --git a/sound/firewire/dice/dice.c b/sound/firewire/dice/dice.c
> > index 6c93e6e4982c..d362e4251c68 100644
> > --- a/sound/firewire/dice/dice.c
> > +++ b/sound/firewire/dice/dice.c
> > @@ -392,6 +392,69 @@ static const struct ieee1394_device_id dice_id_table[] = {
> >  		.model_id	= 0x0000de,
> >  		.driver_data	= (kernel_ulong_t)snd_dice_detect_focusrite_pro40_tcd3070_formats,
> >  	},
> > +	// Weiss DAC202: 192kHz 2-channel DAC
> > +	{
> > +		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
> > +		.vendor_id	= OUI_WEISS,
> > +		.model_id	= 0x000007,
> > +		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
> > +	},
> > +	// Weiss DAC202: 192kHz 2-channel DAC (Maya edition)
> > +	{
> > +		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
> > +		.vendor_id	= OUI_WEISS,
> > +		.model_id	= 0x000008,
> > +		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
> > +	},
> > +	// Weiss MAN301: 192kHz 2-channel music archive network player
> > +	{
> > +		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
> > +		.vendor_id	= OUI_WEISS,
> > +		.model_id	= 0x00000b,
> > +		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
> > +	},
> > +	// Weiss INT202: 192kHz unidirectional 2-channel digital Firewire face
> > +	{
> > +		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
> > +		.vendor_id	= OUI_WEISS,
> > +		.model_id	= 0x000006,
> > +		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
> > +	},
> > +	// Weiss INT203: 192kHz bidirectional 2-channel digital Firewire face
> > +	{
> > +		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
> > +		.vendor_id	= OUI_WEISS,
> > +		.model_id	= 0x00000a,
> > +		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
> > +	},
> > +	// Weiss ADC2: 192kHz A/D converter with microphone preamps and inputs
> > +	{
> > +		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
> > +		.vendor_id	= OUI_WEISS,
> > +		.model_id	= 0x000001,
> > +		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
> > +	},
> > +	// Weiss DAC2/Minerva: 192kHz 2-channel DAC
> > +	{
> > +		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
> > +		.vendor_id	= OUI_WEISS,
> > +		.model_id	= 0x000003,
> > +		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
> > +	},
> > +	// Weiss Vesta: 192kHz 2-channel Firewire to AES/EBU interface
> > +	{
> > +		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
> > +		.vendor_id	= OUI_WEISS,
> > +		.model_id	= 0x000002,
> > +		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
> > +	},
> > +	// Weiss AFI1: 192kHz 24-channel Firewire to ADAT or AES/EBU face
> > +	{
> > +		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
> > +		.vendor_id	= OUI_WEISS,
> > +		.model_id	= 0x000004,
> > +		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
> > +	},
> >  	{
> >  		.match_flags = IEEE1394_MATCH_VERSION,
> >  		.version     = DICE_INTERFACE,
> > diff --git a/sound/firewire/dice/dice.h b/sound/firewire/dice/dice.h
> > index 674f7d552c2e..4c0ad7335998 100644
> > --- a/sound/firewire/dice/dice.h
> > +++ b/sound/firewire/dice/dice.h
> > @@ -232,5 +232,6 @@ int snd_dice_detect_mytek_formats(struct snd_dice *dice);
> >  int snd_dice_detect_presonus_formats(struct snd_dice *dice);
> >  int snd_dice_detect_harman_formats(struct snd_dice *dice);
> >  int snd_dice_detect_focusrite_pro40_tcd3070_formats(struct snd_dice *dice);
> > +int snd_dice_detect_weiss_formats(struct snd_dice *dice);
> >  
> >  #endif
> > -- 
> > 2.39.2
> > 
