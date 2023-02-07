Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E77568E446
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:14:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C166A20B;
	Wed,  8 Feb 2023 00:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C166A20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675811691;
	bh=KEi2R0RE2AzT4DZhjDSYCJthOUziEuMhhBetCJp7trQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C0YwVD+xxnWz54u/y8ok7ZCA/9lIMNQ1oDhnoa1yZ1QWOZ5jW7Xkni1I/JpoXhFQJ
	 DcOHdTy15jvJQ2C+SeHDH4fmtf6AQiAGlJvcCaUpFzZjSmYQBypfaxTBh2yklTXj46
	 IVntbPZSRmqAK+X+BaKDm5d3WVnteZWRPEOS01Hg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A271F8010B;
	Wed,  8 Feb 2023 00:14:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D036F8012B; Wed,  8 Feb 2023 00:13:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C36E0F80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:13:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C36E0F80095
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-16a10138faeso14726540fac.11
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Feb 2023 15:13:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J313f1fFwjARml3wmkpP/9/rfqZBYmRUA6HuCdszao=;
        b=Tvo5pArVvFyhlyRun7OcM+ZkEg4ErTJ++2WQn5TXBjc4t+Gdh1MKQwn+BjaL+SDFRe
         smLnH3/oIZ/ctGvolS8ZVgIflJH07sfR3Z8k48TSuNeUnCjCNjncLxmeLdat0evP1JrO
         OzqMzZC5fkHnbKl5hn20dDH3itTV1jg5i2MCsLqurlYaBTm6qcr9ZnJ3o+1C7Vkjs9QC
         fMc/p+EOgRYmRAhbSAtZmtmX6cFCYCPBVbauxFFHlRNnaAHcFXpZ5YvU3FnOtK/YbELN
         BJMpwgZ/Re0tjR8/k3Zih7gi4y4pHfJO/+zl+B61EChncxoeEdserqTZ1vp2RPhGYl7J
         qxew==
X-Gm-Message-State: AO0yUKWroWvXIirTgntfTIO+j0Wb4Clotggd0ShV3SEGVdJgNRTQow5a
	yTyXsxtK0NvbgWoOP4pvtaYE4wMXmg==
X-Google-Smtp-Source: 
 AK7set9ouCRwzhuZPPza9sCy0hSempMs3/0tikUGOU+FIPe23o+hHRX5Ij/JGGiN1zgVEy09pJszJQ==
X-Received: by 2002:a4a:d6c2:0:b0:517:452c:f4d2 with SMTP id
 j2-20020a4ad6c2000000b00517452cf4d2mr2301431oot.5.1675804001467;
        Tue, 07 Feb 2023 13:06:41 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 b4-20020a4ac284000000b005175b972e52sm6462223ooq.31.2023.02.07.13.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 13:06:41 -0800 (PST)
Received: (nullmailer pid 4154455 invoked by uid 1000);
	Tue, 07 Feb 2023 21:06:40 -0000
Date: Tue, 7 Feb 2023 15:06:40 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,q6apm-dai: adjust iommus for
 SM8550 ADSP
Message-ID: <167580399988.4154399.8014326136743257868.robh@kernel.org>
References: <20230206150532.513468-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230206150532.513468-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: TKANTYEAROGYOXHSFYYEGSPNVMHXBFO3
X-Message-ID-Hash: TKANTYEAROGYOXHSFYYEGSPNVMHXBFO3
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TKANTYEAROGYOXHSFYYEGSPNVMHXBFO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On Mon, 06 Feb 2023 16:05:32 +0100, Krzysztof Kozlowski wrote:
> It seems that SM8550 ADSP remote processor uses two IOMMUs.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Alsa-devel mailing list -- alsa-devel@alsa-project.org
To unsubscribe send an email to alsa-devel-leave@alsa-project.org
