Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4115B543DBB
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 22:47:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 274DB1DF9;
	Wed,  8 Jun 2022 22:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 274DB1DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654721257;
	bh=VRhhu9ajunTB2Jx0vvHFFqmQHOkemsXwtxpkKIgAyvU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WTgBLoroxg7lisOWn4G1En4eNtPiTddDGm+IziqMeCCi0WYW1wgr67dAKbC+ZNt9A
	 B1MOp6k+l2siwOfGe26YOs4h2dYcWf5pXAcYS/3hnEJHyFi1sEXZa6mi6yu28vA2Rk
	 ZPhBsPbDRalca+xorUBSUZCmmxTXIwQKUs6TQmco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 581C6F8026A;
	Wed,  8 Jun 2022 22:46:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A803F8026A; Wed,  8 Jun 2022 22:46:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1780FF80118
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 22:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1780FF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CyRadPHN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81A2A61CDB;
 Wed,  8 Jun 2022 20:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC211C34116;
 Wed,  8 Jun 2022 20:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654721190;
 bh=VRhhu9ajunTB2Jx0vvHFFqmQHOkemsXwtxpkKIgAyvU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CyRadPHNy9qJDKi909xbwJHRtHy9LOPH1UB/XMc4YIkIoxj5GPLO4+jXZ5k0GDyPG
 jUTR5qxBF/ixGEDHDMCIfF1yM5KllXhXse9Zktz0nHDxheMS1cIpEyfxX9yj0+ZaeO
 kc8oWsL74MoSdJcqY+chAg2Jkg3qE1BPYXQnD5rRWERQsMK75RjFl9Wv0m4VQSOcso
 MJ6xIKSE0+tQJz79yqrs7jIPqIIdT/OY9shzL3ClwkV/6Uxa4u5oABW0+otiDPpagu
 a0sce2j99mYvQCVNBgbsbsTFPs/ezvJ1el/zguUqdeR24bfEO8lspctJNhhhY5RNr6
 Bb7ygD5dmSniw==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, shengjiu.wang@gmail.com, alsa-devel@alsa-project.org,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, shengjiu.wang@nxp.com,
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com
In-Reply-To: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
Message-Id: <165472118853.3018072.13972119584766008524.b4-ty@kernel.org>
Date: Wed, 08 Jun 2022 21:46:28 +0100
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

On Thu, 19 May 2022 20:36:48 +0800, Shengjiu Wang wrote:
> On i.MX8MM, the MCTL_MCLK_EN bit it is not only the gate
> for MCLK output to PAD, but also the gate bit between
> root clock and SAI module, So it is need to be enabled
> for master mode, otherwise there is no bclk generated.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
      commit: ff87d619ac180444db297f043962a5c325ded47b

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
