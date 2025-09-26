Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A69C9BA4DB8
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Sep 2025 20:13:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2996B601FD;
	Fri, 26 Sep 2025 20:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2996B601FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758910432;
	bh=0+W1Na4CAb7UCDasIjvvPSb7/qVXNolxFmrc3sFe238=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WFEia+9j1qS8f1SUoOyjxOJsCLRrTKm8d/q0wZr6ithFEErimho7htSEKi5zUUec+
	 1N7mvr8IEqv13SJ3V9QyS+0ZwkPS8fCBst9LxnTPIlHXG4eHa0ebvUpOGdJyO7gBfM
	 Wf5V2pgYJVcFSjP7CEp3K01KLElc/zsrfVg+DZM4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E29D3F805D8; Fri, 26 Sep 2025 20:13:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8DCDF805C6;
	Fri, 26 Sep 2025 20:13:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F107F804FC; Fri, 26 Sep 2025 20:13:12 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F5F6F800E3
	for <alsa-devel@alsa-project.org>; Fri, 26 Sep 2025 20:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F5F6F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MW8kK8WU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GCfxIpNk;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=0yYp4A0Z;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nPFm1wL2
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EFD0922132;
	Fri, 26 Sep 2025 18:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1758910389;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b2fR5fMHUJBEiytnVArGr5QfpX9gLSLu8Btxg4OIEmY=;
	b=MW8kK8WUaF34Ly8qdyUjbxChbw0y5E9pPwHXpYY9HveavDj+6d3QT0bACtiUHJ777fE9hx
	9dsuAlJkTWRsaGIBIp3tQ2np68WQrsmoGpHj9uEnvLBixPtJdMuxgDJ8HnbghAESXvG126
	vRUZVZP5U7pejlxJm7wUca1682mqsDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758910389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b2fR5fMHUJBEiytnVArGr5QfpX9gLSLu8Btxg4OIEmY=;
	b=GCfxIpNkdYF5Cw1hikH8B7gygjJk9sTyM9QPZKJm2AkRON9qSkbL99TcOgGodFuyz0GR/K
	AJxMvY134B+FKTBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1758910387;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b2fR5fMHUJBEiytnVArGr5QfpX9gLSLu8Btxg4OIEmY=;
	b=0yYp4A0Zq1yC6ADWBKoHwe/rowHUz8mxabRRnrJ1cTSNdmbCNQDFgAmB1oNwg0XTxA95tz
	Vel5/Pwrb6AyCn2+ptmv7ea6bmHSK5EWTqO0rPz8uS40S09LDizmm1RBqBb6UMwAvH36N2
	TOlU5YY3dLLsNRwOWjyxucFziEoD/Sk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758910387;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b2fR5fMHUJBEiytnVArGr5QfpX9gLSLu8Btxg4OIEmY=;
	b=nPFm1wL2+ov3lHngOnzyzbAlO+XaJKf4ZdX8Ah0Xw+LkDYoTPX8zu+eBPPkvl3fHkvFspC
	JYfgIb6BKoLyr5BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EF441386E;
	Fri, 26 Sep 2025 18:13:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +SeJFbPX1mhHMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 26 Sep 2025 18:13:07 +0000
Date: Fri, 26 Sep 2025 20:13:06 +0200
Message-ID: <87ldm1axql.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<13916275206@139.com>,
	<alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<lgirdwood@gmail.com>,
	<robh@kernel.org>,
	<krzk+dt@kernel.org>,
	<conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>,
	<k-yi@ti.com>,
	<henry.lo@ti.com>,
	<robinchen@ti.com>,
	<jesse-ji@ti.com>,
	<will-wang@ti.com>,
	<jim.shil@goertek.com>,
	<toastcheng@google.com>,
	<chinkaiting@google.com>
Subject: Re: [PATCH v2 1/2] ASoC: tas2781: Add tas5828 support
In-Reply-To: <20250926043339.8419-1-baojun.xu@ti.com>
References: <20250926043339.8419-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[21];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,ti.com,vger.kernel.org,gmail.com,goertek.com,google.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: CVOENQ6LRR2SNHK3WFNNQJLBMOWH6BYL
X-Message-ID-Hash: CVOENQ6LRR2SNHK3WFNNQJLBMOWH6BYL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CVOENQ6LRR2SNHK3WFNNQJLBMOWH6BYL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 26 Sep 2025 06:33:38 +0200,
Baojun Xu wrote:
> 
> TAS5828 have on-chip DSP without current/voltage feedback.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Please use a different subject for each patch.  Both patches are 100%
identical subject, and that makes harder to identify.


thanks,

Takashi

> 
> ---
> v2:
>  - Update description for TAS5828
>  - Change commit tree to .../tiwai/sound.git.
> ---
>  include/sound/tas2781.h        | 1 +
>  sound/soc/codecs/tas2781-i2c.c | 7 ++++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
> index ddd997ac3..a37b4d67c 100644
> --- a/include/sound/tas2781.h
> +++ b/include/sound/tas2781.h
> @@ -122,6 +122,7 @@ enum audio_device {
>  	TAS2781,
>  	TAS5825,
>  	TAS5827,
> +	TAS5828,
>  	TAS_OTHERS,
>  };
>  
> diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
> index 1539b7088..f62a71dca 100644
> --- a/sound/soc/codecs/tas2781-i2c.c
> +++ b/sound/soc/codecs/tas2781-i2c.c
> @@ -110,6 +110,7 @@ static const struct i2c_device_id tasdevice_id[] = {
>  	{ "tas2781", TAS2781 },
>  	{ "tas5825", TAS5825 },
>  	{ "tas5827", TAS5827 },
> +	{ "tas5828", TAS5828 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(i2c, tasdevice_id);
> @@ -126,6 +127,7 @@ static const struct of_device_id tasdevice_of_match[] = {
>  	{ .compatible = "ti,tas2781" },
>  	{ .compatible = "ti,tas5825" },
>  	{ .compatible = "ti,tas5827" },
> +	{ .compatible = "ti,tas5828" },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, tasdevice_of_match);
> @@ -1665,7 +1667,7 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
>  	}
>  	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
>  
> -	/* There is no calibration required for TAS5825/TAS5827. */
> +	/* There is no calibration required for TAS5825/TAS5827/TAS5828. */
>  	if (tas_priv->chip_id < TAS5825) {
>  		ret = tasdevice_create_cali_ctrls(tas_priv);
>  		if (ret) {
> @@ -1722,6 +1724,7 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
>  		case TAS2781:
>  		case TAS5825:
>  		case TAS5827:
> +		case TAS5828:
>  			/* If DSP FW fail, DSP kcontrol won't be created. */
>  			tasdevice_dsp_remove(tas_priv);
>  		}
> @@ -1884,6 +1887,7 @@ static int tasdevice_codec_probe(struct snd_soc_component *codec)
>  		break;
>  	case TAS5825:
>  	case TAS5827:
> +	case TAS5828:
>  		p = (struct snd_kcontrol_new *)tas5825_snd_controls;
>  		size = ARRAY_SIZE(tas5825_snd_controls);
>  		break;
> @@ -2056,6 +2060,7 @@ static const struct acpi_device_id tasdevice_acpi_match[] = {
>  	{ "TXNW2781", TAS2781 },
>  	{ "TXNW5825", TAS5825 },
>  	{ "TXNW5827", TAS5827 },
> +	{ "TXNW5828", TAS5828 },
>  	{},
>  };
>  
> -- 
> 2.25.1
> 
