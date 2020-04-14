Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 356891A8086
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 16:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D39A916A0;
	Tue, 14 Apr 2020 16:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D39A916A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876211;
	bh=8l8qvAdkG3irVaNUvMR5e7sGi6NgrQ7nNnMN7lU+Ypw=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mXm7prB6WRP4gAGnaFjwdrIQPtzSkLlV6j3QfOS8+9MDm3ASxyxtJ3uyF0jE6wGTQ
	 Iup76wEe+Uyk7d7an4ZB8H9AqjicdQKefNHk8z4obTOkcCPgx57wlDJkW4hsbQ1jdS
	 AJ0CjIjfOlllQDB6P4yBDTaUSyfp5sugfQBsFNek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B2E4F80337;
	Tue, 14 Apr 2020 16:48:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CA5FF80333; Tue, 14 Apr 2020 16:47:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 810E7F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 810E7F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H5dFdqx6"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 726D820CC7;
 Tue, 14 Apr 2020 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875636;
 bh=8l8qvAdkG3irVaNUvMR5e7sGi6NgrQ7nNnMN7lU+Ypw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=H5dFdqx6nIDqdZkcysqi+odJ4NkyCs6vNMSeVV+Gp6uXhKAvOresbwHMCiOV10NID
 X6vS2GogFkMfGhAVMdNlI6D6dS9ZCwIT5krpEM7YboD1DmfrH4Z/ph8xasLiKshilH
 A5c5Xi2LenPDrv/r9hHEOkbV/a9rcY5TFv3NUvRo=
Date: Tue, 14 Apr 2020 15:47:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Applied "ASoC: tegra-wm8903: Document new nvidia,
 headset property" to the asoc tree
In-Reply-To: <20200330204011.18465-2-digetx@gmail.com>
Message-Id: <applied-20200330204011.18465-2-digetx@gmail.com>
X-Patchwork-Hint: ignore
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: tegra-wm8903: Document new nvidia, headset property

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 8240fe6c91b884b5f1f861a8c22721d6ea4c53c9 Mon Sep 17 00:00:00 2001
From: Dmitry Osipenko <digetx@gmail.com>
Date: Mon, 30 Mar 2020 23:40:10 +0300
Subject: [PATCH] ASoC: tegra-wm8903: Document new nvidia, headset property

Some devices have a 4-pin headset jack instead of 3-pin microphone jack.
The new boolean nvidia,headset property tells that the Mic Jack represents
the state of a headset microphone. This additional hardware description is
needed because microphone detection procedure differs in a case of a 4-pin
jack from a 3-pin jack.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Link: https://lore.kernel.org/r/20200330204011.18465-2-digetx@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt
index a8f2b0c56c79..bbd581a8c5bc 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt
@@ -29,6 +29,7 @@ Optional properties:
 - nvidia,hp-det-gpios : The GPIO that detect headphones are plugged in
 - nvidia,int-mic-en-gpios : The GPIO that enables the internal microphone
 - nvidia,ext-mic-en-gpios : The GPIO that enables the external microphone
+- nvidia,headset : The Mic Jack represents state of the headset microphone pin
 
 Example:
 
-- 
2.20.1

