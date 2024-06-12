Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6169059AB
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 19:10:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC8A4846;
	Wed, 12 Jun 2024 19:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC8A4846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718212250;
	bh=DGmFEgFvihFdxQvmqz4ZN/g91RcvtXzAkLA+2ZHUehY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lC5IEi6pTgdnVd187yyxuIBLnNUxKFWfxjrcalm0hOkI3r+it822DJwZFCqjqnm0f
	 q1zWs7NibXZGLlPXfZv34E4RCSHmifpHPROtVY0qsxWvgJdqM9UtASp9AWZMmpubzj
	 xziiH81U35sUwud4/njTiJZajjI5PJIkxN6AsMwI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4946F805D4; Wed, 12 Jun 2024 19:09:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2557F805D4;
	Wed, 12 Jun 2024 19:09:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4842F805C3; Wed, 12 Jun 2024 19:09:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61349F805AF
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 19:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61349F805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H3imqW9P
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7049961506;
	Wed, 12 Jun 2024 17:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6637C4AF50;
	Wed, 12 Jun 2024 17:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718212186;
	bh=DGmFEgFvihFdxQvmqz4ZN/g91RcvtXzAkLA+2ZHUehY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H3imqW9P9XFmNrDHk+S9fa3HMBPc+kiQkeLKEYY0m6mMSuBI2SfsSvZajyPgwuNqt
	 gdQaDe0xbfV//r/N8nCEr3xqfS4iRKYXnxzCVQQaYmcPbOfQKS6akzpDM0ZjE0o5Sw
	 77jmlq2g+nt60kE7/Patsnt/EX5yv1z6garTA4ANCEclPRAc6koezf6MhkmfP3diHP
	 knyz+pQBCFnFbfTFG4Dsz2UMP1X1to0NXk3cPmJeNou5vz6KWOZjNDxsxdocp1CesD
	 lokZHcEyumHIj19KDodY4Ub/3/Bnz0qNW/BFW9kyPiQWuc8lERjGLmvYBKjp0Rdg8+
	 uKH0TgCyCw6ng==
From: Mark Brown <broonie@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
In-Reply-To: <01590109-cf27-404b-88ff-b42bb73ca1c6@moroto.mountain>
References: <01590109-cf27-404b-88ff-b42bb73ca1c6@moroto.mountain>
Subject: Re: [PATCH] ASoC: samsung: midas_wm1811: Fix error code in probe()
Message-Id: <171821218296.232443.6293513321320642950.b4-ty@kernel.org>
Date: Wed, 12 Jun 2024 18:09:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-4c370
Message-ID-Hash: G6OLJ5OZHUPFZD5W6UXJTTAI232M2IHS
X-Message-ID-Hash: G6OLJ5OZHUPFZD5W6UXJTTAI232M2IHS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G6OLJ5OZHUPFZD5W6UXJTTAI232M2IHS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 08 Jun 2024 17:24:31 +0300, Dan Carpenter wrote:
> This accidentally returns success instead of -EINVAL.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: midas_wm1811: Fix error code in probe()
      commit: 5c33876a20e1f42471c2b6fd1804428311d35f1f

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

