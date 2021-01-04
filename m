Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EEA2E9C36
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jan 2021 18:42:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBE1D1692;
	Mon,  4 Jan 2021 18:41:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBE1D1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609782134;
	bh=TdktIRetHITr1rQkVosDcvCOXEpiK2F9oh+Iey8UjR4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C/Q0XHdHbPqnAzqGA6F6aHNmJy+jEObHoXuwAVGHXGmj6Y8VJaR5ejGftZ1zWLGVa
	 n24GmM3gqJMioDTZQeUXwvL2eWtKOzrVUZrG1SbWd3KjFA7APczBbS6ELD2ZOU3D7o
	 mtn96AS3yMIAexJ3nm1koV61UdkE/MRL2s2nQR/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74939F802BE;
	Mon,  4 Jan 2021 18:40:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B13BF80166; Mon,  4 Jan 2021 18:40:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8499F80158
 for <alsa-devel@alsa-project.org>; Mon,  4 Jan 2021 18:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8499F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XVb0Nxi5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9980D206A4;
 Mon,  4 Jan 2021 17:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609782021;
 bh=TdktIRetHITr1rQkVosDcvCOXEpiK2F9oh+Iey8UjR4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XVb0Nxi5lXFFYfDjuZaW1eha7r9nhpdKQwzq6nRNjJjtbSIgZS2IAH5iGhXywMnL+
 +B/6KHXWVV710kQDBAukAUqXDc7PS9uenGBKifkqn0SiTzqXQTGCr7afxMA8M9DySC
 HN7UK7NLhpBktpx/mvn1GUgzQzbrisN7bNnKvadw/9kfP7XCF+PK9NKlBuIFKZU3M8
 9OhVjnXluL3OuPiW6TiIF7Tk6qpVfLmA/oyS1xCK+gXcqlxfzWLM8paeq2aZFyUn4Z
 ERTq8jXbWGGVzXDmxeh9CLN+fVEuQaTHKMxK2HNaygFDEMhFG6LnIlpZw2C1EFBMnG
 wb0wdxwRRWVFQ==
From: Mark Brown <broonie@kernel.org>
To: Adam Ford <aford173@gmail.com>, alsa-devel@alsa-project.org
In-Reply-To: <20201217162740.1452000-1-aford173@gmail.com>
References: <20201217162740.1452000-1-aford173@gmail.com>
Subject: Re: [PATCH] ASoC: wm8962: Add optional mclk device tree binding
Message-Id: <160978198913.14397.16832958229666174829.b4-ty@kernel.org>
Date: Mon, 04 Jan 2021 17:39:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, aford@beaconembedded.com,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
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

On Thu, 17 Dec 2020 10:27:40 -0600, Adam Ford wrote:
> The driver can request an optional clock for mclk.
> Update the txt file to reflect this.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8962: Add optional mclk device tree binding
      commit: e33c93b2206fedee35df756940e07af7b1f29768

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
