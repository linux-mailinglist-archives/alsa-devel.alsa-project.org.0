Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 858917C4208
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 23:06:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CF2483B;
	Tue, 10 Oct 2023 23:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CF2483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696971977;
	bh=yvPMXP2l4TfL9XGBebXnmFKqikjauh9MRR4XumXFlTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CYYXPXcmWQpDr5piAjIBm13FdUBLTHREl19PRMXlfqcxgCRf12Fw0MJHLehd7LvmA
	 EGARJv5CYGJS6x5Sv0T5mGVWnc9sfJWl/1J6EuVnMfX2WcLriAFE/6aj73YD9uJ6nI
	 QHOmN1zam0tj1DiTJ1cWX2csnu1Uq4WzwcY8t+N0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 646EEF8027B; Tue, 10 Oct 2023 23:05:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B09C2F8019B;
	Tue, 10 Oct 2023 23:05:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D711BF802BE; Tue, 10 Oct 2023 23:05:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D352F8019B;
	Tue, 10 Oct 2023 23:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D352F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nQ+3EkzO
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F030B6187A;
	Tue, 10 Oct 2023 21:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE473C433C7;
	Tue, 10 Oct 2023 21:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696971899;
	bh=yvPMXP2l4TfL9XGBebXnmFKqikjauh9MRR4XumXFlTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nQ+3EkzOMqum9iILMoJWwVqSEg4JHyrW5nbtYIhCBruFlKDx0CxnviKGEixaVdHvj
	 +710FuLg+zgREUHUBk1aafDFz9fCh1iG86SLNYd/AF572bbh3VoM+9BwpQA+HIk9g5
	 brrXfiilEFwbUEeznBv8H/kWK/L62RORmOARQW7eDzWxV+MC2kSx8IJ3nuOChtF4H5
	 a4n2HQ5ommNXa9kUObzX7UhnVnYpvlSY21QvKd+emid4Ztu3LGJ9jcXmTlc29uZjrY
	 hhJsk25hSU3amgIXvqyq/fu2eM4lsNGqE0e/VtNQnF/eB2+Qe3zxyJeG3ixq5VcmDp
	 ytZwDpnwG/DQQ==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20231009155945.285537-1-u.kleine-koenig@pengutronix.de>
References: <20231009155945.285537-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: SOF: Convert to platform remove callback
 returning void
Message-Id: <169697189438.374969.14160714279506826790.b4-ty@kernel.org>
Date: Tue, 10 Oct 2023 22:04:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: WRJVZOOZJTYMNHDZ7RYXR4F7NDWXGNF3
X-Message-ID-Hash: WRJVZOOZJTYMNHDZ7RYXR4F7NDWXGNF3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WRJVZOOZJTYMNHDZ7RYXR4F7NDWXGNF3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 09 Oct 2023 17:59:45 +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Convert to platform remove callback returning void
      commit: 52fee5c9158000db607d734383fd862969782de5

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

