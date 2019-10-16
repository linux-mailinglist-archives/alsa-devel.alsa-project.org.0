Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A226D91DC
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 15:01:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DED541615;
	Wed, 16 Oct 2019 15:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DED541615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571230895;
	bh=nbmj3eQGKACSv+hxYkLt1C0NppDO3vVj5hKI1Ia6bns=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bs20ko3Uho9Kssd5jVFNyrZBSNqfTBPX8bUmY1iztywix8sChrYH8h0OFWGKDn3On
	 d4F4sIFmV3XUzXKABbIyk23Ijs+jzcGi2vVeB4DKIGbV53YUFaiD1tbjfG7EV5i6un
	 aUpKjBsX7rtTikiFxLuRXbeIoxTbty51Ajeo1TkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AC85F80635;
	Wed, 16 Oct 2019 14:58:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83EE5F805FD; Wed, 16 Oct 2019 14:58:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2561F80376
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 14:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2561F80376
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="QjhkP2r7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=i4IFev4hoNhLiHnNyOc0tlmnPsToq3hWRFR2YG1XIyg=; b=QjhkP2r7bmJB
 KWZo00DROulH/agljegaAJ0/6sVz+AsO89Vle/6GSYlbIRiePP6SDjZZrUh6zoNvtaPl12GoPNn7R
 BLLhq3LQIsIxCpK/ipX0QfYHV8zNOBo+uJF0lnOtSl14LuzqbtRUZbRQNDU3Pv2/uEUQFlLvtQozk
 YAMFM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iKisY-0005MR-0T; Wed, 16 Oct 2019 12:58:14 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7502027428FD; Wed, 16 Oct 2019 13:58:13 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
In-Reply-To: <20191016120149.5860-1-ben.dooks@codethink.co.uk>
X-Patchwork-Hint: ignore
Message-Id: <20191016125813.7502027428FD@ypsilon.sirena.org.uk>
Date: Wed, 16 Oct 2019 13:58:13 +0100 (BST)
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [alsa-devel] Applied "ASoC: wm8958: use <asm/unaligned.h> to
	simplify code" to the asoc tree
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

The patch

   ASoC: wm8958: use <asm/unaligned.h> to simplify code

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 3ad00f6a5f76d4030a3c712fabe0cf69920925fc Mon Sep 17 00:00:00 2001
From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Date: Wed, 16 Oct 2019 13:01:49 +0100
Subject: [PATCH] ASoC: wm8958: use <asm/unaligned.h> to simplify code

Simplify the memcpy/be32_to_cpu() code by simply using
get_unaligned_be32() throughout and makes the code nicer
to look at.

This fixes the following warnings from sparse:

sound/soc/codecs/wm8958-dsp2.c:62:26: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:62:26: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:62:26: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:62:26: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:62:26: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:62:26: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:69:15: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:69:15: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:69:15: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:69:15: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:69:15: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:69:15: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:72:18: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:72:18: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:72:18: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:72:18: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:72:18: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:72:18: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
sound/soc/codecs/wm8958-dsp2.c:108:29: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:108:29: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:108:29: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:108:29: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:108:29: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:108:29: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:120:26: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:120:26: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:120:26: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:120:26: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:120:26: warning: cast to restricted __be32
sound/soc/codecs/wm8958-dsp2.c:120:26: warning: cast to restricted __be32

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20191016120149.5860-1-ben.dooks@codethink.co.uk
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8958-dsp2.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wm8958-dsp2.c b/sound/soc/codecs/wm8958-dsp2.c
index 18535b326680..ca42445b649d 100644
--- a/sound/soc/codecs/wm8958-dsp2.c
+++ b/sound/soc/codecs/wm8958-dsp2.c
@@ -25,6 +25,8 @@
 #include <linux/mfd/wm8994/pdata.h>
 #include <linux/mfd/wm8994/gpio.h>
 
+#include <asm/unaligned.h>
+
 #include "wm8994.h"
 
 #define WM_FW_BLOCK_INFO 0xff
@@ -58,18 +60,15 @@ static int wm8958_dsp2_fw(struct snd_soc_component *component, const char *name,
 	}
 
 	if (memcmp(fw->data, "WMFW", 4) != 0) {
-		memcpy(&data32, fw->data, sizeof(data32));
-		data32 = be32_to_cpu(data32);
+		data32 = get_unaligned_be32(fw->data);
 		dev_err(component->dev, "%s: firmware has bad file magic %08x\n",
 			name, data32);
 		goto err;
 	}
 
-	memcpy(&data32, fw->data + 4, sizeof(data32));
-	len = be32_to_cpu(data32);
+	len = get_unaligned_be32(fw->data + 4);
+	data32 = get_unaligned_be32(fw->data + 8);
 
-	memcpy(&data32, fw->data + 8, sizeof(data32));
-	data32 = be32_to_cpu(data32);
 	if ((data32 >> 24) & 0xff) {
 		dev_err(component->dev, "%s: unsupported firmware version %d\n",
 			name, (data32 >> 24) & 0xff);
@@ -87,9 +86,8 @@ static int wm8958_dsp2_fw(struct snd_soc_component *component, const char *name,
 	}
 
 	if (check) {
-		memcpy(&data64, fw->data + 24, sizeof(u64));
-		dev_info(component->dev, "%s timestamp %llx\n",
-			 name, be64_to_cpu(data64));
+		data64 = get_unaligned_be64(fw->data + 24);
+		dev_info(component->dev, "%s timestamp %llx\n",  name, data64);
 	} else {
 		snd_soc_component_write(component, 0x102, 0x2);
 		snd_soc_component_write(component, 0x900, 0x2);
@@ -104,8 +102,7 @@ static int wm8958_dsp2_fw(struct snd_soc_component *component, const char *name,
 			goto err;
 		}
 
-		memcpy(&data32, data + 4, sizeof(data32));
-		block_len = be32_to_cpu(data32);
+		block_len = get_unaligned_be32(data + 4);
 		if (block_len + 8 > len) {
 			dev_err(component->dev, "%zd byte block longer than file\n",
 				block_len);
@@ -116,8 +113,7 @@ static int wm8958_dsp2_fw(struct snd_soc_component *component, const char *name,
 			goto err;
 		}
 
-		memcpy(&data32, data, sizeof(data32));
-		data32 = be32_to_cpu(data32);
+		data32 = get_unaligned_be32(data);
 
 		switch ((data32 >> 24) & 0xff) {
 		case WM_FW_BLOCK_INFO:
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
