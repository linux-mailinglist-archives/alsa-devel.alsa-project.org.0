Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3327B5A7B
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 20:52:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EEDE868;
	Mon,  2 Oct 2023 20:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EEDE868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696272724;
	bh=D2Ch6QB5+LSN74GAsXtnMHwOYH38o0GTJQkjHu+KEUY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BBxDuu6ADp7Nkp/7XScvGmnDXugszWCusD/uHOvR9upPsvSxzde4jZhWy/LbIkeET
	 I+AG7EJJaXfXU+VpCGlx1gK5jOw6LX46/4s6L9IxDobWplL234Os6CiOhv/3HB0ME1
	 63h4NH+16nD6i+FxIOpikDBVDqlkK8wtZp8+wR0Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E18B5F80310; Mon,  2 Oct 2023 20:51:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 568FFF800C1;
	Mon,  2 Oct 2023 20:51:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69D92F8047D; Mon,  2 Oct 2023 20:51:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F5A9F801EB
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 20:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F5A9F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dToGKMr7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F3C45B81256;
	Mon,  2 Oct 2023 18:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F348C433C7;
	Mon,  2 Oct 2023 18:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696272665;
	bh=D2Ch6QB5+LSN74GAsXtnMHwOYH38o0GTJQkjHu+KEUY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dToGKMr75xfA+w4iupZ0zNYc2qF7+kEP/hVZWSfV8KRhsc/Lrh48nVbEpy1fp9abs
	 RmpxAx1XlSXX5NGEHT7QhlJbkFD4+OLupraY2v4JBEmtU0Ljx7m+haPb7zW/ybOM1B
	 mObpP8YbdtAuYn1VZVQBNrK54JAjkgAz26H3khHL20TwlkxZ2tHbN+j23XXx64XE9i
	 TdwmtAgYNWvAVe2asihI0ptSVzGz3zl9Jq4c9OmwoOb/X86lM0ThCGqsS2XqwE68bg
	 sV9BcOZUKOCgammOfLPRXVfgDPU9Y4DvNtzFtqffsdQSLX9bdAjHQeK/udxkAJyMpw
	 GtK1LSSx+Zx+w==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Antoine Gennart <gennartan@disroot.org>
Cc: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
In-Reply-To: <20230929130117.77661-1-gennartan@disroot.org>
References: <20230929130117.77661-1-gennartan@disroot.org>
Subject: Re: [PATCH] audio: tlv320adc3xxx: BUG: Correct micbias setting
Message-Id: <169627266313.110968.13103747417901977042.b4-ty@kernel.org>
Date: Mon, 02 Oct 2023 19:51:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: PVPEDOU7QQJGACPA3OP456R7MHFXGG7K
X-Message-ID-Hash: PVPEDOU7QQJGACPA3OP456R7MHFXGG7K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PVPEDOU7QQJGACPA3OP456R7MHFXGG7K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 29 Sep 2023 15:01:17 +0200, Antoine Gennart wrote:
> The micbias setting for tlv320adc can also have the value '3' which
> means that the micbias ouput pin is connected to the input pin AVDD.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] audio: tlv320adc3xxx: BUG: Correct micbias setting
      commit: e930bea4124b8a4a47ba4092d99da30099b9242d

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

