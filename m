Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EC070F53F
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 13:29:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5E5F206;
	Wed, 24 May 2023 13:28:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5E5F206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684927759;
	bh=lEERwyoUcstq6rJVbG1zvefRvh8OPRxnWhDbydxtCfw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O4fYXl7kg1fB9gVCfVoxmA0WLYuJpfLNQ3WglJ1RfzCiBUOweTlnBI1VrBbd7vA6X
	 kb0rHVjccYJ+BYcZIgl6j+VGTTWeQ+lorc8kyQ8t18uMb2rYpudOMJZ9aoffee9k2d
	 Xq1OEFqRpcSQMp4el+w3rhqPtBpQ1HgS5JmGTuYc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C840EF80249; Wed, 24 May 2023 13:28:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BB21F8016A;
	Wed, 24 May 2023 13:28:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDA71F8024E; Wed, 24 May 2023 13:28:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0F39F80086
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 13:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0F39F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oVe0N9qw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC49C63163;
	Wed, 24 May 2023 11:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9104DC433EF;
	Wed, 24 May 2023 11:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684927692;
	bh=lEERwyoUcstq6rJVbG1zvefRvh8OPRxnWhDbydxtCfw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oVe0N9qwwyfroM4hTkC+7avZPqmgaIn5OU1RVM66CR1GKBIEL30cfPMmC10Ap0Yyk
	 XSlrPIONc5x4NH+Xo/VaNXH6vAZrFovMkjoaQVumnZ/Q45h7rFoBcKrugZr9XY+SC8
	 SZuZv/qtxdN3cY4pPKovio3BjH9Xmx0MuDesXrM2k4iip69hSZycKfja09dV9Taxxc
	 C4oE+vzZ4X86vB6efvGE/TPRlz9zqpQ+B+CGOvtdYg/tnFVi8XMvk+lvVFjRYqxIvQ
	 bsyUWFNGASd/Qsro11KYQhG+DKcazZ42tflfm2rXysGna0J1garnZlTfvrVN/chhL3
	 M+hgySyKcl5ng==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org
In-Reply-To: <20230523154605.4284-1-srinivas.kandagatla@linaro.org>
References: <20230523154605.4284-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: wsa883x: do not set can_multi_write
 flag
Message-Id: <168492769030.49784.4719862081052299023.b4-ty@kernel.org>
Date: Wed, 24 May 2023 12:28:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: LT33SU2PDLE5WQ7UVZQDLNZBDL3SGSAJ
X-Message-ID-Hash: LT33SU2PDLE5WQ7UVZQDLNZBDL3SGSAJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LT33SU2PDLE5WQ7UVZQDLNZBDL3SGSAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 23 May 2023 16:46:04 +0100, Srinivas Kandagatla wrote:
> regmap-sdw does not support multi register writes, so there is
> no point in setting this flag. This also leads to incorrect
> programming of WSA codecs with regmap_multi_reg_write() call.
> 
> This invalid configuration should have been rejected by regmap-sdw.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: wsa883x: do not set can_multi_write flag
      commit: 40ba0411074485e2cf1bf8ee0f3db27bdff88394
[2/2] ASoC: codecs: wsa881x: do not set can_multi_write flag
      commit: 6e7a6d4797ef521c0762914610ed682e102b9d36

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

