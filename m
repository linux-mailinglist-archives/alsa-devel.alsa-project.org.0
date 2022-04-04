Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA654F14E2
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 14:31:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB90A16C8;
	Mon,  4 Apr 2022 14:30:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB90A16C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649075464;
	bh=Z7ztsm3Md7Jvnfrh+eL9+Lf65aVRzhlpG24eO0rHEvA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PY2m0QbYJVo7O6mdDXSfa0j0B948REtg0EU5noHRTV9xG1IEYPuk2DT7VcFKjNXMc
	 7ncobxIv2GtpEApk80aYU/PfFXzpIC9cMMmhcv4fHNAdYvlUQwrSMr+7dpScTUFK9E
	 JRfAJ/WoJYrFyNg4HKHMjGoAQ4r2KJ8A//hcnznE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 161C0F800D1;
	Mon,  4 Apr 2022 14:30:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29FE1F80100; Mon,  4 Apr 2022 14:30:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E323CF80100
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 14:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E323CF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="ZII2WKTR"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CCE9F1F44C81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649075395;
 bh=Z7ztsm3Md7Jvnfrh+eL9+Lf65aVRzhlpG24eO0rHEvA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=ZII2WKTROH8jdnDAzt5U2pGxzVQKtQeF+d85nHqB5WvP26sBmU3HcY+ZgCSdalt/w
 MyE1oOQbTo6iJqLumvHZDDEHlrJNWLEIfxLp731qI2xtj3+KaUU1Oj1XHZv3lc3f90
 gKgvNpdpPQ6cc+nHoNygxlowKPXLsFwTSlTjlosRIFAlzG5K/MbJdBuDUUIL8IyJAH
 bijprzeZUBNtEcRVnwl7RWfNlFnVJxLR50su+PUPN1urxY3I3+mgf5jzho8UDRM2YE
 cQdF/iqxHw3p1GDHcSac7hp0nm8MNerucbcG8fWN21ORt0bQvQmZjWsgTjXZT15WRt
 kPoCuQtncnFPw==
Message-ID: <db1f701f-c2f6-bb89-635e-2871fc781140@collabora.com>
Date: Mon, 4 Apr 2022 14:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: mediatek: Fix error handling in
 mt8173_max98090_dev_probe
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Koro Chen <koro.chen@mediatek.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220404092903.26725-1-linmq006@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220404092903.26725-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 04/04/22 11:29, Miaoqian Lin ha scritto:
> Call of_node_put(platform_node) to avoid refcount leak in
> the error path.
> 
> Fixes: 94319ba10eca ("ASoC: mediatek: Use platform_of_node for machine drivers")
> Fixes: 493433785df0 ("ASoC: mediatek: mt8173: fix device_node leak")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

