Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B4D45CB33
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 18:38:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79A6F1795;
	Wed, 24 Nov 2021 18:37:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79A6F1795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637775499;
	bh=JEeUexWEgyab1NljGHQNaWIyFZQlnmSROasR1Re9FXg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sLUfakpQuSyVULWD2QQ4di6mEDseN7jPJmGgAwm98v4C9jNGDojlX96DwBXNzlQGw
	 /zLtRk+IX3Njro12ZWgpqY29ly4qSpD4ZoY9BIoEUrAXYaD6ybUr4/+3D+L9HuQyZb
	 v1WXWX9MRso5wvqp8zoyGzDOgGvAqnLFSd52yt5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92BE6F8032D;
	Wed, 24 Nov 2021 18:36:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E3DFF80087; Wed, 24 Nov 2021 18:36:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 106F8F80087
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 18:36:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 106F8F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qoI3EN2i"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C50AB60E0B;
 Wed, 24 Nov 2021 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637775390;
 bh=JEeUexWEgyab1NljGHQNaWIyFZQlnmSROasR1Re9FXg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qoI3EN2icsuEq+84/28slFKggX1HwQzUrFf0aTEv0Opcm60iGe2C59rv27kXFoshe
 rgENMjtj3bhiZ6dhLvKrdR4yPhpx21s6PBqJCMrw7y5fsrVUILoOPrvIInbkO3zYNz
 SDt+VpdO4WAwP4Xl2WmbiwNkZzshLejdd8Y2Sk1tGsb3GQVYt3WyZotXMSj1pcV6vK
 /+Zwi5yenTjJCMCPO3DKPzd6CUY5jAJTibw03Zs9niI22nOHn/z0kd4Ux3rBOqOKOO
 Oh+2Nk30e5zOKcK3tXbhbGKBPPALAOHUimIZz06+p2ifsyvwcvkZ0Q8xXJU/HfBTf+
 Y0zhV+oxLFE9w==
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20211123165759.127884-1-kai.vehmanen@linux.intel.com>
References: <20211123165759.127884-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: hda: reset DAI widget before reconfiguring it
Message-Id: <163777538854.2712035.15609353888586493899.b4-ty@kernel.org>
Date: Wed, 24 Nov 2021 17:36:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Paul Olaru <paul.olaru@oss.nxp.com>, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
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

On Tue, 23 Nov 2021 18:57:59 +0200, Kai Vehmanen wrote:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> It is not unusual for ALSA/ASoC hw_params callbacks to be invoked
> multiple times. Reset and free the DAI widget before reconfiguring
> it to keep the DAI widget use_count balanced.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: SOF: hda: reset DAI widget before reconfiguring it
      commit: 86f74ba3fef56dd1cee19b7a15ae27fc0da5bb61

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
