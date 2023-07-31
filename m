Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E20769353
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 12:44:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 881061E7;
	Mon, 31 Jul 2023 12:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 881061E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690800266;
	bh=E33CjQpupE+wG7p1Io0hOHXbBBhWMbME1c4m45LWYVw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ULN8Y5kFRInKg5DguWEsR1xObENt8vndVQnQfDIL0RqvomZsU+Be4DnXKN9OMxIua
	 8MjDpgIAYM30JzeVppuHsRUuyqf9OfA9oZ6nhrMLsyXx9lIhiyIi+tmv+gvWbdhCe4
	 zFruBUGaH/Q9DoEjTKSK565Kp/XrNvHuhLfG3zo4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6272F8025A; Mon, 31 Jul 2023 12:43:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBDF9F80163;
	Mon, 31 Jul 2023 12:43:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40F38F801D5; Mon, 31 Jul 2023 12:43:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0704CF80149
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 12:43:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0704CF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=h5feVxPD
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0116B6606FCD;
	Mon, 31 Jul 2023 11:43:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690800202;
	bh=E33CjQpupE+wG7p1Io0hOHXbBBhWMbME1c4m45LWYVw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=h5feVxPDdExw5PulaXEMxo5XT+cnAJ2hOXSf8Yv1Gud8+32fiOyE3evk/pTrh9Jx3
	 bTaVWSLtbVN/jMBTr2pyqXuzfq94QjIxfySd4vyQj4e32V7hv1+uOQEgrk7XxEFRNx
	 f2mWJQ0/fFiINL+0pjH90kklq+yIdbNStPKRWRNbbEEhJGka5N+TvqAiI47y85nz1G
	 uzSo1xQj1Zq+zUzZWMGJwtURVkinsdhqHTTddJ++X0gVaWbnvemzO9FihXuUjirywz
	 mRdWFFOkCnXMFF5kB5Fjgdu9VtcNn0l5x3GY+h9vxgZA6SNw82OdMaiN5cf75uOCuO
	 Ni6WIst/Dsbpg==
Message-ID: <4a4e3228-7d29-5508-4e0b-584436212b21@collabora.com>
Date: Mon, 31 Jul 2023 12:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 02/12] ASoC: dt-bindings: Add common sound card properties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 Rohit kumar <quic_rohkumar@quicinc.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Rao Mandadapu <srivasam@codeaurora.org>, Judy Hsiao
 <judyhsiao@chromium.org>, Trevor Wu <trevor.wu@mediatek.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-3-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230731094303.185067-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VC7ZUGWVE6NRY5IFDQBLHLAZD4ZSQXWU
X-Message-ID-Hash: VC7ZUGWVE6NRY5IFDQBLHLAZD4ZSQXWU
X-MailFrom: angelogioacchino.delregno@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VC7ZUGWVE6NRY5IFDQBLHLAZD4ZSQXWU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 31/07/23 11:42, Krzysztof Kozlowski ha scritto:
> Almost every board machine / sound cards has "audio-routing" and "model"
> properties, so move them to common schema to have only one definition of
> these properties.
> 
> For amlogic,gx-sound-card, leave the "audio-routing" constraints in the
> original binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


