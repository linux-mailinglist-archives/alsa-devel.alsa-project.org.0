Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC1D7A63F0
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 14:56:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFB39DED;
	Tue, 19 Sep 2023 14:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFB39DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695128166;
	bh=MKGWj10s0LzlKHDo7ioTm3ob1t9hdozjsCfBOJ3qY0M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eoVwk7HKHwtd0BRfmk9ZHDEOZDnzHZMP+QGKwQ6A8SbRmQUGM9u4f4ZmiUazdaUgI
	 kIEBB82kW3xm2MYWx+Pai6DOUeyY95t+UQ25IulzSG1X/8aQdDUbiRO2fHe3gai+np
	 /h5ScggHcyjxW9BS8PmrCMS/G61ErLVbjzLwIENY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E62DF80551; Tue, 19 Sep 2023 14:55:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C88E3F801F5;
	Tue, 19 Sep 2023 14:55:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D30EF8025A; Tue, 19 Sep 2023 14:55:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2880AF800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 14:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2880AF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=JTT0Jyv9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7TyUSbAk
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 88A8C228FA;
	Tue, 19 Sep 2023 12:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695128108;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F5nKKjHZtD/Augg+WrVX8pmsTZsQzi+peKQWlUjxsVs=;
	b=JTT0Jyv9Qzc3v9LdOO/p5zp7CSGybbyzE6OQHK0+WIYaUZ4XNx98r+N+8j5OsUa0k0p4wl
	rRhEwrAuQuTKf1q5ptZ+/0EdjXXLKFbOJSuu4yi+5jIZcUJ55zdpDnWgWs+pC57g+F8yjX
	jS8/rs3OhAq2EM7mz7yssyv7nFsdsX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695128108;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F5nKKjHZtD/Augg+WrVX8pmsTZsQzi+peKQWlUjxsVs=;
	b=7TyUSbAkPxX0Ne+iy6bTZggfBcli4Bxug7n8Gh/UACaGdN9k6pkByiw/Niqw93eYP7DJeI
	rq+mHW1gdoTarSBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 58C3F13458;
	Tue, 19 Sep 2023 12:55:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id lRswFCyaCWUYIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 19 Sep 2023 12:55:08 +0000
Date: Tue, 19 Sep 2023 14:55:07 +0200
Message-ID: <875y46xqz8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: broonie@kernel.org,
	alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	kai.vehmanen@linux.intel.com
Subject: Re: [PATCH] ASoC: hdac_hda: add HDA patch loader support
In-Reply-To: <20230919083209.1919921-1-yung-chuan.liao@linux.intel.com>
References: <20230919083209.1919921-1-yung-chuan.liao@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 7VJ4KNQW6SQBECKNTL4H4SZR4FXWZXEP
X-Message-ID-Hash: 7VJ4KNQW6SQBECKNTL4H4SZR4FXWZXEP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7VJ4KNQW6SQBECKNTL4H4SZR4FXWZXEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 10:32:09 +0200,
Bard Liao wrote:
> 
> +#ifdef CONFIG_SND_HDA_PATCH_LOADER
> +static char *loadable_patch[SNDRV_CARDS];

Hm, this size looks wrong.

In the code later in this patch, dev_index points to the codec
address, and it's basically irrelevant with SNDRV_CARDS.  As
SNDRV_CARDS might be 8 depending on the config, it can go beyond the
array size, too.  Use a different array size to match with the codec
address ranges.

> +module_param_array_named(patch, loadable_patch, charp, NULL, 0444);
> +MODULE_PARM_DESC(patch, "Patch file for Intel HD audio interface.");

Better to give a bit more description; when it's a codec address
array, it can be  non-zero, and user may wonder why it's not applied.

> +#ifdef CONFIG_SND_HDA_PATCH_LOADER
> +	if (loadable_patch[hda_pvt->dev_index] && *loadable_patch[hda_pvt->dev_index]) {
> +		dev_info(&hdev->dev, "Applying patch firmware '%s'\n",
> +			 loadable_patch[hda_pvt->dev_index]);
> +		ret = request_firmware(&hda_pvt->fw, loadable_patch[hda_pvt->dev_index],
> +				       &hdev->dev);
> +		if (ret < 0)
> +			goto error_no_pm;
> +		if (hda_pvt->fw) {
> +			ret = snd_hda_load_patch(hcodec->bus, hda_pvt->fw->size, hda_pvt->fw->data);
> +			if (ret < 0) {
> +				dev_err(&hdev->dev, "failed to load hda patch %d\n", ret);
> +				goto error_no_pm;
> +			}
> +			release_firmware(hda_pvt->fw);
> +			hda_pvt->fw = NULL;

So the hda_pvt->fw is only for a temporary use, already released
already here.  Then...

> --- a/sound/soc/codecs/hdac_hda.h
> +++ b/sound/soc/codecs/hdac_hda.h
> @@ -26,6 +26,10 @@ struct hdac_hda_priv {
>  	struct hda_codec *codec;
>  	struct hdac_hda_pcm pcm[HDAC_DAI_ID_NUM];
>  	bool need_display_power;
> +	int dev_index;
> +#ifdef CONFIG_SND_HDA_PATCH_LOADER
> +	const struct firmware *fw;
> +#endif

... we don't have to add a new extra field, right?


thanks,

Takashi
