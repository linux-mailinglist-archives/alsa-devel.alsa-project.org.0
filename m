Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 100EF2A4544
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 13:33:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BBFB1742;
	Tue,  3 Nov 2020 13:32:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BBFB1742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604406822;
	bh=RuyZkk19LqRXyL4XbhTgocmpTiG36SfRQF8ad0UIbUA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jGurViVLMWaKHdnZ1oFwmjwGhsHh4UM3UjoKLdYDeGOjD4Ix7LW7eAD5WzWv0+kLJ
	 uDTegJSrrFXpMIDbAo+j2S/AO5i9nqBjUvMYiK7rnF/NirhfoH28aE1UGVmoLvedpq
	 8GyTP1rVtxJwmRymlmx/GHmBRUANL+Hd96lQ+8R8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFA3AF804BB;
	Tue,  3 Nov 2020 13:31:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2039CF804B4; Tue,  3 Nov 2020 13:31:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 749F6F80279
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 13:31:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 749F6F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zwxC+iwJ"
Received: by mail-wm1-x344.google.com with SMTP id e2so12605683wme.1
 for <alsa-devel@alsa-project.org>; Tue, 03 Nov 2020 04:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j00fZvd5E25LdZWEzbk/1r7+kTge0offgTqgLngChuU=;
 b=zwxC+iwJptDjgiLVGWFM2MWY7tm/VXVdLIdMZtY1HfjuCcNxbWUJbcbj7rgGaccdF/
 oxUFoIPE+H2jh9ZiucjG5gsB8/wX7QdyFyAOWnjyDifHt6h9gbO7eBtFWTo8ahF8VOQZ
 9jksT6eBdGLYlmzScWMr1nODC1Qn6xkHXz1FJ6TQ9F+05aXheM7nkx72jJp8Z9D8b/4i
 gupaGs8o44QOC6/e3DmhysXcyyKFfFXxuebxG9Z5ILw75WbRboNtSeJhDSc30KvsEybS
 XyccheUV3JXBzLEwVR66FzaysD4dVpIfJkdRChQDMNPcgThoegLW0RDv9nxDW88+D88T
 Jd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j00fZvd5E25LdZWEzbk/1r7+kTge0offgTqgLngChuU=;
 b=lfefiSgLrLlc+1O1RZe/W9VzHMOMVUfHZnLbjWvlg7zIjx8QNbgRJ1sz48EIQ2S+by
 hOH7pQeB9eIAbGReaYbAFsL6xZYwxQQCSRRt+3FdB1XUCNsqs+neXEWXW8vXJj6wKcCV
 T74/JQhPVasGu67xJceqYN55MrR7HD/IoTBtHzh/JPwfL5+kp6yisRiqI4h6n8gGag8a
 x8B4YX1ji2iEnV1UQhwMDj+ltKSg5d22rXfW0ziTfVJJX5GH+FTPzRVRtuBb6w8J0mcd
 NHRsnJ9/M5g40X5hamObowbCIq8kat4FQRk1JtuhMY03SPqPPCRVyaapNFu1hR8zPmHq
 rmBw==
X-Gm-Message-State: AOAM531H4R4+7P/vSPlZ5okdwbjULbJEZ9zktwM4KFQkhNMqt1tkCtsW
 V3N/kI3LZX1ATpV7KaKwGjfK4w==
X-Google-Smtp-Source: ABdhPJw6nHTW43cCaBSUzJOKY5E/eZzzP3IlKaa7CbmY90z+f/wk/4UnhiYk363o9nYD0FBPq3OYxg==
X-Received: by 2002:a1c:1b85:: with SMTP id b127mr3563167wmb.163.1604406697450; 
 Tue, 03 Nov 2020 04:31:37 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id u3sm3127993wme.0.2020.11.03.04.31.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Nov 2020 04:31:36 -0800 (PST)
Subject: Re: [PATCH v2 3/6] ASoC: codecs: lpass-wsa-macro: add dapm widgets
 and route
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20201029110829.16425-1-srinivas.kandagatla@linaro.org>
 <20201029110829.16425-4-srinivas.kandagatla@linaro.org>
 <3300f31e-28d1-becf-41e7-814b38082dcb@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b21abfab-108e-50f4-f905-5d9d0fc5168b@linaro.org>
Date: Tue, 3 Nov 2020 12:31:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3300f31e-28d1-becf-41e7-814b38082dcb@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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



On 29/10/2020 15:52, Pierre-Louis Bossart wrote:
> 
>> +static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
>> +                     struct snd_kcontrol *kcontrol, int event)
>> +{
>> +    struct snd_soc_component *component = 
>> snd_soc_dapm_to_component(w->dapm);
>> +    u16 gain_reg;
>> +    int offset_val = 0;
>> +    int val = 0;
>> +
>> +    switch (w->reg) {
>> +    case CDC_WSA_RX0_RX_PATH_MIX_CTL:
>> +        gain_reg = CDC_WSA_RX0_RX_VOL_MIX_CTL;
>> +        break;
>> +    case CDC_WSA_RX1_RX_PATH_MIX_CTL:
>> +        gain_reg = CDC_WSA_RX1_RX_VOL_MIX_CTL;
>> +        break;
>> +    default:
>> +        return 0;
>> +    }
>> +
>> +    switch (event) {
>> +    case SND_SOC_DAPM_POST_PMU:
>> +        val = snd_soc_component_read(component, gain_reg);
>> +        val += offset_val;
>> +        snd_soc_component_write(component, gain_reg, val);
> 
> missed from v1: offset_val is zero so the sequence is reading and 
> writing the same thing. Is this intentional or useful?

Its useless, I should get rid of offset_val!

> 
>> +        break;
>> +    case SND_SOC_DAPM_POST_PMD:
>> +        snd_soc_component_update_bits(component, w->reg,
>> +                          CDC_WSA_RX_PATH_MIX_CLK_EN_MASK,
>> +                          CDC_WSA_RX_PATH_MIX_CLK_DISABLE);
>> +        break;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
> 
> [...]
> 
>> +static bool wsa_macro_adie_lb(struct snd_soc_component *component,
>> +                  int interp_idx)
>> +{
>> +    u16 int_mux_cfg0 = 0, int_mux_cfg1 = 0;
> 
> these inits are ignored
> 
>> +    u8 int_mux_cfg0_val = 0, int_mux_cfg1_val = 0;
> 
> these as well
> 
>> +    u8 int_n_inp0 = 0, int_n_inp1 = 0, int_n_inp2 = 0;
> 
> and these are also ignored.
> 
Yes, these are ignored, I should have removed the unnecessary 
initialization!
It would have been nice if sparse could catch such errors!

are you using tool to catch these?

--srini
>> +    int_mux_cfg0 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG0 + interp_idx * 8;
>> +    int_mux_cfg1 = int_mux_cfg0 + 4;
>> +    int_mux_cfg0_val = snd_soc_component_read(component, int_mux_cfg0);
>> +    int_mux_cfg1_val = snd_soc_component_read(component, int_mux_cfg1);
>> +
>> +    int_n_inp0 = int_mux_cfg0_val & 0x0F;
>> +    if (int_n_inp0 == INTn_1_INP_SEL_DEC0 ||
>> +        int_n_inp0 == INTn_1_INP_SEL_DEC1)
>> +        return true;
>> +
>> +    int_n_inp1 = int_mux_cfg0_val >> 4;
>> +    if (int_n_inp1 == INTn_1_INP_SEL_DEC0 ||
>> +        int_n_inp1 == INTn_1_INP_SEL_DEC1)
>> +        return true;
>> +
>> +    int_n_inp2 = int_mux_cfg1_val >> 4;
>> +    if (int_n_inp2 == INTn_1_INP_SEL_DEC0 ||
>> +        int_n_inp2 == INTn_1_INP_SEL_DEC1)
>> +        return true;
>> +
>> +    return false;
>> +}
> 
