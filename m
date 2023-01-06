Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F5965FDD1
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:25:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BED014197;
	Fri,  6 Jan 2023 10:24:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BED014197
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672997112;
	bh=/guuqpYUGNjdXQuLjNqMSHdBTlf67T4+XuF5fMg8NmA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Qt3Dgz9yVKCxlM5m6sbiDV65/BTl+nZ/KoCAJUNat9V2OsWTucfX9cZsjZcipQ6T2
	 f4nmV/9ktc2SYnyIDhP4miNXxvc71k+dVIFvwWup9HVVzERFsNV6+wfXIbRz8y7u+9
	 OIN7/GQvuqT+mYTNFYqoK4yfwsJGS5de2F4XiRn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 427E0F800C0;
	Fri,  6 Jan 2023 10:24:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 222D1F80238; Fri,  6 Jan 2023 10:24:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60448F80238
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:24:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60448F80238
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YTbpxPT1
Received: by mail-wm1-x333.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso3110278wmb.3
 for <alsa-devel@alsa-project.org>; Fri, 06 Jan 2023 01:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SK0dKOCEBiaYKVTOvhAS22+z7lpa7ZgsHoskRIRAsZc=;
 b=YTbpxPT1ydolX/yLiyHmyWQXFkrm76SJhztxoGBZX3lIpxBbCW/ue7DCp6AtCG9DnI
 yDu9AD5+xqLyvsC9TSBoQKdQ9H73q+SPg6W/D1yGKk9StZfYlZ356SvmshsHoSVv9T/G
 jcQCIcvTHcsT8gJzeQef+d+nGR2q7gASrn1Fnln5Ejp3+lsENDxg3CSPvXp3/HOeXJR2
 2c0EEDx94X+WkfyNLGtsqwJWAOy/1HgVcQ7bE31mSDXNobClaQBXBsi+xaQSZBqTl170
 5pFD3NtwDVWjJgbyBkqox87NKkY2JxhMgxnyplkoH304Bcyq9Q9YImAqgJslqXIV434U
 Cb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SK0dKOCEBiaYKVTOvhAS22+z7lpa7ZgsHoskRIRAsZc=;
 b=O0mCQkLnrW1zqBeYqJK1CzeKxdVG+vWWKz2Jkt1/KLx4b7VulSxCxoUiBDxFa6mxP3
 uAxxrlu5znzuUZW8wsWbbiHls7lTKJXwVYAEOG+nydqM7iuWINeniZGwd8HottKBQdDS
 sxoY1KqDxtR8QjW7DYgFA+F51N7MDzU3BLL9D/UE4JlsfkqPwFCAo5t/mDTCAmML39TA
 38lj0wrrAm9ggUNIZNwqfeluPvUugfMTWd9VX0RGGhdc2KuLaMEWAR8YUe8brMi/XW+2
 lNbnW17qhrS7MnA3s4S9n46bY2BwmlPVfKtqiUpJF0GJi+KyPWgu6Z2Rgz2foAtXanYs
 714g==
X-Gm-Message-State: AFqh2kqRDlURCFK0tiUH3/zAcYl3GrSqhL3JqEALlVPR+02Vk/St2hVC
 7fHf3w2RKRhHM0wjJDURe1J3sg==
X-Google-Smtp-Source: AMrXdXvUXP1CXYiwjVxyNq2t/+oSyvDqLJuGkimxPKQaOx1jLGDORGChSn+kZ/MZBKQgytJdm7fmrA==
X-Received: by 2002:a05:600c:798:b0:3d3:5737:3b0f with SMTP id
 z24-20020a05600c079800b003d357373b0fmr47698542wmo.36.1672997049322; 
 Fri, 06 Jan 2023 01:24:09 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c1c8400b003d22528decesm6453805wms.43.2023.01.06.01.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 01:24:08 -0800 (PST)
Message-ID: <b74b4438-9496-f636-995b-4acdba5766f1@linaro.org>
Date: Fri, 6 Jan 2023 10:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] ARM: dts: vfxxx: Swap SAI DMA order
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Marek Vasut <marex@denx.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20230105144145.165010-1-marex@denx.de>
 <20230105144145.165010-2-marex@denx.de>
 <5c2f0bba0a3a9d846cdfbcf7529759327d895810.camel@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5c2f0bba0a3a9d846cdfbcf7529759327d895810.camel@pengutronix.de>
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
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Richard Zhu <hongxing.zhu@nxp.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, Alexander Stein <alexander.stein@ew.tq-group.com>,
 Adam Ford <aford173@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 Paul Elder <paul.elder@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Tim Harvey <tharvey@gateworks.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 06/01/2023 10:18, Lucas Stach wrote:
> Am Donnerstag, dem 05.01.2023 um 15:41 +0100 schrieb Marek Vasut:
>> Swap the SAI dmas and dma-names to match the order documented in
>> Documentation/devicetree/bindings/sound/fsl,sai.yaml
>> No functional change.
>>
> While I'm not opposing this patch, I find this class of changes a bit
> odd. The *-names properties are there so the properties they are naming
> can be in any order in the DT without impacting the lookup. Enforcing a
> fixed order for named properties just feels odd.

DT requires fixed order regardless of '-names' property. '-names' are
not there to fulfill "can be in any order", but merely a helper.

> 
> Not sure if the schema validation could take this into account or if
> there is any policy in place already by the DT maintainer that we still
> want to enforce the same order in the DTs as in the bindings.

The order in DTS must obviously match bindings, however here both are
changed, so what is exactly your concern?


Best regards,
Krzysztof

