Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C3D781D25
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Aug 2023 11:17:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 542CA832;
	Sun, 20 Aug 2023 11:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 542CA832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692523038;
	bh=Fm85MXHroZchQ7AZrzxaPLN37b0alRoa+CFAkWqq8c8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c6gMWHctmwl/1/40ghA9nprUEfg04OgpxTnr3zxGBN6haG7MufckDCSlNzVgsYzny
	 RzR4exR1Awi5bZ9aLPJTx5lw3G5iJmUrqSfqbO3Ph/k9GwglIdmnEQaafXKlo+4nU0
	 eJLW+0U6UeDPdrHkChyEkxciAI15hdtMsk5G5iMI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0151F8025F; Sun, 20 Aug 2023 11:16:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45691F8016C;
	Sun, 20 Aug 2023 11:16:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29F9FF80199; Sun, 20 Aug 2023 11:16:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D89ECF80027
	for <alsa-devel@alsa-project.org>; Sun, 20 Aug 2023 11:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D89ECF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=n0NuEUOq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dbteixOI
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 595F121862;
	Sun, 20 Aug 2023 09:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692522969;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/TF6kVTX6ebBQDIHld1IKl2lO7dkwxnRa+fdMooao6M=;
	b=n0NuEUOqFdzE0K7Jgy0vnbuuGIMWkQ/g6b3cCzdJLZcplQTHTMQJ04Bm01cBk2/uEkejhW
	WPyFHvs/vj4XpX9bvLdruRN7+T6zbh+0e0lrLVA3R1iqzv16LoNm7xM1u4mIX1fgyhhG/P
	Df9fZrj4779uiGPqM8TGLEbbbzn2hYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692522969;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/TF6kVTX6ebBQDIHld1IKl2lO7dkwxnRa+fdMooao6M=;
	b=dbteixOI0KFb2auoIq/LlURJ2+K1vBlg0pr+QpyLjUlzQCTnL8RAFkePDA7App0/WVBdpM
	pXOrntkNE5cC48Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1F311348E;
	Sun, 20 Aug 2023 09:16:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ZqCjOdjZ4WSwMgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 20 Aug 2023 09:16:08 +0000
Date: Sun, 20 Aug 2023 11:16:08 +0200
Message-ID: <87jztq9iqv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	kevin-lu@ti.com,
	13916275206@139.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com,
	mengdong.lin@intel.com,
	baojun.xu@ti.com,
	thomas.gfeller@q-drop.com,
	peeyush@ti.com,
	navada@ti.com,
	broonie@kernel.org,
	gentuser@gmail.com
Subject: Re: [PATCH v3 2/2] ALSA: hda/tas2781: Add tas2781 HDA driver
In-Reply-To: <ZN+j3LmfUW2vB+QS@smile.fi.intel.com>
References: <20230818085558.1431-1-shenghao-ding@ti.com>
	<20230818085558.1431-2-shenghao-ding@ti.com>
	<4c1b44b5-995a-fac7-a72b-89b8bf816dd2@linux.intel.com>
	<ZN+j3LmfUW2vB+QS@smile.fi.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: Y7JSUFXRJA5EINLQPARXUSFCRYEISPLO
X-Message-ID-Hash: Y7JSUFXRJA5EINLQPARXUSFCRYEISPLO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y7JSUFXRJA5EINLQPARXUSFCRYEISPLO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 18 Aug 2023 19:01:16 +0200,
Andy Shevchenko wrote:
> 
> On Fri, Aug 18, 2023 at 11:00:34AM -0500, Pierre-Louis Bossart wrote:
> 
> ...
> 
> > > +static int comp_match_tas2781_dev_name(struct device *dev,
> > > +	void *data)
> > > +{
> > > +	struct scodec_dev_name *p = data;
> > > +	const char *d = dev_name(dev);
> > > +	int n = strlen(p->bus);
> > > +	char tmp[32];
> > > +
> > > +	/* check the bus name */
> > > +	if (strncmp(d, p->bus, n))
> > > +		return 0;
> 
> > > +	/* skip the bus number */
> > > +	if (isdigit(d[n]))
> > > +		n++;
> 
> Why do you think it can't be two or more digits?
> 
> > > +	/* the rest must be exact matching */
> > > +	snprintf(tmp, sizeof(tmp), "-%s:00", p->hid);
> > 
> > ACPI can sometimes add :01 suffixes, this looks like the re-invention of
> > an ACPI helper?
> > 
> > Adding Andy for the ACPI review.
> > 
> > > +	return !strcmp(d + n, tmp);
> > > +}
> 
> Yes, this looks like reinventing a wheel.
> Just compare dev_name() against what is in p->....

Note that comp_match_tas7281_dev_name() is a copy of
comp_patch_cs35l41_dev_name() and it was implemented in a hackish way
to be applicable to both I2C and SPI device names that have slightly
different naming rules.

> ...
> 
> > > +static void tas2781_fixup_i2c(struct hda_codec *cdc,
> > > +	const struct hda_fixup *fix, int action)
> > > +{
> > > +	 tas2781_generic_fixup(cdc, action, "i2c", "TIAS2781");
> > 
> > TI ACPI ID is TXNW
> > 
> > https://uefi.org/ACPI_ID_List?search=TEXAS
> > 
> > There's also a PNP ID PXN
> > 
> > https://uefi.org/PNP_ID_List?search=TEXAS
> > 
> > "TIAS" looks like an invented identifier. It's not uncommon but should
> > be recorded with a comment if I am not mistaken.
> > 
> > > +}
> 
> Thank you, but actually it's a strong NAK to this even with the comment.
> We have to teach people to follow the specification (may be even hard way).
> 
> So where did you get the ill-formed ACPI ID?
> Is Texas Instrument aware of this?
> Can we have a confirmation letter from TI for this ID, please?

This is used already for products that have been long in the market,
so it's way too late to correct it, I'm afraid.

What we can do is to get the confirmation from TI, complain it, and
some verbose comment in the code, indeed.


thanks,

Takashi
