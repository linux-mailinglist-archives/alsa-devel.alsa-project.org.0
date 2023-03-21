Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0637F6C3768
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 17:52:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 978C31F4;
	Tue, 21 Mar 2023 17:51:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 978C31F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679417539;
	bh=AbKt52iNEb6SnYQa9HSck3GX1mTBCsjvzSB4fCNRt1Y=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tEX0gpkkPbasD6kIQmv4Gg5u6dbrmfE80Bnhfpbfmro2Q9pjhd8YN0rIInB7Yw8x2
	 WjS9fnl/dE/zz2TIrsqw0b/qN5mGlUhHX3HDTKWxSJ+drVBAlYOlUSVnXHTmUheSp8
	 bJ06CIS7lHXhUbSNJHgHs1XubGa/J1HMFAbgz4AE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB8B9F802E8;
	Tue, 21 Mar 2023 17:51:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FD92F80482; Tue, 21 Mar 2023 17:51:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3F3AF80254
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 17:51:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3F3AF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k0mQmIrm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ABD43B818E5;
	Tue, 21 Mar 2023 16:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2C5C433EF;
	Tue, 21 Mar 2023 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679417463;
	bh=AbKt52iNEb6SnYQa9HSck3GX1mTBCsjvzSB4fCNRt1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k0mQmIrmb6hJNlW1BXbDJDN7Ph0HeBy0tiqlqX6qDCCQtH6KVk6J6IKqtDHGSQilg
	 QBLViDfFi/eUhPcXADNnChTBSXvK53oWdCD3qlYEFUgbNEh08EJ10bCdkxmHp6M2zL
	 szBpfxVMIdELmIQCZqk9Tqd/af+RKWOWevsLbqk+Gab/azeXqchV/lswthRpodkFZg
	 7vU2DY1uj1LNUdFYlZF1NSVMbojBPbntC8ADPKTsX7xSF75smXJOnoCv4bOWK7TQrC
	 i9atCvW/z1Q0MRAPi7MVNw7FOL5weyf2U9qkGye8IVJkukCXKnBgUIcnJ60GLA1kPk
	 /Iz8HXSMXUqsg==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20230320112245.115720-1-rf@opensource.cirrus.com>
References: <20230320112245.115720-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v3 0/8] ASoC: Initial support for Cirrus Logic CS35L56
Message-Id: <167941746163.67241.16095967873543822189.b4-ty@kernel.org>
Date: Tue, 21 Mar 2023 16:51:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: YFFW5T6CYGRVERRTZELVNUBSER643ASX
X-Message-ID-Hash: YFFW5T6CYGRVERRTZELVNUBSER643ASX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YFFW5T6CYGRVERRTZELVNUBSER643ASX/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 20 Mar 2023 11:22:37 +0000, Richard Fitzgerald wrote:
> The CS35L56 is a high-performance boosted mono audio amplifier.
> Supported control interfaces are I2C, SPI or SoundWire.
> Supported audio interfaces are I2S/TDM or SoundWire.
> 
> The CS35L56 has a self-booting firmware in ROM, with the ability
> to patch the firmware and/or apply tunings.
> Patches #1 to #7 add support to cs_dsp and wm_adsp for self-booting
> firmware and the ability to apply a .bin file without having to
> apply a .wmfw.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] firmware: cs_dsp: Introduce no_core_startstop for self-booting DSPs
      commit: 7062e1c727ec99a9c5b40586964304d60a43f240
[2/8] ASoC: wm_adsp: Use no_core_startstop to prevent creating preload control
      commit: 0cd1fd571719e19bd6824a98855382a70e47d932
[3/8] firmware: cs_dsp: Support DSPs that don't require firmware download
      commit: 107c167419e75213e078e4f2468c0f2f55fdd11a
[4/8] ASoC: wm_adsp: Support DSPs that don't require firmware download
      commit: 65a314b7ddc09f6b1bad8decc6670e68d45ef07d
[5/8] ASoC: wm_adsp: Expose the DSP boot work actions as wm_adsp_power_up()
      commit: 11520b87e2232c6e3defed69ec94f0e28fb80f84
[6/8] ASoC: wm_adsp: Add support for loading bin files without wmfw
      commit: 0e7d82cbea8bc0db8ced613aea04da17ac0f0249
[7/8] ASoC: wm_adsp: Simplify the logging of requested firmware files
      commit: 991b1de830f61076b7dc29bec081a4d2e50724cf
[8/8] ASoC: cs35l56: Add driver for Cirrus Logic CS35L56
      commit: e496112529006ce0c2cfe67d1136186e2786d2e8

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

