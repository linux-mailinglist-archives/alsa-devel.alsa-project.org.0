Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A7A1D8039
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:35:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D5E1177B;
	Mon, 18 May 2020 19:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D5E1177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589823325;
	bh=PSmnWuP17/yea5rqvjVY1dIsWkaC/qQtFtP1MCihYMs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HNeHyo37UtUmgFVmZfblIMXpa4LZkWbK8+QNNEs2ogzqk+9gBx0N8TfWMkJEjh3N9
	 FuHkv7wa2OhlRRI6bAv+h6P8HrBx3h90JRO3qSoYPkwRQ9WvHNq5hZ3aKk+qFkW6yy
	 f6luQua1z+/ipAvHjOiM+PplvFoJGJ09GVdV7toM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E76DF801F9;
	Mon, 18 May 2020 19:33:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0613FF801DA; Mon, 18 May 2020 19:33:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9473F80086
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9473F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GxeTirnl"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1476620826;
 Mon, 18 May 2020 17:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589823216;
 bh=PSmnWuP17/yea5rqvjVY1dIsWkaC/qQtFtP1MCihYMs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=GxeTirnlybDK2L5UVAKDO/XeaiGG7NN9jlgBQS+wM6ToCFRrGEaZ0La+Y4aqbt5EY
 RZ3HtesElEhDKBVdi+VsqQZJgNfxSjMFdyYGVGV8IsrgQ6pU6kTGBaatIhMk90RKep
 tmeiB2u5MtUOnJpsAfzSKCf52mcAoBedcBVAJd0I=
Date: Mon, 18 May 2020 18:33:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Pavel Dobias <dobias@2n.cz>, alsa-devel@alsa-project.org
In-Reply-To: <20200515120757.24669-1-dobias@2n.cz>
References: <20200515120757.24669-1-dobias@2n.cz>
Subject: Re: [PATCH] ASoC: max9867: fix volume controls
Message-Id: <158982321396.43342.6059802026981086380.b4-ty@kernel.org>
Cc: ladis@linux-mips.org, lgirdwood@gmail.com
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

On Fri, 15 May 2020 14:07:57 +0200, Pavel Dobias wrote:
> The xmax values for Master Playback Volume and Mic Boost
> Capture Volume are specified incorrectly (one greater)
> which results in the wrong dB gain being shown to the user
> in the case of Master Playback Volume.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

Thanks!

[1/1] ASoC: max9867: fix volume controls
      commit: 8ba4dc3cff8cbe2c571063a5fd7116e8bde563ca

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
