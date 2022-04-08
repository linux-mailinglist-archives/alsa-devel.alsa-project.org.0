Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD984F927B
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 12:03:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 326DD1920;
	Fri,  8 Apr 2022 12:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 326DD1920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649412196;
	bh=FqAvt8ypfsA4NVC3NbXVr4Xzdu/Pk9xlB69DZ7giK+I=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jQdaWchzObh0wlPVlaj8DgGXsZtMfAXojy+GSueq0IjRM5B7N3jFOs4tddklykt9b
	 rZqKmCZIx7XjNWJs6/oco4k3Pa1Lz+5y5MOaopqmWLxw2y+iVQgk515ki8hp80GGvG
	 LnKKtMOWZqjZqYJsYGpHTnScwkr/MniHvBH5LcDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A75EF80516;
	Fri,  8 Apr 2022 12:01:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C565FF80311; Fri,  8 Apr 2022 12:01:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29D39F80311
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 12:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29D39F80311
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="QPIy9xoo"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5045B1F46D04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649412091;
 bh=FqAvt8ypfsA4NVC3NbXVr4Xzdu/Pk9xlB69DZ7giK+I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QPIy9xooIHcG5c9g9Fx6s0BO7NaFy/BEHV7pyH2cPBuyyl/xQ5oRBeR/kaR1xy4kO
 xQcw5RhPJc65peVUt+wiM7WB/aFJlSy5dHF/u7GzjT8JIadxaKQZpzc8cuBYHIFXIe
 m6eEkdwhRCGZY9rRs3cYPOEJgROePqI/3gMfBw7grVIwmSupEo+S0eAn2rrmF3Nr3T
 mli8YOjg/vLkAc5u1wOpRwZ0oEHDiJ1/Xkd/9nRq+sTHXgs4pcLddp2pGufVB8DZo8
 tlQ6hCgRNaD2HXk6E/PDxk8jKjnLKOcFmsLJ4Rsl6904IL5jcZeHyzo8Q8baVFbJDh
 Xu7W/pSB5kcNw==
Message-ID: <ca885fc0-d67a-b2f7-454b-c8e65ee5ce1d@collabora.com>
Date: Fri, 8 Apr 2022 12:01:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [v10 3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI
 links of headset
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org,
 robh+dt@kernel.org, nfraprado@collabora.com, tzungbi@google.com
References: <20220408060552.26607-1-jiaxin.yu@mediatek.com>
 <20220408060552.26607-4-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220408060552.26607-4-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>, matthias.bgg@gmail.com, aaronyu@google.com,
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

Il 08/04/22 08:05, Jiaxin Yu ha scritto:
> As part of the refactoring to allow the same machine driver to be used for
> the rt1015(p) and rt5682(s) codecs on the MT8192 platform, parse the
> rt5682(s) codec from the headset-codec property in the devicetree and wire
> it to the I2S8 and I2S9 backends.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
