Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C17999FC9
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 11:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7853A868;
	Fri, 11 Oct 2024 11:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7853A868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728637731;
	bh=RQ7Lxb9941hJIWIjknEb0KZH3t22jRdOrvwNUZ7gKEc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UFXFWutFBgU0cxKaoZ9U3t+wASH8e4O9aEq6mXZbmt4mx6Hq59R9SD26QFEyAHOKU
	 7GBcfXDro/uZL2ua/VF6tKqbiYd0S+fb65x/GPg5W11z2PlsYRSvt+39kXRilQw9qS
	 WrVunzknP9AcelQnpgTXLF5oF3rpDPW6oKC2fXPg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A783AF805A0; Fri, 11 Oct 2024 11:08:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94FC4F805AC;
	Fri, 11 Oct 2024 11:08:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E39F6F80528; Fri, 11 Oct 2024 11:08:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BE6E6F80496
	for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2024 11:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE6E6F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1U+EnOyh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RcgRk04j;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=1U+EnOyh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RcgRk04j
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B1A3422006;
	Fri, 11 Oct 2024 09:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1728637691;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qRtkyU1XwOFtiE9AeGs8BXfcw5siT/eDeiiVg8cjBIE=;
	b=1U+EnOyhpEaNx7NrHFLfdshoEkclnxLJ3ZqISbCoioJE516o2kiXE51TZHXOmB+U/NokQA
	Q2fa7Z8cDWq+flVN8myQ+7GThNR7QKGCBcJ+cG+7nL76DYOML2hqLDsCCkuyAJ3dscEAoo
	SzxDqc6w4YWgBNr4fp4JuA1EjbExHT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728637691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qRtkyU1XwOFtiE9AeGs8BXfcw5siT/eDeiiVg8cjBIE=;
	b=RcgRk04jXRDLFa3PIdIWkxQxQOB8++W6+LtLBXZjxqtmVlP046MMyrgicMykMPp5XRXgaN
	mtY4i/I6LjQZs2Bw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1U+EnOyh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RcgRk04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1728637691;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qRtkyU1XwOFtiE9AeGs8BXfcw5siT/eDeiiVg8cjBIE=;
	b=1U+EnOyhpEaNx7NrHFLfdshoEkclnxLJ3ZqISbCoioJE516o2kiXE51TZHXOmB+U/NokQA
	Q2fa7Z8cDWq+flVN8myQ+7GThNR7QKGCBcJ+cG+7nL76DYOML2hqLDsCCkuyAJ3dscEAoo
	SzxDqc6w4YWgBNr4fp4JuA1EjbExHT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728637691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qRtkyU1XwOFtiE9AeGs8BXfcw5siT/eDeiiVg8cjBIE=;
	b=RcgRk04jXRDLFa3PIdIWkxQxQOB8++W6+LtLBXZjxqtmVlP046MMyrgicMykMPp5XRXgaN
	mtY4i/I6LjQZs2Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3BE5D136E0;
	Fri, 11 Oct 2024 09:08:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K8V5DfvqCGdsKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 11 Oct 2024 09:08:11 +0000
Date: Fri, 11 Oct 2024 11:09:08 +0200
Message-ID: <87plo7m2ff.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add speaker id check for ASUS
 projects
In-Reply-To: <20241011085303.738-1-baojun.xu@ti.com>
References: <20241011085303.738-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: B1A3422006
X-Rspamd-Action: no action
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com,perex.cz,ti.com,139.com,alsa-project.org,vger.kernel.org,intel.com,irl.hu];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 3CNHVK3PAMMBSHRGJDSKIYH4EHXU3KIG
X-Message-ID-Hash: 3CNHVK3PAMMBSHRGJDSKIYH4EHXU3KIG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CNHVK3PAMMBSHRGJDSKIYH4EHXU3KIG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 11 Oct 2024 10:53:03 +0200,
Baojun Xu wrote:
> 
> Add speaker id check by gpio in ACPI for ASUS projects.

Please give more background info.  e.g. why is the speaker id check
needed, what does this patch actually fix, and why it's specific to
ASUS?


thanks,

Takashi

> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
>  include/sound/tas2781.h         |  3 +++
>  sound/pci/hda/tas2781_hda_i2c.c | 39 ++++++++++++++++++++++++++++++---
>  2 files changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
> index 8cd6da0480b7..f8a3dc13cbbc 100644
> --- a/include/sound/tas2781.h
> +++ b/include/sound/tas2781.h
> @@ -107,6 +107,8 @@
>  #define TASDEVICE_CMD_DELAY		0x3
>  #define TASDEVICE_CMD_FIELD_W		0x4
>  
> +#define TAS2781_ASUS_ID			0x10430000
> +
>  enum audio_device {
>  	TAS2563,
>  	TAS2781,
> @@ -156,6 +158,7 @@ struct tasdevice_priv {
>  	struct tasdevice_rca rcabin;
>  	struct calidata cali_data;
>  	struct tasdevice_fw *fmw;
> +	struct gpio_desc *speaker_id;
>  	struct gpio_desc *reset;
>  	struct mutex codec_lock;
>  	struct regmap *regmap;
> diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
> index 370d847517f9..1f71927825b2 100644
> --- a/sound/pci/hda/tas2781_hda_i2c.c
> +++ b/sound/pci/hda/tas2781_hda_i2c.c
> @@ -615,7 +615,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
>  	struct tasdevice_priv *tas_priv = context;
>  	struct tas2781_hda *tas_hda = dev_get_drvdata(tas_priv->dev);
>  	struct hda_codec *codec = tas_priv->codec;
> -	int i, ret;
> +	int i, ret, spk_id;
>  
>  	pm_runtime_get_sync(tas_priv->dev);
>  	mutex_lock(&tas_priv->codec_lock);
> @@ -648,8 +648,23 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
>  	tasdevice_dsp_remove(tas_priv);
>  
>  	tas_priv->fw_state = TASDEVICE_DSP_FW_PENDING;
> -	scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%04X.bin",
> -		codec->core.subsystem_id & 0xffff);
> +	if ((codec->core.subsystem_id & 0xffff0000) == TAS2781_ASUS_ID) {
> +		// Speaker id need to be checked.
> +		if (tas_priv->speaker_id)
> +			spk_id = gpiod_get_value(tas_priv->speaker_id);
> +		else
> +			spk_id = 0;
> +		if (spk_id < 0 || spk_id > 1) {
> +			// Speaker id is not valid, use default.
> +			dev_dbg(tas_priv->dev, "Wrong spk_id = %d\n", spk_id);
> +			spk_id = 0;
> +		}
> +		scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%04X%01d.bin",
> +			codec->core.subsystem_id & 0xffff, spk_id);
> +	} else {
> +		scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%04X.bin",
> +			codec->core.subsystem_id & 0xffff);
> +	}
>  	ret = tasdevice_dsp_parser(tas_priv);
>  	if (ret) {
>  		dev_err(tas_priv->dev, "dspfw load %s error\n",
> @@ -787,6 +802,15 @@ static void tas2781_hda_remove(struct device *dev)
>  	tasdevice_remove(tas_hda->priv);
>  }
>  
> +static const struct acpi_gpio_params speakerid_gpios = { 0, 0, false };
> +static const struct acpi_gpio_params interrupt_gpios = { 1, 0, false };
> +
> +static const struct acpi_gpio_mapping tas2781_speaker_id_gpios[] = {
> +	{ "speakerid-gpios", &speakerid_gpios, 1 },
> +	{ "interrupt-gpios", &interrupt_gpios, 1 },
> +	{ }
> +};
> +
>  static int tas2781_hda_i2c_probe(struct i2c_client *clt)
>  {
>  	struct tas2781_hda *tas_hda;
> @@ -823,6 +847,15 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
>  	if (ret)
>  		return dev_err_probe(tas_hda->dev, ret,
>  			"Platform not supported\n");
> +	ret = devm_acpi_dev_add_driver_gpios(tas_hda->dev,
> +					     tas2781_speaker_id_gpios);
> +	if (ret)
> +		dev_info(tas_hda->dev, "Unable to add GPIO mapping table\n");
> +
> +	tas_hda->priv->speaker_id = devm_gpiod_get(tas_hda->dev, "speakerid",
> +						   GPIOD_IN);
> +	if (IS_ERR(tas_hda->priv->speaker_id))
> +		dev_info(tas_hda->dev, "Failed to get Speaker id gpio.\n");
>  
>  	ret = tasdevice_init(tas_hda->priv);
>  	if (ret)
> -- 
> 2.43.0
> 
