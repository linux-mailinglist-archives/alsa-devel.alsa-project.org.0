Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0077138A7
	for <lists+alsa-devel@lfdr.de>; Sun, 28 May 2023 10:07:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C0B1207;
	Sun, 28 May 2023 10:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C0B1207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685261234;
	bh=N8ScCwkkoceob3+EyPm7iImd8y4UEVuw/FbZiegQDwU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CA859ahp+vwMDkH4WcbR1g8mHa5ut7StMPuBcE2OCssczu8LLZReLZFOMUhgC9wWj
	 iNlVzZst52HnbPb96U3VzWPxpUUQzUeGuLQjBsQQHzzIuknNIHFD4a54Bxf1eZ7Fr6
	 Q+/KJuQtmoY6PiW4M1BkY3j7xDYXykEsrytGPm6U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C469EF8042F; Sun, 28 May 2023 10:06:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71160F8026A;
	Sun, 28 May 2023 10:06:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1507F8042F; Sun, 28 May 2023 10:05:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr
 [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D0D9F80149
	for <alsa-devel@alsa-project.org>; Sun, 28 May 2023 10:05:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D0D9F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=da7Gaqa1
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 3BObqyyRbSNCw3BObqcWTO; Sun, 28 May 2023 10:05:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1685261105;
	bh=Aow8pWzrNqwHcvHDs8g+PZ6GllTfm+wuifMcD2uUgs0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=da7Gaqa1dFgD6ePmQxiIr6dmbG7gWBMdTdTkkmz0rVpOOONkTDVwWz8NLjbsPXQQ8
	 yW481GJfWc2sDtrFmldMfluVKqb64LyFtJLIpRTS5mXErMDqu1loIRs4CUKWuJyz0P
	 o7Edp3htAEr/fNqQfsAzPhwMPsTAJC+EtOauKpyRj1YpxdM0L37MT2Yzm1DRB5ONT9
	 agXfddg7SdjKiPUC447W1SqbON5kuGDZQNQbl7FBnN0lSO8o9v9R8EPfdTV0qe386r
	 KckPhYejcCop7RQQnOvFGyL8EdwW8M25Aq7RPsrubiC00H0jTPTkaiYm5PQ1YCXQsR
	 oHOU6kIvu7gOA==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 28 May 2023 10:05:05 +0200
X-ME-IP: 86.243.2.178
Message-ID: <1eb0d507-2017-4057-272b-cb3c298fa990@wanadoo.fr>
Date: Sun, 28 May 2023 10:04:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 3/6] ASoC: tas2781: Add tas2781 driver
Content-Language: fr
To: Shenghao Ding <13916275206@139.com>
Cc: Ryan_Chu@wistron.com, Sam_Wu@wistron.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, devicetree@vger.kernel.org, gentuser@gmail.com,
 kevin-lu@ti.com, krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, navada@ti.com, peeyush@ti.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, robh+dt@kernel.org,
 shenghao-ding@ti.com, tiwai@suse.de, x1077012@ti.com
References: <20230527223537.9686-1-13916275206@139.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230527223537.9686-1-13916275206@139.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HOAGOAROOIPTICSZJUZCAVJKEIXWUNY5
X-Message-ID-Hash: HOAGOAROOIPTICSZJUZCAVJKEIXWUNY5
X-MailFrom: christophe.jaillet@wanadoo.fr
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HOAGOAROOIPTICSZJUZCAVJKEIXWUNY5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 28/05/2023 à 00:35, Shenghao Ding a écrit :
> Create tas2781 driver.
> 
> Signed-off-by: Shenghao Ding <13916275206-7R9yAhoRP9E@public.gmane.org>
> 
> ---
> Changes in v4:
>    - fixed issue| Reported-by: kernel test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>      | Closes: https://lore.kernel.org/oe-kbuild-all/202305192322.gBZ4JIyr-lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org/
>   Changes to be committed:
> 	modified:   sound/soc/codecs/Kconfig
> 	modified:   sound/soc/codecs/Makefile
> 	new file:   sound/soc/codecs/tas2781-comlib.c
> 	new file:   sound/soc/codecs/tas2781-i2c.c
> ---
>   sound/soc/codecs/Kconfig          |  25 +
>   sound/soc/codecs/Makefile         |   6 +
>   sound/soc/codecs/tas2781-comlib.c | 581 +++++++++++++++++++++++
>   sound/soc/codecs/tas2781-i2c.c    | 736 ++++++++++++++++++++++++++++++
>   4 files changed, 1348 insertions(+)
>   create mode 100644 sound/soc/codecs/tas2781-comlib.c
>   create mode 100644 sound/soc/codecs/tas2781-i2c.c

[...]

> +static void tasdev_dsp_prog_blk_remove(struct tasdevice_prog *prog)
> +{
> +	struct tasdevice_data *im;
> +	struct tasdev_blk *blk;
> +	unsigned int nr_blk;

Purely a mater of style, but 'i' is more common, and less verbose.
(same in tasdev_dsp_cfg_blk_remove() below)

> +
> +	if (!prog)
> +		return;
> +
> +	im = &(prog->dev_data);
> +
> +	if (!im->dev_blks)
> +		return;
> +
> +	for (nr_blk = 0; nr_blk < im->nr_blk; nr_blk++) {
> +		blk = &(im->dev_blks[nr_blk]);
> +		kfree(blk->data);
> +	}
> +	kfree(im->dev_blks);
> +}

[...]

> +static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
> +	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
> +	int ret = 0;
> +
> +	if (tas_priv->rcabin.profile_cfg_id !=
> +		ucontrol->value.integer.value[0]) {
> +		tas_priv->rcabin.profile_cfg_id =
> +			ucontrol->value.integer.value[0];
> +		ret = 0;

So 'ret' is always 0?
Is it what is expected?
If so, removing 'ret' and having return 0; below, looks fine.

Stop reading here. There seems to be a mix-up with patch 4/6.

CJ

