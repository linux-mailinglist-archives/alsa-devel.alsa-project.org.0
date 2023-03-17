Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E206BEE86
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 17:38:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBA59EF9;
	Fri, 17 Mar 2023 17:37:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBA59EF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679071116;
	bh=M9YecNO2QqTO+XIWVDN7LjKRnzx82pJPBw9Mqm/EaHg=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CWJW5k2rX1ScxkNA9d5yiCu0rwtejcucSF5rLbuta6Y39PjV2+y3CNqIqUAN4Y09W
	 UvP1l23BKHJ/mBrHF6Nw9+iH9yMn+WngTg33IFUVSGP63r4as3UINLo9SJmD5Cx1Ja
	 /7F4Jz8CNdOz8OMHacssUIxzL1M0dH5Hdj886RFQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E618F80482;
	Fri, 17 Mar 2023 17:37:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E60D1F804B1; Fri, 17 Mar 2023 17:37:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA4DEF80425
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 17:37:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA4DEF80425
Received: by mail-il1-f182.google.com with SMTP id 4so3037258ilz.6
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Mar 2023 09:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679071025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcritOrlAL7LuDSySaaHoz9IYB1WBIYVDspOFtztN2k=;
        b=VakPeJmQ5XZDYdf8aCe42MfdLKhbwFzz7D1UxxT/7+EEMPLocGSTvexGG6F9dpA7Ky
         7rUIcdGABkyy279V+ngY+rP51Dys1440quGmMQT/4vO4SHrVR/L77ZQaMsse0YC6zD+i
         iUoT/aQZt7Z6ljLVGNKwP67551qZ2c1ZOZo2oJlittH76NE0lM90GKStlGeFrrI4+OBC
         1PxeYCmNvOxauZKQFM44xSIgunR8U9hFjRErjYXqdpQIg1L4uS9otbv+ngDAS1Wl5D2b
         zvxzQo8cVt2mRZmoM7Sx4fSb4pcEkMBoEVLvEVjtASuDZhKv0HefMg/BqKZ4dGl90Bl8
         0BQw==
X-Gm-Message-State: AO0yUKVrTRziifiLvdPOmYAjWGoHy9Dz8BsTBDL4ulmNuY+6FnRM3gA/
	pQGM5hqcwC0HiRt/F9yutw==
X-Google-Smtp-Source: 
 AK7set+RA5nev2MuiGtvMOrTL9xbsjPWnCjv0S5EA55HGbZQWvOKZPDt9AH3ni/HX9m4JeT1ZbJD9g==
X-Received: by 2002:a92:d091:0:b0:317:3f4:c5c7 with SMTP id
 h17-20020a92d091000000b0031703f4c5c7mr67132ilh.3.1679071024928;
        Fri, 17 Mar 2023 09:37:04 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id
 o1-20020a056e0214c100b003139668e844sm727471ilk.13.2023.03.17.09.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 09:37:04 -0700 (PDT)
Received: (nullmailer pid 2438515 invoked by uid 1000);
	Fri, 17 Mar 2023 16:37:03 -0000
Date: Fri, 17 Mar 2023 11:37:03 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/9] ASoC: dt-bindings: qcom,lpass-rx-macro: Add
 SM8550 RX macro
Message-ID: <167907102243.2438451.4014850401965311641.robh@kernel.org>
References: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
 <20230313075445.17160-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313075445.17160-2-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: OJIETVX36CSTRYY76PWA3RPTZ2JHGG2H
X-Message-ID-Hash: OJIETVX36CSTRYY76PWA3RPTZ2JHGG2H
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OJIETVX36CSTRYY76PWA3RPTZ2JHGG2H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 13 Mar 2023 08:54:38 +0100, Krzysztof Kozlowski wrote:
> Add the RX macro codec on Qualcomm SM8550, which comes without NPL clock
> exposed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-rx-macro.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

