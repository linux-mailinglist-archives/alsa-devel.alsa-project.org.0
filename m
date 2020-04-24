Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B5B1B6B18
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 04:12:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C75B61699;
	Fri, 24 Apr 2020 04:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C75B61699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587694336;
	bh=wRdWI4mFdlM1FevOsX+Xqy5A8zpujhYyRCT3G1JBXBw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Snmchkm2zfLeRfOipu2BmrfNrMRyWQTUfuNGwlvp+WjPDJnUZN3hbacUnfvCNU71V
	 1wii0jQmVcHS5WgT93GSlJA7iZmGwa44PbP38cS7vO2sj/h752QRgkqIZWfwxZ1mVI
	 SMeVHSv011CNLwhjflI1tCNV3XfAujd7HrIZn9nM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2E13F800BE;
	Fri, 24 Apr 2020 04:10:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99B05F80142; Fri, 24 Apr 2020 04:10:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 498E7F80117
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 04:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 498E7F80117
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 39C2D2001EF;
 Fri, 24 Apr 2020 04:10:24 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AD14F2001DA;
 Fri, 24 Apr 2020 04:10:19 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 2DDEF402D5;
 Fri, 24 Apr 2020 10:10:14 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 shengjiu.wang@nxp.com, tglx@linutronix.de, allison@lohutok.net,
 info@metux.net, patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: wm8962: set CLOCKING2 as non-volatile register
Date: Fri, 24 Apr 2020 10:01:38 +0800
Message-Id: <6d25d5b36d4b9aeb8655b5e947dad52214e34177.1587693523.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

Previously CLOCKING2 is set as a volatile register, but cause
issue at suspend & resume, that some bits of CLOCKING2 is not
restored at resume, for example SYSCLK_SRC bits, then the output
clock is wrong.

The volatile property is caused by CLASSD_CLK_DIV bits,
which are controlled by the chip itself. But the datasheet
claims these are read only and protected by the security key,
and they are not read by the driver at all.

So it should be safe to change CLOCKING2 to be non-volatile.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---

Changes in v2:
- Change according to Charles's suggestion to use non-volatile

 sound/soc/codecs/wm8962.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index d9d59f45833f..0a2cfff44441 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -118,7 +118,7 @@ static const struct reg_default wm8962_reg[] = {
 	{ 5, 0x0018 },   /* R5     - ADC & DAC Control 1 */
 	{ 6, 0x2008 },   /* R6     - ADC & DAC Control 2 */
 	{ 7, 0x000A },   /* R7     - Audio Interface 0 */
-
+	{ 8, 0x01E4 },   /* R8     - Clocking2 */
 	{ 9, 0x0300 },   /* R9     - Audio Interface 1 */
 	{ 10, 0x00C0 },  /* R10    - Left DAC volume */
 	{ 11, 0x00C0 },  /* R11    - Right DAC volume */
@@ -788,7 +788,6 @@ static bool wm8962_volatile_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case WM8962_CLOCKING1:
-	case WM8962_CLOCKING2:
 	case WM8962_SOFTWARE_RESET:
 	case WM8962_THERMAL_SHUTDOWN_STATUS:
 	case WM8962_ADDITIONAL_CONTROL_4:
-- 
2.21.0

