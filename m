Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FB036F726
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Apr 2021 10:33:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3EED1682;
	Fri, 30 Apr 2021 10:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3EED1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619771582;
	bh=1TWENvhBGSaRE2nrkQGyfc7ZMQgHJuoeCPhf0cBLw/E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QZJ2KOA/yAnI0a4PhWMfDS3MjJDIC7ZwzRQZURr36eSfbc/eDwsjxMOtFdpxWUIY7
	 Npr2zFgHC5qezjZz1zwHUSkCEv+/vfYqvEJQh++iW5ogpX1lKVCRVs0cBimyX4IfS5
	 aMd5siBZYO6ulRFSxBFh7P8+6/SRu0zYJoR9dzrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DF15F80165;
	Fri, 30 Apr 2021 10:31:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37AC2F8016C; Fri, 30 Apr 2021 10:31:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98600F8012B
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 10:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98600F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="K3FRPCTI"
Received: by mail-wr1-x429.google.com with SMTP id k14so19668759wrv.5
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I0ktwXj/LufSDPcWIwR3A5LuKeogVGJ5D0aKzv45ni0=;
 b=K3FRPCTIOIcVfiM0ikTVUZ3B7q7yS5+SWHMujMW3/BgCEhHutSOBoeb0898FV39FxT
 mqSxqwkOo1C5lJTz+zcuBI0f50DMWz20m/Ok9rQGuJdnWfZG4JgQz0qUIzaO2ablgg5W
 NkczboABhPeV3qoIDLElyeSpYNN7br7gA0QsoLWTMG/N0JoYz77cVWjHYb3izoDXLcMB
 RieL5ogADKcxmPQcouMikRV2Ga+BmTJgEggatDH1KAOFdkKHw5cu2F6DMfVIlBHhlW12
 d1nfBps3hwhCt5X4XAoNACsrIgUj/kNkeK4aNqtHxu3aYBt0AE2k3oMxd/xL3bZFYSmz
 lvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=I0ktwXj/LufSDPcWIwR3A5LuKeogVGJ5D0aKzv45ni0=;
 b=ZulD+3fmPVCtWQwf4B/8ZoWAp0kxU0HsLSVZHV+dKSTLI6cWQH00btIM0KYXI8LTYw
 +nUzcq/BJRl6y5FtDL1b0kTMKeZxSu5hXRWuWPSpTKe+ZNaBXTscxbpjfifdv4MbXerk
 RpxE36QF8A+2fYkVTgOwpkyRnvnEgl/JoUWa5HHLlbqYvbypiMSf0J46crD1jQf1zwZA
 DxycRrJC/Tj/Hf3R8U/w7Y2sjAcAr7yGshUWC3opf7Fjzf21nXHWv0wWQEUs2glMoqbO
 rhL6SZm4LgrSPJaLu22NRoYhUU8E+3FLiPasAsUhjMNrR4ZBwUvbP2Mn/zRBnf1ZElsM
 BuQg==
X-Gm-Message-State: AOAM531eBIkBNue8Qsn76Z3m/bKLwp0LovOIsduOy5ehbShI1/IHLbeh
 n5pRMSViwE5gewvFwsYzT7OL8Q==
X-Google-Smtp-Source: ABdhPJw9xLve5QbQXAL8IJ5O7GPw9kwlS+yguKzOeJ+oWdNivqpvwzKU4zA1UTZYbWOcU3Iijj4iTA==
X-Received: by 2002:adf:ff89:: with SMTP id j9mr5243182wrr.416.1619771474844; 
 Fri, 30 Apr 2021 01:31:14 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:4a89:8c32:4adc:fc67?
 ([2a01:e0a:90c:e290:4a89:8c32:4adc:fc67])
 by smtp.gmail.com with ESMTPSA id s10sm1433195wrt.23.2021.04.30.01.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 01:31:14 -0700 (PDT)
Subject: Re: [PATCH] ASoC: meson: g12a-toacodec: add support for SM1 TOACODEC
To: Jerome Brunet <jbrunet@baylibre.com>, broonie@kernel.org
References: <20210429170147.3615883-1-narmstrong@baylibre.com>
 <1jo8dx9ec5.fsf@starbuckisacylon.baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <d2e9fc82-1483-e4d0-db10-6c11d9fdbba9@baylibre.com>
Date: Fri, 30 Apr 2021 10:31:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1jo8dx9ec5.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 29/04/2021 19:43, Jerome Brunet wrote:
> 
> On Thu 29 Apr 2021 at 19:01, Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
> 
>>  
>> +static int sm1_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
>> +				     struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component =
>> +		snd_soc_dapm_kcontrol_component(kcontrol);
>> +	struct snd_soc_dapm_context *dapm =
>> +		snd_soc_dapm_kcontrol_dapm(kcontrol);
>> +	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
>> +	unsigned int mux, changed;
>> +
>> +	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
>> +	changed = snd_soc_component_test_bits(component, e->reg,
>> +					      CTRL0_DAT_SEL_SM1,
>> +					      FIELD_PREP(CTRL0_DAT_SEL_SM1, mux));
>> +
>> +	if (!changed)
>> +		return 0;
>> +
>> +	/* Force disconnect of the mux while updating */
>> +	snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
>> +
>> +	snd_soc_component_update_bits(component, e->reg,
>> +				      CTRL0_DAT_SEL_SM1 |
>> +				      CTRL0_LRCLK_SEL_SM1 |
>> +				      CTRL0_BCLK_SEL_SM1,
>> +				      FIELD_PREP(CTRL0_DAT_SEL_SM1, mux) |
>> +				      FIELD_PREP(CTRL0_LRCLK_SEL_SM1, mux) |
>> +				      FIELD_PREP(CTRL0_BCLK_SEL_SM1, mux));
>> +
>> +	/*
>> +	 * FIXME:
>> +	 * On this soc, the glue gets the MCLK directly from the clock
>> +	 * controller instead of going the through the TDM interface.
>> +	 *
>> +	 * Here we assume interface A uses clock A, etc ... While it is
>> +	 * true for now, it could be different. Instead the glue should
>> +	 * find out the clock used by the interface and select the same
>> +	 * source. For that, we will need regmap backed clock mux which
>> +	 * is a work in progress
>> +	 */
>> +	snd_soc_component_update_bits(component, e->reg,
>> +				      CTRL0_MCLK_SEL,
>> +				      FIELD_PREP(CTRL0_MCLK_SEL, mux));
>> +
>> +	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
>> +
>> +	return 0;
>> +}
> 
> Instead of duplicating this function, I'd prefer if you could use regmap fields
> 
> 

Sure, will do
