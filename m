Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0956837CD1D
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 19:09:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91DBA189B;
	Wed, 12 May 2021 19:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91DBA189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620839378;
	bh=37b6sYm47fj9tJA5pTEY7KlL0GHnz0MhaTe/CechS7Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=olsPFhMnZvw/4WoLek1o5DCmRFw09IsSx5FUCKv1KsdIx76/wuNhiW+nIEnUJ3MHd
	 uVN1wXHAoz3vnxBXHa7eK7TlpU4K5EtFcxat93POfvqvybgKEUQ5tqI7kGvlRKLLy3
	 bMHjBlThklUogSs9Ch3sXf8jUmyfXYN8uunU9MLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B601F804D8;
	Wed, 12 May 2021 19:06:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88B35F804B4; Wed, 12 May 2021 19:05:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14F8BF804B0
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 19:05:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14F8BF804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XcSm6+p3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43602613BE;
 Wed, 12 May 2021 17:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620839152;
 bh=37b6sYm47fj9tJA5pTEY7KlL0GHnz0MhaTe/CechS7Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XcSm6+p3hy+PvvTg8/wLohTQBoLS8yJlYN2iqkYRmpImlZ3XtsOcp53Fji26Y2ADc
 NeTkQwIrSzD7TGVcWTASkL3BrSZ0qscMK3ddoS3V38aaGoVfmOPVIhhFjtjBPC6mRz
 R56qyynzQmbMlLhwGpHL1TO8JAZMOvGqQ+8xJ2X2KPvfCN+j6ntN3e/C/1KvXJqA2y
 u0+AeBDZM7xPdN3eZV61vkwLnt3SWeqAExhc9+j4MLTURbSIcokksQG5ZOAPPd1++c
 I/v6HfSdBLofCKWfQg5U2cejU7c5FovHIPw74c9Z8RA5z6s64reHKzTTNgN4LqI2Iq
 QIpBw30ZAQDJQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Nathan Chancellor <nathan@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] Revert "ASoC: q6dsp: q6afe: remove unneeded dead-store
 initialization"
Date: Wed, 12 May 2021 18:04:46 +0100
Message-Id: <162083892845.44734.12776647391535930277.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210511190306.2418917-1-nathan@kernel.org>
References: <20210511190306.2418917-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Mark Brown <broonie@kernel.org>,
 Yang Li <yang.lee@linux.alibaba.com>
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

On Tue, 11 May 2021 12:03:06 -0700, Nathan Chancellor wrote:
> This reverts commit 5f1b95d08de712327e452d082a50fded435ec884.
> 
> The warnings that commit 5f1b95d08de7 ("ASoC: q6dsp: q6afe: remove
> unneeded dead-store initialization") was trying to fix were already
> fixed in commit 12900bacb4f3 ("ASoC: qcom: q6afe: remove useless
> assignments"). With both commits in the tree, port_id is uninitialized,
> as pointed out by clang:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] Revert "ASoC: q6dsp: q6afe: remove unneeded dead-store initialization"
      commit: 9b7493468fa7eeef2e86b8c646c0535c00eed3e2

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
