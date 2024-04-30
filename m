Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E568B767E
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 14:58:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EFF9741;
	Tue, 30 Apr 2024 14:58:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EFF9741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714481935;
	bh=/pU4Dib1WddZsF8ZFDt6j+ppcDi/xkpE/RQql4gGQyM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bxed+DcHMPYQkDA8EFqavvZ8BZRxJKknSExsiZGGXCOv6HvhoZtzyj7OXiZn1YVWO
	 EvBk3PcDYdp4kq492wlS4Xe4H8pVCwQNOwqN2r6emJE9YGu04wDfoKnBaSPXHwGQv/
	 2bdnOneYsLsI8O5DkO20alwoH/Az6IV56DmmTQSE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23532F80580; Tue, 30 Apr 2024 14:58:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 700D0F8057B;
	Tue, 30 Apr 2024 14:58:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2B7BF80266; Tue, 30 Apr 2024 14:58:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13D16F8023A
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 14:57:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13D16F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=jvNP0/Nn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=royZH4Cy;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=wIVQZ+UG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gy0UNDTG
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ED5C11F7D2;
	Tue, 30 Apr 2024 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714481879;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=28VGKmz8/G47Zscm7EVEjbZPA1AicPxrlrxWvx0shZA=;
	b=jvNP0/NnBiSa4qhTnN25wHJ1Xdg6+Z9TtVSX6OQdxSi6mb0pyRYoLEsKZ3ZGwI7YxU1jSH
	6HhMQxI3O9Q5g6NBsrdWLYd81NliaR0ez8oFDHML5Z+ZM+GUxGdsTXNbkRsBSZ2aw1lnPX
	xVGpyeY2kS5pYF/mwYdy7ryMn9j3XMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714481879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=28VGKmz8/G47Zscm7EVEjbZPA1AicPxrlrxWvx0shZA=;
	b=royZH4CyjV1vbwNc6U9uT59fWX0THAQRM10bKmxZi3GC3oxSY3+7xIdaeRTMQ1wND6lEHk
	c3/mqIT0AWqhSvBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714481878;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=28VGKmz8/G47Zscm7EVEjbZPA1AicPxrlrxWvx0shZA=;
	b=wIVQZ+UGElsUEtcRhegciyUl7y3HfUA9JZynBmMgGBF0XBnAkCklEQcDdOBSgdbztMekOP
	jRrYVfmHQ9qhzffDGnv88g1+czULLtiJnwscqK2FQQu+R/StuVdlSIGCqnc33oDTlJvSnd
	jFxPz/2HM5yXa1GfN0w4wQO+JKzSwGc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714481878;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=28VGKmz8/G47Zscm7EVEjbZPA1AicPxrlrxWvx0shZA=;
	b=gy0UNDTGR7KuO7MzcNkbvFWqEYWK5YuSPvd672UKGrbOU9hJ+64ZnkpxVBvahuIxswMJtC
	vAUIytv5/a788tDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B6203136A8;
	Tue, 30 Apr 2024 12:57:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jgboK9bqMGbrKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 30 Apr 2024 12:57:58 +0000
Date: Tue, 30 Apr 2024 14:58:10 +0200
Message-ID: <87jzkfm2hp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <robh+dt@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<pierre-louis.bossart@linux.intel.com>,
	<kevin-lu@ti.com>,
	<shenghao-ding@ti.com>,
	<navada@ti.com>,
	<13916275206@139.com>,
	<v-po@ti.com>,
	<niranjan.hy@ti.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<liam.r.girdwood@intel.com>,
	<yung-chuan.liao@linux.intel.com>,
	<broonie@kernel.org>,
	<soyer@irl.hu>
Subject: Re: [PATCH v4 1/3] ALSA: hda/tas2781: Add tas2781 hda driver based on
 SPI
In-Reply-To: <20240430072544.1877-2-baojun.xu@ti.com>
References: <20240430072544.1877-1-baojun.xu@ti.com>
	<20240430072544.1877-2-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com,perex.cz,ti.com,139.com,alsa-project.org,vger.kernel.org,intel.com,irl.hu];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
Message-ID-Hash: LOHEIAKGN4FRYZMNMELOUF45IY6DY2ZG
X-Message-ID-Hash: LOHEIAKGN4FRYZMNMELOUF45IY6DY2ZG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LOHEIAKGN4FRYZMNMELOUF45IY6DY2ZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Apr 2024 09:25:42 +0200,
Baojun Xu wrote:
> 
> Integrate tas2781 hda spi driver configs for HP (Varcolac).
> Every tas2781 SPI node was added by serial-multi-instantie.c as a SPI device.
> The code support Realtek as the primary codec.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> 
> ---
> v4:
>  - Add old hardware id "TIAS2781" for compatible with old production
>  - Add 2 devices in struct smi_node tas2781_hda, to compatible with 4 AMPs
> v3:
>  - Move HID up to above /* Non-conforming _HID ... */ in scan.c,
>    for avoid misunderstanding.
>  - Move HID up to above /* Non-conforming _HID ... */ in
>    serial-multi-instantiate.c, for avoid misunderstanding.
>  - Change objs to y for snd-hda-scodec-tas2781-spi- in Makefile.
> ---
>  drivers/acpi/scan.c                             |  2 ++
>  drivers/platform/x86/serial-multi-instantiate.c | 13 +++++++++++++
>  sound/pci/hda/Kconfig                           | 14 ++++++++++++++
>  sound/pci/hda/Makefile                          |  2 ++
>  sound/pci/hda/patch_realtek.c                   | 13 +++++++++++++
>  5 files changed, 44 insertions(+)
> 
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index d1464324de95..51af181ccf62 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1765,6 +1765,8 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>  		{"CSC3557", },
>  		{"INT33FE", },
>  		{"INT3515", },
> +		{"TXNW2781", },
> +		{"TIAS2781", },
>  		/* Non-conforming _HID for Cirrus Logic already released */
>  		{"CLSA0100", },
>  		{"CLSA0101", },
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 97b9c6392230..d1c766f17b26 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -368,6 +368,17 @@ static const struct smi_node cs35l57_hda = {
>  	.bus_type = SMI_AUTO_DETECT,
>  };
>  
> +static const struct smi_node tas2781_hda = {
> +	.instances = {
> +		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{}
> +	},
> +	.bus_type = SMI_AUTO_DETECT,
> +};
> +
>  /*
>   * Note new device-ids must also be added to ignore_serial_bus_ids in
>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
> @@ -380,6 +391,8 @@ static const struct acpi_device_id smi_acpi_ids[] = {
>  	{ "CSC3556", (unsigned long)&cs35l56_hda },
>  	{ "CSC3557", (unsigned long)&cs35l57_hda },
>  	{ "INT3515", (unsigned long)&int3515_data },
> +	{ "TXNW2781", (unsigned long)&tas2781_hda },
> +	{ "TIAS2781", (unsigned long)&tas2781_hda },
>  	/* Non-conforming _HID for Cirrus Logic already released */
>  	{ "CLSA0100", (unsigned long)&cs35l41_hda },
>  	{ "CLSA0101", (unsigned long)&cs35l41_hda },
> diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
> index f806636242ee..15f0e66b77e5 100644
> --- a/sound/pci/hda/Kconfig
> +++ b/sound/pci/hda/Kconfig
> @@ -202,6 +202,20 @@ config SND_HDA_SCODEC_TAS2781_I2C
>  comment "Set to Y if you want auto-loading the side codec driver"
>  	depends on SND_HDA=y && SND_HDA_SCODEC_TAS2781_I2C=m
>  
> +config SND_HDA_SCODEC_TAS2781_SPI
> +	tristate "Build TAS2781 HD-audio side codec support for SPI Bus"
> +	depends on SPI_MASTER
> +	depends on ACPI
> +	depends on EFI
> +	depends on SND_SOC
> +	select CRC32_SARWATE
> +	help
> +	  Say Y or M here to include TAS2781 SPI HD-audio side codec support
> +	  in snd-hda-intel driver, such as ALC287.
> +
> +comment "Set to Y if you want auto-loading the side codec driver"
> +	depends on SND_HDA=y && SND_HDA_SCODEC_TAS2781_SPI=m
> +
>  config SND_HDA_CODEC_REALTEK
>  	tristate "Build Realtek HD-audio codec support"
>  	select SND_HDA_GENERIC
> diff --git a/sound/pci/hda/Makefile b/sound/pci/hda/Makefile
> index 13e04e1f65de..2d5d4d841d87 100644
> --- a/sound/pci/hda/Makefile
> +++ b/sound/pci/hda/Makefile
> @@ -39,6 +39,7 @@ snd-hda-scodec-cs35l56-spi-objs :=	cs35l56_hda_spi.o
>  snd-hda-cs-dsp-ctls-objs :=		hda_cs_dsp_ctl.o
>  snd-hda-scodec-component-objs :=	hda_component.o
>  snd-hda-scodec-tas2781-i2c-objs :=	tas2781_hda_i2c.o
> +snd-hda-scodec-tas2781-spi-y :=	tas2781_hda_spi.o tas2781_spi_fwlib.o

A nitpicking: better to align with other lines (i.e. with *-objs
instead of *-y).

The main problem here is, though, that this commit will break the
build, because you introduced a Kconfig that can be enabled, while the
corresponding code for snd-hda-scodec-tas2781-spi isn't present yet.
This is bad for the git-bisection.

You'd need to reorganize better how the code is added piece-by-piece.


thanks,

Takashi
