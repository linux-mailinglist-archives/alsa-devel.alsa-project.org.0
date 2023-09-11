Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A8979A8BC
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 16:41:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25E6A84B;
	Mon, 11 Sep 2023 16:40:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25E6A84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694443292;
	bh=K6iNBAprnlrrQdCOhtq57JgHvoe8R7g8lKIIYvP5aZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n/b+b6PJw7ekdwPzxoPXcQtvM2REXQhhMJO0c4E6Dr0fuXnusC1j7jvPEfifnFUPL
	 r/bqiEex4kboed2zGJ9fA2eEFQubsYKy3mTb3thU3NdGIYuSsARUD7n1t1qQWyS5zO
	 T8YET6CqEDhupS1GsW8xevXadBeLx9BEilAUGhlk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 544B5F80549; Mon, 11 Sep 2023 16:40:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16716F80246;
	Mon, 11 Sep 2023 16:40:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12E2DF80425; Mon, 11 Sep 2023 16:40:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E574F8007C
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 16:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E574F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=giyc2yo6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 6C8BECE09E4;
	Mon, 11 Sep 2023 14:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727C1C433CD;
	Mon, 11 Sep 2023 14:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694443228;
	bh=K6iNBAprnlrrQdCOhtq57JgHvoe8R7g8lKIIYvP5aZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=giyc2yo64aXhbNxhv6ueGMgo1mS+XXCzQdDcvoL3RPEKVXX8jJKhSRvrosLY9rGM/
	 WL/2FQ/mFG5FBSf5iCF/0fHb5tToCPI51lVt36Tzdu0M8Az1DSJL0ZWhCSJEyN57nE
	 1gRYccEAEJr8TcVhdQNQ23Qle97ntbzEQccg8yFE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.4 277/737] ASoC: stac9766: fix build errors with REGMAP_AC97
Date: Mon, 11 Sep 2023 15:42:16 +0200
Message-ID: <20230911134658.311384763@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911134650.286315610@linuxfoundation.org>
References: <20230911134650.286315610@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NG2TD5KK4PI4DRFAR7V5K7POXHEVYJ3Z
X-Message-ID-Hash: NG2TD5KK4PI4DRFAR7V5K7POXHEVYJ3Z
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NG2TD5KK4PI4DRFAR7V5K7POXHEVYJ3Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

6.4-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit c70064b96f509daa78f57992aeabcf274fb2fed4 ]

Select REGMAP_AC97 to fix these build errors:

ERROR: modpost: "regmap_ac97_default_volatile" [sound/soc/codecs/snd-soc-stac9766.ko] undefined!
ERROR: modpost: "__regmap_init_ac97" [sound/soc/codecs/snd-soc-stac9766.ko] undefined!

Fixes: 6bbf787bb70c ("ASoC: stac9766: Convert to regmap")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org
Link: https://lore.kernel.org/r/20230701044836.18789-1-rdunlap@infradead.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 1b50b2d66beb2..3840dd6844974 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1673,6 +1673,7 @@ config SND_SOC_STA529
 config SND_SOC_STAC9766
 	tristate
 	depends on SND_SOC_AC97_BUS
+	select REGMAP_AC97
 
 config SND_SOC_STI_SAS
 	tristate "codec Audio support for STI SAS codec"
-- 
2.40.1



