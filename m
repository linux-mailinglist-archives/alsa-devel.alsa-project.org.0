Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC277506F5
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:49:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47B3FA4A;
	Wed, 12 Jul 2023 13:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47B3FA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689162585;
	bh=KmwlamqPlSfph8KdfjR/gbkiDbd94LmD5FbVEGJevbM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rLNTk6jbZcjNKli68VNem/if71v9qm5ZzoQVExbK+OAzkdlw+54mG/mQEyTKAc9RW
	 bNAC7McvqescMyOsMaWvZwbt6xVu4juEw11Iuoj7zpwm0oWXElBlR27IT5+8+ywTfX
	 o1KvhY8OYWGl8xfyNeypi/A9uZuDzozpCTUYnOzY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A0E3F805C1; Wed, 12 Jul 2023 13:47:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9AD7F805C1;
	Wed, 12 Jul 2023 13:47:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93024F805B1; Wed, 12 Jul 2023 13:46:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8BF4F805AE
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8BF4F805AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Uo6+1utY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DC7BC6178F;
	Wed, 12 Jul 2023 11:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7269C433C8;
	Wed, 12 Jul 2023 11:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162413;
	bh=KmwlamqPlSfph8KdfjR/gbkiDbd94LmD5FbVEGJevbM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Uo6+1utYnsjFmyazMllTs8Sukvnz5rMWWuc592F0DwlSu2N9H+6ZBNER5AFcSIvUb
	 hnEINpBXKGOa4LHJdcJH5/rhifuP9/zdt7dVLrIvYImN8qRk4RqAVFM6aVkmskCGKv
	 md0z+KeC0Mo6tkv3pujE57CuoXENpTPD9yAUFERlrWCncqSC/SjzOW4xiTzjt/9nWw
	 nQIJMQjFHMf19KykH/FWw9il44rHQIIro1+DgaL08PvD/UU4pyD3/7HUSyUQSRdABd
	 keS3mkdmtsyfWAWMzEPf7AU2V934TwgDkjMlfuc2j3ACReTBFJDNR3D45pHRja7lHF
	 6gBCRYIyfrK3Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, zhuning@everest-semi.com,
 amadeuszx.slawinski@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 hdegoede@redhat.com
In-Reply-To: <20230629112449.1755928-1-cezary.rojewski@intel.com>
References: <20230629112449.1755928-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/8] ASoC: Intel: avs: New boards and fixes to existing
 ones
Message-Id: <168916241146.46574.17236718708306500593.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 12:46:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: UGG3GRA5KBR5IPM2HMDLGOFD76JNLXGR
X-Message-ID-Hash: UGG3GRA5KBR5IPM2HMDLGOFD76JNLXGR
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UGG3GRA5KBR5IPM2HMDLGOFD76JNLXGR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 29 Jun 2023 13:24:41 +0200, Cezary Rojewski wrote:
> Series adds support for two boards: es8336 and rt5663. The former is
> utilized by some KBL-based tablets whereas the latter unlocks
> Chromebooks with rt5663 i2c codecs.
> 
> As existing implementation of es8336 (es8316.c) codec driver is not
> prepared to cope with KBL-based platforms, couple of small,
> clock-related changes precede anything avs-driver related.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: codecs: es8316: Add support for 24 MHz MCLK
      commit: be7dc10ab0bc247c2abbdefdaa9d5196df88e9d1
[2/8] ASoC: codecs: es8316: Add support for S24_3LE format
      commit: c30d10aeb398cf71662cb8c6b0090ed9ab38dd8e
[3/8] ASoC: Intel: avs: Add es8336 machine board
      commit: 32e40c8d6ff920354fde36299198c80e7a7d3b76
[4/8] ASoC: Intel: avs: Load es8336 board on KBL-based platforms
      commit: d55bb0f1c1a365c42d8b4032cb965a255692a400
[5/8] ASoC: Intel: avs: Add rt5663 machine board
      commit: 05c5d4e326cc41221a9c065c1e6fee4cdca549b1
[6/8] ASoC: Intel: avs: Load rt5663 board on KBL-based platforms
      commit: 3ed180ac3cec77fe193573adcbaaca34bbc63551
[7/8] ASoC: Intel: avs: rt5682: Add missing components
      commit: 27cd41698de49c8afbcc148a0d76c35da3271519
[8/8] ASoC: Intel: avs: rt5682: Tidy up hw_params()
      commit: 7012fa7d56b7b3e100e4ff0c8d8d7a183f09130d

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

