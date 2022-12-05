Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42728642ACC
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 15:58:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1E0D176E;
	Mon,  5 Dec 2022 15:57:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1E0D176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670252303;
	bh=dNM/0YXwfp05l/lxyUVBgcbndeF0g/Y53eL74iUMyH0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xw9P4QSWSKccHFX88mnhS3CT/dq0VVeOh0IF5lufl5hvrWilVSOIpVdzgsCbZDW5a
	 +qY/adi7iQBG0/HrNtnNe5J59ZTjNMadc5ULUtAGPGjErAD7xkcuhlRPU3Rr5OzpAn
	 Dg/PcYVhKRDO4ShVv08v+zXirqrQUu2UlnRqFF3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 752D5F800BD;
	Mon,  5 Dec 2022 15:57:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91393F80236; Mon,  5 Dec 2022 15:57:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C10F3F80155
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 15:57:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C10F3F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MSnMzBqC"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B54uh1Z015435; Mon, 5 Dec 2022 08:57:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=c7x/qQVbB5y+L+elrUKFfYzMACzD6HbBUpL317TwXgQ=;
 b=MSnMzBqCbWx1sWMn05rAdoeNlhDXqpHquTzf3bLr+aPvqjwcSCH8Z5Pg4k4Ojve/wiiu
 tFNE8bLvP1wu5aXmvFxb0Y1fqBEaINtoDnyMdPip5/nM+ljvNKHRKfBnx4ODdqSO4kBg
 kAcCg8cgydPzhS8EOZ0ZP4pFPaAKD4hKUmuauB4aOL1DhZzHHA5HCEzveC4qASi7u/nD
 QbKVFsT7+AY6YpOJ+QOgWSbM0mH2footCrcuZuYhfEqXnmGRAq2fpp3tBYnlR0DtSq6l
 UV49Ns5Nv03kFeOLZ5vVDURnDsLHibl11mXuidBNu8hd+QaA+Sg75XChQCRZSzb3VQsP CA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3m83rt9vr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Dec 2022 08:57:15 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 5 Dec
 2022 08:57:14 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Mon, 5 Dec 2022 08:57:14 -0600
Received: from legion.ad.cirrus.com (londmb751293.ad.cirrus.com
 [198.90.238.109])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CCF48B12;
 Mon,  5 Dec 2022 14:57:13 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: hda/cirrus: Add extra 10 ms delay to allow PLL settle
 and lock.
Date: Mon, 5 Dec 2022 14:57:13 +0000
Message-ID: <20221205145713.23852-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fyBzRj7SDDWKls60G-AfQoMavE1CEUKO
X-Proofpoint-GUID: fyBzRj7SDDWKls60G-AfQoMavE1CEUKO
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

New HW platforms with multiple CS42L42 parts, faster CPU and i2c
requre some extra delay to allow PLL to settle and lock. Adding
extra 10ms delay.

Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 754aa8ddd2e4..0ba1fbcbb21e 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -888,7 +888,7 @@ static void cs42l42_resume(struct sub_codec *cs42l42)
 
 	/* Initialize CS42L42 companion codec */
 	cs8409_i2c_bulk_write(cs42l42, cs42l42->init_seq, cs42l42->init_seq_num);
-	usleep_range(20000, 25000);
+	usleep_range(30000, 35000);
 
 	/* Clear interrupts, by reading interrupt status registers */
 	cs8409_i2c_bulk_read(cs42l42, irq_regs, ARRAY_SIZE(irq_regs));
-- 
2.34.1

