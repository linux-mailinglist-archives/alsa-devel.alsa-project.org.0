Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB0D4CAB18
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 18:04:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02B441F9D;
	Wed,  2 Mar 2022 18:03:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02B441F9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646240653;
	bh=0XIBIVlUzZNiW/2J+5FrMjaWIJoPwfNBGNfX1p4g7uE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HU4m7ZUigOIPHSai+yKhID4eZiREJoJ2SBn3iusUtxrXJDAMjCpAniIpX+0iwft3c
	 xrlKRvCTgzimAsNnNPiTmapQdel1gg/aSbJ1BasG/B+U2pIxNkAmVsFSQLFUsljzj0
	 UzOwehm2ZuxBWo7kJ+NSGN9dzinc3kgt1ooWqloQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 141C7F80538;
	Wed,  2 Mar 2022 18:01:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 469E6F80537; Wed,  2 Mar 2022 18:01:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 914CAF8052D
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 18:01:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 914CAF8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KuzO4xe8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D3DA618F2;
 Wed,  2 Mar 2022 17:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA8EC340ED;
 Wed,  2 Mar 2022 17:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646240463;
 bh=0XIBIVlUzZNiW/2J+5FrMjaWIJoPwfNBGNfX1p4g7uE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KuzO4xe83teRijjwcU5153XYI8/9bWjyHIfUI0RwU8trrtTNsjRUV4LQT83jV3nCx
 oOOFwU/pIZ+AekJNWJRb+Jaj+sS0IxmKtQuItYIXlXtPTORjLW4ozhkx55Lu7SIa3O
 sndj6x6Bp0i5Ab0C71Jx2lOJFDHKtutWX4Dxsw4OztQ1W4FrEq+RoIPT2Zl/Gzioj8
 Ufa9Tbil37Yl/VQq1OVB2ns7RbrGDj2W3HVIDAz6iO4mg1RE45eRhVkA56Z/7kTLbg
 kAOhmmKMcNh2byOk1RWOpdqVnIoFqPfzkUIdOEU26HEPKKV/4e2hpF2lcHxMjgN9f9
 GH25Ccjt5/BIw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
References: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/8] ASoC: Intel: machine driver updates for 5.18
Message-Id: <164624046291.1145067.12252402808107543597.b4-ty@kernel.org>
Date: Wed, 02 Mar 2022 17:01:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 1 Mar 2022 13:48:55 -0600, Pierre-Louis Bossart wrote:
> Two cleanups to remove an unused filename and typos, and one addition
> of an ACPI matching table for a Dell SoundWire SKU without local
> microphones.
> 
> The main change is the addition of a common 'sof-ssp-amp' machine
> driver for devices with amplifiers only (no headset codec) and
> different connections using I2S links (Bluetooth offload, HDMI
> receiver). It's likely that the amplifier will be swapped out by OEMs,
> this machine driver provides a relatively generic solution to avoid
> copy-paste of similar solutions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: soc-acpi: remove sof_fw_filename
      commit: a6264056b39ee0c478e1d73bfc40f61a8cf3673f
[2/8] ASoC: Intel: boards: fix spelling in comments
      commit: f1eebb3bf707b267bd8ed945d00a81c8ca31bd73
[3/8] ASoC: Intel: add RT1308 I2S machine driver and HDMI-in capture via I2S support.
      commit: da793fb0f56c0a53d0d461d80d9c1936a39afc30
[4/8] ASoC: Intel: boards: create sof-realtek-common module
      commit: e1d5e13324020c4b405e63cae34560c7992bec2e
[5/8] ASoC: Intel: sof_rt1308: move rt1308 code to common module
      commit: 024979b67b392569dde3f9294f9b66651d2c0a93
[6/8] ASoC: Intel: cirrus-common: support cs35l41 amplifier
      commit: 709ec7bec6b34ee136fff4b1b5265baaae7319a3
[7/8] ASoC: Intel: sof_ssp_amp: rename driver and support cs35l41 amplifier
      commit: 2fe14ff61bd6d4fabe313435dd378b5a38eb6102
[8/8] ASoC: Intel: soc-acpi: add entries in ADL match table
      commit: c4dcd7100c26881b1095d5b2651d61190fc5f247

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
