Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 530F057FF89
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 15:08:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEEE6843;
	Mon, 25 Jul 2022 15:07:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEEE6843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658754529;
	bh=7eNUHi9m1jTYNb6cRhRIgN0JdTON6pZLix7RTM4B5OU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SUs9ZNw2f7Y0KrwAMat2kdVdB7PXDurQGzmCdNO4ca/gt1o5bW7Wr6jfTDgVeqCG4
	 MogG0ngumX9xHxqSDDzHLH4ezPDSAUWE+V6y5+QKMHSil8TJqe78aRhS4JgH9GwDwT
	 ODJ1TExqHudWpjnhRkIBZ1KKoRnZ1pejOaIr23kk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84F73F80115;
	Mon, 25 Jul 2022 15:07:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B244F80212; Mon, 25 Jul 2022 15:07:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA309F80115
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 15:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA309F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="fr4pKhTM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1658754436; x=1690290436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7eNUHi9m1jTYNb6cRhRIgN0JdTON6pZLix7RTM4B5OU=;
 b=fr4pKhTM2FdSvvgnEPuXcjEQLmNBmaxYS7oxLilebUbDgeAEEbhnosAS
 m8cVV6FWbcyPEYLeiUMpFJzVzYzyaFjErz4cubVtPPLBMGwVG2GtN2ehZ
 7uIPPtuifzO8l+cZCtczS7o+0I4PaJx2el4CkfCwE82XDXUShLfZxlbuq
 JJABWZwG8Qb9Jld7f5M4DYT7XBFzAKY8N1WDBbqpEnYbg3NurFeUiOl+u
 01aTbMItJ1qc8HRIaplyiab3ELfltG5zi9X0nDlvmbqq9wiiYTT/eSdwt
 y/PW+eciTsalAoikxssGy9h5JJ6l6lyypdJ083yn4LIGE7kZ64z+WrjrA A==;
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="173519302"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Jul 2022 06:07:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 06:07:07 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 25 Jul 2022 06:07:05 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 2/5] ASoC: mchp-spdifrx: use single tab indent for structure
Date: Mon, 25 Jul 2022 16:09:22 +0300
Message-ID: <20220725130925.1781791-3-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220725130925.1781791-1-claudiu.beznea@microchip.com>
References: <20220725130925.1781791-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
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

Use single tab indentation for mchp_spdifrx_mixer_control structure.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index b6a753893d90..fcc5ca865d81 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -221,11 +221,11 @@ struct mchp_spdifrx_user_data {
 };
 
 struct mchp_spdifrx_mixer_control {
-		struct mchp_spdifrx_ch_stat ch_stat[SPDIFRX_CHANNELS];
-		struct mchp_spdifrx_user_data user_data[SPDIFRX_CHANNELS];
-		bool ulock;
-		bool badf;
-		bool signal;
+	struct mchp_spdifrx_ch_stat ch_stat[SPDIFRX_CHANNELS];
+	struct mchp_spdifrx_user_data user_data[SPDIFRX_CHANNELS];
+	bool ulock;
+	bool badf;
+	bool signal;
 };
 
 struct mchp_spdifrx_dev {
-- 
2.34.1

