Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 773DA6072A8
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 10:42:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03BE4C046;
	Fri, 21 Oct 2022 10:41:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03BE4C046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666341744;
	bh=N4UNINvJZ31lYbQPW+hEaoBxdTyA4gRTjPK7OCidDpE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dOPKPV4ELksHWLexmPr5tBAhJgI9dlVHND5DJl1ze/QhAtluUmCbvbpnwXKTlpR06
	 DFcdiGTWaeJNX8lnxpzLqo6PadVcVoXPnIvu8X30l/nlVMCw1ZhlXbV0EMs+9miscB
	 0GEIWeVz3XhpfiWXU2G+HvvJpZ8xK5M5PqcVGgEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C3FAF80118;
	Fri, 21 Oct 2022 10:41:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0963CF80118; Fri, 21 Oct 2022 10:41:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C43DEF80118
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 10:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C43DEF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="BGBNH2aF"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 831446602534;
 Fri, 21 Oct 2022 09:41:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666341680;
 bh=N4UNINvJZ31lYbQPW+hEaoBxdTyA4gRTjPK7OCidDpE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BGBNH2aFKmpGlLLm0NeLj4/RQcaL0VbfbvpSNvBiB/PxBSbYHaM5/Lch/3U24Rw9U
 uBZt588RTaMjkK7GBYsGpQFswiZrKuhQTsihqg5euRXUk3k1DRRp73bWSHn8+2Dcf7
 npCXXGE5bShXnQSd0w5C21N8HzPyFDTFHEuzM9mzryNEoDSixKO2lrum+NfMAIq470
 uiVTspvctLUxnaFk8ZonDdlNOrp4dcFtsKxC8zHfNWpnRfUbf1LeHgIQb0dpb7mAr1
 D6OwKw70VLEMuR6S8j2IJLPCY4iu2bohuPAtyXlj89MsLDbC/Vu3TNFLLH7UOLhuiF
 n6J35jOoBuXnQ==
Message-ID: <51e54a52-17a7-e71d-27ee-d4754fcc8514@collabora.com>
Date: Fri, 21 Oct 2022 10:41:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 04/12] ASoC: mediatek: mt8188: support adda in platform
 driver
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de
References: <20221021082719.18325-1-trevor.wu@mediatek.com>
 <20221021082719.18325-5-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221021082719.18325-5-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

Il 21/10/22 10:27, Trevor Wu ha scritto:
> Add mt8188 adda dai driver support.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


