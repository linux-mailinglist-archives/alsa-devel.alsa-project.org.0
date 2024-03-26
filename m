Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E31B88C2EF
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 14:04:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F28542369;
	Tue, 26 Mar 2024 14:03:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F28542369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711458244;
	bh=cSjaZbPLR1fQ/eUfBQ2cemr+zFkzT1K8arROWQiRWLM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aCLqAqtiiEJoRx8YBH3hOH13K5fcjoF7wavHUnb99iijVeMNeyDsCtlwz6p28vMrf
	 bPcY5LPgn121TKS1GWD2QG8XXj+d1uDoLYTvpiPMAbd7Dfb6lCebdfWmHk76+RmD10
	 BXcW+OUwgnvCKqPHGwuHfUuBwoPEtyeIEGAfp7mo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 006F4F805AD; Tue, 26 Mar 2024 14:03:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97BA9F805A8;
	Tue, 26 Mar 2024 14:03:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37B42F8025F; Tue, 26 Mar 2024 14:03:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37441F801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 14:03:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37441F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KzIyiKjk
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9A3A4CE1D80;
	Tue, 26 Mar 2024 13:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E8CC433F1;
	Tue, 26 Mar 2024 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711458189;
	bh=cSjaZbPLR1fQ/eUfBQ2cemr+zFkzT1K8arROWQiRWLM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KzIyiKjkwxNi0/djMaYyBukoVoNYhmHV+htRm5MIBzkySyfWG04sgm966SpB07lal
	 ZtNnXJ6xRvSNp/OaFw9d8EjmJwibbDfWndV1uZfGtk7FcypTAPIU3XRlFizoj6r9kR
	 CI3W9juVVjFVoNFK1r+zpR3IdBMUsLOnwK5usyEkg9BORarr6pcz/Gebyt7c2QER/P
	 E28/3eNEPy+5qI5xCTDkyYvZVVMy+ynMh0ADDVcBhLduoOp+d5EJXy8ydD3jvZ0VX9
	 CqU17LIIXnKZauJtn0WGBQWrBw2URyhy0+5fAPUGtm9y6xedU052GMp5Ek2OZLEU9i
	 taWwzYwmaMr7w==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com
In-Reply-To: <20240326105434.852907-1-ckeepax@opensource.cirrus.com>
References: <20240326105434.852907-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Correct extraction of data pointer in
 suspend/resume
Message-Id: <171145818853.73919.2525513604875844696.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 13:03:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: A7E3ZZ53HEJSZXAK2JXIGMQIIL33RLG4
X-Message-ID-Hash: A7E3ZZ53HEJSZXAK2JXIGMQIIL33RLG4
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A7E3ZZ53HEJSZXAK2JXIGMQIIL33RLG4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 26 Mar 2024 10:54:34 +0000, Charles Keepax wrote:
> The current code is pulling the wrong pointer causing it to disable the
> wrong IRQ. Correct the code to pull the correct cs42l43 core data
> pointer.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Correct extraction of data pointer in suspend/resume
      commit: 56ebbd19c2989f7450341f581e2724a149d0f08e

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

