Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AB48ABDFC
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Apr 2024 03:05:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21BB8DF8;
	Sun, 21 Apr 2024 03:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21BB8DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713661558;
	bh=xUIt8QunbZ1fuNrSmdIMkIBH7+mTjqMkriWFaVUvmPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=opq7w8zO/6jzIBEq/cpLqbsmqYDjRwZBhLx4s5vXvemSswkuOlftWYPRhFk6FmhNf
	 v3q70GuM9Znk0JqtU87qDyFTypxooLyWL3AftzELTfByD7IML+2WnuQTbshjU6gdPa
	 uXeilCdli7Pl+X73sy4Yei0piD11LG7gMi3iaoVk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12888F805C7; Sun, 21 Apr 2024 03:05:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9886EF805C7;
	Sun, 21 Apr 2024 03:05:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A463FF802E8; Sun, 21 Apr 2024 03:03:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5625BF8003A
	for <alsa-devel@alsa-project.org>; Sun, 21 Apr 2024 03:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5625BF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DTlinpGL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E8C0FCE0104;
	Sun, 21 Apr 2024 01:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844C3C113CC;
	Sun, 21 Apr 2024 01:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713661395;
	bh=xUIt8QunbZ1fuNrSmdIMkIBH7+mTjqMkriWFaVUvmPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DTlinpGLbEtPgsQQw1398sBovebALKqjt0mxlSKdiF1X/n94a+ZO9D/e+EBjPQOIw
	 RbofoXTKe02dpklanETsV3VbziQNJ2MVoJi6KYtLtP4fgyVED0OVd7RaTlerzvHaaw
	 5rX5gPVVtpNfM4v4/Spig+VQbYXEDH5FOwaXt5u8pUkXwkaZt3NQdTlqUIQaTWeMOJ
	 9X4pg5Cwa9GIiuSS8dcFROuaRydb7VHvUsAajkHF3w8yiwETtVm1evoLx2mBrvyP9s
	 E9KKnIYnyO+8krFcgT4QmoVtxSWdaTzw9R8/hEldgfZVsckXYDJP+DYfbYFOXzXxKn
	 p9aFFIihalktQ==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, steev@kali.org,
 jenneron@postmarketos.org
In-Reply-To: <20240419140012.91384-1-srinivas.kandagatla@linaro.org>
References: <20240419140012.91384-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: wsa881x: set clk_stop_mode1 flag
Message-Id: <171366139341.1739626.17364130148301852244.b4-ty@kernel.org>
Date: Sun, 21 Apr 2024 10:03:13 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: HAVY2ZBQTES2YX23NZTZ2FAOHBWNFADX
X-Message-ID-Hash: HAVY2ZBQTES2YX23NZTZ2FAOHBWNFADX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HAVY2ZBQTES2YX23NZTZ2FAOHBWNFADX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 Apr 2024 15:00:12 +0100, srinivas.kandagatla@linaro.org wrote:
> WSA881x codecs do not retain the state while clock is stopped, so mark
> this with clk_stop_mode1 flag.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wsa881x: set clk_stop_mode1 flag
      commit: 32ac501957e5f68fe0e4bf88fb4db75cfb8f6566

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

