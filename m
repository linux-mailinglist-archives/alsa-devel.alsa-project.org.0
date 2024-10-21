Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E86A09A9231
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 23:39:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DF0AB70;
	Mon, 21 Oct 2024 23:39:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DF0AB70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729546785;
	bh=B0KKRH8HOU33LivcqwGcmlZ9cxEPL+NmEn6pp5H5jcA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N+19faVRdx1C+8NbTQ76A4SnMSzfIm/mxEGb8jTYP1WHFilVw0qPEJ6fAR3oPMoGx
	 nY9CaRqtukWavl6o2gzAalvN7cRHbfgLpiuxKHVkvSzt5zemSJOrvnW1lLCdQngFQp
	 QUYPdVx+iBucQK4PyAQ2iA+3sgMiN3z1cpkHf+p4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C89F8F805BD; Mon, 21 Oct 2024 23:39:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2DCAF805B0;
	Mon, 21 Oct 2024 23:39:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0C1BF8016C; Mon, 21 Oct 2024 23:39:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D15EBF8014C
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 23:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D15EBF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Mp9F3qia
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B81E65C4C10;
	Mon, 21 Oct 2024 21:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671BBC4CEC3;
	Mon, 21 Oct 2024 21:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729546740;
	bh=B0KKRH8HOU33LivcqwGcmlZ9cxEPL+NmEn6pp5H5jcA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Mp9F3qiafs8LS+w7Qjw1bgSxNWo9AM3/Ux3iUsS46ZLU6TFU6s67heHnAbITlMuHH
	 qJOueR2v37OtEA8BAwnsPyQ1Yxid8kNCMwwUaHFsIdk8fbe7ZyGn5X3GDpzxDW2azx
	 GN4LBGa9HGvU7C4Zw5RYUPL2SAH9n0rADMdbDVsrTC+hgsw3RVciEQGukpHGMpjRo6
	 //E+5qDb8YPWztO6cBZg81eEazaZIApE7wlNAORjCK5T0+uc1n7wtMecFgFInfB28C
	 DjERXfpHyyJwFRSzklYkWrvTuqUbevwH6ygeqCr5SZc7+UH4frY1BiSiWk54yvp8fZ
	 gwbc/vN2gKOsA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <cd26275d9fc54374a18dc016755cb72d@realtek.com>
References: <cd26275d9fc54374a18dc016755cb72d@realtek.com>
Subject: Re: [PATCH] ASoC: rt722-sdca: increase clk_stop_timeout to fix
 clock stop issue
Message-Id: <172954673816.144868.3043462366415424049.b4-ty@kernel.org>
Date: Mon, 21 Oct 2024 22:38:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: B26X45BYERK37Z2TAFQBDATD4L7A4C6J
X-Message-ID-Hash: B26X45BYERK37Z2TAFQBDATD4L7A4C6J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B26X45BYERK37Z2TAFQBDATD4L7A4C6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 21 Oct 2024 06:15:44 +0000, Jack Yu wrote:
> clk_stop_timeout should be increased to 900ms to fix clock stop issue.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt722-sdca: increase clk_stop_timeout to fix clock stop issue
      commit: 038fa6ddf5d22694f61ff7a7a53c8887c6b08c45

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

