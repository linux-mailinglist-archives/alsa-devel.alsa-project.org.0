Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B04875124F4
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 00:04:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B2A6852;
	Thu, 28 Apr 2022 00:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B2A6852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651097058;
	bh=3VTVy7BD7HhwARhisohD9wMc13WwJ0bC1kJP5Yjvv6A=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fxjCBwEG8n3GeiW0fA408RafoLtFRwvHNPRUUZWreICSCx9NOlICVRw5yL57YnrDG
	 Fbqi/ZbOOhuGGHznBotkT2BO5n89KGWu923KKxpu//5kMn1tsYqcJEShSlwc9pDjxU
	 XLWfThnX0Qc1kcKPKC7PNss1UvNPJcayeEyG7pHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F76BF80152;
	Thu, 28 Apr 2022 00:02:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92D7EF80256; Thu, 28 Apr 2022 00:02:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAB8FF80152
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 00:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAB8FF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ukW6pGJl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 79B8B61E12;
 Wed, 27 Apr 2022 22:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2590C385AA;
 Wed, 27 Apr 2022 22:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651096958;
 bh=3VTVy7BD7HhwARhisohD9wMc13WwJ0bC1kJP5Yjvv6A=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ukW6pGJlG+mVz8z1ujb6fqX5UMuk00Fp1Y+JAk0s7Oe4cTLh16adVhO07YPlMB1Nh
 DmNgaUp2/bY4Bz3REYfdwTNKsYr77/Sv5hMcNnb9AycvBvHcAadXSTEdA9dUAeALr1
 NrquHai+rYMP+ZgQk2JwBcdT6U/IS4GE+0WU6BmSYtJRVAjAjxXkY6mfI6VdDYv8Y+
 L/xDzF8YnY+M9ruPcE3rwNhewbY95xKrCoQrmvecY5SeJRyTNd20v4aKIV+KKkt/RE
 YUQLshLQU2DNzibWNRNYVa2H+vBCy9IPhS/nQZFJu+MOo3vuaMKSyaj6waAcgaj6aE
 u+CxIHq7HjJXA==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220426184106.102636-1-pierre-louis.bossart@linux.intel.com>
References: <20220426184106.102636-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: use pm_runtime_resume_and_get()
Message-Id: <165109695770.498174.4051368408785191728.b4-ty@kernel.org>
Date: Wed, 27 Apr 2022 23:02:37 +0100
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

On Tue, 26 Apr 2022 13:41:02 -0500, Pierre-Louis Bossart wrote:
> simplify code pattern as recommended by Mark Brown.
> 
> Pierre-Louis Bossart (4):
>   ASoC: SOF: control: use pm_runtime_resume_and_get()
>   ASoC: SOF: debug: use pm_runtime_resume_and_get()
>   ASoC: SOF: sof-client-ipc-flood-test: use pm_runtime_resume_and_get()
>   ASoC: SOF: sof-client-ipc-msg-injector: use
>     pm_runtime_resume_and_get()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: control: use pm_runtime_resume_and_get()
      commit: bf0736e5d4644eb9238a1136625e09126721d2e3
[2/4] ASoC: SOF: debug: use pm_runtime_resume_and_get()
      commit: c106f46e83fd15c34cfa0a68e8218f5cb4844dd3
[4/4] ASoC: SOF: sof-client-ipc-msg-injector: use pm_runtime_resume_and_get()
      commit: 02885dd831c043d4804dfc1d2942f2f4ec5fdc18

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
