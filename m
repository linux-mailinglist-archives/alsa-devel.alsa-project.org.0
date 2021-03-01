Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E4F329551
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:43:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7C1C166D;
	Tue,  2 Mar 2021 00:42:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7C1C166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614642213;
	bh=ee8F+2qtecALKXsHqBVpaFJBcACBRvTrOmpti/qYvXA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uqtne+/rIYX+/iZLf4ZZbQmsn4Ki5P/Wi6DYlu3o2p/8SuR9BumlKKW4lKDjnmSHj
	 tNaECVFio7wsjfJVgn+pMMgrU5RNTfyafjo2emgtI0O1Z6FXUlezufr128aSx/6GvB
	 y/3t4SJVx+ubz6r41QB2ceffGIQ6bGCWGGx1kYBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D6CFF80272;
	Tue,  2 Mar 2021 00:37:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAB33F8051A; Tue,  2 Mar 2021 00:37:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79B36F80272
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:37:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79B36F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q8e74QRY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69E8461490;
 Mon,  1 Mar 2021 23:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641834;
 bh=ee8F+2qtecALKXsHqBVpaFJBcACBRvTrOmpti/qYvXA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Q8e74QRYLJGluQ8/AgQ88NCNIvn4YA+bPK5+dlr4P0lwhcVRrVGnZtYCNDyQw4FkV
 ieWiYuo2GSA5VwQK5N8G8vXJBdqR2b6CSJvqAXnWfe69PxD+ZPBtxRzOWlzwuYKrpD
 F1QojJlo7mIZydEhK8q2LqIzcgzs49UllzwMuf+2/i03100xqTcsuAf+SCMBBcpIMJ
 6DurPiaCuaj/n+ymJA8kg0EALk4hSuJg4Gp5w5rg+k84s0rLAMwKjuXgc/26JMq3RW
 t57NqP3+YMLkQVdMSTKVnLkN2Ln9bRAZZgeMZOcjHrE2Kd2YlXdxgs9s+2Ln83RtA2
 JxcYKeE+N7IVg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20210218221921.88991-1-pierre-louis.bossart@linux.intel.com>
References: <20210218221921.88991-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: core: remove cppcheck warnings
Message-Id: <161464168096.31144.8026117442122515811.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Thu, 18 Feb 2021 16:19:15 -0600, Pierre-Louis Bossart wrote:
> This is the first batch of cleanups to make cppcheck more usable,
> currently we have way too many warnings that drown real issues.
> 
> Pierre-Louis Bossart (6):
>   ASoC: soc-ops: remove useless assignment
>   ASoC: soc-pcm: remove redundant assignment
>   ASoC: soc-pcm: remove shadowing variable
>   ASoC: soc-pcm: add error log
>   ASoC: soc-topology: clarify expression
>   ASoC: generic: simple-card-utils: remove useless assignment
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: soc-ops: remove useless assignment
      commit: 56dc057925b112353a4d920380c537d1f96699a0
[2/6] ASoC: soc-pcm: remove redundant assignment
      commit: 8f7351ec37b52d22e77d2cab38ddd4aa920af0b4
[3/6] ASoC: soc-pcm: remove shadowing variable
      commit: 52fcd9638da0803c6fe0cfadab7af978c961be37
[4/6] ASoC: soc-pcm: add error log
      commit: 56fc1a7fd01ef0984d0272e52a9823ca11eff890
[5/6] ASoC: soc-topology: clarify expression
      commit: 761fa730a2e1e9197d89f3e9d1a13a9be165b109
[6/6] ASoC: generic: simple-card-utils: remove useless assignment
      commit: 8754b443fa7df24e357b7e707c901eefe373a05c

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
