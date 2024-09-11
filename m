Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 761A89757DF
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 18:03:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F74FB70;
	Wed, 11 Sep 2024 18:03:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F74FB70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726070616;
	bh=CkGJc0b0X6zqDALs7FLOySvP17G4aTD64zilKSbV7LI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AKkyarssjH636d+8eDQC/eTHOBhpVTEW4bbBuNrQqLrFlWBcy6+6/r63CpkwAElrz
	 6E86Y13D+7CUphQQw8DV9oDSvtQim5tLOJ/LgFCgEfmCqkFXtDeXtPzsKUnBoLKCrj
	 riEDwpC24ON9GYxA+D6FREwU5SZsUYAz6cb64AU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 219E0F805D9; Wed, 11 Sep 2024 18:02:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B509F805D9;
	Wed, 11 Sep 2024 18:02:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37E65F801F5; Wed, 11 Sep 2024 18:02:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69D20F80107
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 18:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69D20F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=josjBkr5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BD035C0756;
	Wed, 11 Sep 2024 16:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08369C4CEC0;
	Wed, 11 Sep 2024 16:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726070566;
	bh=CkGJc0b0X6zqDALs7FLOySvP17G4aTD64zilKSbV7LI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=josjBkr5qnkyctiBzWFJaMcf9muNS9pRLhpzWMG4VBmqrB7AQ+cGx5JpGZOtJIzSV
	 4E4wslQ6Jwd/3yCyoU4AyR1eNbb6wHFdd1Ws+JscdMWZqcbBftOzixHKUejCuA6XYD
	 wQTv6OCKPMc0ZpVm9JVCmqJ3/x+ahCu/MRTv1m2syTPSZbrzdeIQX/76m+QoiqYIVI
	 pxb46e7Inc2bUkY4dP+oJBU2wn6ozLGM1CzXcg3ZkrFjncYJ9XxjEY5N96iVDvtpqr
	 oo8Y63OnITgN0BZQFpiQxbBxYxM2pgjy0+bEUiaXFfHCbRTfPqK0nDc1m2UlpOsc/i
	 W4yeGGm2k4ZYg==
From: Mark Brown <broonie@kernel.org>
To: herve.codina@bootlin.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, nathan@kernel.org, ndesaulniers@google.com,
 morbo@google.com, justinstitt@google.com, Su Hui <suhui@nfschina.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240911115448.277828-1-suhui@nfschina.com>
References: <20240911115448.277828-1-suhui@nfschina.com>
Subject: Re: [PATCH] ASoC: codecs: avoid possible garbage value in
 peb2466_reg_read()
Message-Id: <172607056375.105227.14107234534010047644.b4-ty@kernel.org>
Date: Wed, 11 Sep 2024 17:02:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: WERB6OWRGRDOZKBYBYPFYR4QI7AAJD5X
X-Message-ID-Hash: WERB6OWRGRDOZKBYBYPFYR4QI7AAJD5X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WERB6OWRGRDOZKBYBYPFYR4QI7AAJD5X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 11 Sep 2024 19:54:50 +0800, Su Hui wrote:
> Clang static checker (scan-build) warning:
> sound/soc/codecs/peb2466.c:232:8:
> Assigned value is garbage or undefined [core.uninitialized.Assign]
>   232 |                 *val = tmp;
>       |                      ^ ~~~
> 
> When peb2466_read_byte() fails, 'tmp' will have a garbage value.
> Add a judgemnet to avoid this problem.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: avoid possible garbage value in peb2466_reg_read()
      commit: 38cc0334baabc5baf08a1db753de521e016c0432

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

