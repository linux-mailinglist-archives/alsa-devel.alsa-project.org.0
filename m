Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8539813536
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 16:49:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44C97A4E;
	Thu, 14 Dec 2023 16:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44C97A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702568999;
	bh=qwvmJY0CfZ9IyRpisiNP2mZVP0z9aWxyX/RJRPUVOCc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vMVMGIlIeOBOPqof19EfJoq1Su4cS1PLyC3fqirPpPPXD6WBUzGpJL/IWykhdjxAm
	 N9gzd3ji4V7gVIDATr+c1768rtx7ivn3RU7xZUqsgWV9q5+iBNII2xxOtXXN0COZ1A
	 sNcS5epMvvMJNz3EeaB6r2X5V+RQ8okUAa/0T16o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB557F8055B; Thu, 14 Dec 2023 16:49:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BAD7F80578;
	Thu, 14 Dec 2023 16:49:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23494F8016A; Thu, 14 Dec 2023 16:49:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78B78F80124
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 16:49:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78B78F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qr1Ltxub;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+2Z+yL0g;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=qr1Ltxub;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+2Z+yL0g
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BF0ED1F7E7;
	Thu, 14 Dec 2023 15:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702568964;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/CEiGWCi1g7g+h1tAHfpsnpW1o246nmIQDhKp0mLrc=;
	b=qr1LtxubksYct9TqfVgEQfq1HO3jjJx82Ep3T9zjL3+kwE4rJ1JkDN5Bq/PQRD1A40GLtr
	Vb+wM7MehScu76bQJp7AqPSl5cqG1FWBIV68nWmD7Tn67yqfN/XbGdkuXTJx9+5994t0RJ
	cDJJYS40W3C8WXdFiDAqd2F0iQHXhkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702568964;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/CEiGWCi1g7g+h1tAHfpsnpW1o246nmIQDhKp0mLrc=;
	b=+2Z+yL0gD0ubCg4AboFSEC3T9YhJoU9w4QIeB6LyUbMfSLasnuLO2rJgs3vvVYwR/OtO22
	bcPnRPCItT7U2tAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702568964;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/CEiGWCi1g7g+h1tAHfpsnpW1o246nmIQDhKp0mLrc=;
	b=qr1LtxubksYct9TqfVgEQfq1HO3jjJx82Ep3T9zjL3+kwE4rJ1JkDN5Bq/PQRD1A40GLtr
	Vb+wM7MehScu76bQJp7AqPSl5cqG1FWBIV68nWmD7Tn67yqfN/XbGdkuXTJx9+5994t0RJ
	cDJJYS40W3C8WXdFiDAqd2F0iQHXhkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702568964;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/CEiGWCi1g7g+h1tAHfpsnpW1o246nmIQDhKp0mLrc=;
	b=+2Z+yL0gD0ubCg4AboFSEC3T9YhJoU9w4QIeB6LyUbMfSLasnuLO2rJgs3vvVYwR/OtO22
	bcPnRPCItT7U2tAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A3CE1379A;
	Thu, 14 Dec 2023 15:49:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sMGwAAQke2V+PQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 14 Dec 2023 15:49:24 +0000
Date: Thu, 14 Dec 2023 16:49:23 +0100
Message-ID: <87ttokpyws.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stuart Henderson <stuarth@opensource.cirrus.com>
Cc: <patches@opensource.cirrus.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	<perex@perex.cz>,
	<tiwai@suse.com>,
	<sbinding@opensource.cirrus.com>,
	<james.schulman@cirrus.com>,
	<david.rhodes@cirrus.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	Jasper Smet
	<josbeir@gmail.com>
Subject: Re: [PATCH 1/1] ALSA: hda: cs35l41: Dell Fiorano add missing _DSD
 properties
In-Reply-To: <d98a3157-6e58-4dd9-a35a-759bcdcbe0c9@opensource.cirrus.com>
References: <20231212195243.10666-1-alex.vinarskis@gmail.com>
	<87fs05qc65.wl-tiwai@suse.de>
	<d98a3157-6e58-4dd9-a35a-759bcdcbe0c9@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-1.80 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[opensource.cirrus.com,gmail.com,perex.cz,suse.com,cirrus.com,alsa-project.org,vger.kernel.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
Message-ID-Hash: DAG2RWVM5LKVVYQZJ35DECO6LYLUWGSE
X-Message-ID-Hash: DAG2RWVM5LKVVYQZJ35DECO6LYLUWGSE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DAG2RWVM5LKVVYQZJ35DECO6LYLUWGSE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 14 Dec 2023 16:39:58 +0100,
Stuart Henderson wrote:
> 
> 
> On 14/12/2023 11:02, Takashi Iwai wrote:
> > On Tue, 12 Dec 2023 20:52:43 +0100,
> > Aleksandrs Vinarskis wrote:
> >> Dell XPS 9530 (2023) has two SPI connected CS35L41 amplifiers, however
> >> is missing _DSD properties, cs-gpios and has a firmware bug which caps SPI
> >> controller's speed to unusable 3051Hz. This patch adds _DSD properties and
> >> sets second cs-gpio. In case SPI speed bug is detected, it will not
> >> initialize the device to avoid hangs on wake up.
> >> 
> >> Resolution of SPI speed bug requires either a patch to `intel-lpss.c` or an
> >> UEFI update with corrected values from Dell. Tested with locally applied
> >> patch to `intel-lpss` on multiple XPS 9530 devices.
> >> 
> >> Co-developed-by: Jasper Smet <josbeir@gmail.com>
> >> Signed-off-by: Jasper Smet <josbeir@gmail.com>
> >> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > Can Cirrus team review this?
> > 
> > 
> > thanks,
> > 
> > Takashi
> 
> The patch looks sensible, with some minor comments below, however
> we're just at the tail end of testing a patch chain that genericises a
> lot of this code and adds support for a rather large batch of other
> laptops with incomplete DSD.  We're hoping to push this upstream on
> Monday.
> 
> Can I be awkward and ask that we hold off on this patch chain until
> then?  Then we can add this laptop using the new approach.
> 
> If/when the chain is accepted, we will add support for a few Dell
> laptops as well, including this one.

It's fine to wait for a while for me.
Hopefully we can make it in 6.7, and we can catch up in the next
week.

(BTW, I'll be off from the next Tuesday, and the reply will be
delayed, but I can eventually check and merge patches remotely :)

> >> ---
> >>   sound/pci/hda/cs35l41_hda_property.c | 47 ++++++++++++++++++++++++++++
> >>   1 file changed, 47 insertions(+)
> >> 
> >> diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
> >> index c83328971728..69446a794397 100644
> >> --- a/sound/pci/hda/cs35l41_hda_property.c
> >> +++ b/sound/pci/hda/cs35l41_hda_property.c
> >> @@ -7,9 +7,55 @@
> >>   // Author: Stefan Binding <sbinding@opensource.cirrus.com>
> >>     #include <linux/gpio/consumer.h>
> >> +#include <linux/spi/spi.h>
> >>   #include <linux/string.h>
> >>   #include "cs35l41_hda_property.h"
> >>   +/*
> >> + * Device 10280BEB (Dell XPS 9530) doesn't have _DSD at all. Moreover, pin that is typically
> >> + * used for `speaker_id` is missing. SPI's cs-gpios definitions are also missing.
> >> + */
> >> +static int dell_fiorano_no_acpi(struct cs35l41_hda *cs35l41, struct device *physdev, int id,
> >> +				const char *hid)
> >> +{
> >> +	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
> >> +	struct spi_device *spi = to_spi_device(cs35l41->dev);
> >> +
> >> +	/*
> >> +	 * 10280BEB has a firmware bug, which wrongly enables clock divider for intel-lpss
> >> +	 * Resultant SPI clock is 100Mhz/32767=3051Hz, which leads to ~3 minute hang on boot/wake up
> >> +	 * Avoid initializing device if lpss was not patched/fixed UEFI was not installed
> >> +	 */
> >> +	if (spi->max_speed_hz < CS35L41_SPI_MAX_FREQ) {
> >> +		dev_err(cs35l41->dev, "SPI's max_speed_hz is capped at %u Hz, will not continue to avoid hanging\n",
> >> +			spi->max_speed_hz);
> >> +		return -EINVAL;
> >> +	}
> 
> Instead of erroring out, I wonder if we can noodle our way to the
> appropriate clk and clk_set_rate it up to 4MHz for this particular
> laptop only?  Stefan's taking a look at that.
> 
> Also, any SPI rate >~100k is probably just about usable, so we don't
> want to error on <4MHz.  Quite often the spi clock is set at some
> value just below 4MHz.  It's unclear if this is going to get fixed in
> the BIOS at this point, so we don't know what exact rate we'd
> eventually receive.

I suppose the error-out was due to safety reasons, but the clock
adjustment works, it should be fine.  Let's see.

> >> +
> >> +	dev_info(cs35l41->dev, "Adding DSD properties for %s\n", cs35l41->acpi_subsystem_id);
> >> +
> >> +	/* check SPI address to assign the index */
> >> +	cs35l41->index = id;
> >> +	cs35l41->channel_index = 0;
> >> +	/* 10280BEB is missing pin which is typically assigned to `spk-id-gpios` */
> >> +	cs35l41->speaker_id = cs35l41_get_speaker_id(physdev, cs35l41->index, 2, -1);
> >> +	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 1, GPIOD_OUT_LOW);
> >> +
> >> +	hw_cfg->spk_pos = cs35l41->index  ? 1 : 0;	// 0th L, 1st R
> >> +	hw_cfg->bst_type = CS35L41_EXT_BOOST;
> >> +	hw_cfg->gpio1.func = CS35l41_VSPK_SWITCH;
> >> +	hw_cfg->gpio1.valid = true;
> >> +	hw_cfg->gpio2.func = CS35L41_INTERRUPT;
> >> +	hw_cfg->gpio2.valid = true;
> >> +	hw_cfg->valid = true;
> >> +
> >> +	/* Add second cs-gpio here */
> >> +	if (cs35l41->index)
> >> +		spi->cs_gpiod = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
> This will break once you pick up AMD's multi-cs patches, we should use
> spi_set_csgpiod instead.

Thanks, good to know.

I'm looking forward to your revised patches :)


Takashi
