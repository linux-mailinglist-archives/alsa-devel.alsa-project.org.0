Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1B14D7FCE
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 11:27:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E03118B0;
	Mon, 14 Mar 2022 11:26:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E03118B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647253655;
	bh=tyJL5hF65QyMph+7DtjWZYFL2Qzea5pUr0xp38Yx7bo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KsZKetxUlQk076tngY/B7X1G4fgdKlLb9ggrc6wSMssyesO9+8Z6sFE6xKZbiT+o6
	 vQZ6gG3S2vV1R011Rk3xBNql9BiYl3E2XvbAkZvdDCg6sgLNNZ0b4CImQJ9xD886da
	 agbYOhVl5QjYytfhoSGT7VVfzCEhhmgBEig2ZD5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B5A5F80517;
	Mon, 14 Mar 2022 11:25:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FFBDF80224; Mon, 14 Mar 2022 11:25:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C28D1F80139
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 11:25:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C28D1F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="V5Yw7/ep"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 489EC1F43511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647253524;
 bh=tyJL5hF65QyMph+7DtjWZYFL2Qzea5pUr0xp38Yx7bo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V5Yw7/epWa0vrRb9G9PpmchU0FQS3UJZEMSFlkQ7E00UWWSNLN4lPorRW9TM2ocGN
 uVREdeLNVzGlQ/4jcIgogV0YLO1c7Gq0P/Sop1BW+tj2o6ChKUh3P3IuMxRQziIMcw
 2JuhmTnipYck0SlM4Lqxyj21lmX/Hkz66nk5TeYulwWV0E6U7CCkts6hQw2g5geiaW
 XlY7XEAyoqXVCNBy9aoH+rTUqHf/zIvBJE/cszbI32FtWdVxqog3eqJgCorgfNQ84M
 d2UdP7OmBTFGOyaTxt6pMHGORHjmNuFz15VmVMLdqbl0ykfRxyoSWmJY4iejHGiqAU
 XLJHe/VM9FhEQ==
Message-ID: <aaa158d8-767b-8a6e-b708-4bfe60dcb67b@collabora.com>
Date: Mon, 14 Mar 2022 11:25:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v3 14/19] dt-bindings: mediatek: mt8186: add audio afe document
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-15-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220313151023.21229-15-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
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

Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> Add mt8186 audio afe document.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../bindings/sound/mt8186-afe-pcm.yaml        | 175 ++++++++++++++++++
>   1 file changed, 175 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
> 


