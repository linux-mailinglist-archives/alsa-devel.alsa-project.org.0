Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0397C36732B
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 21:06:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CF9A1689;
	Wed, 21 Apr 2021 21:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CF9A1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619031994;
	bh=mJwW6C9lEThN5XEVxVHuEHYAlKqbu5QrhmeC8iM1ubg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IG/sJZ8Z40N/59t9xucco6wNxDrKeBbXTIG23bEjfAX7FXTSd0s0SY8k0Z+k71vH9
	 GXhzbSknue6wCbIDkLkI0kc1Du87Pas/XWhRaOitvX6rvAGOmb1g/WdLpYV41kXksY
	 webneuyfd0nrv0loxS6Wl/Y+THmim+Yqp1KvtsZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42031F80276;
	Wed, 21 Apr 2021 21:04:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B953F80256; Wed, 21 Apr 2021 21:04:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7156AF8019B
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 21:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7156AF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="E14WpmCc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B86A261455;
 Wed, 21 Apr 2021 19:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619031877;
 bh=mJwW6C9lEThN5XEVxVHuEHYAlKqbu5QrhmeC8iM1ubg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E14WpmCcT1SxOx5cChjTJhtQMhF+QKgXuR7AYeUDhzCei8KokOvOGdSbKwI3lDveV
 Yc/c4V0ullBNsgdDy6IAW5tUVfNHt/q8i70vkoFXa8ho+eT4XVxwHiRKKksKGZyI9O
 lkhOa6/2xu7Xtu4C4i7VJvD39Fyd8JE3mkVLPAsVseCrjajjkHIa3pYAM7nrEI5r5Q
 LokzlKtnlnHF3JMREu6JlIlEulBGZKE7uXIgfWbHSGPHQ2fJqyR6lGSeKNPco4Ilam
 gje80K/g3mCjrqBe/TPvU38Y+3dldlqjPkc+VsUMERWe2B8OsC4HHfOSSfAx09B5a3
 0zmShK8rvNI4g==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: amd: drop S24_LE format support
Date: Wed, 21 Apr 2021 20:03:35 +0100
Message-Id: <161903027032.13397.4454772541226435361.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1618993402-10354-1-git-send-email-Vijendar.Mukunda@amd.com>
References: <1618993402-10354-1-git-send-email-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Alexander.Deucher@amd.com, Mark Brown <broonie@kernel.org>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>, Ye Bin <yebin10@huawei.com>
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

On Wed, 21 Apr 2021 13:53:11 +0530, Vijendar Mukunda wrote:
> AMD I2S Controller doesn't support S24_LE format.
> Remove S24_LE format support from ACP DMA driver
> and CPU DAI Driver.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: drop S24_LE format support
      commit: 1300c7037f0f08692008053e4b12a2fb6fbd185a

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
