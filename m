Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD53D9246F2
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2024 20:05:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D59E11926;
	Tue,  2 Jul 2024 20:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D59E11926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719943510;
	bh=Er855fFtE0tkTlrfhmXtCi5qQalirVV6oBWt2PpMAcU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qhKMB/ao+YEz+qi23uGRjTlZa8a54YwvSvfGazTidd1BEsQlZ5BzaGdFV/aPFCj51
	 bwuV7Vm6BVNaaUJ037ZlnHAN1OOoqhKSVOSPEiiGIXhX+1O2DZeJaoyYwEbQlN1fQa
	 JaOfjwfcYFkM82kxViKnKEtcRY0dTFBf71/jZq9g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1A48F805D7; Tue,  2 Jul 2024 20:04:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 360EBF805C2;
	Tue,  2 Jul 2024 20:04:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCF82F80272; Tue,  2 Jul 2024 20:03:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6334F800FA
	for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2024 20:03:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6334F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qSBsnTtv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D25A61F3F;
	Tue,  2 Jul 2024 18:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C287C4AF07;
	Tue,  2 Jul 2024 18:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719943402;
	bh=Er855fFtE0tkTlrfhmXtCi5qQalirVV6oBWt2PpMAcU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qSBsnTtv333Tg5/uNsOrIT8MBev3AQVNEGGM7Kfk7qXhandVtK+zgy5oWN/zz0cMn
	 AKjOn2xJrkow1BcvWdm0q7YXxEQZclaGrlw8UvLNbYNvJZyzOJ6MzcdbdBzaPvo0i0
	 VI64DGTw7ccbUG2lxgwnPLqiWvsIinNLRF9z7EuqVJwMwk89RxK18UTEUm5n/VrTJ6
	 DjUmqM1wuqVpN9fYl1eMFOIKJKZqEPxI/pPP0B8HS2ePcbneeaXeCynK3pDqXXigmr
	 AU617yqWTTqi6AfUd79xrw/tZB1boPoB3cMBgRR568j4I5y5ZjPEIjKNTagkuVdgtn
	 wpKdDNQy5etGA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240702110809.16836-1-rf@opensource.cirrus.com>
References: <20240702110809.16836-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Don't allow writes to read-only
 controls
Message-Id: <171994340097.996226.8732396451392780066.b4-ty@kernel.org>
Date: Tue, 02 Jul 2024 19:03:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: A353YJEI5APZ4QEAY4K55WUFUKYVSR6U
X-Message-ID-Hash: A353YJEI5APZ4QEAY4K55WUFUKYVSR6U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A353YJEI5APZ4QEAY4K55WUFUKYVSR6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 02 Jul 2024 12:08:09 +0100, Richard Fitzgerald wrote:
> Add a check to cs_dsp_coeff_write_ctrl() to abort if the control
> is not writeable.
> 
> The cs_dsp code originated as an ASoC driver (wm_adsp) where all
> controls were exported as ALSA controls. It relied on ALSA to
> enforce the read-only permission. Now that the code has been
> separated from ALSA/ASoC it must perform its own permission check.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Don't allow writes to read-only controls
      commit: 62412a9357b16a4e39dc582deb2e2a682b92524c

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

