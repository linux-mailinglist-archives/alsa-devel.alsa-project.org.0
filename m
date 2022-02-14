Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B144B50BD
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 13:56:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06BFC1760;
	Mon, 14 Feb 2022 13:55:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06BFC1760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644843399;
	bh=EZW3lZdYq+GDhRswwuSuTJNnoxG+mz66jlbpxWVjOPc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YifEjl86Yh9/Mgm3IO00gYoiLi/r6hmGRqLLIo4VfNGsG7JvYdCNPfxUVn8NqMobK
	 3K2Zn0oD741f4HH9Ck2uzbNSBBefoS2Uy/p78sNEnq/px2AElop6OaB+087Ml6Oa43
	 Tqh9Jh8HiQogC25XXEnD948ID5MPAu9vJg0ST4G4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE814F80516;
	Mon, 14 Feb 2022 13:55:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9219F804E4; Mon, 14 Feb 2022 13:55:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4988F800D8
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 13:54:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4988F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z+LqobOg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7BE8561477;
 Mon, 14 Feb 2022 12:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF29C340EF;
 Mon, 14 Feb 2022 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644843288;
 bh=EZW3lZdYq+GDhRswwuSuTJNnoxG+mz66jlbpxWVjOPc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Z+LqobOgcNPpGIQKZeXly1CZFQYHP/Pa0RCpIJasnKK5I+3gaY1Df3z2vBo589xWf
 Bt7muIar38rlbBK4RBGdPv/fHz5X3Uq6BB8M8daWflMk0FBvxF8rTonasVfts1cIsr
 owq472aANMm5bgwVbw9OCzm5Z8E9JpoPxZMAqZR0q836PeSGaStg9qCXYUzoZX03CX
 3gEEkPxsEYbVMezfBlo7INNeH3z7UNwHz9Ko6xxR2c1R4qtn1PEwZFujj0dMJsZSsB
 Hu7d7E69/9nPfb9hqCI/60GBcxzX3mfpwDEbYgqh0gL6JCyuy2XY+nbdKfJH0Kz6M3
 PW44gM2Bw21DA==
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, lgirdwood@gmail.com
In-Reply-To: <20220211082631.179735-1-daniel.baluta@oss.nxp.com>
References: <20220211082631.179735-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH] ASoC: SOF: compr: Mark snd_compress_ops static
Message-Id: <164484328683.12994.13325430085185619773.b4-ty@kernel.org>
Date: Mon, 14 Feb 2022 12:54:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@gmail.com, kernel test robot <lkp@intel.com>,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

On Fri, 11 Feb 2022 10:26:31 +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> Functions won't be directly used outside of compress.c file
> so mark them as static.
> 
> This will also fix warnings reported by kernel test robot:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: compr: Mark snd_compress_ops static
      commit: e7c799e76f070b4ac13498e532574466064ad6a5

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
