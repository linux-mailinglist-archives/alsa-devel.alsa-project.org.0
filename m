Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 866F72FA58B
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 17:06:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B3FB1856;
	Mon, 18 Jan 2021 17:05:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B3FB1856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610985971;
	bh=aCdwQR0ujqDllQM02Gt/LZIEeZwAmc8NRQO9hypFVMQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XIi4MABpjhYvyOkm0eY99qMmTcCdhggYa5P7eb17L+L5jGdR2m1CREPGoh2cMWGpX
	 AZwWL0ZL/i5fYdkaVoolSK+OPLTW1XBSKK+IIBpESqTRIm4Nfbm+U9MzR0toZEZ8me
	 METrr45Ho1rxiTu9NZl8l+OKsRhSJjqq8fAKnUMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBD8BF804CA;
	Mon, 18 Jan 2021 17:03:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60BA0F804CA; Mon, 18 Jan 2021 17:03:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1C07F804CA
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 17:03:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1C07F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dtLZxqhe"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BF1F22AAA;
 Mon, 18 Jan 2021 16:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610985815;
 bh=aCdwQR0ujqDllQM02Gt/LZIEeZwAmc8NRQO9hypFVMQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dtLZxqheV7OH+BVL5uNzaC55AaBmzAHs3H5VT1hhyDnTyykfkzb19csd5euX+1jjR
 FXocEhfYsYT8hRCuXW8d2gl/KPyIBSJEJcEBM0LsTOAHG5bQhYBPHleN+CzdL3xbJG
 ejUpoQwyYM08imr0gWM+kHibq5c0Ui20xAZubTJfOf8xGej1ke/dOS4RU3kHqrF+oa
 ZT2AL0cgOyxdwFHujziv/+vsSLrONNnzvvdMOLZfSN0x370oOUtjdyXHUepVClv3tl
 1DDjazyXnf5InS/T2USzZjR5bmmMwSf2V2ffTSSYiLRVFHnJjce9h7rtPOjeUdAyV1
 OjquFnZxAO9WA==
From: Mark Brown <broonie@kernel.org>
To: Jonathan Neuschäfer <j.neuschaefer@gmx.net>, devicetree@vger.kernel.org
In-Reply-To: <20210116013403.3490518-1-j.neuschaefer@gmx.net>
References: <20210116013403.3490518-1-j.neuschaefer@gmx.net>
Subject: Re: [PATCH] ASoC: dt-bindings: mt8192-mt6359: Fix indentation
Message-Id: <161098576157.26872.3242007396802413840.b4-ty@kernel.org>
Date: Mon, 18 Jan 2021 16:02:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-kernel@vger.kernel.org,
 Shane Chien <shane.chien@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
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

On Sat, 16 Jan 2021 02:34:03 +0100, Jonathan Neuschäfer wrote:
> The items of the 'maintainers' list are indented with three spaces.
> Use the usual two spaces instead, for consistency and to silence
> yamllint.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: mt8192-mt6359: Fix indentation
      commit: e36626bb099e5159a7868dbfad6957ff6b0e4102

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
