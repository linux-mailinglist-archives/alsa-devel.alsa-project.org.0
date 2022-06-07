Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9F953FC55
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:52:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F15B17D3;
	Tue,  7 Jun 2022 12:51:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F15B17D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599131;
	bh=slxqdGbN2Xkk/KNCkqG0OOK4Kra7MbWR8P3wapvWLsQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p9zzEXv1KgkaybaF+F2cbPuzFmRR1ETKOZp8nZGpBasy2a4DH6NrPeBjUu/p0WF8p
	 ZdudGq9HeJs8BUxy1pGOVxBhEX7rlzcH5Iha8lHw+OSilBt4FXVgXrLtZJ852NNhtQ
	 64iBxD/XutJpfPfvc2dO/6QXyWCfiIqQssyv54Ec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C088F805C2;
	Tue,  7 Jun 2022 12:46:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26B32F805DA; Tue,  7 Jun 2022 12:46:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DF01F805C2;
 Tue,  7 Jun 2022 12:46:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DF01F805C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nKgBO2yx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A4F06156D;
 Tue,  7 Jun 2022 10:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18212C34119;
 Tue,  7 Jun 2022 10:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598764;
 bh=slxqdGbN2Xkk/KNCkqG0OOK4Kra7MbWR8P3wapvWLsQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=nKgBO2yxpRTjF0AMMyAvBBPbJPWxIIf/1HNeIl5qjRMTEwgcBjTAEnIzSu1/ANq+l
 G3BFyiLFhfeJaJRY4WRcP3EuQ+GqQOgKw5kwlGz4UuoAGg/sESnti/PQIi2OiZomiq
 obXm8Ho36QZBsOK49idNxRtZwIAnPBiUhpFfVTnutOYnVTdw5BUzNu+lR/XSjG4xzG
 lglnbT/nV9a+AhyPKLgcVHC37XbFY6uAVyDL5MGq60h0ncKeD2yK90qOy/sjzhjeEU
 elhPVuj4acsWTnESDbev9dwTRdYmcm9YFrFV1GdH367y6pFxLovDAW3CI6nK4+cEMJ
 SZ+z1iK4T0iWg==
From: Mark Brown <broonie@kernel.org>
To: dan.carpenter@oracle.com, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com
In-Reply-To: <Yph+Cd+JrfOH0i7z@kili>
References: <Yph+Cd+JrfOH0i7z@kili>
Subject: Re: [PATCH 1/2] ASoC: SOF: ipc-msg-injector: Propagate write errors
 correctly
Message-Id: <165459876081.301808.13605726339122766955.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 ranjani.sridharan@linux.intel.com, harshit.m.mogalapalli@oracle.com,
 rander.wang@intel.com, daniel.baluta@nxp.com,
 sound-open-firmware@alsa-project.org
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

On Thu, 2 Jun 2022 12:08:25 +0300, Dan Carpenter wrote:
> This code is supposed to propagate errors from simple_write_to_buffer()
> or return -EFAULT if "size != count".  However "size" needs to be signed
> for the code to work correctly and the case where "size == 0" is not
> handled correctly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: ipc-msg-injector: Propagate write errors correctly
      commit: d9a251a029f23e79c1ac394bc551ed5d536bc740
[2/2] ASoC: SOF: ipc-msg-injector: Fix reversed if statement
      commit: bedc357217e6e09623f6209c891fa8d57a737ac1

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
