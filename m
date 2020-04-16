Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4291ABAB2
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 10:00:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A0491660;
	Thu, 16 Apr 2020 09:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A0491660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587024041;
	bh=PfZyO36MPT2Q2uIOzVjwAqF4NeQQxIfJo94Vp9bt8zs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WkKWm0AmlYNdepd3Z0n+0lefMycfVM8JBt3LBR36okrHHAYR6Up1KjidzTKjFvE7f
	 bCKLJBuCG6GFmXER9xgxMjf6+rZRx+AYI8Mh8Ei1Zp07gX2SevB2GIn/rIWh/3bdi8
	 JtCudGxotHA+1GrJ6M4CGAtLle7trD211qyvjims=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7310FF802BE;
	Thu, 16 Apr 2020 09:57:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BDDAF802A8; Thu, 16 Apr 2020 09:56:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DC83F8028F
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 09:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DC83F8028F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YZAXeH8R"
Received: by mail-wm1-x341.google.com with SMTP id d77so3517063wmd.3
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4wXkP4Jg2SpgPLNlNFxv80H5dUcR070Yf66C9Z6HJMk=;
 b=YZAXeH8R6EFGR93FoMZPfjyXgVNnyB0Hj/WwXWZygT+Ji3pVWI+parN1ZoWtEhaDl9
 Q5U1HRaEdkgXXziWJzOXdmEnQi+Ixv+kRHTfAOXqNtvoy5Y+ULWZLjJOMVe48WEcB6Px
 9IjKWu91KhFbHP2oBSRpE5zJPUhJjO8yUaqypUToh0XIemuI5LSKcMExLW5++px7ylp4
 Q+G4EnPTSv1BEBVGHaPxUAOG1bAwEQlhBiphm65QiixLfh+8iQHpxgvRp4rmmVbCiXgP
 +G4eE2PpKXkDAwInyc0+aM47axZ8RYq2j82JaF++aF79ay7+PFxVbO97/5J+1l6VOgsI
 vETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4wXkP4Jg2SpgPLNlNFxv80H5dUcR070Yf66C9Z6HJMk=;
 b=CbvwPmB0/S/3T57wM/WaqdGlx0FXN5D4DqeMok0HSsQt34jY+ohNnY08+UuArS8Lvr
 nxaQ5iiRXXnNa9QboTdZzYGGogPZv/pqfcpmFRMjv8WuAmWFPCBJMwUPLJaCuWR5ejQ3
 4t7sfIf83A8yCWWMVQ6ytYrArzqlS5POMs41NV8zfbjHjan8EtH9vn5t6UW3ovk6L9pe
 lYFJlwuCppRi3wG3nO3n4V8wZhG1DrAGdqqnv3umRxtyP8dh1yYCw/tdvH4VBdqu9kB9
 lEpBbKdHO4u5WdjCJevCmR/9YlV+3icxY/ToAzWjaA9FZiYP+PzREHgV+9iw/IXsvT3l
 U8UQ==
X-Gm-Message-State: AGi0PuY+yZZefVAueWA+jakD5BsjMtkNNtpnJBzP28t8ERmNwsIc2CZe
 br6tCM2cJ4/2jVfo7umEkDeVcg==
X-Google-Smtp-Source: APiQypJ2lrl6otM+G6nBiL9EeuYXvwsGAiqWvjGN+NlyKiETI4Foz9VmV53MzLWFGIjTfPzr5oJS6Q==
X-Received: by 2002:a1c:2007:: with SMTP id g7mr3478215wmg.70.1587023800838;
 Thu, 16 Apr 2020 00:56:40 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id l16sm11451926wrp.91.2020.04.16.00.56.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Apr 2020 00:56:40 -0700 (PDT)
Subject: Re: [PATCH 07/11] Documentation: dt-bindings: sound: Add details for
 new dai properties
To: Ajit Pandey <ajitp@codeaurora.org>, alsa-devel@alsa-project.org,
 broonie@kernel.org, devicetree@vger.kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org
References: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
 <1586592171-31644-8-git-send-email-ajitp@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d7ed94e7-639e-9c94-6092-e769a2fc6ad1@linaro.org>
Date: Thu, 16 Apr 2020 08:56:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1586592171-31644-8-git-send-email-ajitp@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, stephan@gerhold.net, tiwai@suse.com
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



On 11/04/2020 09:02, Ajit Pandey wrote:
> Add changes related to new sub node defining MI2S dai's properties. Such
> properties needs to be configured via board specific dts files.
> 
+Adding Stephan Gerlhold

Have a look at https://www.spinics.net/lists/alsa-devel/msg107224.html 
patches from Stephan Gerlhold which has better version of specifying sd 
line mask and is inline with DSP based solution too.

--srini

> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> ---
>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 33 ++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> index a87a406..727ec03 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -16,6 +16,8 @@ description: |
>     configure Low-Power Audio Interface(LPAIF) core registers across different
>     IP versions.
>   
> +  See also dt-bindings/sound/qcom,lpass.h.
> +
>   properties:
>     compatible:
>       enum:
> @@ -69,6 +71,30 @@ properties:
>     '#sound-dai-cells':
>       const: 1
>   
> +  dai-name:
> +    - description: Each node represents an MI2S dai and conatins dai specific
> +        properties that may change with board layout & dai connections.
> +    - type: object
> +    - properties:
> +      id:
> +        - description: dai id among one of value defined in header
> +        - type: u32
> +      qcom,spkmode-mask:
> +        - description: mask defining data lines used for speaker
> +        - type: u32
> +      qcom,micmode-mask:
> +        - description: mask defining data lines used for mic
> +        - type: u32
> +      qcom,wssrc-mask:
> +        - description: mask defining word-select source internal/extrnal on dai
> +        - type: u32
> +      qcom,loopback-mask:
> +        - description: mask defining loopback enable/disable on dai
> +        - type: u32
> +
> +      required:
> +        - id
> +
>   required:
>     - compatible
>     - reg
> @@ -101,3 +127,10 @@ examples:
>   	#sound-dai-cells = <1>;
>   	qcom,adsp = <&adsp>;
>   
> +        prim-mi2s@0 {
> +		id = <MI2S_PRIMARY>;
> +		qcom,spkmode-mask = <SD1>;
> +		qcom,micmode-mask = <SD0>;
> +                qcom,wssrc-mask = <INTERNAL>;
> +                qcom,loopback-mask = <DISABLE>;
> +	};
> 
