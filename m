Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFAB46559A
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 19:35:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC88426B0;
	Wed,  1 Dec 2021 19:35:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC88426B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638383751;
	bh=eTOf0ZAeC2V3Egfrxq0AtFk5umjjg4bM+zXOg1szGO8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sNahV2/lThl8pFqaLPc7oe8L8f0I4Ra3T0hkw08fRKy6CwA5UmjfJJWoasKuI6ahf
	 3D8zjK7TXPUM58y/A858Y0OEx6634JxlKloJ/FEbutc6hr4buVwY6AruCaefCFoTfv
	 Wy0n2phnhdWiwGP0vTUJrA4R/UiJr90wVIPz39Jg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF93EF8051F;
	Wed,  1 Dec 2021 19:32:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87F6AF8051F; Wed,  1 Dec 2021 19:32:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06BD6F80511
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 19:32:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06BD6F80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pwPBym3F"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8C6E5CE20CA;
 Wed,  1 Dec 2021 18:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AC7C53FAD;
 Wed,  1 Dec 2021 18:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638383533;
 bh=eTOf0ZAeC2V3Egfrxq0AtFk5umjjg4bM+zXOg1szGO8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pwPBym3FzHDRdjW5tMGiY94PqpsZLY9uKdAHxfA4l/S523ERoo8MMcRb69hktUyhH
 kxC5IXV36IbXQxHoWqCYjn3baMTMnLqZcSj0MfLEhforwkcj1bHlc/RqYCVTk3ALot
 mvVoSH4lLT6sy4BIoTCnziff8J4UzBfMKHWflGVSu1xG9hi5NAOwYEfH08KWNYjp14
 XnuY5TsI3sh+PUMLD6aQQW8ZBSn2OsUT5k5oPklkLJ97p0x9xPbumNo8RwbDm8TU/3
 JiJfDMZhjECT57LezoK3hTGoYcf5M9nqLIKxBWilEEHYs6xpZD0fhGSH/hIy+QQeMK
 F9avyv7KKXDXA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20211127091954.12075-1-rikard.falkeborn@gmail.com>
References: <20211127091954.12075-1-rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] ASoC: intel: boards: bytcht*: Constify static snd_soc_ops
Message-Id: <163838353065.2179787.7204772157932440988.b4-ty@kernel.org>
Date: Wed, 01 Dec 2021 18:32:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, alsa-devel@alsa-project.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

On Sat, 27 Nov 2021 10:19:54 +0100, Rikard Falkeborn wrote:
> These are only assigned to the ops fields in the snd_soc_dai_link struct
> which is a pointer to const struct snd_soc_ops. Make them const to allow
> the compiler to put them in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: intel: boards: bytcht*: Constify static snd_soc_ops
      commit: 10b155fd413d31c89057986d0fc3d4ceef8e0e9f

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
