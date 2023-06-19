Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7F9735FDE
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 00:31:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 667E0847;
	Tue, 20 Jun 2023 00:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 667E0847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687213862;
	bh=H00mx55kuat8LHbKg+m1U0otLiA7SnikJsD1uUzjQeY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c2u3SV3ImPAE4By6RKvbT5WkYJmxTSMfpjyVuh1pvL7iTJZEhB5NW20ooNyziMARz
	 48/Cta5Fj5FI7kpCOEYebj+1fMwZ3llS/wygQBxbLee+hQ5lT8GkZkRh8+aUNqyuca
	 2pd6f/hthA9TCKPL7i6jBzDAHfRL1SfJTeVa6Q/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50E32F8055C; Tue, 20 Jun 2023 00:29:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8FEBF80548;
	Tue, 20 Jun 2023 00:29:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6918EF801D5; Tue, 20 Jun 2023 00:29:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD0C7F80132
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 00:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD0C7F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CnNz6mVM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6854760EA7;
	Mon, 19 Jun 2023 22:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1966C433CA;
	Mon, 19 Jun 2023 22:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687213747;
	bh=H00mx55kuat8LHbKg+m1U0otLiA7SnikJsD1uUzjQeY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CnNz6mVMqm4dIS1eU4ZFW/Lj1epriJPXJzQgcjhAjLLMY9STCAfSL2aqOaZvdbz+4
	 /EYge/j6NomUrA4i70IZ3UcNrsmnHGxVjphVmbuPuetKDtvOMH+EAxZe1qLnyLQKaF
	 ejhq1yZlIkrzlhQpTTe/1yKx16x7sU2u/V86iEfJwRrjbakt8DgNv34i/54d8zl7CD
	 us4GXsjsS5MBCZ2NyiScvuUqGApy1tpElSo+G8kEyYXiBCsGSsCuds20Ibh2okARkK
	 Cte2Q/qilfGHyZCuxah7WRHpRKaBoGLxllOfZnh7ty40pDK4RjeYhtnngeXv0QXPvJ
	 5pEUfGFaNVWpA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 linux-imx@nxp.com, viorel.suman@nxp.com,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230614121509.443926-1-claudiu.beznea@microchip.com>
References: <20230614121509.443926-1-claudiu.beznea@microchip.com>
Subject: Re: [PATCH] ASoC: imx-audmix: check return value of
 devm_kasprintf()
Message-Id: <168721374438.200161.9016810536762850752.b4-ty@kernel.org>
Date: Mon, 19 Jun 2023 23:29:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: H7H7NL4UGWF7KZJMQSPLPECYTJUJNATD
X-Message-ID-Hash: H7H7NL4UGWF7KZJMQSPLPECYTJUJNATD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H7H7NL4UGWF7KZJMQSPLPECYTJUJNATD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 14 Jun 2023 15:15:09 +0300, Claudiu Beznea wrote:
> devm_kasprintf() returns a pointer to dynamically allocated memory.
> Pointer could be NULL in case allocation fails. Check pointer validity.
> Identified with coccinelle (kmerr.cocci script).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-audmix: check return value of devm_kasprintf()
      commit: 2f76e1d6ca524a888d29aafe29f2ad2003857971

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

