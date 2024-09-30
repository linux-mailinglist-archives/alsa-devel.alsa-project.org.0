Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6A398AEFD
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 23:27:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 411161948;
	Mon, 30 Sep 2024 23:27:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 411161948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727731639;
	bh=RfVPHxKFXcGvZ0OmSWbuVCPPPo2Dn19eVh+WgxOgr5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C6KmEO9Q0BBYyApOiIvFStc7ey65rRzyCCAaQFMWnurS5Avms2lg31mRlZOyUeRFd
	 +m0vEvo1D380LZHcKuWB46Up9LGhPE3Q/wKwyqb6Sym0NyB78UTBMNDbh9omh3Vpa2
	 sVguX6fIhwKJ3+Juazcgy7X0cyl3F0ROlXDkawjo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 072A3F805AD; Mon, 30 Sep 2024 23:26:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 030DCF805A0;
	Mon, 30 Sep 2024 23:26:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66F1BF80517; Mon, 30 Sep 2024 23:26:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2991CF80074
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 23:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2991CF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KTCtfsfv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9CD955C4D4C;
	Mon, 30 Sep 2024 21:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE488C4CEDE;
	Mon, 30 Sep 2024 21:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727731594;
	bh=RfVPHxKFXcGvZ0OmSWbuVCPPPo2Dn19eVh+WgxOgr5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KTCtfsfva7qEn4KXuuQtdLFVv+fbd8igFX/p4rdQvlCo8d/k0UXzhknY8VNuy/56O
	 GyZ2TbIeck30bYpzQX/8vdLR/cdb4oQcgOnixUY9IoHAn91Y0H34zSq+Hbg3kX1XQ0
	 3nySRqYCZhRaedxIOYbqEwMpnJAZIspSbXi2iO9/zh9lJYzZGxCJ86fmifUO5vbi0l
	 5pG14Ffrk9XxJJv3aclv/oAVImlh+/NoyZyG0Hev0uZsTnjp+MY5UR892LpdLBAP2c
	 Vf2TFbN6QU2wV4Mcqj5YW24/fjwtG1TX2ghW+rStfpkf6OOXTLVqSWbxmlZ1jSGVzT
	 yxkCTsF9sCJnA==
From: Mark Brown <broonie@kernel.org>
To: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 Tang Bin <tangbin@cmss.chinamobile.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240914072352.2997-1-tangbin@cmss.chinamobile.com>
References: <20240914072352.2997-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: tas2781: Fix redundant parameter assignment
Message-Id: <172773159263.2197048.9891700729426809736.b4-ty@kernel.org>
Date: Mon, 30 Sep 2024 22:26:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: JDIGYCNFF74OC4GBVN2DJIKRMWUKYWKS
X-Message-ID-Hash: JDIGYCNFF74OC4GBVN2DJIKRMWUKYWKS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDIGYCNFF74OC4GBVN2DJIKRMWUKYWKS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 14 Sep 2024 15:23:52 +0800, Tang Bin wrote:
> In these functions, the variable 'rc' is redundant,
> thus remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Fix redundant parameter assignment
      commit: ecdaf9140528bc2ef37f2d663fbaf690a64bb125

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

