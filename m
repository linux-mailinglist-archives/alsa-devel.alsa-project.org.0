Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4C466047D
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 17:40:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8CBC1483B;
	Fri,  6 Jan 2023 17:39:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8CBC1483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673023199;
	bh=EkGv2fAe4IZVtbYTynD17ofPqbrfLMHTNC1/01j67Zc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Bg8SMYM1eBzE2kZ2vuJg2FoexAVQmMBs6WDDUur4mlX0PI/m4bhz75xFnw0vk2DNR
	 tp8kksPecA3/5W7T0DtaZMBh2TG7Shp0dTFLPjl3eZALxUZ3aBeTRmx8qPCqFY5h2x
	 pbTprBV72hN2KWBnwG5Z2vPwhIxWK0Irb1w2GF3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94E1EF80543;
	Fri,  6 Jan 2023 17:38:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0DBCF8053D; Fri,  6 Jan 2023 17:38:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57DD1F8053D
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 17:38:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57DD1F8053D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bWdAElX6
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 5FC2910000B;
 Fri,  6 Jan 2023 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673023088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zHdG5dWGsORYS6XG1CcUMN1p2tcFBkBpXeEXIVWBo8Q=;
 b=bWdAElX63nV5KAJ3lRli5wH/z0GpLUVccEehfCFnrwsSnOjFjpJrHYugerQBdc7xuNRDeg
 e/gRypGCodVzNgI/7yw+pEHQY2fB4hE20o9otuqohv0QxUG2+IdbRPnS6DsrexRdu4aorm
 PfSxcZpAqaIiVw9gJoEJYamqYN46Hw2Rp4VCDj3iT7qpnQulPL4vskv7xFGh0c8/WUVDrz
 vy7IVWjynd8eqxYxbdg/n0ZDSfJflU45u3idxmMIK8Hw+aygdcEkOaG8dQaxtt9lC9VYwd
 WXteZg5jAX5U7B7+z7mm+aPcXe2Et/F9xwPgKqXKhAAmQRdsrW9essLYrvr6Cg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v2 04/10] powerpc/8xx: Use a larger CPM1 command check mask
Date: Fri,  6 Jan 2023 17:37:40 +0100
Message-Id: <20230106163746.439717-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230106163746.439717-1-herve.codina@bootlin.com>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The CPM1 command mask is defined for use with the standard
CPM1 command register as described in the user's manual:
  0  |1        3|4    7|8   11|12      14| 15|
  RST|    -     |OPCODE|CH_NUM|     -    |FLG|

In the QMC extension the CPM1 command register is redefined
(QMC supplement user's manuel) with the following mapping:
  0  |1        3|4    7|8           13|14| 15|
  RST|QMC OPCODE|  1110|CHANNEL_NUMBER| -|FLG|

Extend the check command mask in order to support both the
standard CH_NUM field and the QMC extension CHANNEL_NUMBER
field.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 arch/powerpc/platforms/8xx/cpm1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
index 8ef1f4392086..6b828b9f90d9 100644
--- a/arch/powerpc/platforms/8xx/cpm1.c
+++ b/arch/powerpc/platforms/8xx/cpm1.c
@@ -100,7 +100,7 @@ int cpm_command(u32 command, u8 opcode)
 	int i, ret;
 	unsigned long flags;
 
-	if (command & 0xffffff0f)
+	if (command & 0xffffff03)
 		return -EINVAL;
 
 	spin_lock_irqsave(&cmd_lock, flags);
-- 
2.38.1

