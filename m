Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AA0777FD4
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 20:01:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 107333E7;
	Thu, 10 Aug 2023 20:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 107333E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691690486;
	bh=Yez2JSlnKEn/bX9Ro8qJZo9LH7FDvf4Vsbop2k5JpTY=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BfRhAZ3yAXI45vsVzIMtfmXGOvyqyzAu4KYAxpfcvTxUMNtx0W3Fzzfjec9U5eqI/
	 nQb88nqUdCfBubBRBbdza+0mYQwTBdmpaIfru0rjXpwRdT3me060LXSlqdNVRmxNhB
	 wbioZex4PhFYXAPByBTbVywc2FMQpHNKyFqBNh7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07EB4F80551; Thu, 10 Aug 2023 20:00:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E7D0F80166;
	Thu, 10 Aug 2023 20:00:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE91CF80536; Thu, 10 Aug 2023 20:00:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6FCD7F800F4
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 20:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FCD7F800F4
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 18EF1FB07;
	Thu, 10 Aug 2023 19:59:59 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7VeIVy9OQeEf; Thu, 10 Aug 2023 19:59:58 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	Peng Fan <peng.fan@nxp.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	kernel@puri.sm,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	David Heidelberg <david@ixit.cz>,
	Sherry Sun <sherry.sun@nxp.com>
Subject: [PATCH v2 0/4] Device tree and config updates for the Librem 5 devkit
Date: Thu, 10 Aug 2023 19:59:48 +0200
Message-Id: <cover.1691684726.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3NSGXKP62XABQXEKHJJHAAZE4UX3XIGJ
X-Message-ID-Hash: 3NSGXKP62XABQXEKHJJHAAZE4UX3XIGJ
X-MailFrom: agx@sigxcpu.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NSGXKP62XABQXEKHJJHAAZE4UX3XIGJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The device tree updates ensure the A53 cores don't get powered off and
fix a DT warning. This isn't testable with the arm64 default config
unless we enable the rsi wifi modules too so do this as well.

While at that include a binding file update.

This is against next-20230809 that include David's option,gtm601
conversion.

v2:
- drop "dt-bindings: mmc: Fix reference to pwr-seq-simple"
  already picked up by Ulf Hansson, thanks!
- add acked-by from Conor Dooley, thanks!
- rework sdio changes as proposed by Sherry Sun

Guido Günther (4):
  dt-bindings: sound: gtm601: Add description
  arm64: dts: imx8mq-librem5-devkit: Mark buck2 as always on
  arm64: dts: imx8mq-librem5-devkit: Drop power-supply
  arm64: defconfig: Enable Redpine 91X wlan driver

 .../bindings/sound/option,gtm601.yaml         |  6 +++--
 .../dts/freescale/imx8mq-librem5-devkit.dts   | 26 ++++++++-----------
 arch/arm64/configs/defconfig                  |  1 +
 3 files changed, 16 insertions(+), 17 deletions(-)

-- 
2.40.1

