Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9266117BA
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 18:42:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6BB41A8F;
	Fri, 28 Oct 2022 18:41:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6BB41A8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666975320;
	bh=vpeLcNOegA7q+zFAD+0G+RlqeZZc6DUxMzrzwKKyQvo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YNCqNzw0G/fYdNpixIpjRJmeGTUzev5ENvPyQw13SyAnKlIhWxmbSjAarokM6qfWA
	 NIfmr5N8Bip7hiIYJYR22iOsMOLmbikVYSgYbIjSrSie7pigrVnxO9NrW7tO+x98r1
	 Y+Zb2axEOLLIOCVXPpUTpR+F2HgCV42iG0wnveAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55404F804BD;
	Fri, 28 Oct 2022 18:41:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85F3DF8016A; Fri, 28 Oct 2022 18:41:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FF3DF8016A
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 18:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FF3DF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ADqVjxb9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 32EC6B82B85;
 Fri, 28 Oct 2022 16:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E4EC433D6;
 Fri, 28 Oct 2022 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666975259;
 bh=vpeLcNOegA7q+zFAD+0G+RlqeZZc6DUxMzrzwKKyQvo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ADqVjxb9mfnGVoqCFld5K9WB9hRHE51enZIq47xjJzyaA0N173vy51P9RGn3dCN3e
 3F6TnFhHIC4e9pdV4HRGoEVxQFZt4EFsYy5sAncQWkCzTcu/n/cpHeKK8j44paHkZP
 0A5pP/ZFX3ai1fnN5mLSvfr1SWfbnp83qffjKhv2MmzS6qqHDo52NnXT2xRxMimJoE
 hGW5C5AzMoPGVjQPdo2PN4To8o2dGJ+9kWSRbVQzoji50SfMW90RkILQETihDEIKaP
 5Ws6v78KkhqqRtiRcuLwvkIXT5tgYY5hK0mn+vRWuF9f+R+DTNIgMr3pnBEy0YsQWn
 9CHbuYA9tmTgg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20221027124702.1761002-1-cezary.rojewski@intel.com>
References: <20221027124702.1761002-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v4 0/9] ASoC: Intel: avs: PCM power management
Message-Id: <166697525840.804779.8588300450322893398.b4-ty@kernel.org>
Date: Fri, 28 Oct 2022 17:40:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: hdegoede@redhat.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
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

On Thu, 27 Oct 2022 14:46:53 +0200, Cezary Rojewski wrote:
> Goal of the series is implementation of suspend/resume operations for a
> PCM stream along with all the collaterals connected to the subject.
> 
> Start with splitting avs_dai_fe_hw_free() as ideally we would like to
> reuse as much of existing code as possible but snd_pcm_lib_free_pages()
> is not desired part of the function when speaking of suspend operation.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: Intel: avs: Split pcm pages freeing operation from hw_free()
      commit: 0abfc84ba22aca05a5268128f719386648351020
[2/9] ASoC: Intel: avs: Introduce PCM power management routines
      commit: 2b9a50ea845ebe95473f5b85dfcc9b806c252fac
[3/9] ALSA: hda: Introduce snd_hdac_stream_wait_drsm()
      commit: efffb014478e76c35b1a9e279d7010f70ff517e2
[4/9] ASoC: Intel: avs: Handle SUSPEND and RESUME triggers
      commit: 8e097f9a5529f0e6af30e1fac0d4e2a97c241392
[5/9] ASoC: Intel: avs: Restart instead of resuming HDA capture streams
      commit: eb0699c4cd6e32d5e2bfc9356ab9e19a6164c94e
[6/9] ASoC: Intel: avs: Count low power streams
      commit: 730cb320ec2973fb2aea72ea27f7edc6a847a664
[7/9] ASoC: Intel: avs: Standby power-state support
      commit: d56829e9c1cb90044c07337fe90a9828fdb165c0
[8/9] ASoC: Intel: avs: Power and clock gating policy overriding
      commit: 2a87f17775c1cbcfb99225312e8cc7a06aa109b9
[9/9] ASoC: Intel: avs: Enact power gating policy
      commit: 758ba92f3a2f86493a9147abd31a5bdc0befc273

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
