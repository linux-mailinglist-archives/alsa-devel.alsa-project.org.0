Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 648E98B79BA
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 16:33:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14057E82;
	Tue, 30 Apr 2024 16:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14057E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714487588;
	bh=rAZcmLCKs6C3ZgBBEHG7AWSAjm/WmGO8airtDzp/QGk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RPL2cE7FAvWxhU1hndjY/ZryWRdM7zDV2zHfawKn60mebFjfKWAXqtzDpLNobQzSi
	 HHJZz17gY8tfDSyNSmp8OucDqCnOET9fyk15lheRyXF1Dl1PB1jI63oWxCbSGawYy9
	 poH8tSrYMTKg3nREaJ/LblqVfb8le3cs8CIEUQrU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25B52F80605; Tue, 30 Apr 2024 16:31:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEB0BF80614;
	Tue, 30 Apr 2024 16:31:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97EEDF8057A; Tue, 30 Apr 2024 16:31:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13DF1F8025D
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 16:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13DF1F8025D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WDLYhQNv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C0E9CCE013B;
	Tue, 30 Apr 2024 14:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBF9C4AF1D;
	Tue, 30 Apr 2024 14:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714487496;
	bh=rAZcmLCKs6C3ZgBBEHG7AWSAjm/WmGO8airtDzp/QGk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WDLYhQNvf2fu44bGta60FeP2ltWuqBq25yIETMyjyaRLOf0R0dBo3EkBFcjSGYYKl
	 sjZHjwCmwL7y2zunGhlRgrA9L5PD5yGRwBQqpFpI0vHYcw9dPrilRXDxHSYRLIty6M
	 eCPTh+REpLaMHnsPNucEPeSLJHfiIEWNdTywAgPYi35Sjx53lK+SPmmwpCqgnFhmED
	 UMuniQnAz5+7tCJD4m4bl3JH73h9+muxvPBhRwEo2Z87PWvoZuoQkNUTrHeGO6AUCy
	 w7wf01nrJILxMHp4lPHq9Nw0VvUv3q5YxFeMRvpT0rBg5jawK3SQT+RrjnZgabGkc4
	 EaNnnu/rqisow==
From: Mark Brown <broonie@kernel.org>
To: Ban Tao <fengzheng923@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Joao Schim <joao@schimsalabim.eu>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240429194920.1596257-1-joao@schimsalabim.eu>
References: <20240429194920.1596257-1-joao@schimsalabim.eu>
Subject: Re: [PATCH v2] ASoC: sunxi: DMIC: Add controls for adjusting the
 mic gains
Message-Id: <171448749392.1870439.1399491803158865203.b4-ty@kernel.org>
Date: Tue, 30 Apr 2024 23:31:33 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: RBSILO3DOCU6GQ2EDDV5FQLTHHOX3F3J
X-Message-ID-Hash: RBSILO3DOCU6GQ2EDDV5FQLTHHOX3F3J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RBSILO3DOCU6GQ2EDDV5FQLTHHOX3F3J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 Apr 2024 21:49:20 +0200, Joao Schim wrote:
> The AllWinner H6 and later SoCs that sport a DMIC block contain a set of registers to control
> the gain (left + right) of each of the four supported channels.
> 
> Add ASoC controls for changing each of the stereo channel gains using alsamixer and alike
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sunxi: DMIC: Add controls for adjusting the mic gains
      commit: 9a8cadddd9303ae15d1d518c4f2ddf00ee668729

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

