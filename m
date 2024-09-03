Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 700F796AC88
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 00:51:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B084C846;
	Wed,  4 Sep 2024 00:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B084C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725403869;
	bh=E1FRRB8uzuRrr4sETqMVC1vm1Kf3AeEHNfMhc1Zr8to=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fE8pCggbbvTgmaPO1Uf9j3qjgEXsACOz1W09EH+WNuSKdQJc8X49RscatFfbLLCls
	 O6F8FwZhhaZTYy3k0T6q5lPIGTaGSEjs/AcnnX3NwOAQuhiOsn6dPdsDR5iD0Zay/k
	 L+Qwq1tdd5YWyvDL5MX6Z/I3yTZPihktNJErQGSU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43366F80527; Wed,  4 Sep 2024 00:50:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08CD9F804F3;
	Wed,  4 Sep 2024 00:50:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 687E8F80199; Wed,  4 Sep 2024 00:50:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81E4FF80027
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 00:50:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81E4FF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d40BttQ+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 42A98A4119F;
	Tue,  3 Sep 2024 22:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8470C4CEC4;
	Tue,  3 Sep 2024 22:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725403829;
	bh=E1FRRB8uzuRrr4sETqMVC1vm1Kf3AeEHNfMhc1Zr8to=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d40BttQ+h/ne0efHOaIxsQW/tmEiK8EZU9bZBK+8xIJCo0GlhKXRkhv3BIS/e2Lcu
	 0ZChZZAIa1GHS1w07v2lNvMacENF2uq1KIU8QIMHJA2CvlGplXkRNc6VV3GBkpe9Hg
	 vL0j9BevChl9uDOtuHiMpLtlvgX09lkdycitkJvQTo0zvXiC7knvJcuzMWGe2KdN1w
	 v3BVWa7F4YZspV+qo82WI6UGrg02i9kEvOgAIE4BVDlSZUKG8domtrGQiyXtX1eXMJ
	 w35gDXi3o7/4Essu7Ho3ikY0eB/F/yABaFdfhjCDf9+8DC67P3+4f0s2PgkO1XCAs9
	 5WxscK27UF1pg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Marek Vasut <marex@denx.de>
Cc: Baojun Xu <baojun.xu@ti.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Jaroslav Kysela <perex@perex.cz>, Kevin Lu <kevin-lu@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Shenghao Ding <shenghao-ding@ti.com>, Takashi Iwai <tiwai@suse.com>,
 kernel@dh-electronics.com, linux-sound@vger.kernel.org
In-Reply-To: <20240830231007.205707-1-marex@denx.de>
References: <20240830231007.205707-1-marex@denx.de>
Subject: Re: [PATCH] ASoC: tlv320aic32x4: Add multi endpoint support
Message-Id: <172540382639.163502.5719294960592347101.b4-ty@kernel.org>
Date: Tue, 03 Sep 2024 23:50:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: WTJHJF2PQVZE3JDZHTTNANR2MXD652SP
X-Message-ID-Hash: WTJHJF2PQVZE3JDZHTTNANR2MXD652SP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WTJHJF2PQVZE3JDZHTTNANR2MXD652SP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 31 Aug 2024 01:09:43 +0200, Marek Vasut wrote:
> Support multiple endpoints on TLV320AIC32x4 codec port when
> used in of_graph context.
> 
> This patch allows to share the codec port between two CPU DAIs.
> 
> Example:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320aic32x4: Add multi endpoint support
      commit: 568dc2fae5d3697033f5e28cf4d6225b3db00461

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

