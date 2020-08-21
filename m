Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDE224DB7E
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 18:42:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B9711727;
	Fri, 21 Aug 2020 18:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B9711727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598028131;
	bh=pRIfmNaiNOw1L35y4l06tL/wHSPMxVTsjUkGjVve9oA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uqqlYIJv1hTeJb0M527BkUWKqJPPyzQgIp2iZdtVt6H2G7EHqHjuMElju3LC9fCBl
	 mQrGT1HJX2iA4JZze9fuddMS6275XvH9ZF0a2FWgGkVVZHrUSkj1QCPc2nTXMQInD5
	 j7mfLz7McR+ONWvqV9lMizC1XHQSYhV1EsG/Cjeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 247ABF800C0;
	Fri, 21 Aug 2020 18:40:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3275BF800C0; Fri, 21 Aug 2020 18:40:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4161EF800D3
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 18:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4161EF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qTTDKWve"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EF0C207BB;
 Fri, 21 Aug 2020 16:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598028019;
 bh=pRIfmNaiNOw1L35y4l06tL/wHSPMxVTsjUkGjVve9oA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=qTTDKWveXPeCEbKj/21q8Q3uNVUNe1ETGOUcRV3IABy7DtksxhPMSWk2CCZPezbFa
 PvTZHgcJxYEOfb4IJbTUJT/c5AaQVUpPwW+aueWZHQngGv2B3Lpa4its2rHT8VHFXU
 0UAwBVCBnScmbmCIAxsvWbHiqjVTihrgLydy/GJg=
Date: Fri, 21 Aug 2020 17:39:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Timur Tabi <timur@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
In-Reply-To: <20200821071153.7317-1-matthias.schiffer@ew.tq-group.com>
References: <20200821071153.7317-1-matthias.schiffer@ew.tq-group.com>
Subject: Re: [PATCH 1/2] ASoC: bindings: fsl-asoc-card: add compatible string
 for TLV320AIC32x4 codec
Message-Id: <159802798182.25503.6288597388971978944.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Fri, 21 Aug 2020 09:11:52 +0200, Matthias Schiffer wrote:
> The TLV320AIC32x4 is commonly used on TQ-Systems starterkit mainboards
> for i.MX-based SoMs (i.MX6Q/DL, i.MX6UL, i.MX7) and LS1021A.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: bindings: fsl-asoc-card: add compatible string for TLV320AIC32x4 codec
      commit: 6d3029e92f320531805e6aed33c74185e5e3f8fa
[2/2] ASoC: fsl-asoc-card: add support for TLV320AIC32x4 codec
      commit: b50747558855ff94523dbb7f08a8c9fadfdd9110

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
