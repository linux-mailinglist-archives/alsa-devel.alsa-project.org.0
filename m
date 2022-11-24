Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD6963761D
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 11:20:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9828016B6;
	Thu, 24 Nov 2022 11:19:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9828016B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669285239;
	bh=fYzwZG+btrhJNj7qcJzSFCW1tTOHZHac4nQx+C+xmJo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r1DeU4CKM4LoZnZ7shhlg0f3H5KuKCpL4VzY+zaCwyI2PAktmMFKowkJEssCMnhXZ
	 hT5V/DMPZFbKURqAi66S7RnDxkVH1cMCXsjsMC+D5SrJDaEG3fP4xO2hnP7lGDEJnM
	 BMbRwbplGxnc3ZA/RLJvuhVMS8U4wJN4B/1TvmO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25C8FF80149;
	Thu, 24 Nov 2022 11:19:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB17BF80431; Thu, 24 Nov 2022 11:19:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A93CEF8014E
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 11:19:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A93CEF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="ladVD4h/"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 839F96602B10;
 Thu, 24 Nov 2022 10:19:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669285175;
 bh=fYzwZG+btrhJNj7qcJzSFCW1tTOHZHac4nQx+C+xmJo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ladVD4h/ARN4kZRmjQ270HjSLleSxaquqisDU36RMD2TrzBG1av3lgH5/NwutbCJA
 KHeCMghCW5GrjkB6eQBL5u3gtoZi9xedOyOKf2X+rOfWxlOeD9ygiVlqhXOz4BmbDB
 DrkMiMk3NyJKBZ6oLeDTFnSWMQ+2jeha9SOBdkzA896osv1To3KlBR1YF6EyLAGu39
 Wy9zbsWKJMqKEpsN2Zw6VGlrN/pGNaT4WcSBzQvTnooeqJ8DwR5duWPsJB9F+M2GZu
 D0H8FL4CeeTrWTw3IrIwveshAusTNB/Cbviv9bnABR3+nUJaj0cJDQAljsiho6ArW2
 fBYF99C9wwrLQ==
Message-ID: <dad82c29-71f7-dfb2-a682-5aeedb1a2518@collabora.com>
Date: Thu, 24 Nov 2022 11:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Correct I2S shared clocks
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org,
 nfraprado@collabora.com
References: <20221123161130.543-1-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221123161130.543-1-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, chunxu.li@mediatek.com,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, ajye_huang@compal.corp-partner.google.com,
 linux-arm-kernel@lists.infradead.org
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

Il 23/11/22 17:11, Jiaxin Yu ha scritto:
> In mt8186 platform, I2S2 should be the main I2S port that will provide the
> clock, on the contrary I2S3 should be the second I2S port that will use
> this clock.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


