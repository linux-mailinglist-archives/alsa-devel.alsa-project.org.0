Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D57CA419D8F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:53:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54E0E16D1;
	Mon, 27 Sep 2021 19:52:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54E0E16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765189;
	bh=gRCt++gqse5ikCiwAvmY/ll89sAusYeaYsgVJ6/bFXk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IGy7PfeH6+MSkeId4KHRzV1AlJNxijezsF1p04mxH84czYeAURtVl3y38rTIcWhPT
	 gQNewTExCiayv3yXDRKL6qgKreJFbPwXr8YZZCjzD7Nsqdy2OfuPpsud/IP8jCMkOe
	 tbJMH/DABce9JXbohhVMb2V8D34iyYNAcy7q93zw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47F77F8053D;
	Mon, 27 Sep 2021 19:47:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80F33F8052D; Mon, 27 Sep 2021 19:47:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D72B7F80529
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D72B7F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GRJ+LCTV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9FF5610E8;
 Mon, 27 Sep 2021 17:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764859;
 bh=gRCt++gqse5ikCiwAvmY/ll89sAusYeaYsgVJ6/bFXk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GRJ+LCTVeYXqup6ncTREQN13vd6Jibmr5UhRx87cG+F9SnVX2GuR+qoma5QZZCaSV
 yVLGYZIfZ9zcNAphjmNaQ0eCZHAAQSdcF0K6VR/1KzLyYwOhTk3DNYZjdrRVpG+5Y2
 yPoFY4PDoG2CTz2Zmn1woWy6N2eaWMAj/XmvG2o/NC8D5UuYuog5nWAs36hpT5D0ID
 35QRJ0zYzzm7rlIoGhHiOqTWBBVCHlFq9XRrjlCqQndux/rAQ4Pt1C9pVXErlrMdBR
 PE7e+C5qznzi79C2YTpaFVL477WSWIKa4gR2s7NxODf9oTj6DnQKbtvsqUoZTcjHtj
 nVWUh4U8/U9YA==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Subject: Re: [PATCH] ASoC: ad1836: Update to modern clocking terminology
Date: Mon, 27 Sep 2021 18:45:37 +0100
Message-Id: <163276442019.18200.494013229074378288.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916142125.7226-1-broonie@kernel.org>
References: <20210916142125.7226-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Thu, 16 Sep 2021 15:21:25 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the ad1836 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ad1836: Update to modern clocking terminology
      commit: 88e5cdddb50abbe8be7570e9bc524791d7ff7dd6

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
