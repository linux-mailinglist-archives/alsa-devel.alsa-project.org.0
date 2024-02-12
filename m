Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 835CA850CCB
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 02:56:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC7D9B71;
	Mon, 12 Feb 2024 02:56:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC7D9B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707702974;
	bh=MUKP/22XKAzX/zrzdHCQz7FFA53f79JTWOcoRM6eTTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rRVQNKa7nt/Bx7iSWuwXMzV9OeOa4j4vcSwll+7Y++OhU+nFMttPMomNbiRhpfeWy
	 tlB6NCB7bm0uX21H8tuR1UWf2C5yADPFDstvYMOIjx3iIL5nDwkKIL0BLNoktkwIxm
	 lK7qc5lDFw3sAW2DzO/bsEKUC00K0w8wIwMF5hEc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07FACF8058C; Mon, 12 Feb 2024 02:55:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71466F80570;
	Mon, 12 Feb 2024 02:55:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A451F80238; Mon, 12 Feb 2024 02:55:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C790AF800EE
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 02:55:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C790AF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QNLX7Mhs
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 698C9CE09E8;
	Mon, 12 Feb 2024 01:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF580C433C7;
	Mon, 12 Feb 2024 01:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707702920;
	bh=MUKP/22XKAzX/zrzdHCQz7FFA53f79JTWOcoRM6eTTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QNLX7MhsNJO+lk066YgnoDlj9aVQZTJP5+jE64EWbHNBSUnbyyHIlyJMPwjy6nDkz
	 WnujwYQUakbl1u+1xnW03OIIFlHYW9eJu08dnoElB4s7YCNNGpEHXSjY5hZgevHcYM
	 Se2Qcqe1IP03h8fyUpicxsn8V+uSc2f1T9yoOO522sP6lKlNURwS19iJ3z9sFaWxJp
	 RsX93aP812zaip9+6j/tiQyopiOhD/nyP2CLGm+GouqIWqXdlDNAbBP7xW0BiVmRoS
	 ygYcHknIg2WGBIdlVhr18kGV3iVg570Q6F3OPWELf4bY4dlYex1pNciNJaSfltLzhw
	 tstN7FUiseVdg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org
In-Reply-To: <20240210134400.24913-1-hdegoede@redhat.com>
References: <20240210134400.24913-1-hdegoede@redhat.com>
Subject: Re: [PATCH 6.8 regression fix 0/2] ASoC: Intel: Boards: Fix NULL
 pointer deref in BYT/CHT boards
Message-Id: <170770291834.2485045.3173940349261833255.b4-ty@kernel.org>
Date: Mon, 12 Feb 2024 01:55:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: GM7EI7LTNBZX6I7YF637D4B77TD5KSK5
X-Message-ID-Hash: GM7EI7LTNBZX6I7YF637D4B77TD5KSK5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GM7EI7LTNBZX6I7YF637D4B77TD5KSK5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 10 Feb 2024 14:43:58 +0100, Hans de Goede wrote:
> While testing 6.8 on a Bay Trail device with a ALC5640 codec
> I noticed a regression in 6.8 which causes a NULL pointer deref
> in probe().
> 
> All BYT/CHT Intel machine drivers are affected. Patch 1/2 of
> this series fixes all of them.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: Boards: Fix NULL pointer deref in BYT/CHT boards
      commit: 7d99a70b65951108d82e1618c67abe69c3ed7720
[2/2] ASoC: Intel: cht_bsw_rt5645: Cleanup codec_name handling
      commit: 930375d34de67e129566caca008de0bbc54a4646

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

