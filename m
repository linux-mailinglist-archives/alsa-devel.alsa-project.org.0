Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD13B7B369B
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 17:23:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4DA1DEB;
	Fri, 29 Sep 2023 17:22:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4DA1DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696000983;
	bh=cRITPcSOZCDpOlOAYPtEtv+wUjewiatWysnCmQpHZdo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dq08jsVvZSCX2oBsL09FdrrMD273rFpgobXXTru2vePgeqTOGitpRmw7YENG8uJmP
	 JGPQMUF/ixDtBiAOa/TLuzCWqT+EG7PkcCjX7GO0y5rjbUr7bvQZ6OfN4jPEa9a36B
	 raFa2JvSvAE9tIhHR6zJtUS1o1IEJEYCmv5xtfms=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56637F800AE; Fri, 29 Sep 2023 17:22:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C2B1F8016A;
	Fri, 29 Sep 2023 17:22:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB4AEF801D5; Fri, 29 Sep 2023 17:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73360F8007C
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 17:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73360F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GDJW6lgp
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BCB2961E5F;
	Fri, 29 Sep 2023 15:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706ABC433C8;
	Fri, 29 Sep 2023 15:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696000913;
	bh=cRITPcSOZCDpOlOAYPtEtv+wUjewiatWysnCmQpHZdo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GDJW6lgp7tjawISSVcPjtQu8ifTb53tlLs3yg/gFtEVoIGhSbrv+uOeV/g0xofEzS
	 YgK91w5b2TEIQj4JMrFOjU4/esJRz/OkEcsIKyeYiPJRtayFWy2hivpRib9u3MbC6T
	 WO/3tPosBxpbSkTv85CfBOPNNpXdIpfAhUjuBfKaOgPtIJeS8SItyYAfr6tRJrGv8g
	 X7k6/wi3w5Ht5NuyduESSiCCvwOWpAnjgzTAm4kRLKDSOBNNYPNYnoBkT255GZtTJK
	 xW4cTLCL0MQWVDxEb6MhQJgvnfUxPmird5wcBySYTi4HmrgIgE28ed/IUJspPTwpU+
	 RjEfbuSVbMU4g==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org
In-Reply-To: <20230929112436.787058-1-amadeuszx.slawinski@linux.intel.com>
References: <20230929112436.787058-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: Intel: avs: QoL fixes
Message-Id: <169600091218.2899821.6351532599212308129.b4-ty@kernel.org>
Date: Fri, 29 Sep 2023 17:21:52 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 6IQZYTT637YEEM4NF66EW6AWTBLD5XOB
X-Message-ID-Hash: 6IQZYTT637YEEM4NF66EW6AWTBLD5XOB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6IQZYTT637YEEM4NF66EW6AWTBLD5XOB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 29 Sep 2023 13:24:30 +0200, Amadeusz Sławiński wrote:
> Set of fixes mainly cleaning up code, but also correcting some minor HW
> assumptions.
> 
> Amadeusz Sławiński (2):
>   ASoC: Intel: avs: Use generic size defines
>   ASoC: Intel: avs: Preallocate memory for module configuration
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: Intel: avs: Move IPC error messages one level down
      commit: 26033ae6bd896d89aac4a3194ceb5dc673ce9214
[2/6] ASoC: Intel: avs: Use generic size defines
      commit: 7eb878e768fd952739a03bf4bbd021496a818eb9
[3/6] ASoC: Intel: avs: Preallocate memory for module configuration
      commit: 28a21cb26425797910b4d7ab0cad0d377d4a004c
[4/6] ASoC: Intel: avs: Keep module refcount up when gathering traces
      commit: 0a5fb3cc28fda52c761775db2ccb7ccb954aee2a
[5/6] ASoC: Intel: avs: Disable DSP before loading basefw
      commit: a5e6ea01265e9ed9ab8511907ebbc82552cd2e9e
[6/6] ASoC: Intel: avs: Drop superfluous stream decoupling
      commit: b87b8f43afd5f7afd3920532942f5e9ea028d955

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

