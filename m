Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A53A39FA48
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 17:22:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00C0F17C3;
	Tue,  8 Jun 2021 17:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00C0F17C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623165749;
	bh=8mnu5Kqia/91Rj46qjzhMH2lfFtaLRNP/T+I75cYFOg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S76ljSegsZ9W8UpUgJ1ypnHgfhSiXrXsR6Y2WIK3FxClZgA2IHVcov2QsFpCYWzKt
	 5OAHzb7NKg4INk/fCFOi/ckudV4mLIQTynv0Nk9FyLD4CPC5ZFC1QkrZqAOuA4n/vi
	 NgeX81f04hcq8JiioU7P8urcMi2miQrLl3NxBJ70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ED09F804BD;
	Tue,  8 Jun 2021 17:20:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 742BAF800FD; Tue,  8 Jun 2021 17:20:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9C70F800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 17:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9C70F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rVbGga0Y"
Received: by mail-wm1-x32c.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so2222907wmd.5
 for <alsa-devel@alsa-project.org>; Tue, 08 Jun 2021 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9hSTH6iFfhk4YNZO/PD9dC5EfuAvuq3JWTMQoezRpa4=;
 b=rVbGga0YMt9v4RX5dgluDTeRiWVagmxiI0r5XffEEGtnBUTGgfpdr8TilsetE54+aG
 W+49JL8h9wKLOfe2XEo8MUlmzM5apk577/ud4NiVAdwH7A60G3aHuxZGXSoBUHf2D496
 glgWg5l6oifVXTG1gPto4Qv820VWcm3Lzpb8VutkEgH3k31hrPNLcFzbkdaYh2JdgPtw
 6s41/4/GuEVBDCpHCFDTk7MgZUXOyg1ldFA0euDOCnUtKrdGK/JbAZCssNpZ29sePJzm
 t2X3aymp+IbTcoOYt7eJV/cXyLo24gbfnedJf01l5+H4fXemCe9VDCIlVEYmF5SmBo4H
 O3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9hSTH6iFfhk4YNZO/PD9dC5EfuAvuq3JWTMQoezRpa4=;
 b=tOjRg2GiLIVAXk7kRbD8AF0u0FuOkNyOaULSRU5e3gfX2yPwdMQj0SLTNqTDdov+Wr
 oFJjhRDrlNhY8CReMYXTimWwh0t98dsxqXXXOPGP9Gy5cFLO7LHInyDH4Ou5oDVqch+t
 iFe/Xfk/2VRB0uFI3S539XK2fjZOTUuk3r/tzUEQ7md/YQcosxhn/Lk9wn/SdaAuJYp9
 IDNGphH4XOTUUWJbZayaQ+w3MThtGuJvSZCh+55qj1Nos7649bq+xZEeswQ48qaR15/q
 kdtBXrtXY+RTq+d5uZyKaKdoyrLA9TrIzRXmz4psptGGnKWZHvolyhpp5g+4shPthF2Q
 QSmg==
X-Gm-Message-State: AOAM530dJhVzQmLt38PHQswpCKUkfnJL4zOzW8KtNR+EsZm/C2SYc7TP
 +qS9P/a+/IbcZRDJRLNegL1LsQ==
X-Google-Smtp-Source: ABdhPJyxapM48QVF45aLpo2H+FUZRplP63/n5liTflATtO1NCzwg7X8/1DrHPmn3DkqJrHfE7tmETA==
X-Received: by 2002:a7b:c44f:: with SMTP id l15mr4870340wmi.151.1623165632463; 
 Tue, 08 Jun 2021 08:20:32 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id b26sm3123109wmj.25.2021.06.08.08.20.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Jun 2021 08:20:32 -0700 (PDT)
Subject: Re: [PATCH v8 6/9] ASoC: codecs: wcd938x: add basic controls
To: Mark Brown <broonie@kernel.org>
References: <20210601113158.16085-1-srinivas.kandagatla@linaro.org>
 <20210601113158.16085-7-srinivas.kandagatla@linaro.org>
 <20210608135933.GE4200@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e8ca16d9-f179-c6de-d683-21180ea4ed1b@linaro.org>
Date: Tue, 8 Jun 2021 16:20:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210608135933.GE4200@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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



On 08/06/2021 14:59, Mark Brown wrote:
> On Tue, Jun 01, 2021 at 12:31:55PM +0100, Srinivas Kandagatla wrote:
> 
>> +static int wcd938x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
>> +				   struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
>> +	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
>> +
>> +	wcd938x->hph_mode = ucontrol->value.enumerated.item[0];
>> +
>> +	return 0;
>> +}
> 
> _put() should return true if it made a change, the same bug is present
> in a lot of other drivers too.
> 
Sure will fix this in next spin

>> +static const struct snd_kcontrol_new wcd9380_snd_controls[] = {
>> +	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum_wcd9380,
>> +		     wcd938x_rx_hph_mode_get, wcd938x_rx_hph_mode_put),
>> +	SOC_ENUM_EXT("TX0 MODE", tx_mode_mux_enum_wcd9380[0],
>> +		     wcd938x_tx_mode_get, wcd938x_tx_mode_put),
>> +	SOC_ENUM_EXT("TX1 MODE", tx_mode_mux_enum_wcd9380[1],
>> +		     wcd938x_tx_mode_get, wcd938x_tx_mode_put),
>> +	SOC_ENUM_EXT("TX2 MODE", tx_mode_mux_enum_wcd9380[2],
>> +		     wcd938x_tx_mode_get, wcd938x_tx_mode_put),
>> +	SOC_ENUM_EXT("TX3 MODE", tx_mode_mux_enum_wcd9380[3],
>> +		     wcd938x_tx_mode_get, wcd938x_tx_mode_put),
>> +};
> 
> Please don't use this pattern of indexing into arrays by absolute
> number, it's error prone and hard to read.  Just declare static
> variables for the enums and reference them individually.

I agree, will clean these instances in next version.

--srini
> 
