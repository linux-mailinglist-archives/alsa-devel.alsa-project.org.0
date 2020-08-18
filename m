Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FDE248C4D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 19:00:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A2D617A9;
	Tue, 18 Aug 2020 18:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A2D617A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597770024;
	bh=O1wpfDbrtyBL3IdNXbN8l+IPH7yJp8PHJk5pTT5AKJA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BQqEMn9keSNyuITDV9sG3ESATdmVCyNP5OmzBkuJdgIPeNWKsIaZmundCp3s0HY48
	 dcKGXHo3dYV8WthmpvilCXtLfbUnt3AVflXb4ktOB3tJNbS0Tfa0g5lATxaNjEzxtk
	 ytNa25Sw9qURGYzBFm25tRW1DhIQ7VVmnv/nklCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAEE4F80304;
	Tue, 18 Aug 2020 18:54:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D8AAF80307; Tue, 18 Aug 2020 18:54:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57ABEF80304
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57ABEF80304
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jFEwZyvu"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82F8020786;
 Tue, 18 Aug 2020 16:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769691;
 bh=O1wpfDbrtyBL3IdNXbN8l+IPH7yJp8PHJk5pTT5AKJA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=jFEwZyvughYWeTaICZZWAifgKqbo7/fO2IbgfnW261N7T4UOsuTb3l2bJEhjoqgTz
 j/85BV0IimQITdvEzvoFzMIPBymmcq9wqBJ7YubK/fiNCC/3WhAlydKQAGT9w+xC1i
 dzVPWz/EQUj1AudI5tJBGaMK7T6s12BR038Wrzqk=
Date: Tue, 18 Aug 2020 17:54:20 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
References: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/21] ASoC: Intel: fix cppcheck warnings
Message-Id: <159776961933.56094.16242138158655075557.b4-ty@kernel.org>
Cc: tiwai@suse.de
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

On Thu, 13 Aug 2020 15:01:26 -0500, Pierre-Louis Bossart wrote:
> This patchset tries to reduce the number of warnings on those drivers,
> so that cppcheck can become a viable tool to detect issues (currently
> hundreds of reports).
> 
> Most of the problems are related to unnecessary/redundant variable
> assignments, prototypes and one nice logical mistake resulting in an
> always-true condition.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/21] ASoC: Intel: Atom: sst-atom-controls: remove redundant assignments
        commit: c6a6586126d3f8010a181c01d4dd6aa90a953b66
[02/21] ASoC: Intel: Atom: compress: remove redundant assignment
        commit: b0a2a93dc3acb4c2868c60ef0d3278289a532816
[03/21] ASoC: Intel: Atom: platform-pcm: remove redundant assignment
        commit: b0754c55adf9a2aeb3c3732eb159615e91c70397
[04/21] ASoC: Intel: Atom: sst: remove useless NULL assignment
        commit: 4e3aab3217cdd1506ff89642e554995cbfa0806a
[05/21] ASoC: Intel: Atom: remove redundant initialization
        commit: 30701e0f3b1a134cbd000ca607a26342a10f6383
[06/21] ASoC: Intel: Atom: sst_pvt: remove redundant initialization
        commit: f3352e6b7c27078d9342c9faa8332b8113719f4b
[07/21] ASoC: Intel: Atom: platform-pcm: fix redundant return
        commit: 5ab56a224398a05ade1762d591321f238c284b19
[08/21] ASoC: Intel: Atom: remove useless assignment
        commit: eeb460f21250d46e5fa8e8429c38de47fe912481
[09/21] ASoC: Intel: Atom: sst_loader: remove always-true condition
        commit: b66a056e1539d8470013fff00f476377a616baa3
[10/21] ASoC: Intel: Atom: sst_pvt: simplify return handling
        commit: 7b99434c2c35e6045cc65992e3aaf231012e93ef
[11/21] ASoC: Intel: Atom: (cosmetic) align parameters
        commit: cfe8cc9419918bc56f528fa370aa8435d99b8353
[12/21] ASoC: Intel: Baytrail: (cosmetic) align function parameters
        commit: 0af1fcea054497ba784fc2d9b0125c4c2f6609e3
[13/21] ASoC: Intel: common: (cosmetic) align function parameters
        commit: 2b84a26f99762774b98fdb1e66be7400c0d22199
[14/21] ASoC: Intel: haswell: (cosmetic) align function parameters
        commit: c9b1f82d53930762094af0381c5dc7a8a2b6a86d
[15/21] ASoC: Intel: haswell-ipc: remove redundant assignments
        commit: 523615b716005b189f5a6cd9f7a255a902e45bce
[16/21] ASoC: Intel: Skylake: skl-nhlt: remove redundant initialization
        commit: 8be54edba9096056ff5d0fb2a29d0b3b962fa60c
[17/21] ASoC: Intel: Skylake: cldma: remove redundant initialization
        commit: 3b4d60f0f7dd13594916bcd6644ea6208597d993
[18/21] ASoC: Intel: Skylake: sst-utils: remove redundant assignment
        commit: c6193988e945b658bffd09174edae1b43b8ab0b6
[19/21] ASoC: Intel: Skylake: skl-topology: remove redundant assignments
        commit: 25722cf606f6c58b1f2f709434aeb418c4b0b1ca
[20/21] ASoC: Intel: Skylake: skl-topology: remove redundant assignment
        commit: 11a790f94b340c3deb893c6229c3948233a91a4a
[21/21] ASoC: Intel: Skylake: (cosmetic) align function parameters
        commit: 8f0ccd59bcc9305241507cb48c6aaa08a9f375c8

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
