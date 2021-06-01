Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCFB397959
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 19:42:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C92E16FA;
	Tue,  1 Jun 2021 19:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C92E16FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622569331;
	bh=ZXDp3ucb9BWyakDkZhwIy8R/DACPa/OENIYRq/ircvU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oUOq2lXb8xssiulQWfldBCOQfkvcXmloSleX7BjZbrnNzY1siTgUD3JcHshXTLQci
	 TSkS61/klILxVGCoZ9FDwBhlhQxSP6bR8rRWkVct1CfjfnT5B6AlckiItzS4gObVan
	 Qd5FKrZRhBJgCB0Aoc/fgfPvCHkjpB4nh2XEGVoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A71A1F804D1;
	Tue,  1 Jun 2021 19:39:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 444DDF804C2; Tue,  1 Jun 2021 19:39:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8F8DF804B0
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 19:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8F8DF804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EDsRCvbA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B52FE613D2;
 Tue,  1 Jun 2021 17:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622569141;
 bh=ZXDp3ucb9BWyakDkZhwIy8R/DACPa/OENIYRq/ircvU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EDsRCvbAnoTfHk5aY/xSuvFJoXPJ2k7xMHTI6BR3WWM9uHbRI8OKrxvsCefwjWOZQ
 G3pCzrN8j2QkTbL01MLHVxh/GSHR82ZKpZh/pKaSfbPgS6sIQLEt7rWZwMUNUKrnR/
 wCu7MlP7VH5yll+jVW/jGQDjf4p3lN/M4E5KV3QYV6VImNhL8V3gsC5hEoYryHuh9i
 VqapCia33mH107dUNmcWLSpM0V0pORA7mBnd4s48ZxGLFUCjio8JHf7dLt43J8BYTq
 6vnnoAkaPurfJvO/laGzTcJbsQRffQRNndQr6jcl2qbjm8l8QSC9zsOJLfztylRsUW
 L4A0T6oINOMfw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: pci-tgl: add ADL-M support
Date: Tue,  1 Jun 2021 18:38:13 +0100
Message-Id: <162256892745.19919.14945523274065182150.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210528184153.18251-1-kai.vehmanen@linux.intel.com>
References: <20210528184153.18251-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@nxp.com, pierre-louis.bossart@linux.intel.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@intel.com>,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
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

On Fri, 28 May 2021 21:41:53 +0300, Kai Vehmanen wrote:
> Add PCI DID for Intel AlderLake-M.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: pci-tgl: add ADL-M support
      commit: 1f763d0388af6f6cffcdb1080ce112c63d766809

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
