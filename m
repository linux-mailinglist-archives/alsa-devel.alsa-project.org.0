Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4BC3B1E69
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 18:12:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4F46166D;
	Wed, 23 Jun 2021 18:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4F46166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624464743;
	bh=ONPWfjtURvhSrw51Nfjaq7MyuJNDRja8KI0zy6NKIig=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nvIjKEpvqOvvrSeS8/Hs80Md/jEt7wBvelCAkq4NeWD0tFlqsFmnFLhoNCSHNr2c8
	 3hWmPI2agAmQc5UrI2ojGqTk+KvVVC1V8T8WK9xEG9mSgYWVoQUMTaFT5MfyW0Lwe6
	 4XFJZPeU5nPO4hzvMf6x0DPQ+PF5zjItp0Vz+538=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 782AEF804DF;
	Wed, 23 Jun 2021 18:10:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D268F804DA; Wed, 23 Jun 2021 18:09:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B14BF804B0
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 18:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B14BF804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Tuy8HJNy"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71A8F61220;
 Wed, 23 Jun 2021 16:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624464590;
 bh=ONPWfjtURvhSrw51Nfjaq7MyuJNDRja8KI0zy6NKIig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Tuy8HJNyLwOvuhheZZZNZlu3TYaZLVWjosEREFOvWrn2wcCWQsaz/tJqvJAOq/5B3
 gRnZ59Cn4mKN/M6IgRdJUcx9dbkQnLmA7etZzp/nqRQoRMbMeFBotqdtkSf1ksgzAq
 WFjTFeZWpBVm+ysv3CQJBWJBWS2ct3TsByZ2RQ0OLac5NlQ0+bCaaMT5+ajabMuAuE
 jKsu6s4SGrI+APgz+VVGv/yGsYypli2pTMCa2e6ZjOkK4SI7bxm2XYmtPqHhyzofNG
 m7pvRsxG7q+q1LOBVy7/Q9UkmxKs2SX0HPkLMhfgnSt1NuzIAkg4drdDvcsQsoYvef
 YMGe43aNYy4eA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel <alsa-devel@alsa-project.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Shawn Guo <shawnguo@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH 1/1] ASoC: fsl: remove unnecessary oom message
Date: Wed, 23 Jun 2021 17:08:59 +0100
Message-Id: <162446397756.55213.5590608323919673701.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617103141.1765-1-thunder.leizhen@huawei.com>
References: <20210617103141.1765-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Thu, 17 Jun 2021 18:31:41 +0800, Zhen Lei wrote:
> Fixes scripts/checkpatch.pl warning:
> WARNING: Possible unnecessary 'out of memory' message
> 
> Remove it can help us save a bit of memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: remove unnecessary oom message
      commit: 723ca2f89412abe47b7cbb276f683ddb292c172c

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
