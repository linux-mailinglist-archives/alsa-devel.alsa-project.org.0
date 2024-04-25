Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6D48B1C3E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 09:52:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDAF1E66;
	Thu, 25 Apr 2024 09:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDAF1E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714031557;
	bh=8v0H8CiptTcVv97dj1v29YODc6CigsdS9AjHb21oBNo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ELFfgxMriOjrm5snjDvmSl1IOlWTpUiG98p/Q2k4R7dJRomy+I7UKhibn5w+hDf01
	 NsC2meJlK1W6CjKPS6VlJOtqnOBj6zegmVVzHMNAfPg8htM8Ol5MKTYIZDXnkhngq+
	 3oLGrVpEPYAukiBT69IUxnn9+lNAINJlDd2bAv/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB70CF805AA; Thu, 25 Apr 2024 09:52:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 438B4F8057F;
	Thu, 25 Apr 2024 09:52:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8012F80423; Thu, 25 Apr 2024 09:51:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59424F800B5
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 09:51:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59424F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Do/u8Z8j;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Sa0CKw2P;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Do/u8Z8j;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Sa0CKw2P
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8522522196;
	Thu, 25 Apr 2024 07:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714031512;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xr3+wUyqIVakvZEJ1uwG10kYoCSAm1C+MR52eJlGe3A=;
	b=Do/u8Z8jJhL4YBlhwsZc4UnELjzbFz/Vfi1r11TcB+Y8gHO5cUYU0TZStdXvm08UiRuVwU
	lnZp52/FREm3jqw17gWB6C5qn99MZY8D3cVTHe70cKLNlrzH+RkHzVXmShA30pQT+MEOvF
	058cgXS9F3Hx1GM2ApFUTQZ8tlrXIZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714031512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xr3+wUyqIVakvZEJ1uwG10kYoCSAm1C+MR52eJlGe3A=;
	b=Sa0CKw2P6AqwiumbdHB+D66Bt+hULYfaBtIuokq7x5kHAq2RWn3GbQAvFxSa/44BA1PPuu
	etSB/BWAUW1ORGBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714031512;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xr3+wUyqIVakvZEJ1uwG10kYoCSAm1C+MR52eJlGe3A=;
	b=Do/u8Z8jJhL4YBlhwsZc4UnELjzbFz/Vfi1r11TcB+Y8gHO5cUYU0TZStdXvm08UiRuVwU
	lnZp52/FREm3jqw17gWB6C5qn99MZY8D3cVTHe70cKLNlrzH+RkHzVXmShA30pQT+MEOvF
	058cgXS9F3Hx1GM2ApFUTQZ8tlrXIZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714031512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xr3+wUyqIVakvZEJ1uwG10kYoCSAm1C+MR52eJlGe3A=;
	b=Sa0CKw2P6AqwiumbdHB+D66Bt+hULYfaBtIuokq7x5kHAq2RWn3GbQAvFxSa/44BA1PPuu
	etSB/BWAUW1ORGBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5AC6A13991;
	Thu, 25 Apr 2024 07:51:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2+GKFZgLKmatEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Apr 2024 07:51:52 +0000
Date: Thu, 25 Apr 2024 09:52:02 +0200
Message-ID: <87h6fpc21p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aaron Ma <aaron.ma@canonical.com>
Cc: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/ASOC tas2781: align the path of firmware
In-Reply-To: <20240425072000.22284-1-aaron.ma@canonical.com>
References: <20240425072000.22284-1-aaron.ma@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.31 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.01)[50.86%];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
Message-ID-Hash: H4EB7MXD66BRR476L2X5K5L24PW6FMEH
X-Message-ID-Hash: H4EB7MXD66BRR476L2X5K5L24PW6FMEH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4EB7MXD66BRR476L2X5K5L24PW6FMEH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 25 Apr 2024 09:20:00 +0200,
Aaron Ma wrote:
> 
> TI upstream the files in ti/tas2781 for linux-firmware.
> Make the driver find the correct files.

Note that the upstream linux-firmware provides symlinks to
ti/tas2781/* files, so it's not "incorrect", so far :)


thanks,

Takashi

> 
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
>  include/sound/tas2781.h           | 1 +
>  sound/pci/hda/tas2781_hda_i2c.c   | 2 +-
>  sound/soc/codecs/tas2781-comlib.c | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
> index 99ca3e401fd1..72119cc32c0f 100644
> --- a/include/sound/tas2781.h
> +++ b/include/sound/tas2781.h
> @@ -21,6 +21,7 @@
>  /* version number */
>  #define TAS2781_DRV_VER			1
>  #define SMARTAMP_MODULE_NAME		"tas2781"
> +#define TAS2781_FIRMWARE_ROOT		"ti/tas2781/"
>  #define TAS2781_GLOBAL_ADDR	0x40
>  #define TAS2563_GLOBAL_ADDR	0x48
>  #define TASDEVICE_RATES			(SNDRV_PCM_RATE_44100 |\
> diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
> index 75f7674c66ee..72dc1469655f 100644
> --- a/sound/pci/hda/tas2781_hda_i2c.c
> +++ b/sound/pci/hda/tas2781_hda_i2c.c
> @@ -649,7 +649,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
>  	tasdevice_dsp_remove(tas_priv);
>  
>  	tas_priv->fw_state = TASDEVICE_DSP_FW_PENDING;
> -	scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%04X.bin",
> +	scnprintf(tas_priv->coef_binaryname, 64, "%sTAS2XXX%04X.bin", TAS2781_FIRMWARE_ROOT,
>  		codec->core.subsystem_id & 0xffff);
>  	ret = tasdevice_dsp_parser(tas_priv);
>  	if (ret) {
> diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
> index 3aa81514dad7..96fe1b855ec9 100644
> --- a/sound/soc/codecs/tas2781-comlib.c
> +++ b/sound/soc/codecs/tas2781-comlib.c
> @@ -277,7 +277,7 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
>  	 */
>  	mutex_lock(&tas_priv->codec_lock);
>  
> -	scnprintf(tas_priv->rca_binaryname, 64, "%sRCA%d.bin",
> +	scnprintf(tas_priv->rca_binaryname, 64, "%s%sRCA%d.bin", TAS2781_FIRMWARE_ROOT,
>  		tas_priv->dev_name, tas_priv->ndev);
>  	crc8_populate_msb(tas_priv->crc8_lkp_tbl, TASDEVICE_CRC8_POLYNOMIAL);
>  	tas_priv->codec = codec;
> -- 
> 2.34.1
> 
