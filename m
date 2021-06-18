Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E3E3ACAA3
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 14:10:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1913D173E;
	Fri, 18 Jun 2021 14:09:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1913D173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624018244;
	bh=DTTi1DchjjmNSAeM+qJLln9rd7TA4vuL5UUuTx4GPj8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=toYbA76Cb8W39G+xC4vE9S74Hb3gm5LUUq0N0JJ4VY5nls6zVPuVJR0Yzo19+FjKX
	 pu9QpzNzfJjbUEaLOao5YuqAsZrZsaweAlc/eSaOTuJNurgyNgy+XrRG+gPNwksuN/
	 XXZFiuG4l+9Rhu539nI2PAhoVDm4W03s6t+lpNac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 199D1F804D2;
	Fri, 18 Jun 2021 14:08:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0121F804D1; Fri, 18 Jun 2021 14:08:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB6A0F80148
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 14:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB6A0F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BdzazckL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4520613F2;
 Fri, 18 Jun 2021 12:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624018102;
 bh=DTTi1DchjjmNSAeM+qJLln9rd7TA4vuL5UUuTx4GPj8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BdzazckL0knCkcUHGlsE04DDuTzj4EZSwZDrB6ZXnq5skooG68nwyl/srls48jm3k
 HCvkNNFMG/ZtOZ4LFruSyGQb8fo97TaCvUAyW3qT2t3gv3w/YNkq1Ug8sCMTtJG5nN
 +d8YeeqCeYO5X7lhnQPRx1miGJxUSVFr5cgVgveJ62SbZekp7wMP+bkpQpRjuLCAbi
 Qr8lbWfGDli8H7QpEmbCtOYgl4JklWz9PFuJzao9uo8jpuwQWvWKMyjwkYNdodE0GP
 VN3gQ6B20RR+NSDZM3qMUDeXy1VrY4cQkqY901ZqP8DGJj0v539kH45T8bPsWWHM38
 +VBykSQkSsZrw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel <alsa-devel@alsa-project.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Zhen Lei <thunder.leizhen@huawei.com>, Jie Yang <yang.jie@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/1] ASoC: Intel: bdw-rt5677: remove unnecessary oom
 message
Date: Fri, 18 Jun 2021 13:07:55 +0100
Message-Id: <162401758812.52682.15431464249144019207.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617103538.1818-1-thunder.leizhen@huawei.com>
References: <20210617103538.1818-1-thunder.leizhen@huawei.com>
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

On Thu, 17 Jun 2021 18:35:38 +0800, Zhen Lei wrote:
> Fixes scripts/checkpatch.pl warning:
> WARNING: Possible unnecessary 'out of memory' message
> 
> Remove it can help us save a bit of memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bdw-rt5677: remove unnecessary oom message
      commit: c5ad09a346651c4612668e2da68b8ebf78d66fd4

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
