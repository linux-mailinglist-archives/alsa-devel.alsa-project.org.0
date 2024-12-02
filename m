Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF909E0A88
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 18:59:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 374E52119;
	Mon,  2 Dec 2024 18:58:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 374E52119
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733162349;
	bh=F465A/xcZjT1ItJy7jDm7anDbaAiluIiWyeLm2UOUdg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dFzGtjP4cPS/pdv+DZfomHA2JWm0KW63csnNWcAdTgfZrwWcBvnhUqBoC6vWeY7KD
	 b0doO4DsgoDo58l/rh8aPNAl30hOWjuxJNOMi1jDII/JEA/vUwl65VZRAVBObsX4nd
	 Em/Xhr87Q+2d1oNE4FoqIPX+5tD6d7tVxoJyTIwU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5022F805B2; Mon,  2 Dec 2024 18:58:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EFF0F805B3;
	Mon,  2 Dec 2024 18:58:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF1AFF80272; Mon,  2 Dec 2024 18:58:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEA8BF800E9
	for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2024 18:58:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEA8BF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H4JUVMeL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A5C6CA411D0;
	Mon,  2 Dec 2024 17:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0976C4CED1;
	Mon,  2 Dec 2024 17:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733162308;
	bh=F465A/xcZjT1ItJy7jDm7anDbaAiluIiWyeLm2UOUdg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H4JUVMeLkl+pUS/DGUjmL8of6HYpsZjQT7lxVRHBv1qu8VsuMsfSdspLtK4th6qY6
	 rtYMYk03s4J2Hv9fxhq0NlfnwwwLRst2dfIJxbguYB2WZ9Y+e0dcYU+2EHKRUp3aKC
	 KxNoHYX7Oq1e2iDycXPtkilrJN90/T4WiOjX/q1pWxi42EMie5hoDAv61gaQaT/hpS
	 GcsxyE0k0oqgt2eziNivGEjcMM4KBXYVsl/8zorHJQ9LAVuYxlntomYxsFTt/alV5z
	 S1918De6+WAoicame2ROkV11NP8mmrNoshH2WxpGYfuWaHiXjjvSue/k5J4HPLnp3d
	 qp5W6osXudIMQ==
From: Mark Brown <broonie@kernel.org>
To: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, perex@perex.cz,
 tiwai@suse.com, lgirdwood@gmail.com,
 Tang Bin <tangbin@cmss.chinamobile.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20241025082042.2872-1-tangbin@cmss.chinamobile.com>
References: <20241025082042.2872-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: tas2781: Fix redundant logical jump
Message-Id: <173316230670.189181.879023337858247511.b4-ty@kernel.org>
Date: Mon, 02 Dec 2024 17:58:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: JFIKS5ASSRQOPEBWI6LQR7NMV2SCPFM7
X-Message-ID-Hash: JFIKS5ASSRQOPEBWI6LQR7NMV2SCPFM7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JFIKS5ASSRQOPEBWI6LQR7NMV2SCPFM7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 25 Oct 2024 16:20:42 +0800, Tang Bin wrote:
> In these functions, some logical jump of "goto" and variable
> are redundant, thus remove them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Fix redundant logical jump
      commit: dc9f2312acaee205609ad3c8b5f064e39eab1d6b

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

