Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4917254E29C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 15:56:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C18111AD4;
	Thu, 16 Jun 2022 15:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C18111AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655387776;
	bh=oIGRdxTVsCWZa26Kbi12l9PL1B3VxqcUI6fbd6V39ik=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tUSHfFCxtNCEXM8JRnVPoXJMoWpv4K1IAzQPs0ZxxiP41V4Vhz775pIZs2lUUu4yj
	 CzKb+OUVklEXvR91RmwkBxE6TBr6maCrJFg38nUqODXZO+M7KkWjPkquOuPyWg/nur
	 uuebmVtxArwxG6OquNLxOvDSvEZ/aeBciTLcEhYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7509FF8047C;
	Thu, 16 Jun 2022 15:55:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93F2CF801D8; Thu, 16 Jun 2022 15:55:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DA06F8012A
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 15:55:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DA06F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MLMlzJpH"
Received: by mail-pj1-x1033.google.com with SMTP id f16so488248pjj.1
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 06:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AqCBBKJhjvVRevpKirub+RjdcNJhrbWsjFdQsoZidsM=;
 b=MLMlzJpHqLk2NTSkk+4CI6/9tDS/CcuAuC6dpww7mHmyJkrttmtnJO/CzsKVctLzxk
 uSWmtfHFtdcmmtcODHtKBEZjJDTXUKdKe+WmLecqFOF6zJKiqunDohh3PU0vQalFwjKA
 d7uiDUPkWwPHlwOvs19l2d58ZAWsYV0fw7sePeBQIPrYPZsiYO5IJW3+TGPBkwJCdCpZ
 TUBQgm+PUj2fx8W3A7arprSw311qJKS2AT37ChtVeYVsgIJHCEUXmpBrOLlt79rnM7iI
 clLazAQA26Ptz+LYSgDLQKTFIA8N4Iutdz2ZSrAPnlzZqxBBCdvCpomjVI7MWbyu93Wf
 ZrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AqCBBKJhjvVRevpKirub+RjdcNJhrbWsjFdQsoZidsM=;
 b=THmW2vVheVtgzd8QEmXF3+2WvyRC68bT+RF3pzzqSqiOhoK2DrKh10UyIXWWYTGlD+
 /jGwy6uFAML0nG49Sm29OqiSlFSpzy4FO5RWpa2ONqD72SL7JcJE4L+goxFU7q/NonAI
 ThZKL5fvSO9l/RgTU8lXJCglG4uncRFwBnxM5nC+/Y1vTY9T0XlS+SmLVyaPInPuw+t5
 SdqL3PrZoKwsIq4LSjK/3J9QEaf43y0S+QrhynHW9MKxTNvuVHm9jkR+GoDRkhyyP/cW
 iUMgg3aLy8+ht3ecyERoaFWE0lBErfkc8GMUW/ErtHzjBvyg+8hJC3PxJa7V1wtLwN/2
 CRBw==
X-Gm-Message-State: AJIora8CAFZo+Fj3mhUbtI+cWJfb1I9aG+GGxi7Q2DdoL2Ta7sQF22cU
 t/3HMwkjGZaVwfDvmjQQRLZm2w==
X-Google-Smtp-Source: AGRyM1vD8xThX01mXSwdjH5o86512U3eYCtOXz7Tt7aA/zrrnyjP12qDLwKDYDuqb3ZyVxcfG86VdA==
X-Received: by 2002:a17:902:c94b:b0:168:fb7a:e5a0 with SMTP id
 i11-20020a170902c94b00b00168fb7ae5a0mr4755533pla.56.1655387708715; 
 Thu, 16 Jun 2022 06:55:08 -0700 (PDT)
Received: from [172.20.0.255] ([192.77.111.2])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a62b802000000b0051bc3f9a1f6sm1823305pfe.55.2022.06.16.06.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 06:55:08 -0700 (PDT)
Message-ID: <629e761b-e3ad-0861-1937-ad660a8a900b@linaro.org>
Date: Thu, 16 Jun 2022 06:55:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/4] dt-bindings: dsp: mediatek: Use meaningful names
 for mbox
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 YC Hung <yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
References: <20220616073042.13229-1-tinghan.shen@mediatek.com>
 <20220616073042.13229-2-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616073042.13229-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On 16/06/2022 00:30, Tinghan Shen wrote:
> Rename mbox according to actions instead of 'mbox0' and 'mbox1'.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml   | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> index b7e68b0dfa13..ca8d8661f872 100644
> --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> @@ -50,13 +50,13 @@ properties:
>  
>    mboxes:
>      items:
> -      - description: ipc reply between host and audio DSP.
> -      - description: ipc request between host and audio DSP.
> +      - description: mailbox for receiving audio DSP requests.
> +      - description: mailbox for transmitting requests to audio DSP.
>  
>    mbox-names:
>      items:
> -      - const: mbox0
> -      - const: mbox1
> +      - const: rx
> +      - const: tx
>  

Commit msg lacks important piece - do you break any users with this? Do
you have any users of this binding?


Best regards,
Krzysztof
