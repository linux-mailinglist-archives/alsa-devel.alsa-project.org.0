Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FD574D94E
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 16:48:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C9586C1;
	Mon, 10 Jul 2023 16:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C9586C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689000528;
	bh=uhdYL5lWd0uqmi0Jh3pZuPe3U6haloYTX5FrCwaGV1s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yypi5Cl9iaVZZ2/bgwiG23IkzWSSErwySavLxlr9wzX8Dwr5IMDe3PzZKGw2/MjFl
	 NYfrevICAnBKaTLpdfgOCV35gQTMRCQ1dukESGexAyyhYF6yBqaBBRcaojqAkwqaN5
	 BGoHd3wdpDqMnnHUgHknRXQeRhVphthzBLrWexK4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8A20F80093; Mon, 10 Jul 2023 16:47:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5738FF80153;
	Mon, 10 Jul 2023 16:47:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91293F80249; Mon, 10 Jul 2023 16:47:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5DE6F80093
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 16:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5DE6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=wUnUmdDi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QydSZCJb
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ECEAF21CA3;
	Mon, 10 Jul 2023 14:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689000441;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q+1Q5IqVM4jiy8w9gyxY+YF8o42gE208jNH/45cti5Y=;
	b=wUnUmdDiJSqdoz3B0jXxqRF3kTWxJQz1nybKGSlco4yStjqHgWyYeyKwVNnuRgpyQ7KMIT
	WlIWN7xv/Rb/jKYTr8tI/Y863fvZp58mBtDvyJv1G1zmVT3396zh0+asxRpgRQtwJxNwfz
	Qk9wUYgVyXg10tqt5tcLpa+BvQxTZzQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689000441;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q+1Q5IqVM4jiy8w9gyxY+YF8o42gE208jNH/45cti5Y=;
	b=QydSZCJbBRa8iINwFoStHdiU0aw+t9lVdxnsQeIq1VojcEFCrtPKvOiqA/nGBiu+0DU29c
	IOyefZK13erea/Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9DFA013A05;
	Mon, 10 Jul 2023 14:47:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id QYy0JfkZrGR0TAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 10 Jul 2023 14:47:21 +0000
Date: Mon, 10 Jul 2023 16:47:21 +0200
Message-ID: <871qhfzuva.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <13916275206@139.com>
Cc: broonie@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	pierre-louis.bossart@linux.intel.com,
	kevin-lu@ti.com,
	shenghao-ding@ti.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com,
	mengdong.lin@intel.com,
	x1077012@ti.com,
	peeyush@ti.com,
	navada@ti.com
Subject: Re: [PATCH v2 2/3] ALSA: hda/tas2781: Add tas2781 HDA driver
In-Reply-To: <20230710041217.151099-2-13916275206@139.com>
References: <20230710041217.151099-1-13916275206@139.com>
	<20230710041217.151099-2-13916275206@139.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 35WIRYY6A2AAMXHAFGNXF4JY6G7WAE6S
X-Message-ID-Hash: 35WIRYY6A2AAMXHAFGNXF4JY6G7WAE6S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/35WIRYY6A2AAMXHAFGNXF4JY6G7WAE6S/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 10 Jul 2023 06:12:16 +0200,
Shenghao Ding wrote:
> 
> Create tas2781 side codec HDA driver for Lenovo Laptops. The quantity
> of the speakers has been define in ACPI. All of the tas2781s in the
> laptop will be aggregated as one audio speaker. The code supports
> realtek codec as the primary codec. Code offers several controls for
> digtial/analog gain setting during playback, and other for eq params
> setting in case of different audio profiles, such as music, voice,
> movie, etc.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>
> 
> ---
> Changes in v2:
>  - All the controls set as const static
>  - Add descriptions for tas2781_save_calibration
>  - remove global addr handling in the code
>  - checking subid in switch statement in function tas2781_hda_bind
>  - add force firmware load Kcontrol
>  - rename the kcontrol name to be more undertandable
>  - remove Superfluous cast in tasdevice_fw_ready
>  - correct weird line break in function tas2781_acpi_get_i2c_resource
>  - correct Referencing adev after acpi_dev_put() in tas2781_hda_read_acpi
>  - As to checking the given value in tasdevice_set_profile_id, it seems done
>    by the tasdevice_info_profile
>  - replace strcpy with strscpy in tas2781_hda_read_acpi
>  - rewrite the subid judgement
>  - Add tiwai@suse.de into Cc list
>  - remove the cast in tas2781_acpi_get_i2c_resource
>  - remove else in tas2781_acpi_get_i2c_resource
>  - fix the return value in tasdevice_set_profile_id
>  - remove unneeded NL in tasdevice_config_get
>  - Unifiy the comment style
>  - remove ret = 0 in tasdevice_fw_ready
>  - remove ret in tas2781_save_calibration
>  - remove unused ret in tas2781_hda_playback
>  - add force firmware load Kcontrol

The new version looks much better.  Another few minor comments:

> +static int tas2781_acpi_get_i2c_res(struct acpi_resource *ares,
> +	void *data)

The indentation could be improved in this patch, too.
Not only this line but in many places.

> +static int tas2781_hda_read_acpi(struct tasdevice_priv *tas_priv,
> +	const char *hid)
> +{
...
> +err:
> +	dev_err(tas_priv->dev, "Failed acpi ret: %d\n", ret);

Too ambiguous error message.  It's hard to spot what the error is only
from this text.

> +static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +	int ret = 0;
> +
> +	if (tas_priv->rcabin.profile_cfg_id !=
> +		ucontrol->value.integer.value[0]) {
> +		tas_priv->rcabin.profile_cfg_id =
> +			ucontrol->value.integer.value[0];

You should have a sanity check of the given values.  User-space may
pass any arbitrary value, and ALSA core doesn't always filter invalid
values.  Ditto for other *_put() callbacks.

> +static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
> +{
> +	const unsigned char page_array[CALIB_MAX] = {
> +		0x17, 0x18, 0x18, 0x0d, 0x18
> +	};

Missing static.

> +	const unsigned char rgno_array[CALIB_MAX] = {
> +		0x74, 0x0c, 0x14, 0x3c, 0x7c
> +	};

Ditto.

> +static void tas2781_hda_remove(struct device *dev)
> +{
> +	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
> +
> +	pm_runtime_get_sync(tas_priv->dev);
> +	pm_runtime_disable(tas_priv->dev);
> +
> +

Too many blank lines.


thanks,

Takashi
