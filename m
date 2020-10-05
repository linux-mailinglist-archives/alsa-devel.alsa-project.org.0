Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DA9283DCD
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 19:56:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D30E17A0;
	Mon,  5 Oct 2020 19:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D30E17A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601920606;
	bh=VCiW3dcVnJ9y8q1OkZqogcxkqkpP/n24rMjf80efbJM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m/wPhes/UzMXOU4K9tHjK7OoueF/BE4UllXz0HwrgG/cYN2Jl+vq3D4+HhfJQnmz/
	 fZ326HmvU5KQb6rClYXvgFnBq9A7bM9AMrirHWYbfVyLArCotiHiaKWlRrZhHBWtND
	 qyy5OR+1pYsewmv8IN1vKdlATN5+H616WvjPw9N0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81CFFF80260;
	Mon,  5 Oct 2020 19:55:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5DD1F8025A; Mon,  5 Oct 2020 19:55:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C38AF80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 19:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C38AF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UqXAPg5V"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 05F34207BC;
 Mon,  5 Oct 2020 17:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601920493;
 bh=VCiW3dcVnJ9y8q1OkZqogcxkqkpP/n24rMjf80efbJM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=UqXAPg5VeIwEKjcazvYt39IGVvbdXeFcre6MDtbS0LC/FB/LnmtcRYIPdAj0ZrptE
 dEozWDSkvha6ExelpFU7XGPGUTI6bbxEF67GuALuJuYBgXiDFoSRQv03AsiCFecAVA
 DeDD1YrWTFo+JLvpRvN6c1PdDFExcUGFxA46vTF8=
Date: Mon, 05 Oct 2020 18:53:50 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
In-Reply-To: <20201004094505.1041898-1-codrin.ciubotariu@microchip.com>
References: <20201004094505.1041898-1-codrin.ciubotariu@microchip.com>
Subject: Re: [PATCH] ASoC: mchp-spdifrx: convert to
 devm_platform_get_and_ioremap_resource
Message-Id: <160192043040.23051.5178430968539357804.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, alexandre.belloni@bootlin.com,
 ludovic.desroches@microchip.com, nicolas.ferre@microchip.com, tiwai@suse.com
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

On Sun, 4 Oct 2020 12:45:05 +0300, Codrin Ciubotariu wrote:
> Use the helper function that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mchp-spdifrx: convert to devm_platform_get_and_ioremap_resource
      commit: 8031b93efa8d393b7e38fa66b836ac157a2f354d

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
