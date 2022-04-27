Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97432511B9D
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 17:09:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D3421686;
	Wed, 27 Apr 2022 17:08:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D3421686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651072157;
	bh=4e9HjzOmSHrItCwfRCtxRCFuv/eUkSNZcEb1t9OTmSk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dy893TmyfYk0VJZd7UT+uePO4EmA6/UBVnZx5bEbXjE0yhZbtMjUVlUEZ1tafjTkl
	 JJNkrxlOPi5qwn/6HII9JZQpVVTU6qrdBKoPtn57JjOuioMqjwivQZaZZsnO5CliAR
	 4YxaUCZpSzfeIcgQV5LUs3LMilePdfdMW6sD2DN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCDE2F80100;
	Wed, 27 Apr 2022 17:07:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 656EDF8051A; Wed, 27 Apr 2022 17:07:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0682FF80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 17:07:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0682FF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="qTUG25Yl"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23RBg6q9022428;
 Wed, 27 Apr 2022 10:07:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=XVCfOf6hJlgIzYiqsHcHFyp8cFTHvQ62xx1M2B+16kQ=;
 b=qTUG25Yl1P6vcGET5FF6wSUEoZw+vfUQYV5bmMKw7t/s6O3FNVUnJcbAJyowBW5q3nA1
 zOipFdJWFNlTjNCwCpU4egQHaPGYiRQClqvIU5G2nlDeDXIdxIIsVpiowZ1i1pH38FNp
 HRqenkYwgJ2fH9MJQFLjOZreS5VPl/o+M9SzVQomFGSHSemRsMWI9w4hiOq7LiZUZArW
 VsSo0ryTx01gjdWiLAIR1RhV99mq2zSy13rGlOwJfsQ+oKT3WJ+CFEhITW/Al+JaDiI2
 gRNgH9kdQxzZ1PNUj3a/3a+N3uUSFz+yd5l+QzbLOsaMDyYPa7U4TxkBe78ed2X5FEDl Sg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fprt60xte-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 27 Apr 2022 10:07:30 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 16:07:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 27 Apr 2022 16:07:21 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.170])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 53816B1A;
 Wed, 27 Apr 2022 15:07:21 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH 01/26] ALSA: hda: cs35l41: Fix error in spi cs35l41 hda driver
 name
Date: Wed, 27 Apr 2022 16:06:55 +0100
Message-ID: <20220427150720.9194-2-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
References: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: TKhh9rl7Yh5JO5S6LpvYbM0Zjy1bKnIE
X-Proofpoint-ORIG-GUID: TKhh9rl7Yh5JO5S6LpvYbM0Zjy1bKnIE
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

For consistency, rename spi cs35l41 hda driver name so that
it matches i2c.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l41_hda_spi.c b/sound/pci/hda/cs35l41_hda_spi.c
index 50eb6c0e6658..22e088f28438 100644
--- a/sound/pci/hda/cs35l41_hda_spi.c
+++ b/sound/pci/hda/cs35l41_hda_spi.c
@@ -48,7 +48,7 @@ MODULE_DEVICE_TABLE(acpi, cs35l41_acpi_hda_match);
 
 static struct spi_driver cs35l41_spi_driver = {
 	.driver = {
-		.name		= "cs35l41_hda",
+		.name		= "cs35l41-hda",
 		.acpi_match_table = ACPI_PTR(cs35l41_acpi_hda_match),
 	},
 	.id_table	= cs35l41_hda_spi_id,
-- 
2.32.0

