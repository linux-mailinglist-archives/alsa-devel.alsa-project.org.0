Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B3C83744C
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 21:46:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59B3C82C;
	Mon, 22 Jan 2024 21:45:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59B3C82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705956360;
	bh=pcmQCWSJ7Hn4aUv4ouaZQqEO5FRMjYPHna+YeTWwauw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qxzx0rLbzfw+KCAg7pEFaFzBqTMpgZJlNZtYGnqHrFA2jNVZ8KwYK25ISy7kmxU1L
	 XTlxNw15J5xo5rFREgM8MBcKGt53rJrzHPKXaT7FNZUmmkA/EiSZyTNAlayucw72Xq
	 n9UMmLXbvbxBqrnc4hr2g1D9BFr9iUK/3lD/TISw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90E30F8061A; Mon, 22 Jan 2024 21:44:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66069F805C9;
	Mon, 22 Jan 2024 21:44:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CE01F805AF; Mon, 22 Jan 2024 21:44:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55FF7F8025F
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 21:44:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55FF7F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dRNP+FyK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AD5E2CE2CE4;
	Mon, 22 Jan 2024 20:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291FFC43394;
	Mon, 22 Jan 2024 20:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705956270;
	bh=pcmQCWSJ7Hn4aUv4ouaZQqEO5FRMjYPHna+YeTWwauw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dRNP+FyKx5WE1dzaEAME0NJ501LGgyxqatdBMof/xz6qz0Bv93Y4X7rpyIoPpunhx
	 PlghgOit+OxQk1yHyVA4JCHBHXeLsbw7AM/sz+IastQRnLNCBZtyX0JUeeFRiVyG6l
	 K2vL6ykE7/V1W86ODRQolCf03EhzMceejNC6NkcqxgsV8udHkdeWGzYrRKvHx2owXm
	 vsXV/HUCcpmAMMkh4O3hRs3l8R2ZScEkz+eNbNmLE3+IQTHbYJTDoyPAjO9kwco5w3
	 zMTC0XnpUQV1CKMT6wVeByfexCiFNlqJgrRO3BL1sje3qHAy1zix+uJS0kZ31Ouqgl
	 JdmVyEONL6PNA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Marian Postevca <posteuca@mutex.one>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20240118143023.1903984-1-venkataprasad.potturu@amd.com>
References: <20240118143023.1903984-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 1/3] ASoC: amd: acp: Enable rt5682s clocks in acp slave
 mode
Message-Id: <170595626688.145475.10620006643082770477.b4-ty@kernel.org>
Date: Mon, 22 Jan 2024 20:44:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: 2HTSUHACXISBF55ITPNHTBBBJX72Y3AD
X-Message-ID-Hash: 2HTSUHACXISBF55ITPNHTBBBJX72Y3AD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2HTSUHACXISBF55ITPNHTBBBJX72Y3AD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 18 Jan 2024 20:00:19 +0530, Venkata Prasad Potturu wrote:
> Set and enable rt5682s codec bclk and lrclk rates when
> acp is in slave mode.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: amd: acp: Enable rt5682s clocks in acp slave mode
      commit: 1d565de8d53cfa823576abac84e82ab1561f04eb
[2/3] ASoC: amd: acp: Update platform name for different boards
      commit: 4bae2029ffcccfbefb8f31563556494464e7bf2d
[3/3] ASoC: amd: acp: Add check for cpu dai link initialization
      commit: 6cc2aa9a75f2397d42b78d4c159bc06722183c78

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

