Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0134980F171
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Dec 2023 16:47:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 684B7A4D;
	Tue, 12 Dec 2023 16:46:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 684B7A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702396025;
	bh=5F3Szy7Vru4H5gp6BMOhKGQvhNadpwCGT0QE2NaOr6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B4RMHFkSXpL3y8oV5dyi68TswKT/WPImnEqcFrdoQ/tlRK0f3X+XLx5Z2vvSMP1xv
	 os2MXIUXFj01+fGAzP7Bi3DL1UzKKtCkatLwwKFBXOe4t+fuqF8SWUwFiSHuAECsQ4
	 1G+kq1hrzvz8dTmvDoNemKRb/zmCWvExY020Dpsk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94129F80564; Tue, 12 Dec 2023 16:46:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5A35F80571;
	Tue, 12 Dec 2023 16:46:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AD52F8016E; Tue, 12 Dec 2023 16:46:35 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8937AF80114
	for <alsa-devel@alsa-project.org>; Tue, 12 Dec 2023 16:46:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8937AF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HarOdR+h
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CEB4D617EA;
	Tue, 12 Dec 2023 15:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0E7C433C8;
	Tue, 12 Dec 2023 15:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702395987;
	bh=5F3Szy7Vru4H5gp6BMOhKGQvhNadpwCGT0QE2NaOr6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HarOdR+h6hS+T5yBSjP/oWADUN4zEVS7R8+npDunEAyKLxNu4hOaMu6qA3J8Mzj0Q
	 /NeBtEVWtJrygfPfJ9MsmJx+W+IudU82wYvnv93zWlnJS1Gn9bx8MUsszr8bxZbMIo
	 S5YKKq4oEmFxVOjvmJQnZF0NgsTua6LzaKMWRIZ1a5Oh54qMRjTg3u+WHVSClyLgFz
	 vmWGDTtG1l/YoBDifGQG/KSOwvRoSHD0QqhAUp3tWFVbaXCIeBhTIvcvmF2pqDMLk8
	 m84QP471OZzQJ7XYS/WB3euFXBeFMrWI3y+kIhsEn3GXUTqkKap9vxMqNkJN1a2mqk
	 IzTkvd6XczRDQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, sfr@canb.auug.org.au, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com
In-Reply-To: <20231212104149.2388753-1-ckeepax@opensource.cirrus.com>
References: <20231212104149.2388753-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Add missing statics for hp_ilimit
 functions
Message-Id: <170239598597.81213.6525470428849908001.b4-ty@kernel.org>
Date: Tue, 12 Dec 2023 15:46:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: ANR5G7OZQN4LL2DR7EPDALR7Z5WO7UHV
X-Message-ID-Hash: ANR5G7OZQN4LL2DR7EPDALR7Z5WO7UHV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ANR5G7OZQN4LL2DR7EPDALR7Z5WO7UHV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 12 Dec 2023 10:41:49 +0000, Charles Keepax wrote:
> 


Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Add missing statics for hp_ilimit functions
      commit: 5ed06e489d20dca141047bdb025d885306ea66da

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

