Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3A4732AEE
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 11:03:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBCAE851;
	Fri, 16 Jun 2023 11:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBCAE851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686906238;
	bh=liQAyMeBABb3jk++u+GcttTTYo2zoQN5sl4L8LiR7W4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iMO5HcpLHNuWH8yDn3k6QUEkCNSPrhmB4VIwamtivD86OpEplvCKhNYj45frWxedg
	 wQk9t0OQKkhRnX32y9Z6q8hGLNiqtw3Urq7yNkskIKa8BoEtNa8YahhH3s5zdwCWb3
	 A475OUAeqtB5xvdaN6E25MjY29x0lGP9JeYOcr0g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29815F80570; Fri, 16 Jun 2023 11:02:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8E5CF8055C;
	Fri, 16 Jun 2023 11:02:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 040D1F80563; Fri, 16 Jun 2023 11:02:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65D9DF80553
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 11:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65D9DF80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cb5Wuf4p
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D41761840;
	Fri, 16 Jun 2023 09:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D68AC433C8;
	Fri, 16 Jun 2023 09:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686906146;
	bh=liQAyMeBABb3jk++u+GcttTTYo2zoQN5sl4L8LiR7W4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cb5Wuf4p9yI0VjVK/YaONawmhznz+7Rimp+gudyxGyAWeWkQKoIV3Ip6CHkjYm6ci
	 SoqOhzy9/0kwQikK94Y/NhXGchjI9D/CADjiCK4fSaFkOj2fPubcRZfFu8OFPfsnGE
	 5OVYVWWXHOJJZOI1rHnQjt4fi4+ddvzhqBadP2kjC8nqcZ201XiMIscymtApauolaI
	 930BQ2v4pdm5L8ahRo4W3Kn8zGIpHuRnzdC58fXQopEwSaxmdvNLQ2UeFIib7szHTy
	 6fNdEImZcNX8bIvGhBYV6k4ndgW3kayd+X8OmA7gKNjwRIVDL54P5IDvPfQpSStiDa
	 uoz1NcWQUx8mg==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ASoC: loongson: add PCI dependency
Date: Fri, 16 Jun 2023 11:00:39 +0200
Message-Id: <20230616090156.2347850-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616090156.2347850-1-arnd@kernel.org>
References: <20230616090156.2347850-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VX2X4EJ5M4NMESRZV3TOUAYYKREPFRM5
X-Message-ID-Hash: VX2X4EJ5M4NMESRZV3TOUAYYKREPFRM5
X-MailFrom: arnd@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VX2X4EJ5M4NMESRZV3TOUAYYKREPFRM5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

The new driver fails to build when PCI is disabled:

WARNING: unmet direct dependencies detected for SND_SOC_LOONGSON_I2S_PCI
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (LOONGARCH || COMPILE_TEST [=y]) && PCI [=n]
  Selected by [y]:
  - SND_SOC_LOONGSON_CARD [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (LOONGARCH || COMPILE_TEST [=y])
sound/soc/loongson/loongson_i2s_pci.c:167:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
module_pci_driver(loongson_i2s_driver);

Add the appropriate Kconfig dependency.

Fixes: d24028606e764 ("ASoC: loongson: Add Loongson ASoC Sound Card Support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/loongson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/loongson/Kconfig b/sound/soc/loongson/Kconfig
index c175f9de19a85..b8d7e2bade246 100644
--- a/sound/soc/loongson/Kconfig
+++ b/sound/soc/loongson/Kconfig
@@ -16,6 +16,7 @@ config SND_SOC_LOONGSON_I2S_PCI
 config SND_SOC_LOONGSON_CARD
 	tristate "Loongson Sound Card Driver"
 	select SND_SOC_LOONGSON_I2S_PCI
+	depends on PCI
 	help
 	  Say Y or M if you want to add support for SoC audio using
 	  loongson I2S controller.
-- 
2.39.2

