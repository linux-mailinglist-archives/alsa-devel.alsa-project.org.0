Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F84E98C4E6
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 19:55:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A812883E;
	Tue,  1 Oct 2024 19:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A812883E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727805327;
	bh=zFUAfX1xGLKWPqysQ2DsF4JQETrYOAYztxgnX54f+SU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LQu21i2us96KnlVtiRV3XgZ7jQV1ojFlOWI957OGpOMKNK6ZpvjjAGAEKvx+pSsUQ
	 gRKuEA5oQt1m+k2ZuxSMJj4UqHNTDOGyghLCMLs2FzxXlEBQiN6SUm7paPUSgO6KYH
	 khqARRjZtjYEbxR/Jwz2/GtUVzBCVdhj7nFBPkdk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B115F80687; Tue,  1 Oct 2024 19:53:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAC2DF8059F;
	Tue,  1 Oct 2024 19:53:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D96D0F8063E; Tue,  1 Oct 2024 19:53:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0EEAF80620
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 19:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0EEAF80620
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BtTa7fc5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B6D3A41879;
	Tue,  1 Oct 2024 17:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249B9C4CECD;
	Tue,  1 Oct 2024 17:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727805207;
	bh=zFUAfX1xGLKWPqysQ2DsF4JQETrYOAYztxgnX54f+SU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=BtTa7fc5dYV7KmtWiwKcr/Gn5pqBlFp2RlGzO/sBQcWTRxSwnOL/1nFaQPu0bGQYa
	 fRyrtywXMXiY32M9yj5/ZJamVKXInQm3iPrSUPkzjDltkBUaxMkkG/jSesFL1c8Qqb
	 Au3Y9+9vqxi/1NkBe5jqUSmtJKKxUrs7pVsUCPAr5L6nGdgP5G0VQh7QUdu1dF/mQW
	 +KFOJhXVYWU5Am/F2QZSTwgh2goWTcLYZXJaq8BuPQCCwV9b5n7lQjLACvknMYEdJu
	 CO/9ssjkRPPcp09yrwntnriRrEcAymTysK0Ef3zqUnvLjs7jOZx6gpDoBpXWicNkjD
	 ejNW3L3AfbqaA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
References: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/3] ASoC: fsl_micfil: fix and improvement
Message-Id: <172780520382.2298697.5976871562900019910.b4-ty@kernel.org>
Date: Tue, 01 Oct 2024 18:53:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: 4FLUYUXZRBUCGJLU3YXZ5IFFVKKH3QWM
X-Message-ID-Hash: 4FLUYUXZRBUCGJLU3YXZ5IFFVKKH3QWM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4FLUYUXZRBUCGJLU3YXZ5IFFVKKH3QWM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 27 Sep 2024 16:00:28 +0800, Shengjiu Wang wrote:
> Fix the usage of regmap_write_bits().
> Move mclk clock enablement to late stage.
> Enable the micfil error interrupt.
> 
> Shengjiu Wang (3):
>   ASoC: fsl_micfil: fix regmap_write_bits usage
>   ASoC: fsl_micfil: Add mclk enable flag
>   ASoC: fsl_micfil: Enable micfil error interrupt
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: fsl_micfil: fix regmap_write_bits usage
      commit: 06df673d20230afb0e383e39235a4fa8b9a62464
[2/3] ASoC: fsl_micfil: Add mclk enable flag
      commit: b47024dc624bcffb89d238f4a5b490363cea2a1e
[3/3] ASoC: fsl_micfil: Enable micfil error interrupt
      commit: cc3ae21f360bfa375fc3539e24e7adb0e643a9d4

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

