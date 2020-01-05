Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 106291308A2
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:17:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 928061809;
	Sun,  5 Jan 2020 16:17:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 928061809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578237473;
	bh=a2D5Sm/ZBtPxiuuSx7mgpnKR2wGXrrR5Ib/nvp/Z8mQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=txcD2ARfNV9yJKCOvNHS4MWjdiuU3M/JWxOJzfMdxS33IHbb/QsiWAexykMTn8HSV
	 087bmttw2LJynd75k/Xxp9vCCB0bh8s5FZWJ6iSHf2gkZm8ydkL0rMqEChYnocTFFy
	 JvhVqHKhuUWaZ0zG1V+7f9+s/6okG5H2O7AwyAwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DAFAF804B1;
	Sun,  5 Jan 2020 15:50:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A3DEF80392; Sun,  5 Jan 2020 15:49:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0351CF802A7
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0351CF802A7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B18E0B2BC
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:58 +0100
Message-Id: <20200105144823.29547-44-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 43/68] ALSA: cmi8328: More constifications
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Apply const prefix to the static resource tables.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cmi8328.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/isa/cmi8328.c b/sound/isa/cmi8328.c
index 250db35109a2..faca5dd95bfe 100644
--- a/sound/isa/cmi8328.c
+++ b/sound/isa/cmi8328.c
@@ -32,7 +32,7 @@ MODULE_LICENSE("GPL");
 #endif
 
 /* I/O port is configured by jumpers on the card to one of these */
-static int cmi8328_ports[] = { 0x530, 0xe80, 0xf40, 0x604 };
+static const int cmi8328_ports[] = { 0x530, 0xe80, 0xf40, 0x604 };
 #define CMI8328_MAX	ARRAY_SIZE(cmi8328_ports)
 
 static int index[CMI8328_MAX] =     {[0 ... (CMI8328_MAX-1)] = -1};
@@ -193,7 +193,7 @@ static int snd_cmi8328_mixer(struct snd_wss *chip)
 }
 
 /* find index of an item in "-1"-ended array */
-static int array_find(int array[], int item)
+static int array_find(const int array[], int item)
 {
 	int i;
 
@@ -204,7 +204,7 @@ static int array_find(int array[], int item)
 	return -1;
 }
 /* the same for long */
-static int array_find_l(long array[], long item)
+static int array_find_l(const long array[], long item)
 {
 	int i;
 
@@ -224,16 +224,16 @@ static int snd_cmi8328_probe(struct device *pdev, unsigned int ndev)
 	struct resource *res;
 #endif
 	int err, pos;
-	static long mpu_ports[] = { 0x330, 0x300, 0x310, 0x320, 0x332, 0x334,
+	static const long mpu_ports[] = { 0x330, 0x300, 0x310, 0x320, 0x332, 0x334,
 				   0x336, -1 };
-	static u8 mpu_port_bits[] = { 3, 0, 1, 2, 4, 5, 6 };
-	static int mpu_irqs[] = { 9, 7, 5, 3, -1 };
-	static u8 mpu_irq_bits[] = { 3, 2, 1, 0 };
-	static int irqs[] = { 9, 10, 11, 7, -1 };
-	static u8 irq_bits[] = { 2, 3, 4, 1 };
-	static int dma1s[] = { 3, 1, 0, -1 };
-	static u8 dma_bits[] = { 3, 2, 1 };
-	static int dma2s[][2] = { {1, -1}, {0, -1}, {-1, -1}, {0, -1} };
+	static const u8 mpu_port_bits[] = { 3, 0, 1, 2, 4, 5, 6 };
+	static const int mpu_irqs[] = { 9, 7, 5, 3, -1 };
+	static const u8 mpu_irq_bits[] = { 3, 2, 1, 0 };
+	static const int irqs[] = { 9, 10, 11, 7, -1 };
+	static const u8 irq_bits[] = { 2, 3, 4, 1 };
+	static const int dma1s[] = { 3, 1, 0, -1 };
+	static const u8 dma_bits[] = { 3, 2, 1 };
+	static const int dma2s[][2] = { {1, -1}, {0, -1}, {-1, -1}, {0, -1} };
 	u16 port = cmi8328_ports[ndev];
 	u8 val;
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
