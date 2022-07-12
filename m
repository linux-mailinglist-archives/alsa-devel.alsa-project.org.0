Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCAE572280
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 20:24:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4729A16EC;
	Tue, 12 Jul 2022 20:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4729A16EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657650252;
	bh=pS5A2RbdO2vwzA/gVp98xkqBdNw8gWmDwEv884bdxhI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BefFta927aqTch9Ob6VfS+6+H4VRsNPaw30jMDQLhdTNsQH30pz5nGf1vKvM6rLsR
	 dd7SAa4rsJpl9EPiazmhYdPl0tTVcDMVyNHVDRciN7U0HwWgougZ9fGwQiM0CFgaWl
	 mWNCwgZ8C4gimN/wkBX7QfdFCjLwV7GNzhEcKpB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18721F80552;
	Tue, 12 Jul 2022 20:22:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62969F80544; Tue, 12 Jul 2022 20:22:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C44E3F800BD
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 20:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C44E3F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i/o4//Ih"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 32880B81B93;
 Tue, 12 Jul 2022 18:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED3DC341C0;
 Tue, 12 Jul 2022 18:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657650148;
 bh=pS5A2RbdO2vwzA/gVp98xkqBdNw8gWmDwEv884bdxhI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=i/o4//IhneCqi8w02otYIt5ZDR+MkgRne9Hsot0WreM5d1d7il0q+KvlpdAC7NQAU
 LrJ2T8c6wGOtb1ohDv5NPN5lFbQYIzueAFSkqEA+gPcza/HHPrV1MBK1Pjjy+UyE9m
 /td/xS3rHLz+Mc60msROvFljI45Nv14h/j00zCV+FHe1GlDi3SsxGznjSFv7HsqvgV
 0CfZXT6FSAfGolkCqiDySaz8kVnv4+3UnSKali5wieVXP9Rp5f3uISTMI7puoFSWes
 i+lfgDEluuwRk68EoqNG7GzjT2YgisBZhHDKXfkJtnX0QB+B4l5K2vi0hQusDSJhAX
 2f7jnZr5UtG8A==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com
In-Reply-To: <20220712131022.1124-1-peter.ujfalusi@linux.intel.com>
References: <20220712131022.1124-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: sof-client-probes: Only load the driver if
 IPC3 is used
Message-Id: <165765014650.502248.8014722384072880634.b4-ty@kernel.org>
Date: Tue, 12 Jul 2022 19:22:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On Tue, 12 Jul 2022 16:10:22 +0300, Peter Ujfalusi wrote:
> The current implementation of probes only supports IPC3 and should not be
> loaded for other IPC implementation.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-client-probes: Only load the driver if IPC3 is used
      commit: 9b93eda355089b36482f7a2f134bdd24be70f907

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
