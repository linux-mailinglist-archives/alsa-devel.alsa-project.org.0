Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFEEAF6EFC
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jul 2025 11:42:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C31CB601F6;
	Thu,  3 Jul 2025 11:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C31CB601F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751535748;
	bh=Tc2He9V2+ZoVsyDk3MmEaYuE00B50p9kj605W0HSn8Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FVionwJ1xFY5+Zlr7pa9ArpcApScmgmBXOvDBeFyIp15pmAzpp52KSRBUJ7/KgHM8
	 hDn2XXqOeOP7rFPSBsgC3gEV84KfDcOsZHSFh/loBV92J8yhfZaXRRQeE3Svi8eAAP
	 QMuNm88wgrbWkAbzEslU0J4m1YcaWa0avddWJ/DE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B94E4F805C2; Thu,  3 Jul 2025 11:41:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99707F805C2;
	Thu,  3 Jul 2025 11:41:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3783DF80424; Thu,  3 Jul 2025 11:41:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DDF3F80038
	for <alsa-devel@alsa-project.org>; Thu,  3 Jul 2025 11:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DDF3F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=LdIdNOok;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=u0rqKlmL;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=LdIdNOok;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=u0rqKlmL
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 47A0921186;
	Thu,  3 Jul 2025 09:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1751535705;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ct7clN4OxfFrYElHSUpU60EmEGUOutONp382V/+9FTE=;
	b=LdIdNOokx4dTZWcu1BTdWSjZ6JD2CcreM/v1VrQLAu9nBQq5wSkJz7NCeB6kXhGbpWo1IG
	c3vUBDy8PNAibHF+ECkNXKNV+lZVhmfl0X0QHV0K3u2YDbOrarzxOpOsvUzfzMrLEkBeTq
	ll1kyf+hz8RtyazD7C5kuaccd5fjv1Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751535705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ct7clN4OxfFrYElHSUpU60EmEGUOutONp382V/+9FTE=;
	b=u0rqKlmLjvEQIKu0KjVmwam2DswknUub1nVgqSpZJEZijzd38XrlYLa8CqNZSXVNNfYzQM
	riMuMwUWtJRifmDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1751535705;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ct7clN4OxfFrYElHSUpU60EmEGUOutONp382V/+9FTE=;
	b=LdIdNOokx4dTZWcu1BTdWSjZ6JD2CcreM/v1VrQLAu9nBQq5wSkJz7NCeB6kXhGbpWo1IG
	c3vUBDy8PNAibHF+ECkNXKNV+lZVhmfl0X0QHV0K3u2YDbOrarzxOpOsvUzfzMrLEkBeTq
	ll1kyf+hz8RtyazD7C5kuaccd5fjv1Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751535705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ct7clN4OxfFrYElHSUpU60EmEGUOutONp382V/+9FTE=;
	b=u0rqKlmLjvEQIKu0KjVmwam2DswknUub1nVgqSpZJEZijzd38XrlYLa8CqNZSXVNNfYzQM
	riMuMwUWtJRifmDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 23FD813721;
	Thu,  3 Jul 2025 09:41:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9a8hCFlQZmjPBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Jul 2025 09:41:45 +0000
Date: Thu, 03 Jul 2025 11:41:44 +0200
Message-ID: <875xg9obl3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>,
	<navada@ti.com>,
	<13916275206@139.com>,
	<v-hampiholi@ti.com>,
	<v-po@ti.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add bus name in device name check
In-Reply-To: <20250703000608.20815-1-baojun.xu@ti.com>
References: <20250703000608.20815-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,alsa-project.org,ti.com,139.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: RPZKANP74T4DV7QPFUG6RG2W7EMRYFQV
X-Message-ID-Hash: RPZKANP74T4DV7QPFUG6RG2W7EMRYFQV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RPZKANP74T4DV7QPFUG6RG2W7EMRYFQV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 03 Jul 2025 02:06:08 +0200,
Baojun Xu wrote:
> 
> Device name start from bus name, as we use strstarts()
> to do compare, need add it for TXNW2781 device.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Could you give the proper Fixes tag if it's a fix of the previous
changes?


thanks,

Takashi


> ---
>  sound/pci/hda/tas2781_hda_i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
> index b9cdbca95..530c2266a 100644
> --- a/sound/pci/hda/tas2781_hda_i2c.c
> +++ b/sound/pci/hda/tas2781_hda_i2c.c
> @@ -588,7 +588,7 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
>  		hda_priv->save_calibration = tas2781_save_calibration;
>  		tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
>  	} else if (strstarts(dev_name(&clt->dev),
> -			     "TXNW2781:00-tas2781-hda.0")) {
> +			     "i2c-TXNW2781:00-tas2781-hda.0")) {
>  		device_name = "TXNW2781";
>  		hda_priv->save_calibration = tas2781_save_calibration;
>  		tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
> -- 
> 2.43.0
> 
