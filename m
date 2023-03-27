Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FA26CA7E0
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 16:40:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77DE1822;
	Mon, 27 Mar 2023 16:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77DE1822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679928004;
	bh=jGbljjZ6sYKW+hsa5vD5FzntKFGqn2nf7NT5nxgonnQ=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ANq8T7YPcBYbzyF5XyFGLM3BtWZdrOzBOfTCA1Em91Yd8I+XY6HfrVbOGTXkwfK4N
	 V1fy8YTuTniZEJyfvMTjSyoM3qxo4sTBAiIOAuLr6NBBl7CgjsdHhj0qjxHzCdEUoM
	 z4tqwy7SsmYPVUitVatheIuDdW5qWXEu+ji4Lsa8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B760DF8024E;
	Mon, 27 Mar 2023 16:39:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0343F80290; Mon, 27 Mar 2023 16:39:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF2DEF80114
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 16:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF2DEF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jhgI7ezS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83CF061291;
	Mon, 27 Mar 2023 14:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC74C433D2;
	Mon, 27 Mar 2023 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679927937;
	bh=jGbljjZ6sYKW+hsa5vD5FzntKFGqn2nf7NT5nxgonnQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jhgI7ezSTUi1ScYCNYo154omb7+Pe8JrT6VuOZ+Np5p4z7gGxcUJlw0TunGvqB2kn
	 CYQzMJZp7QTZnIULs2sUqNcTRmLk80lh+SRiJ3LVTxjL7RXo2V79denL3GuTltFgTe
	 2CgrtU5FEvIXj1gP790yNMDB3LJKYOoMDSB7KVMmqK3EC13KPwkJ7P+xWXUgLtJ2Dx
	 UrQZspoBfFlNELRz03lc2vWscyn/BiluW5Tv5R27cDbX4I2Lhe466x038cZbw+vnyX
	 5tbT818ScrWzBXy+rOP0Fn3kkznO4XBqlAvV/Zart9tWGKe/cDllSWrUYlGZ1WJCyM
	 Z2sXsBkMFlMCA==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: 
 <8dab942d6ce47657a9c038295959be80bb2ee09e.1679834598.git.christophe.jaillet@wanadoo.fr>
References: 
 <8dab942d6ce47657a9c038295959be80bb2ee09e.1679834598.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: meson: Use the devm_clk_get_optional() helper
Message-Id: <167992793479.3167684.14938651737373308205.b4-ty@kernel.org>
Date: Mon, 27 Mar 2023 15:38:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: WB3CZNK7BQ2ZE23I6LNA4DRPUZ6WATHZ
X-Message-ID-Hash: WB3CZNK7BQ2ZE23I6LNA4DRPUZ6WATHZ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WB3CZNK7BQ2ZE23I6LNA4DRPUZ6WATHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 26 Mar 2023 14:43:38 +0200, Christophe JAILLET wrote:
> Use devm_clk_get_optional() instead of hand writing it.
> This saves some loC and improves the semantic.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: Use the devm_clk_get_optional() helper
      commit: 65d4d7259bfec376b6b1483b4fe4058a5ba2259b

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

