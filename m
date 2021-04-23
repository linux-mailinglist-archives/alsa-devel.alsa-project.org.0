Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BEC3698D7
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 20:08:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1871F16F9;
	Fri, 23 Apr 2021 20:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1871F16F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619201325;
	bh=dx/7TeAyGLpuMigGjqATz6HBmG/nMvcd5qteR6VlreE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dCkGdQbxqX2UIiJkfVjGSuZO9NlKMyEW5++Ha0MfLDz57jS5QUx1UmdK7tEL6cro+
	 LcEuIJgpNwuBmrMb2J710lpm+n3qAZrWIt0pRbbayJxALWOgF9Xpr1QXi/bx7lPDeL
	 FtGapTk9SLCdlPmQbPItniMkyXJo0r7YdmXZWX0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2309F8028B;
	Fri, 23 Apr 2021 20:07:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAC38F802D2; Fri, 23 Apr 2021 20:07:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE7E7F8019B
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 20:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE7E7F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b2TQOJ5P"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E017461209;
 Fri, 23 Apr 2021 18:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619201217;
 bh=dx/7TeAyGLpuMigGjqATz6HBmG/nMvcd5qteR6VlreE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b2TQOJ5P0DQ1ZoWf3mzV4yxrnmGkbAy9NxTVAvbCH3pFHZouK/dbjW2T2zoJ0b/a8
 3MJup5RFWRbNEYvU7JzrFel+noq3f5QGvUy6j4gxkBgzEbex3Cyo4xhQCU1YpaTbYo
 z6T26tJQcaH6EUG1QCMSCV8WfB29BeRHl/Yrfbq8WY3Hm5AdNA/EG3qHpwN8YN045J
 7XOl8HSZaht7RMO+kCtN/p6B9bpxkzF1M1f3BxfsF/HeG52HkLAGpY3JigJETdezTN
 C7vjux6s/qZRvd5o1y1leFL2jWNbaOsvOyFoGHDaGej3lu5dbEwlg/gZB7PIpSHS70
 0gZrgV+hau9zQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
	shumingf@realtek.com
Subject: Re: [PATCH v4] ASoC: rt711-sdca: change capture switch controls
Date: Fri, 23 Apr 2021 19:06:19 +0100
Message-Id: <161920094856.15254.11979581936772990718.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210422103220.21987-1-shumingf@realtek.com>
References: <20210422103220.21987-1-shumingf@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, libin.yang@intel.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, jack.yu@realtek.com, Mark Brown <broonie@kernel.org>,
 derek.fang@realtek.com, flove@realtek.com
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

On Thu, 22 Apr 2021 18:32:20 +0800, shumingf@realtek.com wrote:
> The DAPM event and mixer control could mute/unmute the capture directly.
> That will be confused that capture still works if the user settings is unmute before the capture.
> Therefore, this patch uses the variables to record the capture switch status of DAPM and mixer.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt711-sdca: change capture switch controls
      commit: ca5118c0c00f6bc8b7d0c82c95485159db3a5584

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
