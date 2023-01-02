Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE72165B329
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 15:05:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32C979AD2;
	Mon,  2 Jan 2023 15:05:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32C979AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672668359;
	bh=N63SXdlL9trrHT7Xb21JxrmzN98pQgZ+pngOJfLwRW0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HvX+6dEUGoe7mrhWXz8sEIouxYU1j7FIB5ewPiC2qVQN4MNVdaZJUxe5Tl66SwQmT
	 ImOv70QvWcz7i/skPt/vLOkdb4ZDOuB4EcYEWX8LXyWQ5YtCmtpqmRhIr5+a/mfJSe
	 NydZqXeiGgqKQOoEJFcteLjfvQD6esbo8muOQMb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D262AF80240;
	Mon,  2 Jan 2023 15:04:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCD8AF8023A; Mon,  2 Jan 2023 15:04:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28CCDF80238
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 15:04:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28CCDF80238
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=EO8Wyb5E
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 43124660036F;
 Mon,  2 Jan 2023 14:04:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672668268;
 bh=N63SXdlL9trrHT7Xb21JxrmzN98pQgZ+pngOJfLwRW0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EO8Wyb5EuGeVId76NRTrQ9g9Nlan1KM2Ai39EmIxSU6LKNlOf7MyspUj74K/lCiKv
 lYywjFAX3bHRQci9rb6iwlrPFBZa+CdM6lIt3V5T7+p8MtZqaaHjK60rkkPDGQNeWl
 usbZ2hVsCKGGGUnuZyER/m1DJUbY7CyVrQCNbem8Jgs9mohg4vnVCNG0kfQC/JbuzZ
 FMCjIEX34EqKh8GHBUlHwUN9Xk+bLe6IAfaf90kiOEougdc8KpruVxyLFyC2VZEeMQ
 0OTpx4iqfTNHOjxczg3Oh9c2PdNvpJp4C3tuQMLi3hy1WMdvgql0L7DOb+vox5zEW+
 TAHvHrC60eoNQ==
Message-ID: <6e1a405d-b20e-1093-a236-f3713aedbb1d@collabora.com>
Date: Mon, 2 Jan 2023 15:04:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 04/13] ASoC: mediatek: mt8188: support adda in platform
 driver
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
References: <20221230055443.16024-1-trevor.wu@mediatek.com>
 <20221230055443.16024-5-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221230055443.16024-5-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Il 30/12/22 06:54, Trevor Wu ha scritto:
> Add mt8188 adda dai driver support.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


