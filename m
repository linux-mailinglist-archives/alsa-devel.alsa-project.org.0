Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 799EA378C6C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 14:45:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2CDA16B6;
	Mon, 10 May 2021 14:44:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2CDA16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620650718;
	bh=3Dn5x6qFhBwPQt/PjR52fl9Z0+OFcwVAroezu4VJSig=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y1r8dmhaOL5QDnKBry07V/4scEm2e8f2dw69xJXNGuqO5ZWRDyqqbAa/tRKaoNzcr
	 cmO0C1WLwK+h3WA6Ym4WzkH8vySfgHRpJsWVeYEqGre3zUTV5rU7QsrZEYcaxmJJSF
	 1jNvRTQDnNFIj9cx5naHGyd7jGofZ61AYXCVRHKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30214F804AC;
	Mon, 10 May 2021 14:41:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB744F804AD; Mon, 10 May 2021 14:41:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E681EF8026F
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 14:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E681EF8026F
IronPort-SDR: W1XeyHnM2fKcxGUAoUFbM1YtTeInzkB4+g3yhiR8MWuj40V86upP2s0cCDMYiwOv2TtlXkF6Bg
 DS4jYqoWVZiA==
X-IronPort-AV: E=McAfee;i="6200,9189,9979"; a="220130233"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="220130233"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 05:41:23 -0700
IronPort-SDR: Phfeuo6XYiUizxOp3MkKZ0WCHLSS+7svpwaRHf+CR8L8RfBK8thLQd21dGZqfq3wZXtSODCEsf
 R6Sl/SGsTuYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="609085438"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga005.jf.intel.com with ESMTP; 10 May 2021 05:41:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 947FE501; Mon, 10 May 2021 15:41:37 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v3 06/14] spi: pxa2xx: Group Intel Quark specific definitions
Date: Mon, 10 May 2021 15:41:26 +0300
Message-Id: <20210510124134.24638-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510124134.24638-1-andriy.shevchenko@linux.intel.com>
References: <20210510124134.24638-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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

DDS_RATE is Intel Quark specific definition. Move it to the rest
Intel Quark related.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/pxa2xx_ssp.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/pxa2xx_ssp.h b/include/linux/pxa2xx_ssp.h
index 14b049840faf..1b6c1a0922bd 100644
--- a/include/linux/pxa2xx_ssp.h
+++ b/include/linux/pxa2xx_ssp.h
@@ -38,7 +38,6 @@ struct device_node;
 #define SSDR		(0x10)  /* SSP Data Write/Data Read Register */
 
 #define SSTO		(0x28)  /* SSP Time Out Register */
-#define DDS_RATE	(0x28)  /* SSP DDS Clock Rate Register (Intel Quark) */
 #define SSPSP		(0x2C)  /* SSP Programmable Serial Protocol */
 #define SSTSA		(0x30)  /* SSP Tx Timeslot Active */
 #define SSRSA		(0x34)  /* SSP Rx Timeslot Active */
@@ -105,6 +104,9 @@ struct device_node;
 #define CE4100_SSCR1_RFT	GENMASK(11, 10)	/* Receive FIFO Threshold (mask) */
 #define CE4100_SSCR1_RxTresh(x) (((x) - 1) << 10)	/* level [1..4] */
 
+/* Intel Quark X1000 */
+#define DDS_RATE		0x28		 /* SSP DDS Clock Rate Register */
+
 /* QUARK_X1000 SSCR0 bit definition */
 #define QUARK_X1000_SSCR0_DSS		GENMASK(4, 0)	/* Data Size Select (mask) */
 #define QUARK_X1000_SSCR0_DataSize(x)	((x) - 1)	/* Data Size Select [4..32] */
-- 
2.30.2

