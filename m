Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 495C8262F61
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 15:53:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3C03171F;
	Wed,  9 Sep 2020 15:52:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3C03171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599659587;
	bh=gTz0gPHOiW2tCDkuV+0GcmXwF5l+3JuuhN/rzonFxvk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FH80ZPMJ/dj4rjaP16FkDkLlBMCJg2UWT3azdJavznFbxvUX2NKqtrmCee2FXVjd8
	 cWaZyt1aJ1DcL2oKLspSo28IoVXo8t9dVudMvY7xdQiWjhBO1BgrPOM4U+utBrJmFD
	 useW2azjA6rogvt7V2JQCClVPC84w62C8/Xy5wGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08240F802DD;
	Wed,  9 Sep 2020 15:50:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12683F802DC; Wed,  9 Sep 2020 15:49:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2489F8028D
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 15:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2489F8028D
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1F16DD5670B8A6110164;
 Wed,  9 Sep 2020 21:49:36 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Sep 2020
 21:49:29 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH 09/19] ALSA: pci/asihpi: Remove unused function
 hpi_stream_group_get_map()
Date: Wed, 9 Sep 2020 21:49:27 +0800
Message-ID: <20200909134927.33964-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
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

There is no caller in tree, so can remove it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/pci/asihpi/asihpi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 35e76480306e..8bacd4f47540 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -258,15 +258,6 @@ static inline u16 hpi_stream_group_reset(u32 h_stream)
 		return hpi_instream_group_reset(h_stream);
 }
 
-static inline u16 hpi_stream_group_get_map(
-				u32 h_stream, u32 *mo, u32 *mi)
-{
-	if (hpi_handle_object(h_stream) ==  HPI_OBJ_OSTREAM)
-		return hpi_outstream_group_get_map(h_stream, mo, mi);
-	else
-		return hpi_instream_group_get_map(h_stream, mo, mi);
-}
-
 static u16 handle_error(u16 err, int line, char *filename)
 {
 	if (err)
-- 
2.17.1


