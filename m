Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B90FF78012B
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 00:39:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCEB2AE9;
	Fri, 18 Aug 2023 00:39:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCEB2AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692311994;
	bh=qWfV56R0PVlrS4R0MOhkjYKRzK8tVLuWZmIeuWnuzmw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EbJRNoiGWPi/Aqkq22JVySgQqHWfCyeVCsu4/5SgLmBlwIohlBccAoM0j2peYcrf6
	 Vl/UzxB9UsFb4YaZ1q2iOMmInPyX0WfPaKLbOeiaSUl6kv5kMGmLiBVMXN3Y2pDYZe
	 Ufao7BQX5FFxSuif79cO1BZ+VB8SSAGX8owgdnOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D866F805CB; Fri, 18 Aug 2023 00:36:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EBF7F805C0;
	Fri, 18 Aug 2023 00:36:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F84EF80568; Fri, 18 Aug 2023 00:36:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A883FF80568
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 00:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A883FF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=an5NmK/y
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4EA6764030;
	Thu, 17 Aug 2023 22:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495DBC433C7;
	Thu, 17 Aug 2023 22:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692311800;
	bh=qWfV56R0PVlrS4R0MOhkjYKRzK8tVLuWZmIeuWnuzmw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=an5NmK/yUSCbvsoCfBbn2vxil/14n9kdx57w7WOOlEaMe/HOzelDKWdYhOia16ba/
	 gkXw66rfF53aj7rUAd4NM2VozC4Dpjctyk5nS11lsVOas8er2lH/fMjpbnbgY9lSr0
	 SlkljMKs09KOn2ScSVm101G6TiR0ZecdYfEEmLsjJ/os7QhV4lN6GMNnlzB2vH6HKz
	 5EogZBEFNaBxb3nxPD1hfaK5Mu3dTYVXeRJPExar5WDcA+FLh41H5v629U414r0Z8e
	 OvRnYG1QJebeQJOUMQAEqPcgnSWaSN+LCSknj4nPkQVoavUghUs5ywEVEZvkRA9dkQ
	 MI4t0c6N+V0Vw==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230817-descriptors-asoc-rt-v2-0-02fa2ca3e5b0@linaro.org>
References: <20230817-descriptors-asoc-rt-v2-0-02fa2ca3e5b0@linaro.org>
Subject: Re: [PATCH v2 0/5] ASoC: Convert remaining Realtek codecs to GPIO
 descriptors
Message-Id: <169231179901.153247.7284114933332973208.b4-ty@kernel.org>
Date: Thu, 17 Aug 2023 23:36:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: ZUERZ5GIZGE3XQ6N7LNOFNLVT57MV43V
X-Message-ID-Hash: ZUERZ5GIZGE3XQ6N7LNOFNLVT57MV43V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZUERZ5GIZGE3XQ6N7LNOFNLVT57MV43V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 17 Aug 2023 16:03:16 +0200, Linus Walleij wrote:
> After dropping unused headers a few Realtek devices
> actually using the GPIO descriptors remain.
> 
> Converting them to use optional GPIO descriptors is
> pretty straight-forward.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: rt5640: Convert to just use GPIO descriptors
      commit: a9b5f21073c0c687068f17e23385ec43fc643b08
[2/5] ASoC: rt5665: Convert to use GPIO descriptors
      commit: 647a3c4c33cd2c3902cdc07c50f3129166d715f5
[3/5] ASoC: rt5668: Convert to use GPIO descriptors
      commit: ab2a5d17064436585807f2ece5e6b4b03769a11f
[4/5] ASoC: rt5682: Convert to use GPIO descriptors
      commit: ed11701751d43fb2318c625e65e0507b5234f8a5
[5/5] ASoC: rt5682s: Convert to use GPIO descriptors
      commit: 8793bee716452e5e2f9bf085fbe01f9e3d1e659f

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

