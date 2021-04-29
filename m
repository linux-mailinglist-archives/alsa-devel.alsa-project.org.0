Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C9736EF12
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Apr 2021 19:44:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FDCA168F;
	Thu, 29 Apr 2021 19:44:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FDCA168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619718290;
	bh=eqerFrn0a8/m7d9wACpJ6TbSLY6NtgtmBgsRtXakv/I=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kKiwhDUXg1nZpegEuWFXpIWvTvaXlVmSwFxjvh2rDBczTCEnzIyocYtgOae0F/VlB
	 w1i1diysCwPDcjNE7kmVlzl0Zfw/R4FZ1LLmKjUgiyKL/yTD/bmG6NymJBuF35a6EY
	 Z2cqBgI0nWcoQGhsZIcPm/Nv5UHliHOg37R28ryg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFBECF800E4;
	Thu, 29 Apr 2021 19:43:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C538F801EC; Thu, 29 Apr 2021 19:43:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C1AAF80117
 for <alsa-devel@alsa-project.org>; Thu, 29 Apr 2021 19:43:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C1AAF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="Kiq0l4ri"
Received: by mail-ej1-x633.google.com with SMTP id l4so101085491ejc.10
 for <alsa-devel@alsa-project.org>; Thu, 29 Apr 2021 10:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=BRjhSBhHMw0cfh8McFGX3T1RGcT74vqYpGonK7mWYDI=;
 b=Kiq0l4riPAKiNrT7WJO38D0K2S1WMBBF2WDDoJYhcaFGNwXSu6bwya5fgqLoocpIPD
 OsdN/9XBiFLxC8xL4EdVJp+Xrvc9Wti1b8t1aPWQWuH1msE9XiPLnG/NE6OpkTQBsD5j
 pMMWNN3OJOJmB00zYIioJfkMihUkBabKT6p+oP0ATQUZ/sr1nbp0An9yeszAe4Y7mtZR
 BBqr9c8jl3OFLieEYDvoVUb0gahKb766iwSp0mvFTeYJo/ddUY00IBk3YfgT8BzDTwHQ
 cy7OEJwYCiCOnfZ+8OL2Eyv/gnCBDDnkgiX8B4JZvXl4H05uO+OQCquxXTaGQ0bHM6/a
 RKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=BRjhSBhHMw0cfh8McFGX3T1RGcT74vqYpGonK7mWYDI=;
 b=XwQA8lN7u9ra7zDBEa9KRhdY8meZ06RvYWLsBKxvS4qLDICkSh08aplf5PaOdiLFUe
 bKdyQS0yNl3RRuHP6IVUGzGsE3xVf0kiIVkJjKkinlR+oYAYDdFsSvkqmX1kz4y/qwJr
 4clFz6730WQKPrihcAmQ4JRVVoFVR2BEUFMkRQKVHK5xqNaNuY/Jjz4c2HPvEyon6ELb
 fpm81RrxFlucq/CHVCfMK/mn+l0cnlpI1JgXE3wY7GCoeb/nwYJjne0/0L/NHcNTVHUJ
 2pgp4aGmGOdyTb3CZcr2hFZPnobw9g/Rgy4BBniH7xTWmLs3kVTl8s2Xfew3QtpWAp8X
 od0g==
X-Gm-Message-State: AOAM530Xt+8LFazw40HvsusGtqk8UI0vq03Yt5NB6huHl3OU+vYS7CWX
 STANiujp8U7vGHYUxyEFZG6v5g==
X-Google-Smtp-Source: ABdhPJx1ZgmV97KuEwi9+JdPZAVO4jUb2ew4j//svpTXFE+Kseaa2P/yi/AHDBRde4cmoKrvVSnHGw==
X-Received: by 2002:a17:906:6544:: with SMTP id
 u4mr1065841ejn.455.1619718187971; 
 Thu, 29 Apr 2021 10:43:07 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id d5sm2877135edt.49.2021.04.29.10.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 10:43:07 -0700 (PDT)
References: <20210429170147.3615883-1-narmstrong@baylibre.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, broonie@kernel.org
Subject: Re: [PATCH] ASoC: meson: g12a-toacodec: add support for SM1 TOACODEC
In-reply-to: <20210429170147.3615883-1-narmstrong@baylibre.com>
Message-ID: <1jo8dx9ec5.fsf@starbuckisacylon.baylibre.com>
Date: Thu, 29 Apr 2021 19:43:06 +0200
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Thu 29 Apr 2021 at 19:01, Neil Armstrong <narmstrong@baylibre.com> wrote:


>  
> +static int sm1_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
> +				     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_kcontrol_component(kcontrol);
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_dapm_kcontrol_dapm(kcontrol);
> +	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
> +	unsigned int mux, changed;
> +
> +	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
> +	changed = snd_soc_component_test_bits(component, e->reg,
> +					      CTRL0_DAT_SEL_SM1,
> +					      FIELD_PREP(CTRL0_DAT_SEL_SM1, mux));
> +
> +	if (!changed)
> +		return 0;
> +
> +	/* Force disconnect of the mux while updating */
> +	snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
> +
> +	snd_soc_component_update_bits(component, e->reg,
> +				      CTRL0_DAT_SEL_SM1 |
> +				      CTRL0_LRCLK_SEL_SM1 |
> +				      CTRL0_BCLK_SEL_SM1,
> +				      FIELD_PREP(CTRL0_DAT_SEL_SM1, mux) |
> +				      FIELD_PREP(CTRL0_LRCLK_SEL_SM1, mux) |
> +				      FIELD_PREP(CTRL0_BCLK_SEL_SM1, mux));
> +
> +	/*
> +	 * FIXME:
> +	 * On this soc, the glue gets the MCLK directly from the clock
> +	 * controller instead of going the through the TDM interface.
> +	 *
> +	 * Here we assume interface A uses clock A, etc ... While it is
> +	 * true for now, it could be different. Instead the glue should
> +	 * find out the clock used by the interface and select the same
> +	 * source. For that, we will need regmap backed clock mux which
> +	 * is a work in progress
> +	 */
> +	snd_soc_component_update_bits(component, e->reg,
> +				      CTRL0_MCLK_SEL,
> +				      FIELD_PREP(CTRL0_MCLK_SEL, mux));
> +
> +	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
> +
> +	return 0;
> +}

Instead of duplicating this function, I'd prefer if you could use regmap fields


