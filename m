Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1866B3DF809
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 00:38:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1E74171B;
	Wed,  4 Aug 2021 00:38:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1E74171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628030334;
	bh=itzEvpfQl30/cXcBzgEf8EEtRC4VYD4DYNiKCZ3vOGg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KJ3M08OUqh2K3aEji084+pc3YLBYySy6YZsIj5TtNr3uqvRT+eiJ4LP395/e6N9JP
	 DDV966tmzw/+56pwWgle1NnGvBhkyov+0gNJa4wyubaKx/BrSZHCoVocpSiyEBYZtL
	 rqxhOuVYQgBFU9Cyyil2VmRIccMDaqrukEKz37dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B443AF804FA;
	Wed,  4 Aug 2021 00:36:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13C27F804F1; Wed,  4 Aug 2021 00:36:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00312F804E3
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 00:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00312F804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="foRO6o1E"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 042896103C;
 Tue,  3 Aug 2021 22:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628030183;
 bh=itzEvpfQl30/cXcBzgEf8EEtRC4VYD4DYNiKCZ3vOGg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=foRO6o1EZx7gXIkzctHRZgj38RJq8ES+P+LemUCu1nTlw3N2ccFJTX8io4WqKmc6Q
 LR0zjB/9x70CQYbDODAWOejaEzOQlgipFtdR/xW11wX7ITL1vhqOBbZ/28Xl3mTU1c
 mSgcSvY2J7SiITiioaH+EIgdw2riXJwtZMxWILTjrVMRsQrrWfhaS0PTbPYBuHQXek
 ib14HiOtpXEvwBkFGlPbyfj0gbRGbmxgaENn/oNjo+4IpZMgzhXKzzZ0VAeD30b+i2
 evLgNGvldVzzx1E7DqzJ03HBXJlHtHjOf9Ek7+BZG8zagT88wEW9DzEPVn9e1DDfj6
 /0VIrx/IMog+g==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-ipc: fix reply size checking
Date: Tue,  3 Aug 2021 23:35:39 +0100
Message-Id: <162802985540.42099.7162137224505669472.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802151749.15417-1-pierre-louis.bossart@linux.intel.com>
References: <20210802151749.15417-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On Mon, 2 Aug 2021 10:17:49 -0500, Pierre-Louis Bossart wrote:
> Checking that two values don't have common bits makes no sense,
> strict equality is meant.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-ipc: fix reply size checking
      commit: 973b393fdf073a4ebd8d82ef6edea99fedc74af9

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
