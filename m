Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6721376A424
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 00:27:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26E9F83A;
	Tue,  1 Aug 2023 00:27:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26E9F83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690842477;
	bh=DW2FSU6rnV9IwJAsh4AWzYblSNvh3mL6+fIG/bCh92c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R1MPGO0/HYOeWy01oqNCvy43VwVoleMJL31QZB4OefeiuxEvqq+bgxVrODcDTI5b7
	 dlS7J2Fj9/su9YTc7dSDJvHBTx9vPFUJBSy2yH8WAuPm15K/zz4XV1JFmHoDEJmkGQ
	 2RyBFxFqtLry0AO2VW9fv0JoGmCYxR3Wk6hNpqvg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 548B5F80087; Tue,  1 Aug 2023 00:26:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90006F8016D;
	Tue,  1 Aug 2023 00:26:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2833BF8025A; Tue,  1 Aug 2023 00:26:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D6B0F80087
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 00:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D6B0F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q259eM5U
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A5872611BC;
	Mon, 31 Jul 2023 22:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A506EC433C8;
	Mon, 31 Jul 2023 22:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690842389;
	bh=DW2FSU6rnV9IwJAsh4AWzYblSNvh3mL6+fIG/bCh92c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Q259eM5ULCYIk1AxPMqc7RRJValHMgWsU2rV99DZJFrNNbEDZ8xDWdt50WUxukXE7
	 ucJcQjO99VsjlyIFAi6nLGB9QyxDBIVvMGyQkRpxPas2AsA3fQ59tUAhNHr9D8b9Sw
	 YJ5FV0aq2UlwqPk61w4Hn+qHiluFn7RM4Oma9pXFgMAqt6xAGD7hK88mrYUCwnPufd
	 GGN+2S7zydtaczE4HN4hEtLvgIVHX/PjY0PepDf8cZuz7plCUpliJi9FYCWdkwoCIk
	 AOEU6OrHkI0W4aEAdoVFNZI3iRUxYhvyhcbRUGxWwbaZ2igPQhwlrkHnJv3avh3+9V
	 Xk19kGEJc0VmA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230731-asoc-wm8960-clk-v1-0-69f9ffa2b10a@kernel.org>
References: <20230731-asoc-wm8960-clk-v1-0-69f9ffa2b10a@kernel.org>
Subject: Re: [PATCH 0/2] ASoC: wm8960: Clocking tweaks
Message-Id: <169084238738.576259.9856984284848931512.b4-ty@kernel.org>
Date: Mon, 31 Jul 2023 23:26:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: VYLIOHRI2CAVAI24ED46QEUCTDQR6NNK
X-Message-ID-Hash: VYLIOHRI2CAVAI24ED46QEUCTDQR6NNK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VYLIOHRI2CAVAI24ED46QEUCTDQR6NNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 31 Jul 2023 11:47:01 +0100, Mark Brown wrote:
> A couple of minor clocking improvements that make the wm8960 driver work
> a bit better with generic cards.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: wm8960: Read initial MCLK rate from clock API
      commit: 0169cc3f200cbd737a57592fc478b24ff3cec3c5
[2/2] ASoC: wm8960: Make automatic the default clocking mode
      commit: 2bbc2df46e67be1a26b9c2b18a581b83e17ccb19

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

