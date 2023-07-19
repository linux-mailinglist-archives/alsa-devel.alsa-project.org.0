Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FAC759797
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 15:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A73C8206;
	Wed, 19 Jul 2023 15:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A73C8206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689775182;
	bh=6EqqPlvUm4w74hGx/td7RmKuKuRXkvgKw9pk67+i0Eo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aNOvtrmNp3e9Y8r964PytQhw51iL5vU7o3oUvCyvKnadxRY4Kb/OMSA5JEWWcUOdT
	 HiWl6dk8oWstGpNUOHVOOpJJoXsnNfXy9pPL99VNsotwPtR4a3aZs8gfEFIFRrlEM1
	 5Wxna3PJlwG0xB2K5MOpXUoZlgBjalu9kKIAXSPc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CADDF80544; Wed, 19 Jul 2023 15:58:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 257AAF80548;
	Wed, 19 Jul 2023 15:58:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F9F8F8047D; Wed, 19 Jul 2023 15:57:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C0F0F8032D
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 15:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C0F0F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mbVe8bEf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2D3861701;
	Wed, 19 Jul 2023 13:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C198C433C7;
	Wed, 19 Jul 2023 13:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689775073;
	bh=6EqqPlvUm4w74hGx/td7RmKuKuRXkvgKw9pk67+i0Eo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mbVe8bEfqNVrj9LhIVOTgsQve++885iGHPISLraKQwjlDob2WWiSqt5hq/2DtoQdU
	 pQHwknuLrJ7Eecvt2hMei1P7Ypzme09DJrs/Y8oxuBQ06PWmFLgFw2m27+K2vs8cNG
	 wZ8XdvOQ02YF4sAXAQAngVCbuHqpDjQCSdzxBhywbBIHR6efRwfa5lqS20s8Xh84sR
	 UfRX5yb/9AIT92VQoxCVS8ixsf+0rRgg+0sLz7CemaADhpOCTu8p3afPx6Ahikrawg
	 O3KslBCF+fwbYSag0CI5EnW5UcVdpFfMTL+ItdRRUCF/5OKUX10T0pYWy+kjG/h5Xe
	 UcDam1P5cgM6A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
In-Reply-To: 
 <20230718-asoc-topology-kunit-enable-v2-0-0ee11e662b92@kernel.org>
References: <20230718-asoc-topology-kunit-enable-v2-0-0ee11e662b92@kernel.org>
Subject: Re: [PATCH v2 0/5] ASoC: Improve coverage in default KUnit runs
Message-Id: <168977506884.48720.5534147934351936674.b4-ty@kernel.org>
Date: Wed, 19 Jul 2023 14:57:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: ISS6NHTOUVXNMZQ7WBHPVI5T7QNX2IXJ
X-Message-ID-Hash: ISS6NHTOUVXNMZQ7WBHPVI5T7QNX2IXJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ISS6NHTOUVXNMZQ7WBHPVI5T7QNX2IXJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Jul 2023 01:28:41 +0100, Mark Brown wrote:
> We have some KUnit tests for ASoC but they're not being run as much as
> they should be since ASoC isn't enabled in the configs used by default
> with KUnit and in the case of the topology tests there is no way to
> enable them without enabling drivers that use them.  This series
> provides a Kconfig option which KUnit can use directly rather than worry
> about drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] driver core: Provide stubs for !IOMEM builds
      commit: da7c07b1083809888c82522e74370f962fb7685e
[2/5] platform: Provide stubs for !HAS_IOMEM builds
      commit: a0c74f6c9ea9cebd7a8f38142bf87e7c12c2905d
[3/5] ALSA: Enable build with UML
      commit: 512d092d78823f9813f4af38090b33c454137a4c
[4/5] kunit: Enable ASoC in all_tests.config
      commit: 5aaa4024e14f8b878a348338a74b4c97bc2478b1
[5/5] ASoC: topology: Add explicit build option
      commit: b7dc237ef8b0897f5750a738d2c57469909a6a15

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

