Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9D342A0A3
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 11:06:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 222C9167D;
	Tue, 12 Oct 2021 11:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 222C9167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634029606;
	bh=DBxnCCO2P3Qk06FRo9xV98rHWkw9hGIIio5a1sodtwA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=klwh740AaKx2pv1HY2Rb9NjsdWz0DQvgMRrnsZkyLzRfec5YBmBOVasVqtzmVGxtB
	 QKSfW/kKG+pq2b07JL2aNgixrfCN9iO/0K32l5jCssITLbAHBcQklvU+V3m+YiHwTY
	 PMT2PLr3Dc0Z9lb/9+f8Ysv7sKkcFQDRgX46FSvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40BEFF804F1;
	Tue, 12 Oct 2021 11:04:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EFE7F804ED; Tue, 12 Oct 2021 11:04:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36BF0F804E6
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 11:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36BF0F804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="W6+2A3mu"
Received: by mail-wr1-x429.google.com with SMTP id e12so64708602wra.4
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UwNILf/oluFUUL5PRUd2S4kE1LT5CdgyGEGUgX5bbxQ=;
 b=W6+2A3muXydBcHY/YF74R9Dh7MLGWONPA3LeeKLsKxiK1FD/dPcgXuStynOCL0/KsM
 4rHWc0ij/gMMghBussGkcCz1tQ9RIEAbQ0R31is7iooKjUj4dG9918VvbE/IZxdNFugB
 I9uXtMBGeUpQdz9qDmS588A6fge1rY7zFDa6M6+IgdCoLymzCByNymv7gbkbPgWJtg/2
 Pw+JbagwgQT6P3Fe65I9XHmGEMNFS12b7+R33ZxJ/SvPmH8eyP4ZCzxbq25itDhjs2u+
 Q1InWToDbUEWIR1RLik2xe0SJ+lsQMQPRvBTSC2GIlPEzeE1RoiHZ0eWUN8gcQJcs5dn
 rm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UwNILf/oluFUUL5PRUd2S4kE1LT5CdgyGEGUgX5bbxQ=;
 b=G85v2Lh6OSebtR3L+z5IIyG6PclFkNJjluMnrmLDT49HtmVCDlnicbsyGbfdbhNFGx
 XjvhqVIvnYcxh1l/oVZ0s3xYdG2zu+PKaIClPTaxHeJCftr5z4f/ajAxXoRbYrd2UgHw
 hveV7l1dyYhdOEBbchjz7LjcaFvmQTwLgCCyVZFcYXp8g6Zyc7OUU0XQ2/IuClKufobk
 AdbWFjwObA62kaiHN4skgpZea3M3WthhWQYdQJDY0ETbxBr6gjMxivH3INEvI9CUzUQ3
 cBOCZitP4jAt8c0SmxZqbRhG1WtGN5zKhYPNrwV7DmlKqael8ovT/Nv9ITJqRXbXgF7O
 JwAA==
X-Gm-Message-State: AOAM531lw6/pgXi7Ds+rthdYF2WvhJUdL/E/72l7JGvGds7NSDAwfsGy
 o85NYdgoD5h6ZIsAHp4MTA16Mw==
X-Google-Smtp-Source: ABdhPJwRzweIQF2jbPBf/OBl+c01b0VQ2tg2Le+bMbucYkda7/fJjKV7wd4vuvPXckxhCnHoc+8CsQ==
X-Received: by 2002:adf:fb44:: with SMTP id c4mr30838267wrs.179.1634029479152; 
 Tue, 12 Oct 2021 02:04:39 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id c17sm9909734wrq.4.2021.10.12.02.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 02:04:38 -0700 (PDT)
Subject: Re: [PATCH v3 4/5] ASoC: codecs: tx-macro: Update tx default values
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1633702144-19017-1-git-send-email-srivasam@codeaurora.org>
 <1633702144-19017-5-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <9261e403-9cbf-d955-d555-1e9cbbdde3df@linaro.org>
Date: Tue, 12 Oct 2021 10:04:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1633702144-19017-5-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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



On 08/10/2021 15:09, Srinivasa Rao Mandadapu wrote:
> Update mic control register default values to hardware reset values
> lpass sc7280.
> 
> Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for lpass tx macro)

I dont think this should have fixes tag, as you are adding default 
values for sc7280.

with that fixed,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   sound/soc/codecs/lpass-tx-macro.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index d472af1..6742405 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -272,7 +272,7 @@ struct tx_macro {
>   
>   static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
>   
> -static const struct reg_default tx_defaults[] = {
> +static struct reg_default tx_defaults[] = {
>   	/* TX Macro */
>   	{ CDC_TX_CLK_RST_CTRL_MCLK_CONTROL, 0x00 },
>   	{ CDC_TX_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00 },
> @@ -1781,9 +1781,10 @@ static const struct snd_soc_component_driver tx_macro_component_drv = {
>   static int tx_macro_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
>   	struct tx_macro *tx;
>   	void __iomem *base;
> -	int ret;
> +	int ret, reg;
>   
>   	tx = devm_kzalloc(dev, sizeof(*tx), GFP_KERNEL);
>   	if (!tx)
> @@ -1805,6 +1806,20 @@ static int tx_macro_probe(struct platform_device *pdev)
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
>   
> +	/* Update defaults for lpass sc7280 */
> +	if (of_device_is_compatible(np, "qcom,sc7280-lpass-tx-macro")) {
> +		for (reg = 0; reg < ARRAY_SIZE(tx_defaults); reg++) {
> +			switch (tx_defaults[reg].reg) {
> +			case CDC_TX_TOP_CSR_SWR_AMIC0_CTL:
> +			case CDC_TX_TOP_CSR_SWR_AMIC1_CTL:
> +				tx_defaults[reg].def = 0x0E;
> +				break;
> +			default:
> +				break;
> +			}
> +		}
> +	}
> +
>   	tx->regmap = devm_regmap_init_mmio(dev, base, &tx_regmap_config);
>   
>   	dev_set_drvdata(dev, tx);
> 
