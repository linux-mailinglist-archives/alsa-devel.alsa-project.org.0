Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8636A04496
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2025 16:32:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A677F6037E;
	Tue,  7 Jan 2025 16:32:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A677F6037E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736263968;
	bh=rmppKVmlM5jQDxLcaabRhJHMM/jp6NqK9tcqaoFB7yg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XvIcZDF0KuaK/G77Ka3IoCyGXRc79WAyg7bKyRR+FHXpVRnpXw+DmX1vZOUsrdVyx
	 c9BbW1CWyxJbAMDHQrfZd+1JAajV0SzQem8qvnRYeiqztADMTw275Z0vJuxE1viFSJ
	 Nw2SX8+cgAQz4qtBsW/2mS5tMxYdSNwj6ADnXQU4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E45B6F805C0; Tue,  7 Jan 2025 16:32:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99BEAF805BA;
	Tue,  7 Jan 2025 16:32:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35CC7F80423; Tue,  7 Jan 2025 16:32:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E49DCF80086
	for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2025 16:32:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E49DCF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Tc3eH96F
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D5665C42BC;
	Tue,  7 Jan 2025 15:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C63C4CEDE;
	Tue,  7 Jan 2025 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736263922;
	bh=rmppKVmlM5jQDxLcaabRhJHMM/jp6NqK9tcqaoFB7yg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Tc3eH96Fk8BoTvx//RzwMjRur49I/EK+4dtswoLTBS+bzAsFpZtcmXoic/D8Db2eY
	 JYMr5DAa/Zj1m7fo0azlhMdo+NdpHEpTFHcx/sqb8kN7+5selJcyybxp1iqQNxNXmM
	 88oUVVxO/6OtO67Kn1QX+Gsa2CYtjcC81lvwRMgVvRLU+andTGDUsQQfhkMtRR5Sxf
	 56wpca/kTboMSsrKK4B9QGQo6r1HniyyxHyOCCbb6AM2tTrsIdZyXTkpbwll7M9a1P
	 yFFI8O1NVQziScEHExrxBElRCrBEfF2AHknDuFUMow2m5RQhWmqNd2bxx4QX7Nzl7A
	 uAG490NFreNBg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Marian Postevca <posteuca@mutex.one>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20241227202751.244954-1-posteuca@mutex.one>
References: <20241227202751.244954-1-posteuca@mutex.one>
Subject: Re: [PATCH RESEND] ASoC: codecs: es8316: Fix HW rate calculation
 for 48Mhz MCLK
Message-Id: <173626392060.92253.14506796479428762280.b4-ty@kernel.org>
Date: Tue, 07 Jan 2025 15:32:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
Message-ID-Hash: NK3OPR7JZKCYUUJ3JZD74SAMSDS3RAMG
X-Message-ID-Hash: NK3OPR7JZKCYUUJ3JZD74SAMSDS3RAMG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NK3OPR7JZKCYUUJ3JZD74SAMSDS3RAMG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 27 Dec 2024 22:27:51 +0200, Marian Postevca wrote:
> For 48Mhz MCLK systems the calculation of the HW rate is broken,
> and will not produce even one sane rate. Since es83xx supports
> the option to halve MCLK, calculate also rates with MCLK/2.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: es8316: Fix HW rate calculation for 48Mhz MCLK
      commit: 85c9ac7a56f731ecd59317c822cb6295464444cc

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

