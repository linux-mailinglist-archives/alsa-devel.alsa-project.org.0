Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ECD689C67
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 15:58:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE697823;
	Fri,  3 Feb 2023 15:57:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE697823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675436314;
	bh=0esXNRdz1LITyce3Po30mtH5bicSbH0BxNc5ZfhkZlI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Swrmc9Bcw+8fXwB+YJQ3S66Z+CpFHQzDmiE685bLGxMQA+X/qoaVXneqiHgCXEe+G
	 jqo7I0B3yAOktcR93MpnrP75+fCB5mgrjpvVH8SS4YW4z8wgwC5RndNEJ2omWZUpE4
	 KY3/lVUb8nLlCoOUrRGlLzFVniMC6kUYulUvOQro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32F3AF8055A;
	Fri,  3 Feb 2023 15:56:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D5E4F8045D; Fri,  3 Feb 2023 15:56:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7C39F8047D;
 Fri,  3 Feb 2023 15:56:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7C39F8047D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LFVrAEnV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 727CBB82AEA;
 Fri,  3 Feb 2023 14:56:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A618FC4339B;
 Fri,  3 Feb 2023 14:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675436171;
 bh=0esXNRdz1LITyce3Po30mtH5bicSbH0BxNc5ZfhkZlI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LFVrAEnVB/id308L965VYGcEQITfC2CyM8wtYN+3D1j+G+AEDHA9+nig6TTGRDKNM
 EFhd7Sl5WumjD6bzNO2mdjhqvDOrcYm/ZkZsIgDIenXBpk0k/1T8AAveGiy8098Wmx
 ME1iRksR/FvHcLtFCazp02X0bc4MvC7tcyG7XtafaylZBQM1FPq4ikCuZfLItZn0ia
 o2kg+R57/Oa4YXeL4qr70hOSnyfvf/DmvPc1x/ZOxhXJmSGH4UNLXiMw9C0SFx6tab
 WcBz2SLHLS0od9HSO19QSZr4Bsi1jM0QXTM0WDZ3cIt6Hg12zwmLc0XUFASaUmkbZu
 xlNMxEHLdvwtw==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20230202102247.806749-1-arnd@kernel.org>
References: <20230202102247.806749-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: SOF: fix intel-soundwire link failure
Message-Id: <167543616838.928818.16684996806941827936.b4-ty@kernel.org>
Date: Fri, 03 Feb 2023 14:56:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 02 Feb 2023 11:22:30 +0100, Arnd Bergmann wrote:
> My randconfig build setup ran into a rare build failure with
> 
> CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE=y
> CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE=m
> CONFIG_SOUNDWIRE=y
> CONFIG_SOUNDWIRE_INTEL=m
> CONFIG_SND_SOC_SOF_HDA=y
> CONFIG_SND_SOC_SOF_INTEL_TGL=y
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: fix intel-soundwire link failure
      commit: c5a61db9bf897494fb0657eeb24dfdcb1aab1fc4

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

