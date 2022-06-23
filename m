Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3068E55767D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 11:20:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6C981B46;
	Thu, 23 Jun 2022 11:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6C981B46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655976039;
	bh=jvTSpUApFuNR+zry7deDGr045Bs+SsvwvHOVl8kQWBE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bjrm6op2ZZf7gaaap+EwaQO9siuwKjZ1w+ROFJoBcQj11uuC0yQZdRtOL1mr8OGBi
	 VHt9YuWKsax0/2jslLesuXFVffzrYaESK5HG1/OXmD7eAOe/+wgFwx05vu64mQ7dNO
	 F/EDpAMyuV+f3CX3BWElZtx2PcbD/Kj0vd+BuJrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5430AF800CB;
	Thu, 23 Jun 2022 11:19:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFBF4F804C1; Thu, 23 Jun 2022 11:19:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 224D0F800CB;
 Thu, 23 Jun 2022 11:19:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 224D0F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="HtlXJ6Fp"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2FF226601752;
 Thu, 23 Jun 2022 10:19:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655975969;
 bh=jvTSpUApFuNR+zry7deDGr045Bs+SsvwvHOVl8kQWBE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HtlXJ6FpjazjmbTMa4K2OgCwmcUvIgnEBsNkestc/XFp/KcB1WYvMxf57uDyTjU79
 +UmT84cZ5l7aebBlizcY3SvC9cSANEU7MooekayQBaJAEImjOp+g7A8BYnJgcNLPtM
 HKogcZk+1CnKeTDKJYkek4EsPkyAtW+kBdvfFMnolf26yDoAHWwi+DbDHc2S9OGX3B
 9JpOCV8Q9ApJstpZHhUJRjKjRG9H3rJdInA/HmgqlkLwwUpCd+L6QlezzR6rLy7otL
 aKC3KUaagtPTXQDtZkzncR+c/SlrbTVmiLf5z396DxfIBcDp7IExBd4oSehUKKvTDC
 hcOy74FkPmOpg==
Message-ID: <0b065a56-5ab1-9be4-d92c-f7bfec629a3e@collabora.com>
Date: Thu, 23 Jun 2022 11:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 0/4] Add MT8186 ADSP dt-binding
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
References: <20220622062245.21021-1-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220622062245.21021-1-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


For the entire series:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> v3 -> v4:
> 1. Update commit message of patch 1/4
> 2. Add review tag to path 3/4
> 
> v2 -> v3:
> 1. Change mbox-names to rx/tx for both mt8186 and mt8195.
> 2. Update description of mbox-names
> 3. Use static string array instead of kasprintf
> 4. Align clock names in dsp driver with dt-bindings
> 
> v1 -> v2:
> 1. Change mbox-names from mbox0/mbox1 to rep/req for both mt8186 and mt8195.
> 2. rename clock-names and remove unused headers
> 
> Tinghan Shen (4):
>    dt-bindings: dsp: mediatek: Use meaningful names for mbox
>    firmware: mediatek: Use meaningful names for mbox
>    dt-bindings: dsp: mediatek: Add mt8186 dsp document
>    ASoC: SOF: mediatek: Align mt8186 clock names with dt-bindings
> 
>   .../bindings/dsp/mediatek,mt8186-dsp.yaml     | 91 +++++++++++++++++++
>   .../bindings/dsp/mediatek,mt8195-dsp.yaml     | 10 +-
>   drivers/firmware/mtk-adsp-ipc.c               | 36 +++-----
>   sound/soc/sof/mediatek/mt8186/mt8186-clk.c    |  4 +-
>   4 files changed, 110 insertions(+), 31 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> 

