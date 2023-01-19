Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD70673A60
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 14:34:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D33438092;
	Thu, 19 Jan 2023 14:33:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D33438092
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674135280;
	bh=m/eODmHld9z1ipQ7XbQASMRTNuO7SJUGIgnPwsgvhAE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MVuh63p5ve5jL570poCIuwgq44Iaqrc2pw1EDNlH7KK4O/KLEkk3Me+7J2JXVSBBf
	 RqKek/C566Txz3zfT+7AOt1H57Hn3dBWW3JmMNJkWYr5rHN9vrLEtGtmsyJW2cUZU/
	 8antYfv+oACHIiQf+tJlnqb7hBRbOA/G/z2aMnLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6560F800F0;
	Thu, 19 Jan 2023 14:33:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 194F7F80542; Thu, 19 Jan 2023 14:33:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D27AF800F0
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 14:33:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D27AF800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=u9CLrJA5
Received: by mail-wr1-x42b.google.com with SMTP id i4so1242882wrs.9
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 05:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b6PeiBNsTffvX/+4lco6RlfjzIGjTxljWE9nlGGQ60s=;
 b=u9CLrJA58gIJ7sWycV0DKTP4oJj5TQqH5ZpZF6mne+zMV/Amze+sz05Vm627nA6l7f
 W7W6Jorg0uzHv9qA90odd7XDydVt4meLs1HgjZUSbbCLSp97FjwdnCkRKZtQcniqhgX1
 f/9XJYTjXPDnBoV/Prnfft4b9RKWK8zd5sHmn0I/t5pbi04eQc+ePtOkzq7+zx+v+HK+
 gemTi+gJNzg56DfmuI1iCTmuKZ9CJHydXwaygOCYmaXOovt/2AMrYuSizXHjR09YAbOY
 n0s7odIw6Gf4RQXzXN8eNJi8dzHv5zt90aJEL2Pdm86dukdKnyhTRsWP2WeHQaZSxObn
 pjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b6PeiBNsTffvX/+4lco6RlfjzIGjTxljWE9nlGGQ60s=;
 b=kw5gSH9NWEZittOPb8XnYj6wGvN8beyWIoPdgWXPOA6d0Nbo1a6A5U6flCNS0N9AA7
 nbNgJiezCNzJbzPnYA6dNjX/1Jth41HnpvGrAv2QzmnimkmXUYWBqQM2TYphpSwOMSnc
 58Z8hzwvdHSG8XrepceFn8gC7EuTwTyfDf1T+xJBGJ/vgnxWo5mJU4NPo8ssLx55KJ1+
 EvyjwZVrlXO0r0CLMwvNKxJnsoXa92MoXtPu9xi5EPigfFe80/hIZax1slvMk4Of3gCR
 +rpGV7/OGrtkm2Lva59Amjz+G9RFgE/wOMNT5qTNVK9GXuQYUSqPPSfANPyj2pwzPU08
 u+Fg==
X-Gm-Message-State: AFqh2kpx8yEUKBv/Owiqrmq9vCj2rMKxNwjdTnf60RoZgp4WmC4fg4Xj
 REMZUvA0WLHPDY4l8Da49Scf4Q==
X-Google-Smtp-Source: AMrXdXtpARPAFImaw2quJx+/Q2zAHbUDSbv0xp/JTokBa7EhBS3eWwexKNtaG9aCwUtv/pIP/LpQvQ==
X-Received: by 2002:a5d:66c9:0:b0:2b9:d6ba:21ef with SMTP id
 k9-20020a5d66c9000000b002b9d6ba21efmr9518068wrw.65.1674135192733; 
 Thu, 19 Jan 2023 05:33:12 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adf9dcb000000b00268aae5fb5bsm34369555wre.3.2023.01.19.05.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 05:33:12 -0800 (PST)
Message-ID: <ffa9e555-f351-d05c-0524-6bc81b88120b@linaro.org>
Date: Thu, 19 Jan 2023 14:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 5/7] arm64: dts: qcom: sc7280: Update lpass_tlmm node
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org
References: <1674131227-26456-1-git-send-email-quic_srivasam@quicinc.com>
 <1674131227-26456-6-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1674131227-26456-6-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

On 19/01/2023 13:27, Srinivasa Rao Mandadapu wrote:
> Update lpass_tlmm clock properties, as different clock sources
> are required in ADSP enabled platforms
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> index 674b01a..232e1dc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> @@ -167,6 +167,15 @@
>  	};
>  };
>  
> +&lpass_tlmm {
> +	clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +
> +	clock-names = "core", "audio";
> +	reg = <0 0x033c0000 0x0 0x20000>,
> +	      <0 0x03550000 0x0 0xa100>;

What is the difference? The length of audio IO space? You need to
explain this in commit msg.


Best regards,
Krzysztof

