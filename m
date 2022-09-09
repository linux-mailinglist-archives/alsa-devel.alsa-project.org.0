Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 906705B429E
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 00:47:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E8FB16A3;
	Sat, 10 Sep 2022 00:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E8FB16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662763670;
	bh=BNVcYOwgkmcKuuJCSlWm7UJ4Vo1N1whJzlrny2RW5SY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EVSLbVY0VwpHT3H1K5sUH0dEHB8YhBKvXydKvAuyEXZRcgdOlOdnVUC7cAyZ+ecSF
	 yLef413fAeaienxBqTMYUqd7QGlTjcHmWOst/3Big0xJI5BPk0qadYtSRyc2DMI20F
	 vNpTrGPRRRhe2bMcTy7Hy33bNjxech6xFO10k/Yc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B062CF8016C;
	Sat, 10 Sep 2022 00:46:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4687AF80538; Sat, 10 Sep 2022 00:46:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B213FF8016C
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 00:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B213FF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Khj+E0ee"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0301D620F9;
 Fri,  9 Sep 2022 22:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8D9C433C1;
 Fri,  9 Sep 2022 22:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662763559;
 bh=BNVcYOwgkmcKuuJCSlWm7UJ4Vo1N1whJzlrny2RW5SY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Khj+E0eeAJ7fLEzJyKHLTiiWFrIrJVU+lUO5jpoR2lIm1D4YZzcIpp+tN8TdOcDwd
 Ppg+obI5Dh5xOniiN4gt5hTenY5UhQlqlTlO8rSElysdXg1xkQdW5J4px5aeITP99w
 yUitUoE2gOFaLFIciXG+PUeAhse/nU3k0zyQj9qxGDr4MWeF4ASMNZ/rb6VkjB2Tf2
 YSyGL7c3dQD0UxQ2n1PiQyu97pV0pQRZOVcPxToS3ugjJ4HTFProe/4NHQA3O6m/2B
 +LvZZJHwDt0SGAJ7vw8ruior83cMtVL7xyUiSwEJGa49ykzDyL3AnrEPib0aed7Pno
 M0FrzRUGQCwzQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874jxhmjgw.wl-kuninori.morimoto.gx@renesas.com>
References: <874jxhmjgw.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: hdmi-codec.c: use devm_kzalloc() for DMA data
Message-Id: <166276355757.332114.1478838443267828453.b4-ty@kernel.org>
Date: Fri, 09 Sep 2022 23:45:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Chao Song <chao.song@intel.com>, Dmitry Osipenko <digetx@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Fri, 9 Sep 2022 01:20:48 +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> hdmi-codec.c is using kzalloc(), but we can replace it to
> devm_kzalloc() and then, we can remove .remove callback.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec.c: use devm_kzalloc() for DMA data
      commit: 985f03ba6f4bc37bdacd2e78906e6b731e03ab32

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
