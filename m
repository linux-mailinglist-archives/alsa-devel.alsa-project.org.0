Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 430DA52A78B
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 18:01:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBDF1AEA;
	Tue, 17 May 2022 18:00:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBDF1AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652803285;
	bh=OlVi754PWvWretVqYxq67E2aohcBH4s2889TUQW3KBc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WEa8kMGsFje3mGHtPNeiVkeorZMPywVZD15/BOsZKXAQwEc2pj3JiJWDsc5Ss3Pj4
	 r9yhXGyC4ur9zml30G2SDJtVVfkigGdi/T3kn34pqJOZA0VMXfm4/lnJECt3qnCRoP
	 hnjB8A+X/yMT88x5SDcBahrbEUgHBlk9D52Gwdx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77093F80526;
	Tue, 17 May 2022 17:59:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 371D5F80520; Tue, 17 May 2022 17:59:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BED01F800D8
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 17:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BED01F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SRokXpDe"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FB1760DDA;
 Tue, 17 May 2022 15:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B8DC385B8;
 Tue, 17 May 2022 15:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652803173;
 bh=OlVi754PWvWretVqYxq67E2aohcBH4s2889TUQW3KBc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SRokXpDeyHlG4seZRgvsGnwQlKy8eOt11cPXln8wZv2UIaGJgcR6ekll9EQstUEeb
 aLxDEjnAqmAQ1iAx2ouiihP3HYyaiZ7ETAlgNC7LopQXApYa6J1ImPQlUDYRnA+Zy9
 hT2r6uicnQT374PyC9MgNNjkq0J6Gv8VfithKaRVpycV2N/U6Gyjgao80quytTSkyB
 firecNHb1hRY4rWS35hbkrkwtitEtUAUKm7zi77MqRXqPruM7yEgKSdrqV7yFyE3Ab
 bvM9YAYIna3x/CtjtlC+thpagYCsT00omA1/PLZ3bIKLNaCVozZCPaMYW8mwbm18aV
 nOq6f0IoGLX9Q==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, festevam@gmail.com, shengjiu.wang@nxp.com,
 Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 shengjiu.wang@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com
In-Reply-To: <1652688372-10274-1-git-send-email-shengjiu.wang@nxp.com>
References: <1652688372-10274-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/3] ASoC: fsl_sai: Add support for i.MX8MM, MP, ULP
Message-Id: <165280317067.1635268.8779077482848386414.b4-ty@kernel.org>
Date: Tue, 17 May 2022 16:59:30 +0100
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

On Mon, 16 May 2022 16:06:09 +0800, Shengjiu Wang wrote:
> ASoC: fsl_sai: Add support for i.MX8MM, MP, ULP platforms
> 
> Shengjiu Wang (3):
>   ASoC: fsl_sai: Add support for i.MX8MM
>   ASoC: fsl_sai: Add support for i.MX8M Plus
>   ASoC: fsl_sai: Add support for i.MX8ULP
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: fsl_sai: Add support for i.MX8MM
      commit: 9e71bc33ae0d402b1579dc7a7afb3916dd35cb17
[2/3] ASoC: fsl_sai: Add support for i.MX8M Plus
      commit: 2530c5e875eab853125265b4f24a69e042d9580b
[3/3] ASoC: fsl_sai: Add support for i.MX8ULP
      commit: af0bd3c0ffae8c11790ab0108787c03767869a9a

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
