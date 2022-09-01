Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC005AA793
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Sep 2022 08:03:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 165701634;
	Fri,  2 Sep 2022 08:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 165701634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662098632;
	bh=VetbOzof6aLXxmltfifFTKX6aMKDbev/eE8VPkjVHsg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YkioOZovfevIIZUSyygkqtihYH2W9rQBD+02JGtkLOaritmvGpna9XRW4W0f2swGO
	 mQW+fSkMEcFhyz5w6T3BTqEggh7Imt6NWl0MsbEV5/6EZH40Ep0EJyXlxTgJs9NWw3
	 d8wsHEiTY6MFnU6G3SX2B6tNnwcu9HhD8n7hQ64o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 883A1F80125;
	Fri,  2 Sep 2022 08:02:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2ADFF8026D; Thu,  1 Sep 2022 12:28:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE9CBF800EB
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 12:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE9CBF800EB
Received: from localhost.localdomain (unknown [83.149.199.65])
 by mail.ispras.ru (Postfix) with ESMTPSA id E5B9B40D403D;
 Thu,  1 Sep 2022 10:28:31 +0000 (UTC)
From: Valentina Goncharenko <goncharenko.vp@ispras.ru>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: asihpi - Remove useless code in hpi_meter_get_peak()
Date: Thu,  1 Sep 2022 13:28:14 +0300
Message-Id: <20220901102814.131855-1-goncharenko.vp@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Sep 2022 08:02:51 +0200
Cc: ldv-project@linuxtesting.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Valentina Goncharenko <goncharenko.vp@ispras.ru>, linux-kernel@vger.kernel.org,
 Eliot Blennerhassett <eblennerhassett@audioscience.com>
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

The hpi_meter_get_peak() function contains the expression
"hm.obj_index = hm.obj_index", which does not carry any semantic load.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 719f82d3987a ("ALSA: Add support of AudioScience ASI boards")
Signed-off-by: Valentina Goncharenko <goncharenko.vp@ispras.ru>
---
 sound/pci/asihpi/hpifunc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/pci/asihpi/hpifunc.c b/sound/pci/asihpi/hpifunc.c
index 1de05383126a..24047fafef51 100644
--- a/sound/pci/asihpi/hpifunc.c
+++ b/sound/pci/asihpi/hpifunc.c
@@ -2020,7 +2020,6 @@ u16 hpi_meter_get_peak(u32 h_control, short an_peakdB[HPI_MAX_CHANNELS]
 		HPI_CONTROL_GET_STATE);
 	if (hpi_handle_indexes(h_control, &hm.adapter_index, &hm.obj_index))
 		return HPI_ERROR_INVALID_HANDLE;
-	hm.obj_index = hm.obj_index;
 	hm.u.c.attribute = HPI_METER_PEAK;
 
 	hpi_send_recv(&hm, &hr);
-- 
2.25.1

