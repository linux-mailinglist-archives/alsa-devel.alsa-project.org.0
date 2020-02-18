Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B859162D7B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 18:53:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A0D71694;
	Tue, 18 Feb 2020 18:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A0D71694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582048421;
	bh=f1yNsqqIEzC4tLmhFUc7dfyzBWTwzWSs2zLIH33Kcd8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=spZ0BGfBC5JIJRYRVBh4xDjvdmgkOn3jAMDb+pu3NxjKL54cZPMW0Fi1MmJPAHF+2
	 CAhnGHbL0MuGX2eNNyNgRuOt8MtTwmnFKtK4udCjVpLndMGfLZ1iZk100Tvw1p29zO
	 83nZYic+qA5qfIo2ddUgfxA0iG6GR5b9WAOt/7O8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25D7BF8014A;
	Tue, 18 Feb 2020 18:52:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BEF0F80148; Tue, 18 Feb 2020 18:51:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D3C1F800C4
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 18:51:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D3C1F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BN62NlEe"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01IHpoGQ103137;
 Tue, 18 Feb 2020 11:51:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582048310;
 bh=PuA4lp0vWBawbRTqquXmnDVxz/+5+Ur4nUGMOB158wg=;
 h=From:To:CC:Subject:Date;
 b=BN62NlEesb/og7GSjvvQguq3PWnnsF5osuYSqH2RYeQObxQfn6nDS10ijhZB8qamc
 RVvXkPx5UZitO7EoI7glDl5lV0jBKPV7ozTdZ6AnJatxsv+UhU2ZkCqG/UlAEqjr2J
 E+DgWHQHIYC+hve0URXUfrRZQg4aJ8uBnCZ9Dp/M=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01IHpo3V101686;
 Tue, 18 Feb 2020 11:51:50 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 18
 Feb 2020 11:51:50 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 18 Feb 2020 11:51:50 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01IHpnxc078086;
 Tue, 18 Feb 2020 11:51:49 -0600
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH] ASoC: tas2562: Return invalid for when bitwidth is invalid
Date: Tue, 18 Feb 2020 11:47:06 -0600
Message-ID: <20200218174706.27309-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
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

If the bitwidth passed in to the set_bitwidth function is not supported
then return an error.

Fixes: 29b74236bd57 ("ASoC: tas2562: Introduce the TAS2562 amplifier")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 scripts/conmakehash        | Bin 0 -> 13120 bytes
 scripts/sortextable        | Bin 0 -> 18040 bytes
 sound/soc/codecs/tas2562.c |   3 ++-
 3 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100755 scripts/conmakehash
 create mode 100755 scripts/sortextable

diff --git a/scripts/conmakehash b/scripts/conmakehash
new file mode 100755
index 0000000000000000000000000000000000000000..17eec37019b8ae45f42f3c82046d1a55a6f69cb3
GIT binary patch
literal 13120
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

literal 0
HcmV?d00001

diff --git a/scripts/sortextable b/scripts/sortextable
new file mode 100755
index 0000000000000000000000000000000000000000..94919d95f0cd507c22297412abe299905e09d2a3
GIT binary patch
literal 18040
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

literal 0
HcmV?d00001

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 729acd874c48..5b4803a76719 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -215,7 +215,8 @@ static int tas2562_set_bitwidth(struct tas2562_data *tas2562, int bitwidth)
 		break;
 
 	default:
-		dev_info(tas2562->dev, "Not supported params format\n");
+		dev_info(tas2562->dev, "Unsupported bitwidth format\n");
+		return -EINVAL;
 	}
 
 	ret = snd_soc_component_update_bits(tas2562->component,
-- 
2.25.0

