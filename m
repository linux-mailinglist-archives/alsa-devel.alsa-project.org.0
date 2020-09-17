Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E64271D9B
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 10:12:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D65FC1685;
	Mon, 21 Sep 2020 10:11:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D65FC1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600675926;
	bh=6Sa3IG/J4vzk75z3wkwHH4wYWFHks7KOVx+jwsdi2TY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QHakli96br0nsJMz1fbLMemqCTm/bIyZhafwAa072e9eQY1pk95UVfGBcDzIe/LMm
	 giwxOMYt3CpJ8JD2zeczvL5x2S5bkdeHb7ZWh5ObftzZdcX2vpXXnVeml333xL2Jun
	 xyUIcXKp1KG83WEHruXj/D5BFov7WRYwJWf9VvLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACFCEF80171;
	Mon, 21 Sep 2020 10:10:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1C01F80212; Thu, 17 Sep 2020 09:56:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m17618.mail.qiye.163.com (m17618.mail.qiye.163.com
 [59.111.176.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE7FAF800E8
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 09:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE7FAF800E8
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.226])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id A3D604E17A0;
 Thu, 17 Sep 2020 15:56:18 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Wang Qing <wangqing@vivo.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] sound/pci/asihpi: fix spellint typo in comments
Date: Thu, 17 Sep 2020 15:55:52 +0800
Message-Id: <1600329372-2266-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGR8fS0kYS01CGEtOVkpNS0tISUJITENCT05VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PDI6Cio4Vj8vOBQ4HjgPMkM8
 FTcaCjJVSlVKTUtLSElCSExCSExPVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlJTVlXWQgBWUFKT01JNwY+
X-HM-Tid: 0a749b106c0d9376kuwsa3d604e17a0
X-Mailman-Approved-At: Mon, 21 Sep 2020 10:10:22 +0200
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

Change the comment typo: "ununsed" -> "unused".

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 sound/pci/asihpi/hpios.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/asihpi/hpios.h b/sound/pci/asihpi/hpios.h
index 26f7cf4..9e551bc
--- a/sound/pci/asihpi/hpios.h
+++ b/sound/pci/asihpi/hpios.h
@@ -67,7 +67,7 @@ struct hpi_ioctl_linux {
 };
 
 /* Conflict?: H is already used by a number of drivers hid, bluetooth hci,
-   and some sound drivers sb16, hdsp, emu10k. AFAIK 0xFC is ununsed command
+   and some sound drivers sb16, hdsp, emu10k. AFAIK 0xFC is unused command
 */
 #define HPI_IOCTL_LINUX _IOWR('H', 0xFC, struct hpi_ioctl_linux)
 
-- 
2.7.4

