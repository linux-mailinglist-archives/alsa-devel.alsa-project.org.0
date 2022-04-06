Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D50A4F5132
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 04:31:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 211A4174C;
	Wed,  6 Apr 2022 04:30:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 211A4174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649212275;
	bh=xmoV1wDYDm25L/wEd+wgpbgIUhjzDoq0K9phYwvAZFY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nxnZtqB3pBhJSK2sYp6fMC0vhel9VXCIbrb9vFEu/OqU+wjGPfpxs7kAKZzfUPqc5
	 U/PVesF9Mda2atzYtWmDeTmKcNSMC/PsyzIV3Weg38zc4Y34xpyS8qUHuA2Q7vBtxu
	 iRCqqCdX5oV+XvYz6Q6Ngp1s1nrQK2xeyvyzl50Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84C3DF8019B;
	Wed,  6 Apr 2022 04:30:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EDF7F80161; Wed,  6 Apr 2022 04:30:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4A40F80054
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 04:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4A40F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Pmkqz/0n"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E01061542;
 Wed,  6 Apr 2022 02:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F4FC385A0;
 Wed,  6 Apr 2022 02:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649212204;
 bh=xmoV1wDYDm25L/wEd+wgpbgIUhjzDoq0K9phYwvAZFY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pmkqz/0noFRk7vacJLi7o3vg9unVDqrCyTAAmO94kuNLcZpRGMnELojxzt4z7WhJZ
 MQ3qDz1FiqDLxIYJRTjAk/M2pFxqYYRTQpr0Y0O4tL9+KgYbHjW6ayRs/K2ptMZvEz
 cVAANQyp3Ln6sbQO15qdCyNHeO0mFkgWRd5ASXpkkXbHXZC8mPQNGEhFa5PliOaizn
 MfIndUw2XCE0Bkvjc7W+0DeHOGuAeJOWnFaKxKnvQ7E8M75ru8vz9y8kLhvlLuBg3Z
 GPemXN5w4EG5VauaqfsPEk+rcXHHZZJUP4iyzD8sgcV+bf8lwW3RxwojcilIGweC0s
 Q8huiUdIzv4gQ==
Date: Wed, 6 Apr 2022 02:30:00 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v8 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <Ykz7KB221jyfwKzQ@google.com>
References: <20220402051754.17513-1-jiaxin.yu@mediatek.com>
 <20220402051754.17513-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220402051754.17513-3-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Sat, Apr 02, 2022 at 01:17:52PM +0800, Jiaxin Yu wrote:
> MT8192 platform will use rt1015 or rt105p codec, so through the

s/rt105p/rt1015p/.

>  static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
[...]
> +	hdmi_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,hdmi-codec", 0);
> +	if (!hdmi_codec)
> +		dev_info(&pdev->dev, "The machine don't have hdmi-codec\n");

s/don't have/has no/.
