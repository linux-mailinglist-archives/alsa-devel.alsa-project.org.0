Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A58B3DF802
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 00:38:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99A0A1737;
	Wed,  4 Aug 2021 00:37:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99A0A1737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628030284;
	bh=TswmPyic3rPez1zI27HkARMNq7DbPINjNtxiyY15MFE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ISintIv121Vd+J1trTDRpm8OFZoSx1TH2dXNrmIi7OytpsjG+LgY9JCfgmweh2Nxy
	 BrRDdXbdY0/Wgq42ddWP0qSQL4y7LcjkgKwV4osgKot9HpM4Fkt+zDGjDGOM6mvaxI
	 sLnMYjdS9vyAdbi975eCLif9LBQBoPp+9ba23w8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB2BBF8014D;
	Wed,  4 Aug 2021 00:36:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BEA8F8014D; Wed,  4 Aug 2021 00:36:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 099D2F8049E
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 00:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 099D2F8049E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uOtTR42+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87C9260F38;
 Tue,  3 Aug 2021 22:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628030180;
 bh=TswmPyic3rPez1zI27HkARMNq7DbPINjNtxiyY15MFE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uOtTR42++v1QmcsBHmcVn2U3FkJNORtmU7F3D4VmfnvfVHv97cQjQA1YieilNpVmo
 QKYTVFm/VjQUjAouobLdpFbRslCDHNQvXxI2IEFc3IJ2bcDEfrYDyW5C9jbat1Klkw
 WQ0gqSfE06zBXSIt1n0Hhx7qLSMMAK/BLBiiqs4au2ZH/gEWyubvnuiHNfwU/P5Rlr
 INReV3WDeOCtVOtf9O0UtSZ3qpYQm/Uq3gaWEz0qPci9udO4kM0Sp9x3Sjj+d4DP1W
 QqWiQ6HKmuOVwuhRxO2R0PCgB1S3PkpLD3xvoiId8L1d+LXAVo+LojUa7Hz2y6TAE2
 kbxowx1sbbcwg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: SOF: Intel: Kconfig: fix SoundWire dependencies
Date: Tue,  3 Aug 2021 23:35:38 +0100
Message-Id: <162802985539.42099.16260972008260947641.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802151628.15291-1-pierre-louis.bossart@linux.intel.com>
References: <20210802151628.15291-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Arnd Bergmann <arnd@arndb.de>, tiwai@suse.de,
 Rander Wang <rander.wang@intel.com>, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, Bard Liao <bard.liao@intel.com>
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

On Mon, 2 Aug 2021 10:16:28 -0500, Pierre-Louis Bossart wrote:
> The previous Kconfig cleanup added simplifications but also introduced
> a new one by moving a boolean to a tristate. This leads to randconfig
> problems.
> 
> This patch moves the select operations in the SOUNDWIRE_LINK_BASELINE
> option. The INTEL_SOUNDWIRE config remains a tristate for backwards
> compatibility with older configurations but is essentially an on/off
> switch.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: Kconfig: fix SoundWire dependencies
      commit: 6b994c554ebc4c065427f510db333081cbd7228d

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
