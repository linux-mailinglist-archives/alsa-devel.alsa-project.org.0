Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8386486B30
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 21:30:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BF491AB3;
	Thu,  6 Jan 2022 21:29:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BF491AB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641501035;
	bh=BGqh5w32AtbQBoQuseqpX+P4H5soTGDf7+fuVcRonE0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MeDxBa9YZd0gG48wV4FyzSL3K/HlYGKReVbJQ+QcqzT/V3zYzNutUA48mf45TJpkj
	 CU4Ew1L7zDjzQcKP4tfx1x7UHzx1WDJSzNgoF+6MpksNI//ujwnn+RiE483EhiI46K
	 033o6081XV6cFnqumM+M0POp7QXeZUX0Ggs+GZ8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D988F8050F;
	Thu,  6 Jan 2022 21:28:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F1FEF80158; Thu,  6 Jan 2022 21:28:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9870F80121
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 21:28:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9870F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dYXzcPsd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 179AB61E21;
 Thu,  6 Jan 2022 20:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3B5C36AED;
 Thu,  6 Jan 2022 20:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641500894;
 bh=BGqh5w32AtbQBoQuseqpX+P4H5soTGDf7+fuVcRonE0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dYXzcPsdPgpX4KDM3EK5x+hbwj6AXsuXwNTu6T8A7o40nVnVxTp0DUmqPMXwW69X5
 SB9pN7XIF8rVr2iomTtzBbZ28X4b+bqMpGtuCLP71H8dKA+HiO1tS3uxdrRw05YyWF
 h+5Wbw/fPsKNOXfjWB4Agj6ZDqO5yj7SM5KSPoJ/ASnXwZydNzkUgMkjvdFc9K4YPL
 cQTBYmWEhZi5xR6SrKx5TyfBZdoi45nDng+FUrgLAycY9d2OvZ44zZ2c2bV/kb2Eb2
 YT6G1/WPAQOgZGe3ajonlC0OrwCDl8Td9JOPmp9/aaCVp2L0NoBegqnG7vzxWBlmcR
 H0fogSQz5UgWQ==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org, festevam@gmail.com,
 nicoleotsuka@gmail.com, timur@kernel.org, lgirdwood@gmail.com
In-Reply-To: <1641380883-20709-1-git-send-email-shengjiu.wang@nxp.com>
References: <1641380883-20709-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: refine the check of available clock
 divider
Message-Id: <164150089249.2243486.14713961651621458604.b4-ty@kernel.org>
Date: Thu, 06 Jan 2022 20:28:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Wed, 5 Jan 2022 19:08:03 +0800, Shengjiu Wang wrote:
> According to RM, the clock divider range is from 1 to 8, clock
> prescaling ratio may be any power of 2 from 1 to 128.
> So the supported divider is not all the value between
> 1 and 1024, just limited value in that range.
> 
> Create table for the supported divder and add function to
> check the clock divider is available by comparing with
> the table.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc: refine the check of available clock divider
      commit: 320386343451ab6a3577e0ee200dac56a6182944

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
