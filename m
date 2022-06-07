Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD70F53FC1D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:50:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 677F81923;
	Tue,  7 Jun 2022 12:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 677F81923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599044;
	bh=AxRIcnJX9fW26yyj+ldAClhP+8raYDyMP1J5TheAE7s=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=frEOb1qLkJV+nBBNYoIOcG6dvWwJIBsZc3AU7WHBo1+IlqKJfCe0ZLnE2GZECC1Uw
	 2iwQprRYZVtmOseVNTTglNaBIsOFBVr1n6OTqevq7V73rzNG3CqNAJBINIOHn7EtBD
	 cCAZaIN2KMinrhdtmp0S/WBWXwmqPg2mj/JTYsEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C408F805B6;
	Tue,  7 Jun 2022 12:46:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8366BF80116; Tue,  7 Jun 2022 12:45:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99F7AF805A1
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99F7AF805A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JmvRdb9a"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 68B8E61558;
 Tue,  7 Jun 2022 10:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA13C385A5;
 Tue,  7 Jun 2022 10:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598753;
 bh=AxRIcnJX9fW26yyj+ldAClhP+8raYDyMP1J5TheAE7s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JmvRdb9aTcTuiiMN+2eKgM9/x2W0eaFM5fvZyvL9Gai492PJOXX/0yjou/p3KI+3Q
 LbddzbrBsZXZB/B/6O4VRo/cdpH7N98aT4QxlHc+1A4zQ2WxRRBe9G5sdyEtpRkfq3
 2A31DdAwUest7Mz50UNGf3zuNMOOEvmtX86/+G3VjPCr2eJegHlRD+tU0xG7258hqr
 F01G+ZoC8AuzXHAoxsv2k9HbiN0vd+cu88kR2NZUC0fgL/P55pJl2mVOqYHp2IgiXC
 quaWtTGHV9ewCH+GtNukJ1OcsZu+K74kuNV5NAm5P+/mG7YfjpdC7ryo2+PDijWWpV
 //MfPJL7YuqCw==
From: Mark Brown <broonie@kernel.org>
To: peda@axentia.se, broonie@kernel.org, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220602131058.3552621-1-broonie@kernel.org>
References: <20220602131058.3552621-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: tfa9879: Use modern ASoC DAI format terminology
Message-Id: <165459875269.301808.4543691086218525117.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:52 +0100
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

On Thu, 2 Jun 2022 15:10:58 +0200, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the tfa9879 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tfa9879: Use modern ASoC DAI format terminology
      commit: 4f8ed19593872b710f27bbc3b7a9ce03310efc57

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
