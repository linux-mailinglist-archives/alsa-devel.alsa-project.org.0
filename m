Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D345812E1D
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 12:06:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40F72AEA;
	Thu, 14 Dec 2023 12:06:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40F72AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702552013;
	bh=zrqkafiHONgxn0z1O6jgua3ne8+UtNxmiMVU70g+8BE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F/2ZrAn5bFC3SHzEiDjFJ/ABbHyjRBugj2p5kJCTphNQCcnuewA3ghYzY8TovCPF/
	 blePPtRI1PVjfP3bX6Ae1LFT015H9/MVlWUX6VeTq2pFlar+PRki9rBjGobThlffLP
	 2G6lGztGd+zJVGAqeNpbOptFyRx7kreG5ZAIqhx0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD66FF80124; Thu, 14 Dec 2023 12:06:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19685F80579;
	Thu, 14 Dec 2023 12:06:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0975F8016A; Thu, 14 Dec 2023 12:03:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3CBEF8001F
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 12:03:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3CBEF8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=DkFwTiB/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vZZ/CcA4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Xl+0ARMS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LKlFm42W
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 29243220A1;
	Thu, 14 Dec 2023 11:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702551780;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yLX0zWLQjJXwutevBe3jiLxXnEsG/QKzwGJR5yjOdc8=;
	b=DkFwTiB/OJ4a8hIZOPMOVfLztYJhwaTUNbhIgxWl+ULc3qZyFTIM1BryBqHYJB9tkky7hZ
	o2umm5cfLTRG3pHfzgPHIz+nBLGLQ05zJ79cTxzx8ma4MIHyHwA+FG9fy/CyCfOnVYiPMt
	9G7Zfl/R1796Fl45WULwEPiKOXhpylg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702551780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yLX0zWLQjJXwutevBe3jiLxXnEsG/QKzwGJR5yjOdc8=;
	b=vZZ/CcA4RvHFogtMsN23SEA9CX2EYTr+u78SmcxVo29Ldt2wSIZqsya5f8PckHW5r02QTj
	sBTCBYnD5YW2F+AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702551779;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yLX0zWLQjJXwutevBe3jiLxXnEsG/QKzwGJR5yjOdc8=;
	b=Xl+0ARMSYReu2w0/JAdwZwClAf6cUPmwe3izDedpGDjRTOhTnmElf1gXPqA01+DmE+P7ze
	INAUz6uGm2W5suJV5caR2c0firEMzVVwzLUXEAnAE4wgvYXKt24r7AHeJ2sB+3tQ1htEbC
	XyXvdRQQmuOjooEtTnrGOksyyLgBRjI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702551779;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yLX0zWLQjJXwutevBe3jiLxXnEsG/QKzwGJR5yjOdc8=;
	b=LKlFm42W6vPSg88nuSGyJls9BGAzyqqjhdt2fWpS/GqjGaQdDGzXi9KSbUAfvARhlEFx6b
	BwaBIjCeoG/ZldBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BEF70137E8;
	Thu, 14 Dec 2023 11:02:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0xiCLOLgemWZZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 14 Dec 2023 11:02:58 +0000
Date: Thu, 14 Dec 2023 12:02:58 +0100
Message-ID: <87fs05qc65.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: patches@opensource.cirrus.com
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
    perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Jasper Smet <josbeir@gmail.com>
Subject: Re: [PATCH 1/1] ALSA: hda: cs35l41: Dell Fiorano add missing _DSD
 properties
In-Reply-To: <20231212195243.10666-1-alex.vinarskis@gmail.com>
References: <20231212195243.10666-1-alex.vinarskis@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 29243220A1
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Xl+0ARMS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LKlFm42W;
	dmarc=pass (policy=none) header.from=suse.de;
	spf=softfail (smtp-out1.suse.de: 2a07:de40:b281:104:10:150:64:97 is neither
 permitted nor denied by domain of tiwai@suse.de) smtp.mailfrom=tiwai@suse.de
X-Spamd-Result: default: False [-10.31 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_SPF_SOFTFAIL(0.00)[~all:c];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 DMARC_POLICY_ALLOW(0.00)[suse.de,none];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MX_GOOD(-0.01)[];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 WHITELIST_DMARC(-7.00)[suse.de:D:+];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,opensource.cirrus.com,cirrus.com,alsa-project.org,vger.kernel.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: CCGXXLVV4QZY4FXMLTR2N4TXHOIX5CFH
X-Message-ID-Hash: CCGXXLVV4QZY4FXMLTR2N4TXHOIX5CFH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCGXXLVV4QZY4FXMLTR2N4TXHOIX5CFH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 12 Dec 2023 20:52:43 +0100,
Aleksandrs Vinarskis wrote:
> 
> Dell XPS 9530 (2023) has two SPI connected CS35L41 amplifiers, however
> is missing _DSD properties, cs-gpios and has a firmware bug which caps SPI
> controller's speed to unusable 3051Hz. This patch adds _DSD properties and
> sets second cs-gpio. In case SPI speed bug is detected, it will not
> initialize the device to avoid hangs on wake up.
> 
> Resolution of SPI speed bug requires either a patch to `intel-lpss.c` or an
> UEFI update with corrected values from Dell. Tested with locally applied
> patch to `intel-lpss` on multiple XPS 9530 devices.
> 
> Co-developed-by: Jasper Smet <josbeir@gmail.com>
> Signed-off-by: Jasper Smet <josbeir@gmail.com>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

Can Cirrus team review this?


thanks,

Takashi

> ---
>  sound/pci/hda/cs35l41_hda_property.c | 47 ++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
> index c83328971728..69446a794397 100644
> --- a/sound/pci/hda/cs35l41_hda_property.c
> +++ b/sound/pci/hda/cs35l41_hda_property.c
> @@ -7,9 +7,55 @@
>  // Author: Stefan Binding <sbinding@opensource.cirrus.com>
>  
>  #include <linux/gpio/consumer.h>
> +#include <linux/spi/spi.h>
>  #include <linux/string.h>
>  #include "cs35l41_hda_property.h"
>  
> +/*
> + * Device 10280BEB (Dell XPS 9530) doesn't have _DSD at all. Moreover, pin that is typically
> + * used for `speaker_id` is missing. SPI's cs-gpios definitions are also missing.
> + */
> +static int dell_fiorano_no_acpi(struct cs35l41_hda *cs35l41, struct device *physdev, int id,
> +				const char *hid)
> +{
> +	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
> +	struct spi_device *spi = to_spi_device(cs35l41->dev);
> +
> +	/*
> +	 * 10280BEB has a firmware bug, which wrongly enables clock divider for intel-lpss
> +	 * Resultant SPI clock is 100Mhz/32767=3051Hz, which leads to ~3 minute hang on boot/wake up
> +	 * Avoid initializing device if lpss was not patched/fixed UEFI was not installed
> +	 */
> +	if (spi->max_speed_hz < CS35L41_SPI_MAX_FREQ) {
> +		dev_err(cs35l41->dev, "SPI's max_speed_hz is capped at %u Hz, will not continue to avoid hanging\n",
> +			spi->max_speed_hz);
> +		return -EINVAL;
> +	}
> +
> +	dev_info(cs35l41->dev, "Adding DSD properties for %s\n", cs35l41->acpi_subsystem_id);
> +
> +	/* check SPI address to assign the index */
> +	cs35l41->index = id;
> +	cs35l41->channel_index = 0;
> +	/* 10280BEB is missing pin which is typically assigned to `spk-id-gpios` */
> +	cs35l41->speaker_id = cs35l41_get_speaker_id(physdev, cs35l41->index, 2, -1);
> +	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 1, GPIOD_OUT_LOW);
> +
> +	hw_cfg->spk_pos = cs35l41->index  ? 1 : 0;	// 0th L, 1st R
> +	hw_cfg->bst_type = CS35L41_EXT_BOOST;
> +	hw_cfg->gpio1.func = CS35l41_VSPK_SWITCH;
> +	hw_cfg->gpio1.valid = true;
> +	hw_cfg->gpio2.func = CS35L41_INTERRUPT;
> +	hw_cfg->gpio2.valid = true;
> +	hw_cfg->valid = true;
> +
> +	/* Add second cs-gpio here */
> +	if (cs35l41->index)
> +		spi->cs_gpiod = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
> +
> +	return 0;
> +}
> +
>  /*
>   * Device CLSA010(0/1) doesn't have _DSD so a gpiod_get by the label reset won't work.
>   * And devices created by serial-multi-instantiate don't have their device struct
> @@ -92,6 +138,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
>  	{ "CLSA0100", NULL, lenovo_legion_no_acpi },
>  	{ "CLSA0101", NULL, lenovo_legion_no_acpi },
>  	{ "CSC3551", "103C89C6", hp_vision_acpi_fix },
> +	{ "CSC3551", "10280BEB", dell_fiorano_no_acpi },
>  	{}
>  };
>  
> -- 
> 2.40.1
> 
