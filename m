Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A50B2EF40
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Aug 2025 09:18:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F021C60220;
	Thu, 21 Aug 2025 09:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F021C60220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755760691;
	bh=iGo9CUPN9ePue4vBGmdnfH4LbpOHm6JPYCguMRG6zYc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tpNN8x7/vC0yEux/fxJWfEofKRklwGSlAba613gVTb24FlqhqFKlCwDaxDI8xsttd
	 4g1bbP1G12IbL49JPy+/jyedicXOZQQv9CEt56EpQovT4VRXAiIY8Wrcag0XKpnBQg
	 5PeLUgBG448gJ8CmqedVokYFOl2v3ECdNTedsgZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 001C4F805D3; Thu, 21 Aug 2025 09:17:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FE80F805C4;
	Thu, 21 Aug 2025 09:17:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66F58F80518; Thu, 21 Aug 2025 09:17:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AFE1F80254
	for <alsa-devel@alsa-project.org>; Thu, 21 Aug 2025 09:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AFE1F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sYkEH7lW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kWvwr3a/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=JOaCCOjC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+dHVBNS/
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A394F1F7C7;
	Thu, 21 Aug 2025 07:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1755760644;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/y9JmkXq3GtO/yb5Oh0UJaNAR3IXYSrNhBxF4GnFXs=;
	b=sYkEH7lW1ZnwoTrjSpY+13OELTt/CVBWCg7+SKtaA4dz+dXBrNpzFXTkU2u21ct9mi1NZP
	yM5qQ4Jy2XWssK8TeSUZq6C3RImMoKBSLooHjzVmNlo5X3do0403czIOqybuQGn3HciKtC
	ds3TBlCoILJvGnxWHNrYFGlq2b0F25E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755760644;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/y9JmkXq3GtO/yb5Oh0UJaNAR3IXYSrNhBxF4GnFXs=;
	b=kWvwr3a/1GnyJXknRVjmyC/Fd8UHb8UQetUGQzwb+Fm/bhOOig0+QQSkke7lVIY0YHwTkn
	+hyok7wzm7mJH8CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1755760643;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/y9JmkXq3GtO/yb5Oh0UJaNAR3IXYSrNhBxF4GnFXs=;
	b=JOaCCOjCc+HWVhC1xtRpoSfyL16QJFO6rTeJKir3hUtY/yEjIIllcm4pagyMIXTUEf8C7m
	zXUZBlpjS1HOHdhcJqiKQXqUiFfv27Pt5HjRzACO9C7JdzheCa94OrS2yhCELdl7Vr4M6B
	oj5oqiRer2cY6Nr72jkfMYjzhtoPhtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755760643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/y9JmkXq3GtO/yb5Oh0UJaNAR3IXYSrNhBxF4GnFXs=;
	b=+dHVBNS/oBLakwMkAwwUtkrKiDEBeORJQjTa9//OdHdnYIl4kpYnlL7rwCKdw1B3Ze9y9s
	mL7Zua5RmsSXl5Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 554BA13867;
	Thu, 21 Aug 2025 07:17:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EElcEwPIpmgsAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 21 Aug 2025 07:17:23 +0000
Date: Thu, 21 Aug 2025 09:17:22 +0200
Message-ID: <87cy8p6t4t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<13564923607@139.com>,
	<13916275206@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<baojun.xu@ti.com>,
	<Baojun.Xu@fpt.com>,
	<jesse-ji@ti.com>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Enable init_profile_id for device
 initialization
In-Reply-To: <20250820082123.1125-1-shenghao-ding@ti.com>
References: <20250820082123.1125-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
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
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,ti.com:email,suse.de:mid]
Message-ID-Hash: HIEFI7DHD45TQIQ4EQB7OID3YGJIPE5U
X-Message-ID-Hash: HIEFI7DHD45TQIQ4EQB7OID3YGJIPE5U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HIEFI7DHD45TQIQ4EQB7OID3YGJIPE5U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 20 Aug 2025 10:21:23 +0200,
Shenghao Ding wrote:
> 
> Optimize the time consumption of profile switching, init_profile saves
> the common settings of different profiles, such as the dsp coefficients,
> etc, which can greatly reduce the profile switching time comsumption and
> remove the repetitive settings.
> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> ---
>  sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> index 318f8c58ae61..97c33fee9660 100644
> --- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> +++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> @@ -477,6 +477,12 @@ static void tasdevice_dspfw_init(void *context)
>  	if (tas_priv->fmw->nr_configurations > 0)
>  		tas_priv->cur_conf = 0;
>  
> +	/* Init common setting for different audio profiles */
> +	if (tas_priv->rcabin.init_profile_id >= 0)
> +		tasdevice_select_cfg_blk(tas_priv,
> +			tas_priv->rcabin.init_profile_id,
> +			TASDEVICE_BIN_BLK_PRE_POWER_UP);
> +
>  	/* If calibrated data occurs error, dsp will still works with default
>  	 * calibrated data inside algo.
>  	 */
> @@ -779,6 +785,12 @@ static int tas2781_system_resume(struct device *dev)
>  	tasdevice_reset(tas_hda->priv);
>  	tasdevice_prmg_load(tas_hda->priv, tas_hda->priv->cur_prog);
>  
> +	/* Init common setting for different audio profiles */
> +	if (tas_hda->priv->rcabin.init_profile_id >= 0)
> +		tasdevice_select_cfg_blk(tas_hda->priv,
> +			tas_hda->priv->rcabin.init_profile_id,
> +			TASDEVICE_BIN_BLK_PRE_POWER_UP);
> +
>  	if (tas_hda->priv->playback_started)
>  		tasdevice_tuning_switch(tas_hda->priv, 0);

The patch causes build errors:

sound/hda/codecs/side-codecs/tas2781_hda_i2c.c: In function ¡tasdevice_dspfw_init¢:
sound/hda/codecs/side-codecs/tas2781_hda_i2c.c:468:29: error: ¡struct tasdevice_rca¢ has no member named ¡init_profile_id¢
  468 |         if (tas_priv->rcabin.init_profile_id >= 0)
      |                             ^
....

Something still not landed in my tree yet.


thanks,

Takashi
