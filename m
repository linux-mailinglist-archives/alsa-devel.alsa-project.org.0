Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 577AA69A80B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 10:23:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CAF0EDC;
	Fri, 17 Feb 2023 10:22:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CAF0EDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676625799;
	bh=H367AbgJFBLLaUzo9Cuo7xQZnE8W9ggnt03v2M9AAHs=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FkBkq/gY8m5ncsV/hsBVB2+aVoZRFy1ct1JyFD1eEs2OxONsnbdS+Hv6WmfyA4m/X
	 OH1Kx2txHpvie1dG4dhz1+PEch9QM0mwGWDFe0vJ2Vblx+RZWcG98+flSH8hYaTpUh
	 /+h+u60h8/fqwyFTPpdqLQivKb+Je5P9rNK4pzts=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9A87F800E4;
	Fri, 17 Feb 2023 10:22:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 042EEF80171; Fri, 17 Feb 2023 10:22:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B8A2F800AA
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 10:22:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B8A2F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XOl3+vff
Received: by mail-ed1-x52f.google.com with SMTP id v11so10601335edx.12
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Feb 2023 01:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7LQsmO8BJ1on7K8O2a2MHWuCjPwW4wmR8+WhYFU/VUQ=;
        b=XOl3+vffPd/tr8VTgKyaurW98MVfUTdskc41q1EjjW71xvLiIYgKWXQkNyYZ+Y67PO
         2iJKSuTzoFWi85dqTZWcoFn0iPYHhaViU5+nnOIyHbnUlJJ26fo+SI+v7BjsHRbQbg/a
         UnGkezss5oQXW41AQ/grewhxfhvc42oIKSt4Qw7jN/vNv4P4NkJLwaoHUeLB9DqHozpU
         3aT6jRcgK7PQlaHoI8ygzg6JKEv2dbOIqaKK0YdxRHa7xXdoT4nVTiObhyOytOGpQN31
         kaxoAXBqxOUV3hcCC+FOiXTK9AN8YxvsbF7hBkREnPd1mdzp1Zysm/v5zpiBVMHQEnzS
         JCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7LQsmO8BJ1on7K8O2a2MHWuCjPwW4wmR8+WhYFU/VUQ=;
        b=yGyYnhwKaJcYCN48DrjfPX9ylcDcGRuCYddI8EEcy45ExaMXnqGzcyEH7M8NWFKGtB
         nQhYId8N7/1qb5BaEmqgsOdhHRCl2ymcvD3RCuk9qvq3VlLKOZAIh3QzJbPukbFjh/N3
         jLOccQ6PiGgkRKZNVtAO9GeqWobS8oENTec8A2/U1kMzpbx+pw7o3glWxQJC+S5hC8Yc
         a4p99iERTQMEXL3RRHtLDqTcIStDCIqNqI6Y1OTKr7AYrwJiaoNx2csfMqJySO+mSW8a
         /vDp5Rr6gY8EndLfvwO3P/lLVl9uaR+b0rG4071fmIGNfdH2liKocOR5Esz8N5ejhAGq
         CgGw==
X-Gm-Message-State: AO0yUKW0gC1EKW4gE+0HxmJABGErHhd6Ozmi0GsLDmuEZ8/iU2/mce0v
	HskXu1OimiiZHg9BLG0k8kblSg==
X-Google-Smtp-Source: 
 AK7set/pxhKkcmJ7uQ2CkOz1aneV7sr4U6gYAbzUn9nsEPVXQhfN1+InHaCiguvDh+QE9kvztTD+7Q==
X-Received: by 2002:a17:906:16d3:b0:8b1:23cf:13dc with SMTP id
 t19-20020a17090616d300b008b123cf13dcmr9984759ejd.16.1676625735479;
        Fri, 17 Feb 2023 01:22:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 oq15-20020a170906cc8f00b008b165948da6sm1742629ejb.101.2023.02.17.01.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 01:22:15 -0800 (PST)
Message-ID: <7535d488-37fc-1e67-6a14-b658beb000e3@linaro.org>
Date: Fri, 17 Feb 2023 10:22:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 05/10] dt-bindings: soc: fsl: cpm_qe: Add QMC
 controller
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
 <20230216134226.1692107-6-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230216134226.1692107-6-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XNHBMLKONBCNVCKIVGT6VULW4KJTJFWW
X-Message-ID-Hash: XNHBMLKONBCNVCKIVGT6VULW4KJTJFWW
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XNHBMLKONBCNVCKIVGT6VULW4KJTJFWW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/02/2023 14:42, Herve Codina wrote:
> Add support for the QMC (QUICC Multichannel Controller)
> available in some PowerQUICC SoC such as MPC885 or MPC866.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      | 172 ++++++++++++++++++
>  1 file changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

