Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 720897FB56A
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 10:17:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1195E82C;
	Tue, 28 Nov 2023 10:16:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1195E82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701163027;
	bh=9O39JMlt9cecMGrOhG5k5hA7QZU458FI9TkVb3GvDmA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i38P7cVZErar2Ru+4mdCghmswEC/GoV/zWNTVRxTWgFpokYtPlekg5hG/15MXeXsL
	 fSrWPKR0EpdSLwDnzV3BfKJGaCuT6GwfTmnLGnB5nkLf/793tOT9oLpNNG+4wEpGD2
	 YWFslah519cmWxO1iIMEysEIkbyMrWGrxT5arapE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A747F80114; Tue, 28 Nov 2023 10:16:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DC42F80571;
	Tue, 28 Nov 2023 10:16:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C4C8F8016E; Tue, 28 Nov 2023 10:16:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65209F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 10:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65209F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=c65DSUnQ
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b472f99a0so12911565e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Nov 2023 01:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701162997; x=1701767797;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1ixJzL+G4ExhL3zGwuOlyXJPv0jAqiyItVDxcyAzs0=;
        b=c65DSUnQNKmfc8ZC0jE1YhYOPewHgA5rrAdAT/c/WI3F7zO/XoDNvmZYariNqXfNQf
         0y/1fZImdy/sYY9joKKLqSPEUqbMyLsvAB6z/9pRzAx7uijQ5vnI70ASkrKO2Ghax5LK
         j8bMK5K6vD7B/GVpc2IeV0jaghCd148gYOExx/9wTn26f0ouTkRaTBX2LvOlkATAdeGa
         PvBPXoux7dBMgLTyjvbeFSjpDlSzrWzyxavqIRP1pxzN0mVn0hzKw4qEPyS2ubenmST6
         ZCJ1YNCl/7lyCgkfily9DLjYVnXJjMw75mzpc6OtgNhBDACbd5h+7MtXfvQhtXssOvOq
         4RIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701162997; x=1701767797;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I1ixJzL+G4ExhL3zGwuOlyXJPv0jAqiyItVDxcyAzs0=;
        b=JJ/+NhFTMfkezi3E7PiNR/wEcPSvaA9v7peBcU99smbw84v7YGHDVnwM8g8WWPQsz+
         9XcuXYaVIqmktWc0aeD+hUrEpBdSWnjTcby0pdDNWFzNW2fPksD6RDP5NKhvDJc0b9f2
         Jy7y1yTJ2cYnAbqcLxEuZzN4ECFtbieNEho8RK+hNFqwYaYIq1UKR+Y3eAk9H0zqOg1q
         /OkWOk2k1v3hR1WPj6qmXf41tog7XrFKR5dH/bDDwX/us2pHDEAbefbHeNl+Jt8zNCcB
         kVZQ0iogkQ9tseIyo3HzqfRAeN+4XFOrfpEp3aBsZiBYn3ZlWSewywq9EvnNumAAGA/0
         L/LQ==
X-Gm-Message-State: AOJu0YzsrqQKKZneATZwkWjX9RxiIfu4VOleUAwwMgfdVyK5ZcySw5RC
	xvR+dtOJLp9Nh0z47fToX8eJpQ==
X-Google-Smtp-Source: 
 AGHT+IG6ukaNt2ZgVZQMXe58TmnXHGQqqHO07e+EHx+fN6PCfUc66ZTyBG1sDU5facr7QJDgD0fR8Q==
X-Received: by 2002:a05:600c:4fcc:b0:40b:338b:5f38 with SMTP id
 o12-20020a05600c4fcc00b0040b338b5f38mr10094963wmq.8.1701162996775;
        Tue, 28 Nov 2023 01:16:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe?
 ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
        by smtp.gmail.com with ESMTPSA id
 az21-20020a05600c601500b0040b47c53610sm5045039wmb.14.2023.11.28.01.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:16:36 -0800 (PST)
Message-ID: <095f6e9d-dbee-4cfe-91dc-5443608c386d@linaro.org>
Date: Tue, 28 Nov 2023 10:16:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/5] ASoC: codecs: Add WCD939x Soundwire slave driver
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-4-21d4ad9276de@linaro.org>
 <a7725504-89fd-4f62-b8d0-6ec863bd059a@linaro.org>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <a7725504-89fd-4f62-b8d0-6ec863bd059a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OAMQQCFXW7CEQVG5HG7L4DKDY6DMBABV
X-Message-ID-Hash: OAMQQCFXW7CEQVG5HG7L4DKDY6DMBABV
X-MailFrom: neil.armstrong@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: neil.armstrong@linaro.org
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OAMQQCFXW7CEQVG5HG7L4DKDY6DMBABV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/11/2023 12:55, Konrad Dybcio wrote:
> On 23.11.2023 15:49, Neil Armstrong wrote:
>> Add Soundwire Slave driver for the WCD9390/WCD9395 Audio Codec.
>>
>> The WCD9390/WCD9395 Soundwire Slaves will be used by the
>> main WCD9390/WCD9395 Audio Codec driver to access registers
>> and configure Soundwire RX and TX ports.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> [...]
> 
> 
>> +static struct wcd939x_sdw_ch_info wcd939x_sdw_tx_ch_info[] = {
>> +	WCD_SDW_CH(WCD939X_ADC1, WCD939X_ADC_1_4_PORT, BIT(0)),
>> +	WCD_SDW_CH(WCD939X_ADC2, WCD939X_ADC_1_4_PORT, BIT(1)),
>> +	WCD_SDW_CH(WCD939X_ADC3, WCD939X_ADC_1_4_PORT, BIT(2)),
>> +	WCD_SDW_CH(WCD939X_ADC4, WCD939X_ADC_1_4_PORT, BIT(3)),
>> +	// TOFIX support ADC3/4 & DMIC0/1 on port 2
> Well, fix it or drop it :D
> 
>> +	//WCD_SDW_CH(WCD939X_ADC3, WCD939X_ADC_DMIC_1_2_PORT, BIT(0)),
>> +	//WCD_SDW_CH(WCD939X_ADC4, WCD939X_ADC_DMIC_1_2_PORT, BIT(1)),
>> +	//WCD_SDW_CH(WCD939X_DMIC0, WCD939X_ADC_DMIC_1_2_PORT, BIT(2)),
>> +	//WCD_SDW_CH(WCD939X_DMIC1, WCD939X_ADC_DMIC_1_2_PORT, BIT(3)),
>> +	WCD_SDW_CH(WCD939X_DMIC0, WCD939X_DMIC_0_3_MBHC_PORT, BIT(0)),
>> +	WCD_SDW_CH(WCD939X_DMIC1, WCD939X_DMIC_0_3_MBHC_PORT, BIT(1)),
>> +	WCD_SDW_CH(WCD939X_MBHC, WCD939X_DMIC_0_3_MBHC_PORT, BIT(2)),
>> +	WCD_SDW_CH(WCD939X_DMIC2, WCD939X_DMIC_0_3_MBHC_PORT, BIT(2)),
>> +	WCD_SDW_CH(WCD939X_DMIC3, WCD939X_DMIC_0_3_MBHC_PORT, BIT(3)),
>> +	WCD_SDW_CH(WCD939X_DMIC4, WCD939X_DMIC_3_7_PORT, BIT(0)),
>> +	WCD_SDW_CH(WCD939X_DMIC5, WCD939X_DMIC_3_7_PORT, BIT(1)),
>> +	WCD_SDW_CH(WCD939X_DMIC6, WCD939X_DMIC_3_7_PORT, BIT(2)),
>> +	WCD_SDW_CH(WCD939X_DMIC7, WCD939X_DMIC_3_7_PORT, BIT(3)),
>> +};
> [...]
> 
>> +
>> +int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
>> +{
>> +	int bank;
>> +
>> +	bank = sdw_read(sdev, SDW_SCP_CTRL);
>> +
>> +	return ((bank & 0x40) ? 1 : 0);
> bool conversion?
> 
> Also, 0x40 == BIT(6), can you look up what it means and #define it?
Ack

> 
> [...]
> 
>> +
>> +static int wcd9390_bus_config(struct sdw_slave *slave,
>> +			      struct sdw_bus_params *params)
>> +{
>> +	sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank),
>> +		  0x01);
> similar, BIT(0)
Ack

> [...]
> 
>> +	{ WCD939X_EAR_STATUS_REG_2, 0x08 },
>> +	{ WCD939X_FLYBACK_NEW_CTRL_2, 0x00 }, //??
>> +	{ WCD939X_FLYBACK_NEW_CTRL_3, 0x00 }, //??
>> +	{ WCD939X_FLYBACK_NEW_CTRL_4, 0x44 }, //??
> drop //s

Ack

> [...]
> 
>> +static bool wcd939x_volatile_register(struct device *dev, unsigned int reg)
>> +{
>> +	if (reg <= WCD939X_BASE)
>> +		return false;
> Maybe move this check to readonly_register
>> +
>> +	if (wcd939x_readonly_register(dev, reg))
>> +		return true;
> and call readonly for .volatile_reg as well?
> [...]

Hmm, let me check

> 
>> +	/**
>> +	 * Port map index starts with 0, however the data port for this codec
>> +	 * are from index 1
>> +	 */
> This is not kerneldoc

Ack

> 
>> +	if (of_property_read_bool(dev->of_node, "qcom,tx-port-mapping")) {
>> +		wcd->is_tx = true;
>> +		ret = of_property_read_u32_array(dev->of_node,
>> +						 "qcom,tx-port-mapping",
>> +						 &pdev->m_port_map[1],
>> +						 WCD939X_MAX_TX_SWR_PORTS);
>> +	} else {
>> +		ret = of_property_read_u32_array(dev->of_node,
>> +						 "qcom,rx-port-mapping",
>> +						 &pdev->m_port_map[1],
>> +						 WCD939X_MAX_RX_SWR_PORTS);
>> +	}
> This is used in wcd9380 and will be used in wcd9370 when that happens some
> day, maybe it'd be worth to commonize it as qcom_{rx/tx}_portmap_get?
> [...]

OK but where ?

> 
>> +static const struct sdw_device_id wcd9390_slave_id[] = {
>> +	SDW_SLAVE_ENTRY(0x0217, 0x10e, 0),
> 0x10e - WCD9380 or 9385 slave? an inline comment at the end of the line
> would be cool!

Ack

> 
> Konrad

