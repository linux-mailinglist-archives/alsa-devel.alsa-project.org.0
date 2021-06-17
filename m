Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE893ABCF2
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 21:37:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA3081791;
	Thu, 17 Jun 2021 21:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA3081791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623958638;
	bh=+2GpIeWAnP608repJZ1nuRpkLwEUqsjsVehX302inJs=;
	h=Subject:To:From:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qBuJeZ7TvMk/VKJ4TsWOGG3iVpMvlj81dWK5tNM6wJC/UfkYDEq8msQX5GQnn7NkO
	 xl0SOkbQiOyf7ra1V5euupnjdv9iFmkR+5Lug5kMGpSmaRDI6zM8yvUiMFI7opR7V9
	 c18gr3KKF6YLJDNxDKAYD8H1DaZzfKYRhy6IOrVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47A56F80171;
	Thu, 17 Jun 2021 21:35:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C45AF8025A; Thu, 17 Jun 2021 21:35:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DCA5F8016D
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 21:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DCA5F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="vOBgpWQJ"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210617193538euoutp01bdbd6e711239e0f9bd555968e301102e~Jda_--otG2992029920euoutp01Q
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 19:35:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210617193538euoutp01bdbd6e711239e0f9bd555968e301102e~Jda_--otG2992029920euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1623958538;
 bh=1uBGtvIj4Fl53/heI+tivIwbHFbFUjdAyoDsN8HU7AU=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=vOBgpWQJO5Uvc7wHBO2E49eLkmiCH8oG+m6WtbgmTKiO93v7+01SQ1bCwW5EjqNOy
 BiiAAWTiW4gIo2npetX7TA9ZbzueJAwaFbxXyC8LFLgasIlsV1hzDNTwpuc0V/7WXg
 bQdMBEDmDun2iJpo2/ceAAXy5hP5e9WrIeNyfd2c=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210617193538eucas1p25880900add5677a5b24e765f96cf59f2~Jda_sXNFO1768817688eucas1p2d;
 Thu, 17 Jun 2021 19:35:38 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id DF.1B.09452.904ABC06; Thu, 17
 Jun 2021 20:35:37 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210617193537eucas1p217b93d091ae8795581b30931ad8c7467~Jda_HNMXR1770317703eucas1p2l;
 Thu, 17 Jun 2021 19:35:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210617193537eusmtrp27e275fd525e9e366420607d6017f9e3e~Jda_GW5AA0769107691eusmtrp2L;
 Thu, 17 Jun 2021 19:35:37 +0000 (GMT)
X-AuditID: cbfec7f2-a9fff700000024ec-58-60cba4092751
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 87.2B.08696.904ABC06; Thu, 17
 Jun 2021 20:35:37 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210617193536eusmtip139d9d96d6e14d089ee2c12c407754f4f~Jda9Gd0Am2888128881eusmtip1J;
 Thu, 17 Jun 2021 19:35:36 +0000 (GMT)
Subject: Re: [PATCH v3] ASoC: qcom: Fix for DMA interrupt clear reg overwriting
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
 rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org, judyhsiao@chromium.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <5ae06ccb-ffd4-ca9f-5a88-1f8bf8b48d37@samsung.com>
Date: Thu, 17 Jun 2021 21:35:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210609072310.26099-1-srivasam@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xbVRzHc+6rj6x4uRv2DAkKxsVNxiMad0AkLJnzGv8QHIlRcOMG7ui2
 wpZeOtFoUkcGrIKDBmLbwdjDPYKyIlQYbF1HQeokNEVoZQLisHUD1yJDrMPho72Z8t/n+z3f
 X87ve3KkODNHxkr3lZXzmjJOnUjJie6h+66tsk+HC1NnZp5Hrp/+JND4qANDH06eIdGwPUig
 pls+CrUOukjkbajG0O/jNRhqsI9I0FhfM4WO9R0nUU1LPUBHbYMSdMNaCVDV0BCJQvMjOHJO
 +THUEWoH2QzbsXSEYk/oRgl27OM6jO01T0vYzrZjFDvlvUqx1wLnKdZi9RDsUmd8juwteWYx
 r953mNekZBXKVfZzXxGHvoutaLxiADpwKkYPZFJIPwfPX/8M1wO5lKEvAui1+4AofgNwwDYr
 EcUSgKbK04QeSCMj/SZG9C8A6O/VYaJYBLCrLoSHQ+vpXGjyHQ77G2gvDuc816jwfRSdBvUB
 fYQVdBZsql8gwkzQT0HT7CIW5hi6CC6cNJJiJhreMPkiGRn9Ipw0GiKM04/DnkAzLrISfu9r
 jSwBabsM3jneTYrldkBdTwMm8no477RKRI6Df/c+HKgE8JarXSKKWgDHjhiBmHoBTrlWqHAd
 nN4MLX0por0dWlZrSPEpouBEIFpcIgoauj/BRVsBa6oYMb0Jmp2X/ru23/0tLjIL7TYPWQ8S
 zGtqmtdUM6+pZv5/h1OAaANKXiuUlvBCWhn/TrLAlQraspLkooOlneDf3zj8l/PeZdAyv5js
 AJgUOACU4okbFFuFrwsZRTH37nu85uAejVbNCw7wmJRIVCraTny+h6FLuHL+AM8f4jUPTzGp
 LFaHCbzO1qU3hGYyiJy5M+tKjCOjcbXDXpdrf+343qS3+7urRrhvli7/bGvc/8Sb6Ugiv638
 KOMAleqf6AnF773kKc5Pn7QmpGefla/435iczsob3J28MYMd/CLYuivp9hZydYHpOJlfsbKr
 enr7s+qXmwqqPvgy9H5L/Wvcbm3Mr/nbBpKOJtzMjXN7lAN43Usw714Ul+4veKXF4m7cefcP
 cD33bqmKw39IbX46RXgwk7dZe+7quoJHl8+qgDJozQxuurIzYeFOUXQF8+NGy5PVv8zi7E2H
 aq78/vID98TK6eLlKsM2yUXmwut+oitv9dWc6vbMbGMguOORWI37GedEvDqREFRc2hZcI3D/
 AFU5vcr8AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRmVeSWpSXmKPExsVy+t/xu7qcS04nGPybyGtx7vFvFosrFw8x
 WTTeXsRqcXr/OxaLqQ+fsFnMP3KO1eLaxHYmi29XOpgsJu4/y25xedccNovOXf2sFh1zJzBa
 tO49wm5xckszo0XbsWOsFt9fnWW2OH7nKZPFhu9rGR2EPDZ8bmLzmN1wkcXjcl8vk8fOWXfZ
 PTat6mTzuHNtD5vHvrfL2DzWb7nK4vF5k1wAZ5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJ
 pZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexv6lR1kKrktVTNk9ibGBcYFoFyMHh4SAicTBmUJd
 jFwcQgJLGSU6pvxi7GLkBIrLSJyc1sAKYQtL/LnWxQZR9J5R4vXMkywgzcICgRIzn5SBxEUE
 rjFLLD78mAmkQUjARuLv+2VsIDabgKFE19suMJtXwE5i6oT3LCA2i4CqxMxHH8HqRQWSJX6u
 b4eqEZQ4OfMJWA2ngK3E7RmTwGxmATOJeZsfMkPY8hLb386BssUlbj2ZzzSBUXAWkvZZSFpm
 IWmZhaRlASPLKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMCI33bs55YdjCtffdQ7xMjEwXiI
 UYKDWUmEV7f4RIIQb0piZVVqUX58UWlOavEhRlOgfyYyS4km5wNTTl5JvKGZgamhiZmlgaml
 mbGSOK/JkTXxQgLpiSWp2ampBalFMH1MHJxSDUyiut98wv02JDt5Pg2Qj1/Ie9pEVF6vQn7v
 461b1nyYo7AvbW7Hc9UJ88JWBQm+mvFm1pXOtFvb5/RWbrWofzdBinl1Xuhb8+KWqO7//1p4
 WwJOJ4bMc1E3LmBarFb85tq16H87PYrX+R/a7/E2csWcLJZ7/zkWf7/K/ex7dINESqYqY9i7
 H3p20oXVmm9Envunl2y0OLrM6abAavVDwbv2Xtqqk2rnwucY8O+3waWVP7R9pzqnT1SaWZtX
 bqzwZ+YSPp30ScsX32Pl7VleVK/xTW6Hr2nh1nbDvLcn/93iVZu9pIq1YqHJ3/mTBLeybL9w
 7p5UuX9X280XTBWazi0BvjJTVr+oe87+49EN8R1KLMUZiYZazEXFiQDqfHfvgQMAAA==
X-CMS-MailID: 20210617193537eucas1p217b93d091ae8795581b30931ad8c7467
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210617193537eucas1p217b93d091ae8795581b30931ad8c7467
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210617193537eucas1p217b93d091ae8795581b30931ad8c7467
References: <20210609072310.26099-1-srivasam@codeaurora.org>
 <CGME20210617193537eucas1p217b93d091ae8795581b30931ad8c7467@eucas1p2.samsung.com>
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

Hi,

On 09.06.2021 09:23, Srinivasa Rao Mandadapu wrote:
> The DMA interrupt clear register overwritten during
> simultaneous playback and capture in lpass platform
> interrupt handler. It's causing playback or capture stuck
> in similtaneous plaback on speaker and capture on dmic test.
> Update appropriate reg fields of corresponding channel instead
> of entire register write.
>
> Fixes: commit c5c8635a04711 ("ASoC: qcom: Add LPASS platform driver")
>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

This patch landed recently in linux-next as commit da0363f7bfd3 ("ASoC: 
qcom: Fix for DMA interrupt clear reg overwriting"). It breaks ALSA 
playback on DragonBoard 410c (arch/arm64/boot/dts/qcom/apq8016-sbc.dts). 
After applying this patch, running 'speaker-test -l1' never finishes. 
There is no error nor kernel warning message. Before that commit, the 
playback worked fine on that board.

> ---
> Changes since v2:
> 	-- Removed redundant variables.
> Changes since v1:
> 	-- Subject lines changed.
>   sound/soc/qcom/lpass-platform.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 0df9481ea4c6..f9df76d37858 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -526,7 +526,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   			return -EINVAL;
>   		}
>   
> -		ret = regmap_write(map, reg_irqclr, val_irqclr);
> +		ret = regmap_update_bits(map, reg_irqclr, val_irqclr, val_irqclr);
>   		if (ret) {
>   			dev_err(soc_runtime->dev, "error writing to irqclear reg: %d\n", ret);
>   			return ret;
> @@ -650,10 +650,11 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	struct lpass_variant *v = drvdata->variant;
>   	irqreturn_t ret = IRQ_NONE;
>   	int rv;
> -	unsigned int reg = 0, val = 0;
> +	unsigned int reg, val, mask;
>   	struct regmap *map;
>   	unsigned int dai_id = cpu_dai->driver->id;
>   
> +	mask = LPAIF_IRQ_ALL(chan);
>   	switch (dai_id) {
>   	case LPASS_DP_RX:
>   		map = drvdata->hdmiif_map;
> @@ -676,8 +677,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	return -EINVAL;
>   	}
>   	if (interrupts & LPAIF_IRQ_PER(chan)) {
> -
> -		rv = regmap_write(map, reg, LPAIF_IRQ_PER(chan) | val);
> +		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_PER(chan) | val));
>   		if (rv) {
>   			dev_err(soc_runtime->dev,
>   				"error writing to irqclear reg: %d\n", rv);
> @@ -688,7 +688,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	}
>   
>   	if (interrupts & LPAIF_IRQ_XRUN(chan)) {
> -		rv = regmap_write(map, reg, LPAIF_IRQ_XRUN(chan) | val);
> +		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_XRUN(chan) | val));
>   		if (rv) {
>   			dev_err(soc_runtime->dev,
>   				"error writing to irqclear reg: %d\n", rv);
> @@ -700,7 +700,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	}
>   
>   	if (interrupts & LPAIF_IRQ_ERR(chan)) {
> -		rv = regmap_write(map, reg, LPAIF_IRQ_ERR(chan) | val);
> +		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_ERR(chan) | val));
>   		if (rv) {
>   			dev_err(soc_runtime->dev,
>   				"error writing to irqclear reg: %d\n", rv);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

