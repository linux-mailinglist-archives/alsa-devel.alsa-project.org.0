Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C78A335134E
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 12:21:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68D1916BA;
	Thu,  1 Apr 2021 12:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68D1916BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617272475;
	bh=AFCJnVJv5ReuRo74LrGOhxMkdSGLBf8T4QkrnbvMXRA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gxJPrUC2EizJrnSEs3RJxkK95muqDRtUHBvPBgVi4AI797xR1934tyFvwQVEW/fQI
	 eNxmfbwbmCruSs2AFCRXK7z5+l9t3JfuyDqGsTNFHFnTlTlyTt5T3HVUEjDRT/n8wp
	 EBnXHHuJ17/3r9zwJ2Z/eOUoDsA6ZU94Hloofrmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7990F804D9;
	Thu,  1 Apr 2021 12:17:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF4DAF804D8; Thu,  1 Apr 2021 12:17:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A5EEF804B4
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 12:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A5EEF804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jLaQlJOW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 587E8610CE;
 Thu,  1 Apr 2021 10:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617272243;
 bh=AFCJnVJv5ReuRo74LrGOhxMkdSGLBf8T4QkrnbvMXRA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jLaQlJOWoTUPV0Y+ITVMyq9PbIJUZvf9us9kSSoR0Qa+hX0Oo3mXgUXtjCbhEPwVj
 suwFIOd/SDPdKLfuFGpHluzD1NWyFo6qi4CtsZMDCHe2iRKuB/8+u0mfAIz1h7CdTn
 aSiWgsThhCRLns2LTkWRLPwu559+AcLiYwfP+Dzhz2fpUbKpVFznDNSsJLptZijX2t
 z9SgqjlcbLYU5Ojne2TbZTM5Vy+3oRCqO1xjgeGNHpAOeYnfNzbW/lmLB0JR58EDep
 iSNKYjk03DBXvfQSPBn6pK7wsPrjYbM9betnZFyZomg67gXIIPZLU3TP3b2t2brbac
 rH/la4vFIaRnw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/6] ASoC: simple-card: cleanup and prepare for Multi
 CPU/Codec support
Date: Thu,  1 Apr 2021 11:16:26 +0100
Message-Id: <161726938992.2219.5400158283885824194.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <87eeg21tqz.wl-kuninori.morimoto.gx@renesas.com>
References: <87eeg21tqz.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On 26 Mar 2021 12:25:24 +0900, Kuninori Morimoto wrote:
> I want to add new audio-graph-card2 driver which can support
> not only DPCM, but also Multi-CPU/Codec, and Codec2Codec.
> And it is also supporting user customization.
> 
> But before supporting such driver, we need to cleanup existing
> simple-card / audio-graph, because these and new driver are
> sharing code.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: simple-card-utils.c: remove old comment
      commit: 89503d736e3631bda906c627d1092dc8e76ddfd9
[2/6] ASoC: simple-card-utils: alloc dai_link information for CPU/Codec/Platform
      commit: 050c7950fd706fec229af9f30e8ce254cea9b675
[3/6] ASoC: audio-graph: count DAI / link numbers as in order
      commit: 674b9438e2d4c44f45af2a38521767c06c46eacb
[4/6] ASoC: audio-graph: cleanup graph_for_each_link()
      commit: e9cbcf23a28b41a310a13d0b1b67501948b255fb
[5/6] ASoC: simple-card: count DAI / link numbers as in order
      commit: a6e8798061bf0f33caea6fd47b0cb367309e34d0
[6/6] ASoC: simple-card: cleanup graph_for_each_link()
      commit: 39af7f7a03d007e5590f0b852b3f2fed9e703d0f

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
