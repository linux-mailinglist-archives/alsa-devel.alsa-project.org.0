Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FC0777B30
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 16:45:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2668822;
	Thu, 10 Aug 2023 16:44:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2668822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691678735;
	bh=taD2g2HjEYDDGyrJ7xRRjV/D/Ew9sTSpuCtEVhiSMVI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hAmDe8itEpJAJ7Vgq2n8VkCQfC/Obaswgbf7HE6xYrrCUf1Q4xRxdZCaAjufs/i2g
	 9tQgP4/msO1Dy7M0Vi1f60RQBOTt8/8UGfCpDuiPMg4BB+05Dq/eJLNgh4hmzHZSeQ
	 VeQBdFl+zl7orhW0ALg6HAPA8Pvedr53xcZqmmBI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37F28F80551; Thu, 10 Aug 2023 16:44:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D83CCF80166;
	Thu, 10 Aug 2023 16:44:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 876E0F8016E; Thu, 10 Aug 2023 16:44:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98323F800FB
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 16:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98323F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZARSl0Qu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DD4EC65E55;
	Thu, 10 Aug 2023 14:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49CFDC433C7;
	Thu, 10 Aug 2023 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691678674;
	bh=taD2g2HjEYDDGyrJ7xRRjV/D/Ew9sTSpuCtEVhiSMVI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZARSl0Qu0dWqGyMxPdHwUP4DCJXIgtofaovntgVIS1O8ERbxLpTmxuHTv9htJBcgi
	 WnOU4Pq1u+xdYUNAJHVHy7ODTKkDFS39Hx7degKqwA4krDXV1XR6zaeQ7RsQRjP2Jm
	 DzbhrPVv9Vqlb0ex7NZlhzM1Pp7wYmXEdWPJGIbNp5zYrz3GM2KYg6fOxCDk4hQu+u
	 8eXtM6ZGUxWZnrK04WseN8x+n0Ebk9FrCUbWn/enYf3qtg5kY492toI26QiP6MwiOd
	 RNVWiZC5PsVaJRDeDGYHKgEDepoObxLt5I2EIif7/uZu0OHYQ+8jVh16FILmtrcPQO
	 osZj5w+PuJ3xw==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230809171931.1244502-1-jbrunet@baylibre.com>
References: <20230809171931.1244502-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: fix channel slot
 allocation
Message-Id: <169167867301.482967.10999028538152637796.b4-ty@kernel.org>
Date: Thu, 10 Aug 2023 15:44:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: NZNMEHONCHIAEIOWPDELRNEWZCAIELM2
X-Message-ID-Hash: NZNMEHONCHIAEIOWPDELRNEWZCAIELM2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NZNMEHONCHIAEIOWPDELRNEWZCAIELM2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 09 Aug 2023 19:19:31 +0200, Jerome Brunet wrote:
> When the tdm lane mask is computed, the driver currently fills the 1st lane
> before moving on to the next. If the stream has less channels than the
> lanes can accommodate, slots will be disabled on the last lanes.
> 
> Unfortunately, the HW distribute channels in a different way. It distribute
> channels in pair on each lanes before moving on the next slots.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg-tdm-formatter: fix channel slot allocation
      commit: c1f848f12103920ca165758aedb1c10904e193e1

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

