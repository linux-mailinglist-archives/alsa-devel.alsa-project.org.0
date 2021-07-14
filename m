Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4EC3C7B15
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 03:32:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 796F4169A;
	Wed, 14 Jul 2021 03:31:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 796F4169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626226344;
	bh=Xs3Jemi2rq7XXMytV8JplIB/loUWYG1pYPA/65laKhU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JaEQD5cfECLIyHA1j9AnVNIPR/I78DA2ZVyzsHimHlSzg1KnevuHxglA7LPCxIkpo
	 Go0zArBOepKz/28vuFyrXdaG8HCBL6RSHwpRl4sJffI7nowtr0/PTTgBVUd9a0j3Qa
	 EvVncBRFQL8qE2Ur/KOwigWDMV7Fe594fPEx1YmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7FA5F800ED;
	Wed, 14 Jul 2021 03:30:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9856F80217; Wed, 14 Jul 2021 03:30:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFF01F800ED
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 03:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFF01F800ED
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="190646659"
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; d="scan'208";a="190646659"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 18:30:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; d="scan'208";a="570947946"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 18:30:38 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: dmi-quirks: add ull suffix for SoundWire _ADR
 values
Date: Wed, 14 Jul 2021 09:30:27 +0800
Message-Id: <20210714013027.17022-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Sparse throws the following type of warnings:

drivers/soundwire/dmi-quirks.c:25:17: error: constant
0x000010025D070100 is so big it is long

Let's add the 'ull' suffix to make this go away and find real issues.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/dmi-quirks.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 5db0a2443a1d..1ac16687e315 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -22,12 +22,12 @@ struct adr_remap {
  */
 static const struct adr_remap hp_spectre_360[] = {
 	{
-		0x000010025D070100,
-		0x000020025D071100
+		0x000010025D070100ull,
+		0x000020025D071100ull
 	},
 	{
-		0x000110025d070100,
-		0x000120025D130800
+		0x000110025d070100ull,
+		0x000120025D130800ull
 	},
 	{}
 };
@@ -39,18 +39,18 @@ static const struct adr_remap hp_spectre_360[] = {
 static const struct adr_remap dell_sku_0A3E[] = {
 	/* rt715 on link0 */
 	{
-		0x00020025d071100,
-		0x00021025d071500
+		0x00020025d071100ull,
+		0x00021025d071500ull
 	},
 	/* rt711 on link1 */
 	{
-		0x000120025d130800,
-		0x000120025d071100,
+		0x000120025d130800ull,
+		0x000120025d071100ull,
 	},
 	/* rt1308 on link2 */
 	{
-		0x000220025d071500,
-		0x000220025d130800
+		0x000220025d071500ull,
+		0x000220025d130800ull
 	},
 	{}
 };
-- 
2.17.1

