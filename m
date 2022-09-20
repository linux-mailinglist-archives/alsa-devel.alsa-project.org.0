Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC2E5BE715
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 15:29:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 618ACAEA;
	Tue, 20 Sep 2022 15:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 618ACAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663680543;
	bh=duF10gD9sbZA+Bm4zPNQqJO6kJ7WkRZ4TTW0Qx0ckj8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GGa0gxHIQtAd3Agc31IQ36ShJC6nGZGgMelnbR1HZ/SbPXBq1fDD9FWVOibR+Kt+9
	 M35xUKo0H9KH6O5IjN5NNFReK3A6OKlETKIjJZZBN8mpSwg7XjROZ0YsjBMsP/lu/y
	 Cz6z7uHE3JMBhFgSZBFrpr0ib/QOYiGa7znG44to=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97839F804DA;
	Tue, 20 Sep 2022 15:27:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FC90F80539; Tue, 20 Sep 2022 15:27:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 432A1F80171
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 15:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 432A1F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OXKncDma"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B6A1629AD;
 Tue, 20 Sep 2022 13:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B35C43143;
 Tue, 20 Sep 2022 13:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663680452;
 bh=duF10gD9sbZA+Bm4zPNQqJO6kJ7WkRZ4TTW0Qx0ckj8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OXKncDma0pSYX1etnuN2SPD0MgPfZQL51GSltE/BThnJglBHGeZ+mD21FaQ0MO8Kc
 8mP6299DTIVsLYdW5Crx+K82zavm8vw1PpboiX0r0Oh4MmAtHhbHdzwWBk82EyKKxq
 iO6LivBbTwCPIeI5QFBtNPohnbN6CRjWtSgT4lvfd2xKcdSn4BXltW6XeHUBBdLIF6
 QFI6d0IYZ/iv3wq1ZZmkOAI+5nLkbJ8TG4h5Ffs3Ame2lR2r4qfT9syQ4BmmfKbSRO
 TvkynXwxLvJHgcsQ0QSf6JpGgSA511DXe2kYD/y4I8zK8074af2pS6yfOGKGdHlMqQ
 SBd/Fir4R6I4w==
Received: by pali.im (Postfix)
 id 70D882E0F; Tue, 20 Sep 2022 15:27:29 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Marcin Wojtas <mw@semihalf.com>
Subject: [PATCH 4/5] ARM: mvebu: Add spdif-pins mpp pins for Armada 38x
Date: Tue, 20 Sep 2022 15:26:47 +0200
Message-Id: <20220920132648.2008-5-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220920132648.2008-1-pali@kernel.org>
References: <20220920132648.2008-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

S/PDIF function on Armada 38x uses only mpp51 pin. So add spdif-pins mpp
pins section for it. It is needed for boards without i2s.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/arm/boot/dts/armada-38x.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
index 11e0e4286ec2..b09a48de9906 100644
--- a/arch/arm/boot/dts/armada-38x.dtsi
+++ b/arch/arm/boot/dts/armada-38x.dtsi
@@ -296,6 +296,11 @@
 						       "mpp52", "mpp53";
 					marvell,function = "audio";
 				};
+
+				spdif_pins: spdif-pins {
+					marvell,pins = "mpp51";
+					marvell,function = "audio";
+				};
 			};
 
 			gpio0: gpio@18100 {
-- 
2.20.1

