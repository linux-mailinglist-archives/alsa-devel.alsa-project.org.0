Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB1357506C
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 16:11:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CF711921;
	Thu, 14 Jul 2022 16:10:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CF711921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657807885;
	bh=qi/qOdOVZ40TVm5BT2/tqZLayvaYuJfwS71mNq4bK94=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S1FE/sVSCOegcYqspZCLzBY/BNlVs099fkkq11nM+KhWhZ1MmBxoaNAj+MmUHTAji
	 X0gRk0UXfbXRiGjl0YSy8zdqCLDTAQo0baJt9Xs66+RcRGnJ855BhEruUt7qs4ERE3
	 qp1oS2BJ+lVgA3XoArFbVBcYrjFH4hwMpwKgEMeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9748AF800AA;
	Thu, 14 Jul 2022 16:10:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81834F80165; Thu, 14 Jul 2022 16:10:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AC1BF800AA
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 16:10:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AC1BF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="JcdIcR6O"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EEB316601A3B;
 Thu, 14 Jul 2022 15:10:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657807816;
 bh=qi/qOdOVZ40TVm5BT2/tqZLayvaYuJfwS71mNq4bK94=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JcdIcR6Og4Vg9G6/9NmALwvVAnVa9VVc7Z01u+3km5ggJNGstH/4pJ8D0LHNEuegB
 mFtYzl2+56pl9b3k+sEKlNHI4TgPx3a/W/pgtLr/9TuzNqeHpQpAToedt3p88LRtmS
 sMPyK9voeYry8ejPqJHihHXQkCUQjhzPSlSECNG9YwMup3Y32/hLw0g78EoAg195J6
 hm9M8+N3oTLBMqs7DLpK2uz1Rb1UvI7j3dkVsLJP3MtYvx+Z5P/2l0jHwBEufEjbnc
 dm+D9Vfd95ke/aDxE9WwYvcn1yX1XMxF/oy8c4tmhPItqSLBaergEPHz+0jRi/Mth7
 U4tJ2v1DqiT3w==
Message-ID: <a1e984eb-4d12-fe71-1538-ff2ca4df3add@collabora.com>
Date: Thu, 14 Jul 2022 16:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9 3/8] ASoC: mediatek: mt8186: add mt8186-mt6366 common
 driver
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
References: <20220712150442.32504-1-jiaxin.yu@mediatek.com>
 <20220712150442.32504-4-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220712150442.32504-4-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
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

Il 12/07/22 17:04, Jiaxin Yu ha scritto:
> Add mt8186-mt6366 common driver for mt8186 series machine.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

