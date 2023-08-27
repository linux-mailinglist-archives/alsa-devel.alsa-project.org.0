Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A053789BF8
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 09:59:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B11A9827;
	Sun, 27 Aug 2023 09:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B11A9827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693123194;
	bh=sFzN1jm1+NKAuQJqXevTbRUv+aYoiKf7cqBLmvbQokk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AVycmrA7V9jy4brpERy/I23Xg6AMNyL+rCQ32C16yyml5BRRBkMQ4FdD4ZnnGKdeY
	 jtBPTlu3Z3Zb2hyflcEh1vkiuErqzpr9KLU7Dyc01K2wVzHwsnrugHoceJnovpSp0l
	 nVTGaF+4bfdv9MZZ2lwOTxVAQ9SERBhgFg7OUAHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA8A8F80158; Sun, 27 Aug 2023 09:59:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87CD3F800D1;
	Sun, 27 Aug 2023 09:59:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E48AF80158; Sun, 27 Aug 2023 09:58:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7492EF800D1
	for <alsa-devel@alsa-project.org>; Sun, 27 Aug 2023 09:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7492EF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NuyQFG2d
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so6719319a12.0
        for <alsa-devel@alsa-project.org>;
 Sun, 27 Aug 2023 00:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693123130; x=1693727930;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yzHei1g5YcSQyHI7e3WpJcQQ0IiVSLaR8OHizgTz2sU=;
        b=NuyQFG2dWALVm9IlA6RPXxpye1iubdJRrWzysgAFBx/BVK3KOKkV7hAN92wbVpswjS
         h6qSMZVbNdpWu7sBmD6Dj/G9W+Vmy9qCIEel4JiPHTrNt4SlRp4sRkGE7ErztcOzvhG9
         ivW3te4QF6anSPrsQlxZeenilLkT2V2Q8Rh4216XeEWQevJ4LfGGmithk41G1MKqHSja
         WEUC0pSDTGBY/fDKYpa2pnAvASbelWfKc0XhgDos3S520RvgG66nBoQZnNcMndoHYckD
         pcuGIZdFOvha3da1TrwAzEHiDYABiP/5ypp03pqMeCJMQwAqo7vFXNSL9hCXLmOci03Y
         5DCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693123130; x=1693727930;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzHei1g5YcSQyHI7e3WpJcQQ0IiVSLaR8OHizgTz2sU=;
        b=jFlUCNMlyFIuSyc9Dtkih07Ou8OVGf+7YuRepRlgnG9UWYYrov5Ya5fjw7YlkgHScZ
         kiaTJdiOfWwkyHpW4btwiilY3kRNJ08OGyA8CJuCW1uthKKGxs/Lh3lzCFIf0Qx4wHdH
         s0DdmdB2rJ0uLgFYpLCz1wkTLxHgcBwcz8m5VqfskpajQEHSMMxGnAjIjyuOmFq3Vj9l
         CqvxIgBybdOob5tmXQF4dqzsOP7nyeZyTOaMHx0E1cSsB7YIiuAmrNwzfrJ20L3luvhE
         bqI9LKT0xI/65zArLyRIgMX3vWma3re7D1ikuojEivBRzl2Z7T23qp87t9EEzlx3rZHv
         U3+g==
X-Gm-Message-State: AOJu0YywXbRtCg5BmeitRYu6ejnAZcayWEPLHyy8PnLg61+0Q9KFHZ0a
	iVK55odgaEgOXFJuTUmLsISxnA==
X-Google-Smtp-Source: 
 AGHT+IEScLBkcO8pNEPy/rMoZr5psWXGID4i8adwolALGUX2Z3hUeYCGx1OSe5h3fjCoxnJc0gD8KA==
X-Received: by 2002:aa7:de12:0:b0:522:3149:159b with SMTP id
 h18-20020aa7de12000000b005223149159bmr26594190edv.2.1693123130231;
        Sun, 27 Aug 2023 00:58:50 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id
 n25-20020aa7c459000000b005259dd903e5sm3023822edr.67.2023.08.27.00.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 00:58:49 -0700 (PDT)
Message-ID: <f425912e-e2de-2015-cc16-0631a1fd8abd@linaro.org>
Date: Sun, 27 Aug 2023 09:58:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V2 1/3] ASoC: dt-bindings: fsl_easrc: Add support for
 imx8mp-easrc
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230827023155.467807-1-aford173@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230827023155.467807-1-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UA2O3SC6VWE6ZGPOQHUMWPSRPOSWJZCW
X-Message-ID-Hash: UA2O3SC6VWE6ZGPOQHUMWPSRPOSWJZCW
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UA2O3SC6VWE6ZGPOQHUMWPSRPOSWJZCW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/08/2023 04:31, Adam Ford wrote:
> The i.MX8MP appears to have the same easrc support as the Nano, so
> add imx8mp as an option with a fallback to imx8mn.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

