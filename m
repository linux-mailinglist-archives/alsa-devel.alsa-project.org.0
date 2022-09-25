Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F19F15E9593
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Sep 2022 20:59:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78B1D1F7;
	Sun, 25 Sep 2022 20:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78B1D1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664132355;
	bh=n80MfCJCqjKVhW9/ohk9LmD7xYo2KQTl/GOuuT13+T0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mMj6P+Eya8vpV8FmsO0V6aY4D+hUh/4vperyOv8regtMcUL2tRGHw5aDsam/t3Rwh
	 KApvpjudvvu+Sb9qoQ9VQ0jQR7JEXDlz58QQ6Qn3xNhwudWkwb4lsQyWeWwEgCEDMn
	 uQeEJTNFQO8nEj5vK+dMhAp/7U6eryGH01O2pUlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E288F80543;
	Sun, 25 Sep 2022 20:58:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15DC2F80525; Sun, 25 Sep 2022 20:57:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0326EF8053C
 for <alsa-devel@alsa-project.org>; Sun, 25 Sep 2022 20:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0326EF8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org
 header.b="ODYOHUvc"
Received: by mail-oi1-x22c.google.com with SMTP id n124so5981902oih.7
 for <alsa-devel@alsa-project.org>; Sun, 25 Sep 2022 11:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Xkkurc7xmhFTAUmptTAIyBrQNuCw6O40NOONaEt5SY4=;
 b=ODYOHUvchpeTI7kgg2hz3gdVa4Iql7GILhBLA5AMo4BkfIcIM9oUod7Ce3iLkQycID
 1u6P0YqHGGfeY0UlyLTIOWbZGYzUSu9e+qQGztRmgt/92ptT+hZlATNlfdIDNVklRmgg
 AbGE2XGF1oysM2ls2fvitmVio8TZTahF9dDEg1O/RbZu24YmMR1DT1WP1LStM/YZaDJw
 zVbUBN6s1IltvVGe88QfJQcmv6gOfWBq1LFC2NIm9/4E6IjfidX66mrSl2wGod3UMQPD
 l3X5TWf4Dsg9cUvnjTeJ2MVpUR7Pl2MRfLumQOIVOo3v/G6/qPqVl+SuoB/3e8G+iI6I
 NbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Xkkurc7xmhFTAUmptTAIyBrQNuCw6O40NOONaEt5SY4=;
 b=PeEV46Bf+iARiGf9OdLbcd1t/T7Gx9SSbdAv+uq1+8HDhBzVqbl6LBd/liNNV248as
 21Rz9KBZzfUc4OWnaxZT1TqQPaz+M+XJirStguw7tiuJu/sTeH9YFTA2Uk0Ul4hIdN6k
 7TvnB+NQa2/tQ+d3NMZ1c4+0uK7Vf1cKnnlf3pDtbIF2PtSTfPkhEXFSb0GVrWhiE+eg
 ul9fvFbdmwn4tDyX95XsUtd4xpfqzXDITePBkiEsX+ZpczwLd0okyJt/I6FUmejmk7v1
 pjdQaOn7gI0/9vUSxU2ROdJ5Je6jLz65jFul2STent2PnLPN3bdJqy+gi3ySgy2NjCeG
 9TUw==
X-Gm-Message-State: ACrzQf1Q+AOFDL1Zv35msZlsBZqHYDZFJdK11AjGm1mbhkpNDbMWVBtf
 CQdI4dAv4MJzW6SDD5Zp0s/HKiwLeGnwgvSRq80=
X-Google-Smtp-Source: AMsMyM5jPsdQ9cdIbbiQVtXHLiRsM8nEpBbYgdYcp0q8ndoeeUBtB5jMoDECVwj/c1rIncJJtzm2ZA==
X-Received: by 2002:a05:6808:1892:b0:350:7c49:649f with SMTP id
 bi18-20020a056808189200b003507c49649fmr13224624oib.219.1664132271066; 
 Sun, 25 Sep 2022 11:57:51 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 n124-20020acaef82000000b003502783c454sm6394656oih.0.2022.09.25.11.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 11:57:50 -0700 (PDT)
Message-ID: <bff64b90-078b-5cb7-edff-4d5308bb7e0b@kali.org>
Date: Sun, 25 Sep 2022 13:57:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 05/11] arm64: dts: qcom: sdm845: drop unused slimbus dmas
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
 <20220923161453.469179-6-krzysztof.kozlowski@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220923161453.469179-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 9/23/22 11:14 AM, Krzysztof Kozlowski wrote:
> Bindings document only two DMA channels.  Linux driver also does not use
> remaining rx2/tx2.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 2264bba69f84..1213f78a8b7a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3828,9 +3828,8 @@ slim: slim@171c0000 {
>   			reg = <0 0x171c0000 0 0x2c000>;
>   			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
>   
> -			dmas = <&slimbam 3>, <&slimbam 4>,
> -				<&slimbam 5>, <&slimbam 6>;
> -			dma-names = "rx", "tx", "tx2", "rx2";
> +			dmas = <&slimbam 3>, <&slimbam 4>;
> +			dma-names = "rx", "tx";
>   
>   			iommus = <&apps_smmu 0x1806 0x0>;
>   			#address-cells = <1>;

Tested on Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>

