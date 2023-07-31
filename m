Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9494768F2F
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 09:50:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 204CF823;
	Mon, 31 Jul 2023 09:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 204CF823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690789812;
	bh=MwYPtcN+ds25ndJQPVgfkeGPgXj8IGc6JaKTvV0dS0g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FDT5SKIC5t7P3QZVs6nsVtJjF5E7oWhGxNBhgrtKpryFoyXxOmjfvcf9itqEjP+D3
	 HOBWY/CExoy75bYasGe3p9Ya4tu6DpPrxpg05lX9Of2jsQFBd09pP8owxzFlF1Td4F
	 TwgnySaDr3Uafi8p8HL13pWJ6E798BJx3TUT+5FI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9398AF8016D; Mon, 31 Jul 2023 09:49:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FA07F80163;
	Mon, 31 Jul 2023 09:49:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7B4BF8016D; Mon, 31 Jul 2023 09:49:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1F0AF8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 09:48:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1F0AF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=LqCeOtVp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rQ0kmr9W
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 644821F460;
	Mon, 31 Jul 2023 07:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690789737;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HRb+iEVyNyN5bs1NAVsrke/3KjePmDp7FMxC2kJDGy0=;
	b=LqCeOtVpBwY1mFcCcfdNqT9AKJNRgsVG1Q9RhRWsjsINFRETefQqztpL39lrNwRtBwbUzH
	UcOMoV1OKMjdVdI9pii1HIK4Ptky4ZAZsbKsF3yNlsmGbck4gEhhEs2Ma5FklmDkqc2MiV
	grhjiUlOwnVoxYriTQBp4kXKmE0oTAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690789737;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HRb+iEVyNyN5bs1NAVsrke/3KjePmDp7FMxC2kJDGy0=;
	b=rQ0kmr9WQ7mFuVmPIMYQBEBQ75lPn12PZwvwygFI/CtSBwTVoQwaP7ZL3sg8RtPPuP0gQk
	SpmUPKosDcHfwADg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E8A67133F7;
	Mon, 31 Jul 2023 07:48:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id QGHMN2hnx2R3DAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 07:48:56 +0000
Date: Mon, 31 Jul 2023 09:48:55 +0200
Message-ID: <87v8e0bjx4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
Cc: <perex@perex.cz>,
	<tiwai@suse.com>,
	<pierre-louis.bossart@linux.intel.com>,
	<zhangyiqun@phytium.com.cn>,
	<peter.ujfalusi@linux.intel.com>,
	<broonie@kernel.org>,
	<chenhuacai@kernel.org>,
	<cezary.rojewski@intel.com>,
	<siyanteng@loongson.cn>,
	<amadeuszx.slawinski@linux.intel.com>,
	<evan.quan@amd.com>,
	<jasontao@glenfly.com>,
	<kai.vehmanen@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>,
	<mkumard@nvidia.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<CobeChen@zhaoxin.com>,
	<TimGuo@zhaoxin.com>,
	<LeoLiu-oc@zhaoxin.com>
Subject: Re: [PATCH] ALSA: hda: Zhaoxin: Add HDAC PCI IDs and HDMI Codec
 Vendor IDs
In-Reply-To: <20230731055932.4336-1-TonyWWang-oc@zhaoxin.com>
References: <20230731055932.4336-1-TonyWWang-oc@zhaoxin.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: TZAZGRAUEBZWNRWCWLOA6BES7IBEOZJS
X-Message-ID-Hash: TZAZGRAUEBZWNRWCWLOA6BES7IBEOZJS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZAZGRAUEBZWNRWCWLOA6BES7IBEOZJS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 31 Jul 2023 07:59:32 +0200,
Tony W Wang-oc wrote:
> @@ -1044,6 +1044,16 @@ void azx_stop_chip(struct azx *chip)
>  }
>  EXPORT_SYMBOL_GPL(azx_stop_chip);
>  
> +static void azx_rirb_zxdelay(struct azx *chip, int enable)

It'd be helpful to have a brief function description.  It doesn't do
any delaying but flip something instead, right?

> +{
> +	if (chip->remap_diu_addr) {
> +		if (!enable)
> +			writel(0x0, (char *)chip->remap_diu_addr + 0x490a8);
> +		else
> +			writel(0x1000000, (char *)chip->remap_diu_addr + 0x490a8);

Avoid magic numbers, but define them.

> @@ -1103,9 +1113,14 @@ irqreturn_t azx_interrupt(int irq, void *dev_id)
>  			azx_writeb(chip, RIRBSTS, RIRB_INT_MASK);
>  			active = true;
>  			if (status & RIRB_INT_RESPONSE) {
> -				if (chip->driver_caps & AZX_DCAPS_CTX_WORKAROUND)
> +				if ((chip->driver_caps & AZX_DCAPS_CTX_WORKAROUND) ||
> +					(chip->driver_caps & AZX_DCAPS_RIRB_PRE_DELAY)) {
> +					azx_rirb_zxdelay(chip, 1);
>  					udelay(80);

Calling it here looks a bit misleading, especially because it's paired
with a later call.  Better to put another if block that matches with
both calls consistently.

> +				}
>  				snd_hdac_bus_update_rirb(bus);
> +				if (chip->driver_caps & AZX_DCAPS_RIRB_PRE_DELAY)
> +					azx_rirb_zxdelay(chip, 0);

I meant this one.

> @@ -145,6 +146,7 @@ struct azx {
>  
>  	/* GTS present */
>  	unsigned int gts_present:1;
> +	void __iomem *remap_diu_addr;

This is a completely different thing, give some comment.


> +static int azx_init_pci_zx(struct azx *chip)
> +{
> +	struct snd_card *card = chip->card;
> +	unsigned int diu_reg;
> +	struct pci_dev *diu_pci = NULL;
> +
> +	diu_pci = pci_get_device(PCI_VENDOR_ID_ZHAOXIN, 0x3a03, NULL);
> +	if (!diu_pci) {
> +		dev_err(card->dev, "hda no KX-5000 device.\n");
> +		return -ENXIO;
> +	}
> +	pci_read_config_dword(diu_pci, PCI_BASE_ADDRESS_0, &diu_reg);
> +	chip->remap_diu_addr = ioremap(diu_reg, 0x50000);
> +	dev_info(card->dev, "hda %x %p\n", diu_reg, chip->remap_diu_addr);
> +	return 0;

Missing pci_dev_put()?

> @@ -1360,6 +1385,10 @@ static void azx_free(struct azx *chip)
>  	hda->init_failed = 1; /* to be sure */
>  	complete_all(&hda->probe_wait);
>  
> +	if (chip->driver_type == AZX_DRIVER_ZHAOXINHDMI) {
> +		azx_free_pci_zx(chip);
> +	}

Superfluous parentheses.

> @@ -1876,6 +1906,10 @@ static int azx_first_init(struct azx *chip)
>  		bus->access_sdnctl_in_dword = 1;
>  	}
>  
> +	chip->remap_diu_addr = NULL;
> +	if (chip->driver_type == AZX_DRIVER_ZHAOXINHDMI)
> +		azx_init_pci_zx(chip);

No error check?  It doesn't look too serious even if the driver
continues to load, though.

> --- a/sound/pci/hda/patch_hdmi.c
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -4501,6 +4501,8 @@ static int patch_gf_hdmi(struct hda_codec *codec)
>  	return 0;
>  }
>  
> +static int patch_zx_hdmi(struct hda_codec *codec) { return patch_gf_hdmi(codec); }

Don't put in a single line.
Or, if it's the very same function, you can rather call patch_gf_hdmi
directly in the table.


thanks,

Takashi
