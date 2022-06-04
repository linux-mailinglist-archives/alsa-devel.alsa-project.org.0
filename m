Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DECE53D676
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jun 2022 12:54:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BF171865;
	Sat,  4 Jun 2022 12:53:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BF171865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654340039;
	bh=aQWGVz14tVMgdX2bV3/UpFILqPAYToEPDjNPLV6X1FY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nuZ2Fz16GFDen9DCCzq1H3kqVdRM14hLBZvNKz283X4xym48AVW+e9PRx4RpOObst
	 lEHap1nEjY7hkq3NKKO9mkraerQnGB1lEt6MRV5vh0bLtobcxwZyCB9VWAqGbgqhdU
	 lOTbjmbc3iQLI05QaZ3CbZF2IAQPkMwvtp7p5B7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 478CDF801EC;
	Sat,  4 Jun 2022 12:53:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17DA3F8016D; Sat,  4 Jun 2022 12:53:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D05CF80124
 for <alsa-devel@alsa-project.org>; Sat,  4 Jun 2022 12:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D05CF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rHZfbumU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A2A160A50;
 Sat,  4 Jun 2022 10:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C546EC385B8;
 Sat,  4 Jun 2022 10:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654339973;
 bh=aQWGVz14tVMgdX2bV3/UpFILqPAYToEPDjNPLV6X1FY=;
 h=From:To:Cc:Subject:Date:From;
 b=rHZfbumUs6Zb6nrLIuPMV+r/znrwoNuooS+3YziSQ+vENkmN6w5iqEaeESr4u788r
 alh3l20mkVM2QQro6AAW0A39SdSG1oLMq5r4HzMr8UDv2VhpexNqf2/TEW55vDWxEZ
 RWfgau0E4mV1KrXm4IvE7a8pp5K5wxmAIHj0Bp0YWgp2yNNXJtqLlM6DlsN9To8BAk
 hB3URf6f+KJih9Zf6PgwuhfJ2TaJe8xJK4/fHyUAMu4pN9hZSxiNhPqxueUtAltO/C
 OWPtUoCsWvXxyyUEJqYeKkrC0dsEq2OgxOvnhO4RhHCUUKPCbz/ClBNRKhvnI/N2z+
 TO8Xg20HTkCNw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: ops: Fix off by one in range control validation
Date: Sat,  4 Jun 2022 11:52:46 +0100
Message-Id: <20220604105246.4055214-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005; h=from:subject;
 bh=aQWGVz14tVMgdX2bV3/UpFILqPAYToEPDjNPLV6X1FY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimy6LDNp0ebSWX6Wle08hLwX2sDK/ccNv0HllhgXp
 mCBHdiWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpsuiwAKCRAk1otyXVSH0MDTB/
 9qTMwUCGLhwV8pF6Q4+7bnSJpPAW0t/t0ATTkHFJ3O4MG+nTtko5S0h3L6I/8+5wm4mdVtZ4C9jTh5
 s20YTf4ucsaMOALzef4apLTTHy6mDPqZqq04BzT7VKOWwXKAXtTJw6rLt2qqtiMCONUzSnryLiGRQt
 31SqVctrl9Nxysmn3bP1qovsm4m5xAXMLWHaBSgpGp8fF7de8wAfe4E/MDd+iQeU5MwkxoUjhnfP0P
 B/3X498J+J60yc3qrQIKaH53yPuPn45rQwnBDUGFmOzb2dqbr5BkNrCm6EVrOxbUUHxEBpBSIjHWSv
 gTOrRbXnlaHmEo/L9g16TJNei83WEW
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

We currently report that range controls accept a range of 0..(max-min) but
accept writes in the range 0..(max-min+1). Remove that extra +1.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 93e72a016b4d..e11109dcaa50 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -542,7 +542,7 @@ int snd_soc_put_volsw_range(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	if (mc->platform_max && tmp > mc->platform_max)
 		return -EINVAL;
-	if (tmp > mc->max - mc->min + 1)
+	if (tmp > mc->max - mc->min)
 		return -EINVAL;
 
 	if (invert)
@@ -563,7 +563,7 @@ int snd_soc_put_volsw_range(struct snd_kcontrol *kcontrol,
 			return -EINVAL;
 		if (mc->platform_max && tmp > mc->platform_max)
 			return -EINVAL;
-		if (tmp > mc->max - mc->min + 1)
+		if (tmp > mc->max - mc->min)
 			return -EINVAL;
 
 		if (invert)
-- 
2.30.2

