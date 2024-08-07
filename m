Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A5894A44C
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 11:31:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 116C11903;
	Wed,  7 Aug 2024 11:31:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 116C11903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723023076;
	bh=iBwSElW7/bGjjlIgMt5MwMhqoVEnZ1qEhtTJ2Xsjuw4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u6h+UFyAp3+bn2sb7Aaa+i3qrEXJRKoenZVO4RMVJo0ijGus9RqliaXJe+ttbTHl5
	 kDop19+FFFNITxiqhKYiO9Sqg1BZpD2fVdnVe+4h+gqQD0Vca99wv1Ik0CtdNFrwjw
	 AhYVz2z3pXCCDs3x8ZEDs8ES5cJ8jDydVlQFOSsE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26E87F805BD; Wed,  7 Aug 2024 11:30:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 486D3F805AF;
	Wed,  7 Aug 2024 11:30:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D38B8F802DB; Wed,  7 Aug 2024 11:30:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C640F800BF
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 11:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C640F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KEH94C0V;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=stZfgEGd;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=KEH94C0V;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=stZfgEGd
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B52BF21B79;
	Wed,  7 Aug 2024 09:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723023014;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LhM+tJw0ZvhBM0ppB6xSr68FJ9X0AGS0EoEn7WLfbTQ=;
	b=KEH94C0VSSClbVs+IHMgmtLdflfj40u4QaOwdTKjxwIX8b9Y+H1C41ERZqcmLGEE8D+Tm+
	5IZGyIHnHS0ZbPvQ5ZPsQX2RG44B85VE43Z3a39ZLnHbsx1DQONpCMOJ15JOcup6rzx9WM
	zcGqgVq9khWDLi2iAaUpTmefYtqpI4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723023014;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LhM+tJw0ZvhBM0ppB6xSr68FJ9X0AGS0EoEn7WLfbTQ=;
	b=stZfgEGdVYSAY/V+mgzPtBobLhQgY2M1f34/sEE17IhnUJfI+iESJeI2EW0XsrOYjLaeJh
	c1S3STgA052vfzAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KEH94C0V;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=stZfgEGd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723023014;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LhM+tJw0ZvhBM0ppB6xSr68FJ9X0AGS0EoEn7WLfbTQ=;
	b=KEH94C0VSSClbVs+IHMgmtLdflfj40u4QaOwdTKjxwIX8b9Y+H1C41ERZqcmLGEE8D+Tm+
	5IZGyIHnHS0ZbPvQ5ZPsQX2RG44B85VE43Z3a39ZLnHbsx1DQONpCMOJ15JOcup6rzx9WM
	zcGqgVq9khWDLi2iAaUpTmefYtqpI4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723023014;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LhM+tJw0ZvhBM0ppB6xSr68FJ9X0AGS0EoEn7WLfbTQ=;
	b=stZfgEGdVYSAY/V+mgzPtBobLhQgY2M1f34/sEE17IhnUJfI+iESJeI2EW0XsrOYjLaeJh
	c1S3STgA052vfzAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5714913A7D;
	Wed,  7 Aug 2024 09:30:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0QfmE6Y+s2bGDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 09:30:14 +0000
Date: Wed, 07 Aug 2024 11:30:53 +0200
Message-ID: <87r0b07k8i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<pierre-louis.bossart@linux.intel.com>,
	<13564923607@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<liam.r.girdwood@intel.com>,
	<cameron.berkenpas@gmail.com>,
	<baojun.xu@ti.com>,
	<soyer@irl.hu>,
	<Baojun.Xu@fpt.com>,
	<robinchen@ti.com>
Subject: Re: [PATCH v1] ALSA: ASoC/tas2781: fix wrong calibrated data order
In-Reply-To: <20240807075541.1458-1-shenghao-ding@ti.com>
References: <20240807075541.1458-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com,perex.cz,139.com,alsa-project.org,vger.kernel.org,intel.com,ti.com,irl.hu,fpt.com];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,ti.com:email]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B52BF21B79
Message-ID-Hash: QF5JODXENFW47ZFEGHFKJEOI5WR3ZDIO
X-Message-ID-Hash: QF5JODXENFW47ZFEGHFKJEOI5WR3ZDIO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QF5JODXENFW47ZFEGHFKJEOI5WR3ZDIO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Aug 2024 09:55:40 +0200,
Shenghao Ding wrote:
> 
> From: Baojun Xu <baojun.xu@ti.com>
> 
> Wrong calibration data order cause sound too low in some device.
> Fix wrong calibrated data order, add calibration data converssion
> by get_unaligned_be32() after reading from UEFI.
> 
> Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> 
> ---
> v1:
>  - Change copyright date, and add new maintainer.
>  - Add unaligned.h included for get_unaligned_be32().
>  - In tas2781_apply_calib(), change data address transfer directly to
>    get data by get_unaligned_be32(), and send address to device.
> ---
>  sound/pci/hda/tas2781_hda_i2c.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
> index 49bd7097d..4dc3350d5 100644
> --- a/sound/pci/hda/tas2781_hda_i2c.c
> +++ b/sound/pci/hda/tas2781_hda_i2c.c
> @@ -2,10 +2,12 @@
>  //
>  // TAS2781 HDA I2C driver
>  //
> -// Copyright 2023 Texas Instruments, Inc.
> +// Copyright 2023 - 2024 Texas Instruments, Inc.
>  //
>  // Author: Shenghao Ding <shenghao-ding@ti.com>
> +// Current maintainer: Baojun Xu <baojun.xu@ti.com>
>  
> +#include <asm/unaligned.h>
>  #include <linux/acpi.h>
>  #include <linux/crc8.h>
>  #include <linux/crc32.h>
> @@ -519,20 +521,21 @@ static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
>  	static const unsigned char rgno_array[CALIB_MAX] = {
>  		0x74, 0x0c, 0x14, 0x70, 0x7c,
>  	};
> -	unsigned char *data;
> -	int i, j, rc;
> +	int i, j, rc, data;
> +	int offset = 0;

data should be __be32 type, to be more explicit.


Takashi

>  
>  	for (i = 0; i < tas_priv->ndev; i++) {
> -		data = tas_priv->cali_data.data +
> -			i * TASDEVICE_SPEAKER_CALIBRATION_SIZE;
>  		for (j = 0; j < CALIB_MAX; j++) {
> +			data = get_unaligned_be32(
> +				&tas_priv->cali_data.data[offset]);
>  			rc = tasdevice_dev_bulk_write(tas_priv, i,
>  				TASDEVICE_REG(0, page_array[j], rgno_array[j]),
> -				&(data[4 * j]), 4);
> +				(unsigned char *)&data, 4);
>  			if (rc < 0)
>  				dev_err(tas_priv->dev,
>  					"chn %d calib %d bulk_wr err = %d\n",
>  					i, j, rc);
> +			offset += 4;
>  		}
>  	}
>  }
> -- 
> 2.40.1
> 
