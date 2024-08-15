Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E64A2952B13
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 11:11:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1382A211E;
	Thu, 15 Aug 2024 11:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1382A211E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723713110;
	bh=LV56AJxudgL24toWGOMCu5drTkNEj0f0SOc/cSvQqwM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tE2xdcwrWTo2+iJ+ODQD7gssGzxxz0qjLTVVMEQSxEoZLGCe/5XDNGFKUwWiPrYAZ
	 XM7lmk830Npuvx5FHu6waH+y/n6g/eUTl7qZbl6K4WSlN7p5QmQW+2AbgoA8AZ3f/o
	 w5jq5KOtrfnET3i4SdYwrc3Cfyztf1RIUlfaPC6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D542F805AD; Thu, 15 Aug 2024 11:11:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B8D9F80580;
	Thu, 15 Aug 2024 11:11:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A371F80423; Thu, 15 Aug 2024 11:10:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1F9EF800BF
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 11:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1F9EF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OP+WoPF2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Vh7gBJs/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=OP+WoPF2;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Vh7gBJs/
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A13241FFDC;
	Thu, 15 Aug 2024 09:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723712898;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zvV7rDnQuEkYG7+I3UuDsGSUYF02JhMNqD6FrhNzFJQ=;
	b=OP+WoPF2t8co2G1jmoZ5DiN3lmNr9pwbVCTU2NK/+sTqDJssXV+ZIPPsBzDCHh5NxwfhqO
	uizENqkSwn4RGwhhnGWVVq/6fq49Jav4opWuHbPKpSnUjZ7v7MV60guy1av9Kwq+51Xklp
	DramEnYQp3MXO6/KWR5wTXkwXK9RI58=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723712898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zvV7rDnQuEkYG7+I3UuDsGSUYF02JhMNqD6FrhNzFJQ=;
	b=Vh7gBJs/wwFxKvsQwwa/PsrZ8pmArsKMrXmI76kFBn3vUKTvFg0Qhxe4KoGYwLsbDL1vb2
	p0NZaqOrvIcYD7Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723712898;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zvV7rDnQuEkYG7+I3UuDsGSUYF02JhMNqD6FrhNzFJQ=;
	b=OP+WoPF2t8co2G1jmoZ5DiN3lmNr9pwbVCTU2NK/+sTqDJssXV+ZIPPsBzDCHh5NxwfhqO
	uizENqkSwn4RGwhhnGWVVq/6fq49Jav4opWuHbPKpSnUjZ7v7MV60guy1av9Kwq+51Xklp
	DramEnYQp3MXO6/KWR5wTXkwXK9RI58=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723712898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zvV7rDnQuEkYG7+I3UuDsGSUYF02JhMNqD6FrhNzFJQ=;
	b=Vh7gBJs/wwFxKvsQwwa/PsrZ8pmArsKMrXmI76kFBn3vUKTvFg0Qhxe4KoGYwLsbDL1vb2
	p0NZaqOrvIcYD7Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DCE613983;
	Thu, 15 Aug 2024 09:08:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4K8IBoLFvWYIDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Aug 2024 09:08:18 +0000
Date: Thu, 15 Aug 2024 11:08:58 +0200
Message-ID: <87ikw25f11.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
    Hans de Goede <hdegoede@redhat.com>,
    <robh+dt@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<pierre-louis.bossart@linux.intel.com>,
	<kevin-lu@ti.com>,
	<shenghao-ding@ti.com>,
	<navada@ti.com>,
	<13916275206@139.com>,
	<v-hampiholi@ti.com>,
	<v-po@ti.com>,
	<niranjan.hy@ti.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<liam.r.girdwood@intel.com>,
	<yung-chuan.liao@linux.intel.com>,
	<broonie@kernel.org>,
	<soyer@irl.hu>
Subject: Re: [PATCH v11] ALSA: hda/tas2781: Add tas2781 hda SPI driver
In-Reply-To: <20240727085048.1092-1-baojun.xu@ti.com>
References: <20240727085048.1092-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,linux.intel.com,gmail.com,perex.cz,ti.com,139.com,alsa-project.org,vger.kernel.org,intel.com,irl.hu];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: ZDYG6XL4VHWMJH5EXQ23TGPDQ6UOIGJB
X-Message-ID-Hash: ZDYG6XL4VHWMJH5EXQ23TGPDQ6UOIGJB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZDYG6XL4VHWMJH5EXQ23TGPDQ6UOIGJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 27 Jul 2024 10:50:48 +0200,
Baojun Xu wrote:
> 
> This patch was used to add TAS2781 devices on SPI support in sound/pci/hda.
> It use ACPI node descript about parameters of TAS2781 on SPI, it like:
>     Scope (_SB.PC00.SPI0)
>     {
>         Device (GSPK)
>         {
>             Name (_HID, "TXNW2781")  // _HID: Hardware ID
>             Method (_CRS, 0, NotSerialized)
>             {
>                 Name (RBUF, ResourceTemplate ()
>                 {
>                     SpiSerialBusV2 (...)
>                     SpiSerialBusV2 (...)
>                 }
>             }
>         }
>     }
> 
> And in platform/x86/serial-multi-instantiate.c, those spi devices will be
> added into system as a single SPI device, so TAS2781 SPI driver will
> probe twice for every single SPI device. And driver will also parser
> mono DSP firmware binary and RCA binary for itself.
> The code support Realtek as the primary codec.
> In patch version-10, add multi devices firmware binary support,
> to compatble with windows driver, they can share same firmware binary.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> 
> ---
> v11:

Now it's v11, and I'd love to move this forward finally, instead of
hanging forever.

The HD-audio part looks more or less OK, but I'd need acks for the
ACPI and serial-multi-instance parts below.

Put ACPI and serial-multi-instance maintainers to Cc.
Rafael, Hans, let me know if that looks OK to take.

The original patch is found at
https://lore.kernel.org/20240727085048.1092-1-baojun.xu@ti.com

> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1769,6 +1769,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>  		{"CSC3557", },
>  		{"INT33FE", },
>  		{"INT3515", },
> +		{"TXNW2781", },
>  		/* Non-conforming _HID for Cirrus Logic already released */
>  		{"CLSA0100", },
>  		{"CLSA0101", },
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 3be016cfe601..b15c819023d0 100644
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
> @@ -380,6 +391,7 @@ static const struct acpi_device_id smi_acpi_ids[] = {
>  	{ "CSC3556", (unsigned long)&cs35l56_hda },
>  	{ "CSC3557", (unsigned long)&cs35l57_hda },
>  	{ "INT3515", (unsigned long)&int3515_data },
> +	{ "TXNW2781", (unsigned long)&tas2781_hda },
>  	/* Non-conforming _HID for Cirrus Logic already released */
>  	{ "CLSA0100", (unsigned long)&cs35l41_hda },
>  	{ "CLSA0101", (unsigned long)&cs35l41_hda },


thanks,

Takashi
