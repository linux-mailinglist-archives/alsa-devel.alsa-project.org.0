Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF9F54FB1A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 18:31:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5024C1F21;
	Fri, 17 Jun 2022 18:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5024C1F21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655483504;
	bh=37RF6vXxD+QrHf1TXFejX0md9vYNoUUU5wVJL32Ybtc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=szeuxTLfseHQkm1/NRPqJEqzijWCYwTKVRy+dEL2cH2Maadd3tDVNyoWLSAMrO8w3
	 tmHM1p1C1cE6yGY0CxBL29YQAXQNhpDZxVNDmrcSnli0YOftpccWAGHaOAYnRhTN5a
	 z3ApwXeDOaMhlRRV77GWl1XPWc+nYDYY7oGFXWug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38507F8051F;
	Fri, 17 Jun 2022 18:30:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95912F804BC; Fri, 17 Jun 2022 18:30:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B921F804BC
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 18:29:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B921F804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fHZWCnro"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 152E9B82B10;
 Fri, 17 Jun 2022 16:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE7DC3411E;
 Fri, 17 Jun 2022 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655483395;
 bh=37RF6vXxD+QrHf1TXFejX0md9vYNoUUU5wVJL32Ybtc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fHZWCnrostRioI8qJQqZM89Yo4HTK4ZybWo84szEyHnw4asIJwp7Qcpc/DmxAy0zn
 BALYsQdy7TJjLxZZfrr0eCuF/VO95wCkmwbJGYNwZZJkHF0mVmiiBxMEF8BHNh6MYy
 wIgZKItJnJ5SD7yqqJ3hhGz5DqjdrYj1x4wavMC/sptB03sCBU9F/Hny7RZyCcM4/Z
 6f27UwQK68UcB4p+1HsED7Z7T1QZ96nabkrthm2aff7KNNFSJ7RXQ+82KeGz306UIy
 SvzXkameWHuV2RbDHkMCfZe4RCoMjdIm+KMIqnPm1FL+2xb1zD58aN6RGRVpXD8nxv
 YVIvSdxRrh4xw==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
References: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/13] ASoC: SOF/Intel: remove __func__ from dev_dbg()
Message-Id: <165548339423.901499.18321717025583594390.b4-ty@kernel.org>
Date: Fri, 17 Jun 2022 17:29:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, cezary.rojewski@intel.com,
 amadeuszx.slawinski@linux.intel.com
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

On Thu, 16 Jun 2022 16:53:38 -0500, Pierre-Louis Bossart wrote:
> Cleanups suggested by Greg KH during SoundWire reviews, since the
> __func__ information can be added with the dyndbg kernel parameter
> [1].
> 
> The first two patches change the error level in cases where the use of
> dev_dbg() was inconsistent with an aborted programming sequence.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: SOF: Intel: hda-dsp: report error on power-up/down
        commit: 6d5e37b0f343af70a7e824641f264fb140bbead5
[02/13] ASoC: SOF: Intel: hda-stream: report error on stream not opened
        commit: 3abc88730a0e45247296a561a12e811b5d2d2236
[03/13] ASoC: SOF: Intel: hda-dai: remove use of __func__ in dev_dbg
        commit: 18701bb1370cb6b34a8f3ad820045930138083dc
[04/13] ASoC: SOF: Intel: hda-stream: remove use of __func__ in dev_dbg
        commit: 8bf064f8e439d9b92a023a54adc657f920f4e1a8
[05/13] ASoC: SOF: Intel: mtl: remove use of __func__ in dev_dbg
        commit: b837870fe17f21cf80b15d143c9ea0bc6b342741
[06/13] ASoC: SOF: ipc3-dtrace: remove use of __func__ in dev_dbg
        commit: 9fd8fcd03451ea3f04af9a419748248d3fa8fb59
[07/13] ASoC: SOF: ipc3-loader: remove use of __func__ in dev_dbg
        commit: e16809a74f09b2c2e066b3d7cf1d87be2a75911e
[08/13] ASoC: SOF: ipc3-topology: remove use of __func__ in dev_dbg
        commit: f132dc020270976fe83c86f8c826890873023980
[09/13] ASoC: SOF: ipc4-topology remove use of __func__ in dev_dbg
        commit: 3809264b53906b8b666b93831ecc23a00e119b68
[10/13] ASoC: SOF: sof-client: remove use of __func__ in dev_dbg
        commit: 298e3aba1b56d19dcb70e10ffe93057d1ddd18f6
[11/13] ASoC: SOF: ipc4: remove use of __func__ in dev_dbg
        commit: b3ec3eb2baaad057631ab7e09c38ab3ad5c7a42b
[12/13] ASoC: Intel: boards: hda: remove use of __func__ in dev_dbg
        commit: 46bc6bc3a6a3af5306e8e3320a083cf3c32350d4
[13/13] ASoC: Intel: boards: sof_sdw: remove use of __func__ in dev_dbg
        commit: d2d19cb6ed13eb54dd6c958f3808a23820c3ebba

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
