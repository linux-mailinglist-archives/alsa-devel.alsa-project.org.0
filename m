Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0507121F783
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 18:42:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 831C31676;
	Tue, 14 Jul 2020 18:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 831C31676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594744934;
	bh=TbXWV5ei7TBnr/Ctk0w3GzHb6IxxNUBtez1DyLMmyCk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NaAruYtPKftifnQlesv6lrOtvwoWSMzbY7b+pO02SL91FtNKUCpHTMzOkvWGFIpAt
	 C3DTfd2hLgXp0wifuGBa7BDhBe6+J8iOfZs9P2hF4ZfgQFign8d9Q7LUxkhmpyWf6i
	 pWUGGFW6aU7ZOehqvJcexrVo5YofYnfztUA4Khd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C00DBF8026A;
	Tue, 14 Jul 2020 18:39:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B026F8020C; Tue, 14 Jul 2020 18:39:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81F16F801EC
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 18:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81F16F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BznuuqH9"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A879122475;
 Tue, 14 Jul 2020 16:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594744786;
 bh=TbXWV5ei7TBnr/Ctk0w3GzHb6IxxNUBtez1DyLMmyCk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=BznuuqH97wJLHyex5iSFWHeYbkNfLTB2RFZQR+i+UN8PjghuFxITWS+85qdQchZaw
 +06NZp5M5zHse8Ky/eFq7lvb48byAkGE+Ar+GUPnD84kMxweJMwi66np7bv6NgLBBQ
 TOdoGJScF39M++kfVYx6sAvwM1+CAb4OnAcVaABk=
Date: Tue, 14 Jul 2020 17:39:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20200714073247.172859-1-katsuhiro@katsuster.net>
References: <20200714073247.172859-1-katsuhiro@katsuster.net>
Subject: Re: [PATCH v3] dt-bindings: sound: convert rk3328 codec binding to
 yaml
Message-Id: <159474477218.998.15280718297734736345.b4-ty@kernel.org>
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

On Tue, 14 Jul 2020 16:32:47 +0900, Katsuhiro Suzuki wrote:
> This patch converts Rockchip rk3328 audio codec binding to DT schema.
> And adds description about "mclk" clock and fixes some errors in
> original example.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: convert rk3328 codec binding to yaml
      commit: 3f6597ad2f9ed8ed89dbd2a9ec0b0c892774f9d2

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
