Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C26B419A2
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Sep 2025 11:11:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD9BB601FE;
	Wed,  3 Sep 2025 11:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD9BB601FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756890701;
	bh=zAWoGnz2y7CwLjX58jB83OvAck2B6JWBzTw/V8aAOp4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BL3PYde3XiEguQLRZg05soBpjLS1UHl8xfNpLuevsUY89Y3SnMiTGIXFLOoPP4WvO
	 p6iGg4n+ztozbQxao5NnFU68LBHclm9YSiwo3aQCs2tXNYCQTCugmpaglak3YNICN3
	 AjpveNRAqQwPEL6Zkj/NLKCWg4InzcKqmzybJiA4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2AC0F805CB; Wed,  3 Sep 2025 11:11:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 115CDF805CA;
	Wed,  3 Sep 2025 11:11:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 520CBF804D6; Wed,  3 Sep 2025 11:10:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5036F80075
	for <alsa-devel@alsa-project.org>; Wed,  3 Sep 2025 11:10:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5036F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BC2KR7m8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lTVqWkOT;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=n/eQEnMw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=X3ydiXUP
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 863E32191F;
	Wed,  3 Sep 2025 09:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1756890654;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TqJ0qVbciWWxeZgsRG9NGeP3cguWzw91eI2DWW2hyoo=;
	b=BC2KR7m887TJoozq4pIfds8w9RbfAbjWReiYUEpbcNCqlZnqp+MWkGasTZWozKakWY85ez
	wenDMS9smjH8Zo30lGgqgtJv20JapkkKTqrZ5jalSKSccB0fulVZK49yenSlTE6sZJ/8V9
	Z57B40QMGfuqBaPC9mrtpm6oKucBL6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756890654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TqJ0qVbciWWxeZgsRG9NGeP3cguWzw91eI2DWW2hyoo=;
	b=lTVqWkOT6NB7mFiHEiGQKJvUe17w1RuZy1yTS8W1cirOaEksMSN0a+w/U3ATiXHVJ9iklc
	YtWULPOn4/+rULAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1756890653;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TqJ0qVbciWWxeZgsRG9NGeP3cguWzw91eI2DWW2hyoo=;
	b=n/eQEnMwD7lr+y1npLQ/jMmQv7syXQ/WSKaaKeVqRzc5DfUblKBv0Dx6igaflxo8EfHO+4
	ljuQT04zdk9PoH8sp1757g26rYL3qCun++6bBNds4W6uSnkw5xRM2nzDv3Rr+juejsCpyo
	e2cvuNHrzH5LRI/4m+UDT2Gjq4KtcWc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756890653;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TqJ0qVbciWWxeZgsRG9NGeP3cguWzw91eI2DWW2hyoo=;
	b=X3ydiXUPXyY6chf77547uS8RkskxAfv71xY+A1rpfZaaMhDdVrOLkjMaz3791ADQCT7BIr
	FrTz4WehiSb0EBBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D9D913888;
	Wed,  3 Sep 2025 09:10:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 98fIDR0GuGjgYQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 03 Sep 2025 09:10:53 +0000
Date: Wed, 03 Sep 2025 11:10:52 +0200
Message-ID: <875xdzx5nn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<13564923607@139.com>,
	<13916275206@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<baojun.xu@ti.com>,
	<Baojun.Xu@fpt.com>
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Fix the order of TAS2781
 calibrated-data
In-Reply-To: <20250903041351.143-1-shenghao-ding@ti.com>
References: <20250903041351.143-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: NYIJZG2EREK5R2CWEOWICWVJQZU2UGHO
X-Message-ID-Hash: NYIJZG2EREK5R2CWEOWICWVJQZU2UGHO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NYIJZG2EREK5R2CWEOWICWVJQZU2UGHO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 Sep 2025 06:13:51 +0200,
Shenghao Ding wrote:
> 
> A bug reported by one of my customers that the order of TAS2781
> calibrated-data is incorrect, the correct way is to move R0_Low
> and insert it between R0 and InvR0.
> 
> Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> ---
> v2:
>  - Submit to sound branch maintianed by Tiwai instead of linux-next branch
>  - drop other fix
> ---
>  sound/hda/codecs/side-codecs/tas2781_hda.c | 38 ++++++++++++++++++----
>  1 file changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/hda/codecs/side-codecs/tas2781_hda.c b/sound/hda/codecs/side-codecs/tas2781_hda.c
> index f46d2e06c64f..cd9990869e18 100644
> --- a/sound/hda/codecs/side-codecs/tas2781_hda.c
> +++ b/sound/hda/codecs/side-codecs/tas2781_hda.c
> @@ -33,6 +33,32 @@ const efi_guid_t tasdev_fct_efi_guid[] = {
>  };
>  EXPORT_SYMBOL_NS_GPL(tasdev_fct_efi_guid, "SND_HDA_SCODEC_TAS2781");
>  
> +/*
> + * The order of calibrated-data writing is a bit different from the order
> + * in UEFI. Here is the conversion to match the order of calibrated-data
> + * writing.
> + */
> +static void cali_cnv(unsigned char *data, unsigned int base, int offset)
> +{
> +	__be32 bedata[TASDEV_CALIB_N];
> +	int i;
> +
> +	/* r0_reg */
> +	bedata[0] = cpu_to_be32(*(uint32_t *)&data[base]);
> +	/* r0_low_reg */
> +	bedata[1] = cpu_to_be32(*(uint32_t *)&data[base + 8]);
> +	/* invr0_reg */
> +	bedata[2] = cpu_to_be32(*(uint32_t *)&data[base + 4]);
> +	/* pow_reg */
> +	bedata[3] = cpu_to_be32(*(uint32_t *)&data[base + 12]);
> +	/* tlimit_reg */
> +	bedata[4] = cpu_to_be32(*(uint32_t *)&data[base + 16]);
> +
> +	for (i = 0; i < TASDEV_CALIB_N; i++)
> +		memcpy(&data[offset + i * 4 + 1], &bedata[i],
> +			sizeof(bedata[i]));
> +}

IMO, this can be more readable when you use struct calidata, e.g.

static void cali_cnv(unsigned char *data, unsigned int base, int offset)
{
	struct calidata reg;

	reg.r0_reg = *(u32 *)&data[base]
	reg.r0_low_reg = *(u32 *)&data[base + 8]
	reg.invr0_reg = *(u32 *)&data[base + 4]
	reg.pow_reg = *(u32 *)&data[base + 12];
	reg.tlimit_reg = *(u32 *)&data[base + 16]);

	cpu_to_be32_array((__force __be32 *)(data + offset + 1), &reg,
			  TASDEV_CALIB_N);
}

... or even simpler like:

static void cali_cnv(unsigned char *data, unsigned int base, int offset)
{
	struct calidata reg;

	memcpy(&reg, data, sizeof(reg));
	/* the data order has to be swapped between r0_low_reg and inv0_reg */
	swap(reg.r0_low_reg, reg.invr0_reg);

	cpu_to_be32_array((__force __be32 *)(data + offset + 1), &reg,
			  TASDEV_CALIB_N);
}

>  static void tas2781_apply_calib(struct tasdevice_priv *p)
>  {
>  	struct calidata *cali_data = &p->cali_data;
> @@ -86,6 +112,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
>  
>  		for (j = 0, k = 0; j < node_num; j++) {
>  			oft = j * 6 + 3;
> +			/* Calibration registers address */

Don't try to add unrelated changes.  This comment won't fix or explain
what your patch does.  If any, make another patch to update / add more
comments.
Putting unrelated changes disturbs the patch readability *a lot*

>  			if (tmp_val[oft] == TASDEV_UEFI_CALI_REG_ADDR_FLG) {
>  				for (i = 0; i < TASDEV_CALIB_N; i++) {
>  					buf = &data[(oft + i + 1) * 4];
> @@ -93,6 +120,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
>  						buf[2], buf[3]);
>  				}
>  			} else {
> +				/* Calibrated data */

Ditto.

> @@ -127,12 +154,11 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
>  			dev_err(p->dev, "%s: V1 CRC error\n", __func__);
>  			return;
>  		}
> -
> +		/* reverse rearrangement in case of overlap */

Ditto.


thanks,

Takashi
