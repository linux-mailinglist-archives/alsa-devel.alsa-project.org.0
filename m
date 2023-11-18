Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 581CE7EFC9C
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Nov 2023 01:34:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AA39950;
	Sat, 18 Nov 2023 01:33:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AA39950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700267688;
	bh=J/goLqTyDEI22Ut/pwCL/UNJNymwPHdELhT+G8VnytQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m8wg+Ln1SUJnk7JtrPAFjLRhbOUELSBW77yRwDVjTXe71KnKYTTGt1EXrMlmx8yd9
	 ppsWuUm9vmE4EGRM3BEWPcLo6tczZbPN2eSSKWMurFI2AS5lsBNX2aUaoowUNGACjd
	 qhr+NMpsLm9UdZKZej/oMWA8NrdM7UBmtywhAEyw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92291F80249; Sat, 18 Nov 2023 01:33:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42CF8F8016E;
	Sat, 18 Nov 2023 01:33:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25D09F801D5; Sat, 18 Nov 2023 01:33:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE7CBF800ED
	for <alsa-devel@alsa-project.org>; Sat, 18 Nov 2023 01:32:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE7CBF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GPiqFDYA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 287D8CE25D0;
	Sat, 18 Nov 2023 00:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCAEC433C7;
	Sat, 18 Nov 2023 00:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700267573;
	bh=J/goLqTyDEI22Ut/pwCL/UNJNymwPHdELhT+G8VnytQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GPiqFDYAW0CqmUbyqiFkERP5VRvZBQF7q5NignjIU5v0FN4+iof5qOgc05JmE+cl9
	 +b0/ebkAsyeEP+mG//lbtrLx1ima9e8uvV4JTCjJPaWRMBcr9Ma40PfulYWWzmOn+F
	 ypf1cE3rHxNFxJ2Cx4aMTtFDLe6c6ERUFrYUtRVmiea/+XXP4HcpqRGQsKTOifPsR6
	 yVkyTaj4MHY/qQbsa5PdDmjn0657lzyp+mb4prD7g7oDxcTL2xLtkg+IpFlxDiE5ve
	 sjOG1kW9oMOcbwqgNeiTEuCEUPuokojpuug6rlHiLA6TFoRZWiFydSc+voUB14Z5nN
	 THDZFWY+NWsyw==
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231117141344.64320-1-mstrozek@opensource.cirrus.com>
References: <20231117141344.64320-1-mstrozek@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 0/7] ASoC: cs43130: Fixes and improvements
Message-Id: <170026757145.1646674.10200174783594509637.b4-ty@kernel.org>
Date: Sat, 18 Nov 2023 00:32:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: MDPH33PSIQSLN23HOBM3FXNQQAD5EY5N
X-Message-ID-Hash: MDPH33PSIQSLN23HOBM3FXNQQAD5EY5N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MDPH33PSIQSLN23HOBM3FXNQQAD5EY5N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 17 Nov 2023 14:13:37 +0000, Maciej Strozek wrote:
> This patchset aims to add minor fixes (first two patches) and
> introduce general improvements to the driver (rest of the patches)
> 
> Maciej Strozek (7):
>   ASoC: cs43130: Fix the position of const qualifier
>   ASoC: cs43130: Fix incorrect frame delay configuration
>   ASoC: cs43130: Allow configuration of bit clock and frame inversion
>   ASoC: cs43130: Store device in private struct and use it more
>     consistently
>   ASoC: cs43130: Add handling of ACPI
>   ASoC: cs43130: Allow driver to work without IRQ thread
>   ASoC:cs43130: Add switch to control normal and alt hp inputs
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: cs43130: Fix the position of const qualifier
      commit: e7f289a59e76a5890a57bc27b198f69f175f75d9
[2/7] ASoC: cs43130: Fix incorrect frame delay configuration
      commit: aa7e8e5e4011571022dc06e4d7a2f108feb53d1a
[3/7] ASoC: cs43130: Allow configuration of bit clock and frame inversion
      (no commit info)
[4/7] ASoC: cs43130: Store device in private struct and use it more consistently
      commit: 552206add94dd7977bad32c37eba16e23756a0f9
[5/7] ASoC: cs43130: Add handling of ACPI
      commit: ce7944b73e7729dc702b6741cff2b26886bb723c
[7/7] ASoC:cs43130: Add switch to control normal and alt hp inputs
      commit: 9158221bf2aa5f7bfb916452c079b2fe63ca76e8

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

