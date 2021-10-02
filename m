Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEC741F8B2
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 02:20:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0358F16E2;
	Sat,  2 Oct 2021 02:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0358F16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633134011;
	bh=VAVHnoUfr1vHRk1CPnvhgVB1qv+vlUJG4BZ/csbPNkE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=USRWo6J51PnnunErs6o+NUUJQ/Lrz/UE3V9jNqSVoqftWq7GWIQSrqvST/q0GpVhr
	 grWuEtG6TM74yhI32dJ1CSSPELigkh2CF1l485bJvsmXdX5qXYDuDrOKGVHEwREBiu
	 qZlHQ8qjTpap99X/Q0ezv6nn+09SkJJVfO0MU9JU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8171F80510;
	Sat,  2 Oct 2021 02:17:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22839F80510; Sat,  2 Oct 2021 02:17:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5809F804ED
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 02:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5809F804ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Pkf6hRKv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDD4261A38;
 Sat,  2 Oct 2021 00:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633133829;
 bh=VAVHnoUfr1vHRk1CPnvhgVB1qv+vlUJG4BZ/csbPNkE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pkf6hRKvY5FWkI3Rtxyro/ALYWAw3LcLBdP7tAGoxaDHhGlmHGpfa1vRUQ6e0E3sX
 0bQ8RW7Ss6NRTW425fZb7tj0V/xlxZ6/Z/VRcvs6DKm+RctHFGKGxK+kSotlDd0zcS
 4Glo9NlX5s15PT3gSlbxV3rRCBzgHAVccLBSiipBgZ0X6vuXq12ystMaU+8SOoK8dJ
 j7luMQ2I9vHSFv64D2fAwiv4GLtDXZHLc1FxzNs6Fp0gZ1vckJxDgM0+n0A//GOKCX
 pNiH1Ml6jzYicXweoZMPEDdlL3t1PLojI6qa+u0GV/7NTnfuJUpJVezm4DQjfsjTZK
 msAU5Dmfu1A7g==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: soc-component: Remove conditional definition of
 debugfs data members
Date: Sat,  2 Oct 2021 01:16:33 +0100
Message-Id: <163313339122.45396.9113357063584478110.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930142116.528878-1-simont@opensource.cirrus.com>
References: <20210930142116.528878-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Thu, 30 Sep 2021 15:21:16 +0100, Simon Trimmer wrote:
> This simplification allows the use of the standard kernel pattern of
> static inline dummy functions for debugfs code. Most systems will only
> have a small number of snd_soc_components so the memory impact is
> minimal.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-component: Remove conditional definition of debugfs data members
      commit: 0a43c152ed0666dc837009bae031b898ced95e5b

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
