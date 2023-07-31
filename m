Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A79769356
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 12:45:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFCB4820;
	Mon, 31 Jul 2023 12:44:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFCB4820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690800316;
	bh=ptgtKRZHz9m08pFGdSOUsCJDYP/pYOSuWW3+Fc/rwY4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=tsqY3QNcwTzlWnrmV6R7W82AgaixPZyu0h3mPMqryAl5G60ti6yr4qdKHLZXw15fo
	 MiaYzASQ1xTHMWQO7GvI7O+51FOTi8YhgCxRnMylou48N8HvXa4vWW8Htx139sPSnC
	 fJsKq7U/xmd+MO5jdMvRkqq1TxQI0GcIYJuFnAEc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1CF7F80551; Mon, 31 Jul 2023 12:43:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6467F80548;
	Mon, 31 Jul 2023 12:43:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AFF4F8016D; Mon, 31 Jul 2023 12:43:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B463F80163
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 12:43:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B463F80163
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=N0AyWZON
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 192446606EF9;
	Mon, 31 Jul 2023 11:43:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690800201;
	bh=ptgtKRZHz9m08pFGdSOUsCJDYP/pYOSuWW3+Fc/rwY4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=N0AyWZONptSpzY6GYIkhAun32R28SJB3I0GRYaShUMJPiPFyQ87ITe0vaN57+zrQd
	 7hoBInXqVu1NnXqLMSaugJgIioMr5C7SU3gr5iZEcj6Ifda2xvx2rrSZIurLz3g5Hb
	 dKkxes3MLIGxZkl6CA1TekBtQJ2kAYd1ZWFN6fKJPUfDspG3lV4JqZ/MO8851ru1uK
	 g8xs8OdaNrPmP2cQyT/5nJm8Fo3nv6nb65EZYCq7p2SytXSSP77gTSpGjM6ppRLpRc
	 6urXA2EBEa/y8Mqxk+KbYChq/uMrpDJTE1pEOvZ2Bmxd9AxLD/y6cTyy5KNOe9kRUP
	 NI9yQaPMHK6UA==
Message-ID: <eeaa3d0c-2f47-3eb1-52b4-742889a7f8fb@collabora.com>
Date: Mon, 31 Jul 2023 12:43:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 03/12] ASoC: dt-bindings: mediatek,mt8188-mt6359: use
 common sound card
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
 <20230731094303.185067-4-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230731094303.185067-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VWTJOEV3BRA3UJMVV5IKTWYNPBKLSYXA
X-Message-ID-Hash: VWTJOEV3BRA3UJMVV5IKTWYNPBKLSYXA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VWTJOEV3BRA3UJMVV5IKTWYNPBKLSYXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 31/07/23 11:42, Krzysztof Kozlowski ha scritto:
> The mediatek,mt8188-mt6359 Linux sound machine driver requires the
> "model" property, so binding was incomplete.  Reference the common sound
> card properties to fix that which also allows to remove duplicated
> property definitions.  Leave the relevant parts of "audio-routing"
> description.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

