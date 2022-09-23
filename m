Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 647945E765D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 10:59:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 077E184D;
	Fri, 23 Sep 2022 10:59:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 077E184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663923599;
	bh=HJCmthvkr+gqFl+ypmaWbwlJdZFD1jQ1jtfY4oRGN0U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bG/H6C+1CKf69VkUsoYXbLrMLVMU1gNecz18cnsDZAEz0gJQwnGks/tnT/LEqYbao
	 V6R9kgwBoZ5j6Ob3FuioBLpfyKDDXf1uwe56NQWgbm6VWAlEMNYw2/ph77Hv3NHHF2
	 pSr7DDttqaXjp4CseRQVzdAI+WVRxnVVQc8xIDwM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D87EDF80548;
	Fri, 23 Sep 2022 10:58:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02116F80224; Fri, 23 Sep 2022 10:58:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93238F80224
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 10:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93238F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="CdH81/Nf"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 641636602240;
 Fri, 23 Sep 2022 09:58:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663923487;
 bh=HJCmthvkr+gqFl+ypmaWbwlJdZFD1jQ1jtfY4oRGN0U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CdH81/NfnL068geDlhZWlsl4y4X/E43jS7Jq3ESt/Hp+uVCeKoTTf8ONycYJN56+K
 MCVX0xU7hJShi/kC1gg2SGiKxvmNgZU263jaJeD+wRosEbI8+F8EYuITRTTfTMRY0g
 GW+c7sZhLEu6Kt+7xoLjQjBzMzfQDNXh4gXsrV/4MotsW7xRd16bjMbDpJmSN7pTtO
 se8TxBHRmIBdnRR6DFnD5XIru6EeLHjR0j9keUmut9Qy7JtCuQ9BxcsH0BMTb2tqJl
 seo7OViAmjqlzxNZZQA/tUsnz+Rn4GdMMILlr9zLZcQpuHojnmL4RxzCWXLC6bzBFB
 JZoJ547+F/rQA==
Message-ID: <983bd526-ce7d-0c7e-d93a-66755db3a33f@collabora.com>
Date: Fri, 23 Sep 2022 10:58:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/6] ASoC: mediatek: mt8186-da7219: Add headset widgets
 with switches
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20220922235951.252532-1-nfraprado@collabora.com>
 <20220922235951.252532-4-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220922235951.252532-4-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, "chunxu.li" <chunxu.li@mediatek.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
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

Il 23/09/22 01:59, Nícolas F. R. A. Prado ha scritto:
> Add DAPM widgets for headphones and headset microphone, with matching
> switches, to allow toggling these paths based on the jack connection
> status.
> 
> Note that differently from others (mt8192, mt8195 and mt8186-rt5682),
> the widget here is named "Headphones" (with an 's'), since "Headphone
> Switch" was already registered by da7219.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


