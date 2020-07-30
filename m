Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C0323344F
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 16:26:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC274177E;
	Thu, 30 Jul 2020 16:25:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC274177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596119181;
	bh=4GY3TnLCNBSy7Cu1xvpU0dcwNnwNMFtY57bUH90+q7k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Eul6ejxmwUJYWgWTBiJ/+EzQlhzQlZSC7w6JMOypFHd+u1Tmd+QG76WxkICzWcT7z
	 /k0cpFHiv9nSanCwrJxsJoPO0ZbMj4bd6Nu8iYT1l7fRDq433N3xSwoT42WEK6QmX5
	 S5ChkOKT2niXQzvl40JfSqiQgdnTNr2ge0FRmL7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E556CF800C9;
	Thu, 30 Jul 2020 16:24:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03104F8012F; Thu, 30 Jul 2020 16:24:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC74BF8012F
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 16:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC74BF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="a/oIX2tA"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06UEOPK0120202;
 Thu, 30 Jul 2020 09:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1596119065;
 bh=Tg6ayNdN7O4/CjjcMHoaiFkUayvdOa+Ei5rN0VtBwB0=;
 h=From:To:CC:Subject:Date;
 b=a/oIX2tA3Vi6briZJB3wH4zAU3Zt3eBiB+n1ONHq1Ll6fOMCQFdMWp0/MzhzeaTm3
 4AXIBI1C+WSF7jbC32W4mjIUwMRlVIY6NPTwdWV4Hz2QnxL/3ISIfxR8C0qXmZSPF7
 fCUqc8tRxkE0fKe+MUVONtAwffct2GAyldawBDPg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06UEOPdS075710
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 Jul 2020 09:24:25 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 30
 Jul 2020 09:24:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 30 Jul 2020 09:24:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06UEOPlG115124;
 Thu, 30 Jul 2020 09:24:25 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 1/2] ASoC: tlv320adcx140: Fix GPO register start address
Date: Thu, 30 Jul 2020 09:24:18 -0500
Message-ID: <20200730142419.28205-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
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

The header was updated to align with the data sheet to start the GPO_CFG
at GPO_CFG0.  The code was not updated to the change and therefore the
GPO_CFG0 register was not written to.

Fixes: 6617cff6a05e ("ASoC: tlv320adcx140: Add GPO configuration and drive output config")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tlv320adcx140.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 7bb9e9aa0c0a..fc7616dcf9b5 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -790,7 +790,7 @@ static int adcx140_configure_gpo(struct adcx140_priv *adcx140)
 
 		gpo_output_val = gpo_outputs[0] << ADCX140_GPO_SHIFT |
 				 gpo_outputs[1];
-		ret = regmap_write(adcx140->regmap, ADCX140_GPO_CFG1 + i,
+		ret = regmap_write(adcx140->regmap, ADCX140_GPO_CFG0 + i,
 				   gpo_output_val);
 		if (ret)
 			return ret;
-- 
2.28.0

