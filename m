Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FC7419D6E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:49:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF52416B1;
	Mon, 27 Sep 2021 19:48:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF52416B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632764951;
	bh=M90cuFM1YIrJBJBoarxhNQtXoFm5I4O9Ot+xZnF0u4g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ol2orSHz+TERVVtIsPGE4bdGPZhDOqA1Ijxr8HazfaHsmecFLrRv/E7ufm0GJV4xe
	 8Jc7YTMVLWjmgrNdMHg89t9ZYDiPCKy49LAVfA4j6d5CBRtAL5HzvauQn9gZ4Zw8tN
	 y/SdNCK981z2B7doO30UBI+g80bV2tIH20PkQgXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8282DF804E4;
	Mon, 27 Sep 2021 19:47:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5B00F804E3; Mon, 27 Sep 2021 19:47:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53B60F80147
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53B60F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PmFhi6n8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3923660FF2;
 Mon, 27 Sep 2021 17:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764828;
 bh=M90cuFM1YIrJBJBoarxhNQtXoFm5I4O9Ot+xZnF0u4g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PmFhi6n8gyllA+YmhmeBxwVRoxWI+BYotWc+7eE8ojftaxDs5nlwjA+EDJNBilp4j
 675M+NVpRKL4a8KoMBIDpJUhkHJOBY5eOA+QkcdxJnxUPX3NW0QSpSRega6Oomm3by
 QbWddCUMOn4Rvm4GcH2JpEXD64OP9moEjFIVu/Yc54vm12P865Fp4YJ3AmzL1XcxDa
 Z/JvIAOJawsWbEAkUnH93NzLWuGULEtc2cr3IPB+3VfdYXRArrDd2k7NTF9+UcZUkW
 FZpSlxEyz6MwDLHqQ62fPtAIZogmI4GnaIMJrVVIdJciJPSRxnQco4QVY8Y6KUmCnt
 +JObm9IF0Wl9w==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: alc5623: Use modern ASoC DAI format terminology
Date: Mon, 27 Sep 2021 18:45:25 +0100
Message-Id: <163276442022.18200.5601738135987461752.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920165036.17142-1-broonie@kernel.org>
References: <20210920165036.17142-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Mon, 20 Sep 2021 17:50:36 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the alc5623 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: alc5623: Use modern ASoC DAI format terminology
      commit: 2a36bd83bf8ac0d72a384e9cd93cb7b60e33ed4a

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
