Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 153B153FC92
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:58:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8BCF1948;
	Tue,  7 Jun 2022 12:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8BCF1948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599526;
	bh=ot7NZIrQgQ0K2dEgKzUwzDdgV5Ilv020lsSs+EdKjrM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CyZMcjIF1+IIKT9nAoUJFEt5ondZcsQK2cCW4YlHc7u6oJMSw0T7tqsgCemmJQB/w
	 E0WknIgcsnCYXjdPMC3VsEyCagEAtI/kpO2dwZobjdgWy2L0fNWIcC/oNBzMYQbeSN
	 U1P7dqUa8nWxSD7IkdBuvB2nvSIEXOBtBJXnqQoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0324F8056F;
	Tue,  7 Jun 2022 12:55:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C339F80570; Tue,  7 Jun 2022 12:55:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F39BF80528
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F39BF80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FHf5bn/4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB966615DD;
 Tue,  7 Jun 2022 10:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70C4C3411E;
 Tue,  7 Jun 2022 10:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654599314;
 bh=ot7NZIrQgQ0K2dEgKzUwzDdgV5Ilv020lsSs+EdKjrM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FHf5bn/4/JYTbfZlXi8iW1Dfp090LKdGitT3vJ7mPXAUPwVQWGXIKhhBUPk/5v0he
 +dCXcCO5Cc7OsnI+4WlBg/D5GcE1xmGVKMqaWzrNOzjpiM1JE+qI3E6zSHH5vK0nuT
 pBhpqsJ7mazVeYUMCJwhiLbrvfATRDyVyfkNyvoyU3mEywBXqyO7A2phbejmbbuPaN
 hSQDm0NqQ6v8EhJkXyrFplrvwatFDKjfuYKJjvbCsP2rkoulT1ZiALqMGJP/rsP9sB
 b9sdvUqAgk2F65ej8HGsUOPJAN1XuOLbhnenmykfQiSuq3yaC2NT4EbKNV44G1XbuS
 tJuaM402yYwug==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Vsujithkumar.Reddy@amd.com
In-Reply-To: <20220531120813.47116-1-Vsujithkumar.Reddy@amd.com>
References: <20220531120813.47116-1-Vsujithkumar.Reddy@amd.com>
Subject: Re: [PATCH v5 0/2]Add Machine driver support for nau8825,
 max98560 and rt5682s, rt1019
Message-Id: <165459931260.399031.7143599683737432212.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:55:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 ajitkumar.pandey@amd.com, Vijendar.Mukunda@amd.com
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

On Tue, 31 May 2022 17:38:10 +0530, V sujith kumar Reddy wrote:
> This patch set depends on:
>         --gpio patch
>         --https://patchwork.kernel.org/project/alsa-devel/patch/20220516160619.17832-1-Vsujithkumar.Reddy@amd.com/
>         --https://patchwork.kernel.org/project/alsa-devel/patch/20220516160619.17832-2-Vsujithkumar.Reddy@amd.com/
> 
> v4 --> v5:
> Resolved:
> . Used separate firmware files.
> . Deleted useless initialization variables
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: acp: Add support for nau8825 and max98360 card
      commit: 0439eb4d94e0fc17c6dd3829fabd88c11773381d
[2/2] ASoC: amd: acp: Add support for rt5682s and rt1019 card with hs instance
      commit: 4dc6737cfe882765d914fcb88b5eaa14551ffddd

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
