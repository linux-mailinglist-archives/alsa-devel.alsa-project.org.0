Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 162511CFB3D
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 18:46:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B25741697;
	Tue, 12 May 2020 18:45:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B25741697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589301963;
	bh=Trwo38OmVBD2TlImzx3c+TlSZBTuSuR0SffTOf0cwTA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jKf1kU2rRmrgCA2TNe+CdGudsyEtkcP6wZuCUTBnCeDQKHmasRrEh8Alg+i2WB3JO
	 JSC6r0IrIb1TbqGI5UzanvyKcJNuKvziJjlcz5oBWfK/15A1MOY2LwIpEyLx1SZFwd
	 iOszL2IyYv2CKFcVhyohYr+t4ZmyvsDX9ZLvgmzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A74EF801F2;
	Tue, 12 May 2020 18:45:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09155F801DB; Tue, 12 May 2020 18:44:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0ECCDF800AA
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 18:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ECCDF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nASl9Chi"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1198206B9;
 Tue, 12 May 2020 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589301887;
 bh=Trwo38OmVBD2TlImzx3c+TlSZBTuSuR0SffTOf0cwTA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=nASl9ChizvQCSHZxqM5SKnNBNtsxJze1bOhEBm/r+ek96uRhxFd21jPbl4IkHLDtY
 g/4XQcCzQEALbK6PoUnVZG1pZ0itOTInxIIrK99bvUOF9VbhlUUi/jqwiISyUndL0j
 EemoVeSFjbqGZkFTHccsawGsW9qlKRal6xO7BUYc=
Date: Tue, 12 May 2020 17:44:44 +0100
From: Mark Brown <broonie@kernel.org>
To: heiko@sntech.de, Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <20200507113238.7904-1-jbx6244@gmail.com>
References: <20200507113238.7904-1-jbx6244@gmail.com>
Subject: Re: [PATCH v1] ASoC: rockchip-i2s: add description for rk3308
Message-Id: <158930188455.55827.16068992221946601782.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
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

On Thu, 7 May 2020 13:32:38 +0200, Johan Jonker wrote:
> The description below is already in use for rk3308.dtsi,
> but was somehow never added to a document, so add
> "rockchip,rk3308-i2s", "rockchip,rk3066-i2s"
> for i2s nodes on a rk3308 platform to rockchip-i2s.yaml.
> One of the rk3308 i2s nodes also has a different dma layout,
> so change that as well.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: rockchip-i2s: add description for rk3308
      commit: ab436c974e08d9254999d7a84d86b1d4c1749230

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
