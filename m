Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F3971A2EB
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 17:45:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CED51FA;
	Thu,  1 Jun 2023 17:44:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CED51FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685634332;
	bh=6wfuvEex59Ok6T5gRrkfMoK/HR47V0aNeFPlA0QEhM8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YisW1+5VULuQrIuaAmayu+B4sr87PJfOWkTGAl8xEHQIzV9b8aygS/wsh9Q58uyrl
	 82Du+8mZsRI9LRaGYCpmhkn++FO3plmc9FIAdWfdF8B16U3A84tw4xl9zn/Cehvv4r
	 5V13dE1tlWx/EODCKq3IeVhn2vtzANOmTMsYGf4s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DDB0F800ED; Thu,  1 Jun 2023 17:44:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B53C7F80132;
	Thu,  1 Jun 2023 17:44:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37644F80199; Thu,  1 Jun 2023 17:44:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BFFA7F800ED
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 17:44:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFFA7F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZqvvUnO/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C4F2C640E6;
	Thu,  1 Jun 2023 15:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6FAC433EF;
	Thu,  1 Jun 2023 15:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685634268;
	bh=6wfuvEex59Ok6T5gRrkfMoK/HR47V0aNeFPlA0QEhM8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZqvvUnO/0qfrMMhnw3xdHydTy+Y8BJRfv87V1KJ9TvwRrbOBm1vH4kx+bc/BXg0S4
	 eR9mepejozTdE7nmqzwznxeTOrt32CR96/BljyQbeZlkZ7aEwBcxmcJ6ZN92DtCBXH
	 GcVer9bs2bPDkAYjZsn6weI9nRIkxj2kAS0cZU8Mrmi8kNfPZz9mWnjL/0WsZTQBnS
	 cGNKH0v+cCrodvUzd5XAiMLz4XBDCDta6EmixY2D4MsR8U+jysWux25USD2YV37sN+
	 E/Pvpq4mNP9RoEVjJJmiT6jVUTETmwrcKGFrfXOX+Jsgum6Juz8ibk3AN/PiftsDtx
	 H1ZIZuRUAxaQA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 Trevor Wu <trevor.wu@mediatek.com>
Cc: dianders@chromium.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230601033318.10408-1-trevor.wu@mediatek.com>
References: <20230601033318.10408-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH v2 0/2] ASoC: mediatek: fix use-after-free in driver
 remove path
Message-Id: <168563426581.132600.16426299018571667864.b4-ty@kernel.org>
Date: Thu, 01 Jun 2023 16:44:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 66QFUGQBD4OR7YAGUBWUOAVWOV5G4JXE
X-Message-ID-Hash: 66QFUGQBD4OR7YAGUBWUOAVWOV5G4JXE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/66QFUGQBD4OR7YAGUBWUOAVWOV5G4JXE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 01 Jun 2023 11:33:16 +0800, Trevor Wu wrote:
> These patches concern modifications made in mt8186[1]. The clock
> unregistration mechanism used in mt8188 and mt8195 is similar with
> mt8186, resulting in the same problem existing within the driver.
> Therefore, the solution has also been applied to these two platforms.
> 
> [1] https://lore.kernel.org/all/20230511092437.1.I31cceffc8c45bb1af16eb613e197b3df92cdc19e@changeid/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8188: fix use-after-free in driver remove path
      commit: fd67a7a1a22ce47fcbc094c4b6e164c34c652cbe
[2/2] ASoC: mediatek: mt8195: fix use-after-free in driver remove path
      commit: dc93f0dcb436dfd24a06c5b3c0f4c5cd9296e8e5

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

