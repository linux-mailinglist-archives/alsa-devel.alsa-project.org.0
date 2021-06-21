Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 542083AEA53
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 15:49:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5E531684;
	Mon, 21 Jun 2021 15:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5E531684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624283342;
	bh=Px3U0vIJOR9+4P9tFLiv33AajDA+Qy49z/9CU42x4+c=;
	h=Subject:To:From:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NY7mjKXom+Aoinme26FP3bJs0T4kFYc+ioHCMVB9BnBV0IYm+uDuZa5C7sQztfd5i
	 v37/QMf+VPEvt+YbKwra1SJaTsNc3KyFLULAEWPb+LnjLPn2z5fRA0dsjB+ZHW/yDZ
	 KEs/mLV86fNUAoZci/6GiaYAgBzXBWyaaTuOeSYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59BEFF80111;
	Mon, 21 Jun 2021 15:47:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67528F8016D; Mon, 21 Jun 2021 15:47:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0AD5F80111
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 15:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0AD5F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="qhFRnE+r"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210621134724euoutp02aeb836e02c419895a47b731bcf0ba3bf~KnQFLPloC0908509085euoutp02c
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 13:47:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210621134724euoutp02aeb836e02c419895a47b731bcf0ba3bf~KnQFLPloC0908509085euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1624283244;
 bh=WBGmiRk36mDUrOliQVAlmO4y07enstu/5D4iQkLvX/M=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=qhFRnE+rGPLp/bGBNqiPpmV4MnV4In63WvH5jbp5wAwMWdvQj1q5ivU2uAwrri+6j
 VaAMm3vPOVjZBfcM7d1L2FC8eL06mVUdolXIRdFAFons7qFtUQnKWqUnjw7QfajQs9
 DI+xG9FFjyUD40l8t2WHcSpbtb+BfinwCMXj0qpw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210621134724eucas1p2899419d20b04f726caab86c236f75932~KnQE9dAbw1083610836eucas1p2Y;
 Mon, 21 Jun 2021 13:47:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id EB.4F.42068.C6890D06; Mon, 21
 Jun 2021 14:47:24 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210621134723eucas1p15155c018d83a6cc8f58e8b235a5fe964~KnQEVbWJW1095010950eucas1p1O;
 Mon, 21 Jun 2021 13:47:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210621134723eusmtrp1b907cbe0396d95965509cc3bed52df3a~KnQEUi1Sr1681616816eusmtrp11;
 Mon, 21 Jun 2021 13:47:23 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-8d-60d0986cc113
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 56.FB.31287.B6890D06; Mon, 21
 Jun 2021 14:47:23 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210621134722eusmtip2edd869dc85c0c59c448fc878e343f2d2~KnQDR6AMc2887228872eusmtip20;
 Mon, 21 Jun 2021 13:47:22 +0000 (GMT)
Subject: Re: [PATCH v3] ASoC: qcom: Fix for DMA interrupt clear reg overwriting
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Srinivasa Rao
 Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <f12445cc-53ad-4ebe-c0f7-c0d86b369164@samsung.com>
Date: Mon, 21 Jun 2021 15:47:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ec4f3faf-2169-3cd2-7471-976f20f77110@linaro.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBKsWRmVeSWpSXmKPExsWy7djP87o5My4kGLT8ZLU49/g3i8WVi4eY
 LBpvL2K1OL3/HYvF1IdP2CzmHznHanFtYjuTxbcrHUwWE/efZbe4vGsOm0Xnrn5Wi465Exgt
 WvceYbc4uaWZ0aLt2DFWi++vzjJbHL/zlMliw/e1jA5CHhs+N7F5zG64yOJxua+XyWPnrLvs
 HptWdbJ53Lm2h81j39tlbB7rt1xl8fi8SS6AM4rLJiU1J7MstUjfLoEr49yzBawFh0wqmv5c
 YGpgbNTtYuTkkBAwkfjc38fcxcjFISSwglHiz5kXUM4XRokt856wQjifGSVWtXxhgmk5vHoF
 VNVyRomeD12MIAkhgY+MEkf/sXcxcnAICwRKzHxSBhIWEXjHLPFjkjmIzSZgKNH1tosNxOYV
 sJM42HsezGYRUJVou/EGbIyoQLLE+3kzWCFqBCVOznzCAmJzAtXf37cYzGYWkJdo3jqbGcIW
 l7j1ZD4TyD0SArs5JQ7vaGOHONRFYtHM6WwQtrDEq+NboOIyEqcn97BANDQzSjw8t5Ydwulh
 lLjcNIMRospa4s65X2wg3zALaEqs36UPEXaUWP+3gxUkLCHAJ3HjrSDEEXwSk7ZNZ4YI80p0
 tAlBVKtJzDq+Dm7twQuXmCFsD4n9e6+yTmBUnIXkzVlIXpuF5LVZCDcsYGRZxSieWlqcm55a
 bJSXWq5XnJhbXJqXrpecn7uJEZgYT/87/mUH4/JXH/UOMTJxMB5ilOBgVhLhvZlyIUGINyWx
 siq1KD++qDQntfgQozQHi5I4b9KWNfFCAumJJanZqakFqUUwWSYOTqkGJhXPST58S2q2Pd+v
 O7X3jfaNHz/FvfZ67P52dK3LHfGkXL/K7Xv/fvkj84aJ1ejs4sKvXE0uvTXvpvcWKag+qea4
 dU7l8Ow+3zMFSapuEhsWT/90gT8nRPDDBr30G6n32HbWLb7dGZZ9l4NPYjrXU+ZHQg2Tjxa+
 8v67v1jX3F5oGU9G1fe1k4R1lJIsmhi+TmE+te1G1GLuD2YXCrjnvPLY9PvY/rUPVFkrOq/L
 sRRNvGncpyNiuHzic//obdoF76dmLP2//dJJoZ2zZh5iCRZgSQxe9rNBKt7ywenHq/L6Iv0P
 V262mmBj+aRKbfVzTd9Hj95G7BaO1/Li4mmUVuz+mbj3S3/R2sfHbik4VSixFGckGmoxFxUn
 AgCjBkZM+wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRmVeSWpSXmKPExsVy+t/xe7rZMy4kGEy4Im1x7vFvFosrFw8x
 WTTeXsRqcXr/OxaLqQ+fsFnMP3KO1eLaxHYmi29XOpgsJu4/y25xedccNovOXf2sFh1zJzBa
 tO49wm5xckszo0XbsWOsFt9fnWW2OH7nKZPFhu9rGR2EPDZ8bmLzmN1wkcXjcl8vk8fOWXfZ
 PTat6mTzuHNtD5vHvrfL2DzWb7nK4vF5k1wAZ5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJ
 pZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexrlnC1gLDplUNP25wNTA2KjbxcjJISFgInF49Qrm
 LkYuDiGBpYwSFw6dYIdIyEicnNbACmELS/y51sUGUfSeUeLfhLNAHRwcwgKBEjOflIHUiAi8
 Y5b42JwPYgsJ/GSU+HYzB8RmEzCU6HoL0svJwStgJ3Gw9zyYzSKgKtF24w0jiC0qkCzxc307
 VI2gxMmZT1hAbE6g+vv7FoPZzAJmEvM2P2SGsOUlmrfOhrLFJW49mc80gVFwFpL2WUhaZiFp
 mYWkZQEjyypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzAiN927OfmHYzzXn3UO8TIxMF4iFGC
 g1lJhPdmyoUEId6UxMqq1KL8+KLSnNTiQ4ymQP9MZJYSTc4Hppy8knhDMwNTQxMzSwNTSzNj
 JXHerXPXxAsJpCeWpGanphakFsH0MXFwSjUwCZf9vHCkSb1r09fFU16Inxae674lVfiZxb8P
 dgHOtgeKnpWLiK6X6FnveJhdIq751hLfm5PN3WXC59rf/1Vl+HUR98xp9iUmZ4VP8P7LOs2z
 WvTMdV9v608bjoaWnHvLkeZwmn96Zltj2kOJTQaL2pLzO2LK88IbE2b4Laz23Ncsq8MsaMd9
 SenEK4++n+ccJ7TPmm/z8NPm836Tzz+Z/nT3m1urN+/2PdSiZLDA8dRphe6KvUtb28XSP1at
 /BF6qaeH8cwbw2vsl14Fx81Yp/ukcMrRdeF7D1gJrJPXu96aJxE21V/akr2sJVMh1EU9+Pw6
 vgPyxfsmps/9fMCO3f1yovGfUO9FR9eINPnXK7EUZyQaajEXFScCAD2Jg6OBAwAA
X-CMS-MailID: 20210621134723eucas1p15155c018d83a6cc8f58e8b235a5fe964
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210617193537eucas1p217b93d091ae8795581b30931ad8c7467
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210617193537eucas1p217b93d091ae8795581b30931ad8c7467
References: <20210609072310.26099-1-srivasam@codeaurora.org>
 <CGME20210617193537eucas1p217b93d091ae8795581b30931ad8c7467@eucas1p2.samsung.com>
 <5ae06ccb-ffd4-ca9f-5a88-1f8bf8b48d37@samsung.com>
 <ec4f3faf-2169-3cd2-7471-976f20f77110@linaro.org>
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

On 21.06.2021 14:52, Srinivas Kandagatla wrote:
>
> On 17/06/2021 20:35, Marek Szyprowski wrote:
>>
>> On 09.06.2021 09:23, Srinivasa Rao Mandadapu wrote:
>>> The DMA interrupt clear register overwritten during
>>> simultaneous playback and capture in lpass platform
>>> interrupt handler. It's causing playback or capture stuck
>>> in similtaneous plaback on speaker and capture on dmic test.
>>> Update appropriate reg fields of corresponding channel instead
>>> of entire register write.
>>>
>>> Fixes: commit c5c8635a04711 ("ASoC: qcom: Add LPASS platform driver")
>>>
>>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>
> Can you please try this patch and let us know if this fixes the issue
>
> ------------------------->cut<-------------------------------
> Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Date:   Mon Jun 21 12:38:43 2021 +0100
>
>     ASoC: qcom: lpass-cpu: mark IRQ_CLEAR register as volatile and 
> readable
>
>     Currently IRQ_CLEAR register is marked as write-only, however using
>     regmap_update_bits on this register will have some side effects.
>     so mark IRQ_CLEAR register appropriately as readable and volatile.
>
>     Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This fixes the issue observed on DragonBoard410c. Feel free to add:

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 0b9cbf2ce505..8998697cd1e1 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -525,6 +525,8 @@ static bool lpass_cpu_regmap_readable(struct 
> device *dev, unsigned int reg)
>                         return true;
>
>         for (i = 0; i < v->irq_ports; ++i) {
> +               if (reg == LPAIF_IRQCLEAR_REG(v, i))
> +                       return true;
>                 if (reg == LPAIF_IRQEN_REG(v, i))
>                         return true;
>                 if (reg == LPAIF_IRQSTAT_REG(v, i))
> @@ -566,9 +568,12 @@ static bool lpass_cpu_regmap_volatile(struct 
> device *dev, unsigned int reg)
>         struct lpass_variant *v = drvdata->variant;
>         int i;
>
> -       for (i = 0; i < v->irq_ports; ++i)
> +       for (i = 0; i < v->irq_ports; ++i) {
> +               if (reg == LPAIF_IRQCLEAR_REG(v, i))
> +                       return true;
>                 if (reg == LPAIF_IRQSTAT_REG(v, i))
>                         return true;
> +       }
>
>         for (i = 0; i < v->rdma_channels; ++i)
>                 if (reg == LPAIF_RDMACURR_REG(v, i))
>
> ------------------------->cut<-------------------------------
>
> --srini
>
>> This patch landed recently in linux-next as commit da0363f7bfd3 ("ASoC:
>> qcom: Fix for DMA interrupt clear reg overwriting"). It breaks ALSA
>> playback on DragonBoard 410c (arch/arm64/boot/dts/qcom/apq8016-sbc.dts).
>> After applying this patch, running 'speaker-test -l1' never finishes.
>> There is no error nor kernel warning message. Before that commit, the
>> playback worked fine on that board.
>>
>>> ---
>>> Changes since v2:
>>>     -- Removed redundant variables.
>>> Changes since v1:
>>>     -- Subject lines changed.
>>>    sound/soc/qcom/lpass-platform.c | 12 ++++++------
>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/sound/soc/qcom/lpass-platform.c 
>>> b/sound/soc/qcom/lpass-platform.c
>>> index 0df9481ea4c6..f9df76d37858 100644
>>> --- a/sound/soc/qcom/lpass-platform.c
>>> +++ b/sound/soc/qcom/lpass-platform.c
>>> @@ -526,7 +526,7 @@ static int lpass_platform_pcmops_trigger(struct 
>>> snd_soc_component *component,
>>>                return -EINVAL;
>>>            }
>>>    -        ret = regmap_write(map, reg_irqclr, val_irqclr);
>>> +        ret = regmap_update_bits(map, reg_irqclr, val_irqclr, 
>>> val_irqclr);
>>>            if (ret) {
>>>                dev_err(soc_runtime->dev, "error writing to irqclear 
>>> reg: %d\n", ret);
>>>                return ret;
>>> @@ -650,10 +650,11 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>>        struct lpass_variant *v = drvdata->variant;
>>>        irqreturn_t ret = IRQ_NONE;
>>>        int rv;
>>> -    unsigned int reg = 0, val = 0;
>>> +    unsigned int reg, val, mask;
>>>        struct regmap *map;
>>>        unsigned int dai_id = cpu_dai->driver->id;
>>>    +    mask = LPAIF_IRQ_ALL(chan);
>>>        switch (dai_id) {
>>>        case LPASS_DP_RX:
>>>            map = drvdata->hdmiif_map;
>>> @@ -676,8 +677,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>>        return -EINVAL;
>>>        }
>>>        if (interrupts & LPAIF_IRQ_PER(chan)) {
>>> -
>>> -        rv = regmap_write(map, reg, LPAIF_IRQ_PER(chan) | val);
>>> +        rv = regmap_update_bits(map, reg, mask, 
>>> (LPAIF_IRQ_PER(chan) | val));
>>>            if (rv) {
>>>                dev_err(soc_runtime->dev,
>>>                    "error writing to irqclear reg: %d\n", rv);
>>> @@ -688,7 +688,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>>        }
>>>           if (interrupts & LPAIF_IRQ_XRUN(chan)) {
>>> -        rv = regmap_write(map, reg, LPAIF_IRQ_XRUN(chan) | val);
>>> +        rv = regmap_update_bits(map, reg, mask, 
>>> (LPAIF_IRQ_XRUN(chan) | val));
>>>            if (rv) {
>>>                dev_err(soc_runtime->dev,
>>>                    "error writing to irqclear reg: %d\n", rv);
>>> @@ -700,7 +700,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>>        }
>>>           if (interrupts & LPAIF_IRQ_ERR(chan)) {
>>> -        rv = regmap_write(map, reg, LPAIF_IRQ_ERR(chan) | val);
>>> +        rv = regmap_update_bits(map, reg, mask, 
>>> (LPAIF_IRQ_ERR(chan) | val));
>>>            if (rv) {
>>>                dev_err(soc_runtime->dev,
>>>                    "error writing to irqclear reg: %d\n", rv);
>>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

