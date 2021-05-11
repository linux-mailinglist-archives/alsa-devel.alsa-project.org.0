Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1E437A207
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:31:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FECD175A;
	Tue, 11 May 2021 10:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FECD175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620721873;
	bh=bZwNskZK6whbVRkYR/FxCVOYr6eGNWoLmFHbNP1Bykk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cKJXztbjBHioCSTgS876TyXsWrcJpXFoF+1nsy9PQ6bEl2nzGNPPqoCfBKviJiDCQ
	 4VbGbnGFD309gV+hW38it1AVpxcwR6gsycJJQEoMUkHtHwqsAVBC5+WqIJbvxywzCr
	 NCA1s1dOEaKEaN7wx4R3AYRsByH43WPvSDVLzi1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C84DAF804C1;
	Tue, 11 May 2021 10:27:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D73CF80482; Tue, 11 May 2021 10:27:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D93B5F80279
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D93B5F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mQ4WpPWV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8088961184;
 Tue, 11 May 2021 08:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721661;
 bh=bZwNskZK6whbVRkYR/FxCVOYr6eGNWoLmFHbNP1Bykk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mQ4WpPWVjiT7lF4LPDtPbuZzKzy6jgdIZum25rFTpf9GbRYoL54DlXl7EdO6ytKrY
 3hacJ2IAxLFSRBEvswSz2DaGuWNQUpnzulpGqug7hIQI6BQSqTPJ+7unz4MZVeYIpy
 isUDQZOHV/D5FfB4ti95w+L6OOBVtSvTQ8j/4nDtOXUcOhzC/+kqPgXbnETuRvuw66
 go6tL/wnLR/wCEkewrMP1s4Xi0FuhKkPHq/tcNWRpXLVBn9gtLshkvZcMmCSMSHWHL
 h+sG8cC2M34IJ6matstAEeRxpaiDHmnVFKYw4PbTolUNVxn1pPw/or2Mh32XqXGyML
 SAKyjH7OH3ebA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: amd: renoir: Remove redundant assignment to
 pdm_ctrl and pdm_enable and pdm_dma_enable
Date: Tue, 11 May 2021 09:25:49 +0100
Message-Id: <162072058170.33157.12138948493720742583.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1620298590-29749-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1620298590-29749-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, tiwai@suse.com
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

On Thu, 6 May 2021 18:56:30 +0800, Jiapeng Chong wrote:
> Variable pdm_ctrl and pdm_enable and pdm_dma_enable are set to '0x00',
> but they are overwritten later on, so these are redundant assignments
> that can be removed.
> 
> Clean up the following clang-analyzer warning:
> 
> sound/soc/amd/renoir/acp3x-pdm-dma.c:148:2: warning: Value stored to
> 'pdm_dma_enable' is never read [clang-analyzer-deadcode.DeadStores].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: renoir: Remove redundant assignment to pdm_ctrl and pdm_enable and pdm_dma_enable
      commit: 2fa74b31bb8170f34ec4dfa8455ff07d9ee9a7e6

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
