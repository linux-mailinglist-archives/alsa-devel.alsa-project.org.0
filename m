Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8857A2CF2
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 03:15:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A518BE8B;
	Sat, 16 Sep 2023 03:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A518BE8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694826928;
	bh=ZnjlEj98hFQQmsZsTmFla9uF/838RJCPiORahjtKy74=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ScCr69haSfVAF/io6eflher3RJbqh8jrNNPQVRmr4WMHNTrCCoH3Mq/QGKUk27oyD
	 Bei+bc9lhaGgR/An34nhiYohnF1DgmkpgjiH/GEOhCnYcN+WL0flKprPXVkWzOWDKU
	 /UIbR+9y+4rNfKKsi8/S6UxHnH2ALJyuFAnnHyf8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B05EF805E9; Sat, 16 Sep 2023 03:12:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDE74F805E9;
	Sat, 16 Sep 2023 03:12:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A7A9F805B5; Sat, 16 Sep 2023 03:11:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFA8BF805B1
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 03:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFA8BF805B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S1xHpqLC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A7338CE2E51;
	Sat, 16 Sep 2023 01:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65F9C433C7;
	Sat, 16 Sep 2023 01:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694826711;
	bh=ZnjlEj98hFQQmsZsTmFla9uF/838RJCPiORahjtKy74=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S1xHpqLC9Y6gq/hRVu7xdsKfo68I57/FOw56qL1IGwQSfvbdXnCWtUz+ehokB0+My
	 jvKHh+pZn1aVBvYCTh83loYxt2qb03bZ1DXgPCX2ardp+4/O/NjMiC8Bc06+n5ipr2
	 KF19K4TwWEoZ/7HcCoJNCI9MohDz3gQNwiQGrAHdJuTsrWH0sVBX5vkqrU+KhLgJnT
	 Q3n9YYbVWkIH8zXsI2a/jlxc2R+m1DU+J6lpLSOjjYiXdSam9M5YhvRWqhQESZSloi
	 2mNMMdcofFGlS1LGu45bcBc5T+tIKzeCpsEZm9348OO1umyO4m29VbAKhlFrq8ZUHn
	 4oAHxCAufaElg==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230915092639.31074-1-colin.i.king@gmail.com>
References: <20230915092639.31074-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: cs42l43: make const array controls static
Message-Id: <169482670859.606223.14038286756818345691.b4-ty@kernel.org>
Date: Sat, 16 Sep 2023 02:11:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: E4DQNMZI2JZTEYUFD3CKBWPBYIWPBHM4
X-Message-ID-Hash: E4DQNMZI2JZTEYUFD3CKBWPBYIWPBHM4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E4DQNMZI2JZTEYUFD3CKBWPBYIWPBHM4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Sep 2023 10:26:39 +0100, Colin Ian King wrote:
> Don't populate the const array controls on the stack, instead make it
> static.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: make const array controls static
      commit: 9dc098e3d7297ec895436a799f5faf27d430674c

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

