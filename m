Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F20540DB4
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 20:50:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F2FA189A;
	Tue,  7 Jun 2022 20:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F2FA189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654627822;
	bh=RYYhrO8fEP8cSRkLcxoofnSD4Lmtn28uxTvW4Mk4fDo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RnrY5on0OEiWuvA9pukKG1kEUVTr///lN9FdwdoIYND4QmAgZ5ATFfxPc+flyICKP
	 W6oOUc4b4OhdSrfV1945I1hcqIUJelWV9DNLDZB6Hg+1eukXMwzMMOokng9pwBO71C
	 lRHXpC1xo0EhDryD10PKLW8b23h3PQdynbX0Pi4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51AF7F80248;
	Tue,  7 Jun 2022 20:49:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4B61F80116; Tue,  7 Jun 2022 20:49:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72E69F80116
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 20:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72E69F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EIVC50AP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F1581616B4;
 Tue,  7 Jun 2022 18:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86F0C3411F;
 Tue,  7 Jun 2022 18:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654627756;
 bh=RYYhrO8fEP8cSRkLcxoofnSD4Lmtn28uxTvW4Mk4fDo=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=EIVC50APv1WnV/YPh/hwX/QQRcPyt9wz6IQTW8RaidD0DhRZti7uhkD13w1xoFLm7
 7NnJi9qEHEW2WNAJkorw5WgXxXNp4dlh/CckY1VN+gzJoklz9FVH5u8iC/G9v9GAOB
 6iebOKO5VQC4SMZ4bwthTKgpbvcvqh1cvaXKX3d61do3lZZgEDzLznBiL5wSBQI0Rp
 WfSzSlq0k5o+kHf7crSQa2HPA45WBBWgjE3v9F0GVwkPQUkexF42kSAwViqqEf5FPd
 pWrmymQ/WT9uafxR5w0c6fWl8uijM6+bQZNvDmr/dnjtNBsvIorgSItBZW+hRZ9/6D
 oh8AwLoKIrWtw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linmq006@gmail.com, s.nawrocki@samsung.com,
 perex@perex.cz, krzysztof.kozlowski@linaro.org, tiwai@suse.com
In-Reply-To: <20220602130218.14901-1-linmq006@gmail.com>
References: <20220602130218.14901-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: samsung: Fix error handling in aries_audio_probe
Message-Id: <165462775454.3480784.5012321883700193915.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 19:49:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 2 Jun 2022 17:02:17 +0400, Miaoqian Lin wrote:
> of_get_child_by_name() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> This function is missing of_node_put(cpu) in the error path.
> Fix this by goto out label. of_node_put() will check NULL pointer.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: Fix error handling in aries_audio_probe
      commit: 3e2649c5e8643bea0867bb1dd970fedadb0eb7f3

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
