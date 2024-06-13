Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41834907171
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 14:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 746A8DEE;
	Thu, 13 Jun 2024 14:36:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 746A8DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718282223;
	bh=sFnumGq0FcH5zMjWPpjF2N6XyYSbcjK42uJL+OPfYEE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cKTjfQzekMIkXhcFNxXEsAapYDdmm9O654n+o8QDzE3dj3KyxFMhBrvgAguNLz0sw
	 yDoE8PFk6bD/gfG++ilEfTqKWaoRw04Pcn+TskuXcMSyO3Rwc3FVKfoiF8IKQQ3Opj
	 iiFE8OC+6GDWcUpBwwh0bXOsiRJWssE7QMVVcoNE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41EC3F805A9; Thu, 13 Jun 2024 14:36:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7078EF805B0;
	Thu, 13 Jun 2024 14:36:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B74CF8057A; Thu, 13 Jun 2024 14:36:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6804EF80578
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 14:36:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6804EF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=fq/BtvHX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kNhNRnGy;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=PrPVfGbD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=q2LD2wmz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 887D63716C;
	Thu, 13 Jun 2024 12:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718282171;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8U3dMXngmkBtVM3jPXHQhakytYCFzeNC5q9L/Q2hlTk=;
	b=fq/BtvHXeWeaW2fBbFu1piuFVL91QUYziFWuovljmLtXSM1wARITzV4v5hAb3p0T9GtdMu
	cbeOVfgawaLNfVttoQI/+NSIR3ESDe4Zr4WaTvl4Zsk9gB1tgIixMksoN+cdWio4EOD5Ss
	8PsDmEoThwxFs3MzuYYqObfUyyslZeo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718282171;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8U3dMXngmkBtVM3jPXHQhakytYCFzeNC5q9L/Q2hlTk=;
	b=kNhNRnGy30F54VQ3nBLBAzWP4P8m/vJBknWX6qm4tTHBcbwR6NZ0WViLKejL8prK8uH2zG
	iMu6+AlwXmqKuwCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718282170;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8U3dMXngmkBtVM3jPXHQhakytYCFzeNC5q9L/Q2hlTk=;
	b=PrPVfGbD05wbWXCgHVx7uzlNJQzPaR7ERYV5ZDP7KSmFm8k3hUBNWCNXT9eM7/9bN0OiDX
	W/gcnCYXMDxEZ9YT8hRcrb2ujpU5MyfYQLNnudMkt6lOsQrvbzU8uw/00K/hk+z9ccsmSr
	kurw9B1+M+Ft3LaoVA5YM1srJzjAJjc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718282170;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8U3dMXngmkBtVM3jPXHQhakytYCFzeNC5q9L/Q2hlTk=;
	b=q2LD2wmz1GNmgPoLxza3WPYPcaD+ta5OXdqDbnEG2wYT7MxmmLATMHRZE24PmTm0OVQ/Fb
	rRY/4DC77Eb4DVBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 16B2E13A7F;
	Thu, 13 Jun 2024 12:36:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LbD0A7rnamaQKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Jun 2024 12:36:10 +0000
Date: Thu, 13 Jun 2024 14:36:33 +0200
Message-ID: <875xudnhny.wl-tiwai@suse.de>
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
	<v-hampiholi@ti.com>,
	<v-po@ti.com>,
	<niranjan.hy@ti.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<liam.r.girdwood@intel.com>,
	<yung-chuan.liao@linux.intel.com>,
	<broonie@kernel.org>,
	<soyer@irl.hu>
Subject: Re: [PATCH v7 1/1] ALSA: hda/tas2781: Add tas2781 hda driver based on
 SPI
In-Reply-To: <20240613082633.388-2-baojun.xu@ti.com>
References: <20240613082633.388-1-baojun.xu@ti.com>
	<20240613082633.388-2-baojun.xu@ti.com>
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
	RCPT_COUNT_TWELVE(0.00)[19];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: QQ3TSV3LMAYDLEUJMNZZPSD4A5N54K2J
X-Message-ID-Hash: QQ3TSV3LMAYDLEUJMNZZPSD4A5N54K2J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQ3TSV3LMAYDLEUJMNZZPSD4A5N54K2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jun 2024 10:26:33 +0200,
Baojun Xu wrote:
> --- a/sound/pci/hda/Makefile
> +++ b/sound/pci/hda/Makefile
> @@ -70,6 +70,8 @@ obj-$(CONFIG_SND_HDA_SCODEC_CS35L56_SPI) += snd-hda-scodec-cs35l56-spi.o
>  obj-$(CONFIG_SND_HDA_CS_DSP_CONTROLS) += snd-hda-cs-dsp-ctls.o
>  obj-$(CONFIG_SND_HDA_SCODEC_COMPONENT) += snd-hda-scodec-component.o
>  obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_I2C) += snd-hda-scodec-tas2781-i2c.o
> +obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_SPI) += snd-hda-scodec-tas2781-spi.o
> +snd-hda-scodec-tas2781-spi-y :=	tas2781_hda_spi.o tas2781_spi_fwlib.o

Try to put *-y addition to the right place.  There are the section
defining snd-hda-codec-*-y.

> +#define TASDEVICE_REG(book, page, reg)	(((book & GENMASK(7, 0)) << 16) + \
> +					 ((page & GENMASK(7, 0)) << 8) + \
> +					  ((reg & GENMASK(6, 0)) << 1))

Usually bits are combined with '|', not '+'.

> +/* Firmware block Checksum */
> +#define TASDEVICE_Checksum		TASDEVICE_REG(0x0, 0x0, 0x7e)

Use capital letters.


... and at this point, I noticed that the patch doesn't contain the
code for sound/pci/hda/tas2781_spi_fwlib.c at all.  The patch must be
utterly broken.

*PLEASE* try to apply and build the patch to submit beforehand from
the clean state and verify it really works.


thanks,

Takashi

