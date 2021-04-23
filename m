Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94315369736
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 18:38:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AE4016D5;
	Fri, 23 Apr 2021 18:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AE4016D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619195922;
	bh=ouQCi9bVupepxS9YtM6usBAVHYeBr+zqGtn5jSAro3k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R9dLt3bBm77hUylmytPyBivAGL7THa8O+fWwHidzzokcCQcWJOLissZe3zuLgGZmN
	 pqRNwZJO7RHx4Oj+0FCe9Ogw0wbmHORALPmDFwShRZV2utRX506RjAa+DIOlEOSPXK
	 TYlANUsEI/T7n7YPbM5vI94PagJAf4mNygtqz/xw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BEE2F804C1;
	Fri, 23 Apr 2021 18:35:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B2FAF804AD; Fri, 23 Apr 2021 18:35:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF832F80276
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 18:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF832F80276
IronPort-SDR: ODYkp6zAdzIwRALzzJami8RWNm3AqSRng4Fgf1XFfj3rSH2NYjvoHaA6VOocFXVEFERiuGRV7b
 jPIi13fh9UpQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9963"; a="196207755"
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="196207755"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 09:34:45 -0700
IronPort-SDR: 0rIITxXvFXROaqSP6RWWo/LjE3xn3fp/eFwpEp/aBW9WfHbz64VIJD79JZEA5jfotOvOHXV+fK
 Qt3TJgDkZf3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="453620727"
Received: from black.fi.intel.com ([10.237.72.28])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2021 09:34:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 4AE0B1FC; Fri, 23 Apr 2021 19:34:56 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v1 06/14] spi: pxa2xx: Group Intel Quark specific definitions
Date: Fri, 23 Apr 2021 19:34:29 +0300
Message-Id: <20210423163437.89306-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423163437.89306-1-andriy.shevchenko@linux.intel.com>
References: <20210423163437.89306-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
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
 include/linux/spi/pxa2xx_ssp.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/spi/pxa2xx_ssp.h b/include/linux/spi/pxa2xx_ssp.h
index 14b049840faf..1b6c1a0922bd 100644
--- a/include/linux/spi/pxa2xx_ssp.h
+++ b/include/linux/spi/pxa2xx_ssp.h
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

