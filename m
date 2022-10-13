Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A4C5FDB49
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 15:43:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 972AF5B5F;
	Thu, 13 Oct 2022 15:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 972AF5B5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665668618;
	bh=74Z5rv+raWoM7hrvHUWcSoDclbjh49eJjbnbszkJsZI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HnbOdmBaTB8gz44SsTYz6Z2zoefaxNXtxQQdf6e+158eUMTiszbMNoo196NESQw5p
	 eiZ1c2v05kVLQlTHsaQL/Y2lLAb1ZOckZ0vipMMdmDYrCad40zXmBpeNngEHFo7TND
	 pJpqQV9h4uDcdNp6tX/h68bX8HCroak6HuF+oEs0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96F47F800A7;
	Thu, 13 Oct 2022 15:42:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FEA7F80543; Thu, 13 Oct 2022 15:41:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DFF0F800A7
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 15:41:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DFF0F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MKwV9G1A"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2145CB81E55;
 Thu, 13 Oct 2022 13:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80C0C433B5;
 Thu, 13 Oct 2022 13:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665668510;
 bh=74Z5rv+raWoM7hrvHUWcSoDclbjh49eJjbnbszkJsZI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MKwV9G1AP5Mnz7j7JSQi2sbkPcL1/kiynic4BfVeoaHmSyOhIuDu25YbBQ2nZUwnr
 Z9zR+P4lRMGhnaGTZtj0AhlZYT/vDn3+QFzFcRI3MlTI8bltMLDT6msomPvkQTw6wd
 N4EctM88ox4GzI3kgMJ3t93Gpq3HtYoAElpIcaIfd6qV/A8wIzacla/gkRV8FpxJM7
 FNrSONxdwI1gWFJOiAJpcPKZVdqtEqyBuqO56KJHIF1M/zjn1ycLGTmRLU6MPHSm4M
 20vdkt6goMg9kcePIewdEXhU83IEODreZw3sAMAFbKqEkQta794sHC/nnIDyptyQ/q
 NTkdrKl3njuMA==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.wolfsonmicro.com, matthias.bgg@gmail.com, tiwai@suse.com,
 Zhang Qilong <zhangqilong3@huawei.com>, 
 ckeepax@opensource.cirrus.com, jeff_chang@richtek.com, lgirdwood@gmail.com,
 perex@perex.cz
In-Reply-To: <20221010114852.88127-1-zhangqilong3@huawei.com>
References: <20221010114852.88127-1-zhangqilong3@huawei.com>
Subject: Re: [PATCH v2 -next 0/3] ASoC: wmxxxx: Revert old "ASoC: wmxxxx: Fix
 PM disable depth imbalance in wmxxxx_probe"
Message-Id: <166566850840.143340.14591438019775589248.b4-ty@kernel.org>
Date: Thu, 13 Oct 2022 14:41:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org
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

On Mon, 10 Oct 2022 19:48:49 +0800, Zhang Qilong wrote:
> Both the old and new patch have been applied, it will resulted in
> redundant calling of pm_runtime_disable when error returns. We Just
> revert the old three patches to fix it.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: wm5102: Revert "ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe"
      commit: de71d7567e358effd06dfc3e2a154b25f1331c10
[2/3] ASoC: wm5110: Revert "ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe"
      commit: 7d4e966f4cd73ff69bf06934e8e14a33fb7ef447
[3/3] ASoC: wm8997: Revert "ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe"
      commit: 68ce83e3bb26feba0fcdd59667fde942b3a600a1

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
