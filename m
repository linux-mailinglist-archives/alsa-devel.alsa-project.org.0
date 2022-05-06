Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0568651CF24
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 04:58:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93418183A;
	Fri,  6 May 2022 04:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93418183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651805937;
	bh=K82sd0QdihiTRy0qOlPEEnK/DK4+XvMs8LHZXINQ6ZI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YoAKQkKPwBokRGuYUoVjfabRnUUE57TMiW/R3d3h1qpHOLTyvlnlY0cTrRfq4/1Z/
	 EnstoJ0NB8Re9shVqsVOg4P5aXA/FnRnW4yy5gIIVwqGScsYEBy+fCw6ebPuQSoFv5
	 Eu4mgzKUwhdp+NZaewMexn8y6Mzs0cTpSmocJKU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C87DF80171;
	Fri,  6 May 2022 04:57:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A5A9F8014B; Fri,  6 May 2022 04:57:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-m17657.qiye.163.com (mail-m17657.qiye.163.com
 [59.111.176.57])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 293AFF800D3
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 04:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 293AFF800D3
Received: from book-Convertible.. (unknown [171.83.5.166])
 by mail-m17657.qiye.163.com (Hmail) with ESMTPA id E3BE4280687;
 Fri,  6 May 2022 10:57:39 +0800 (CST)
From: bo liu <bo.liu@senarytech.com>
To: tiwai@suse.com,
	perex@perex.cz
Subject: [PATCH] add a new hda codec SN6140
Date: Fri,  6 May 2022 10:57:35 +0800
Message-Id: <20220506025735.17731-1-bo.liu@senarytech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUMfH09WSxhOSB8aHkkYSk
 oeVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nyo6Kxw5DT05MggoGDQMLAod
 MUMaCThVSlVKTU5KQ0tOQ01LT0JKVTMWGhIXVRkUVRcSDjsIHhUaCQIPHhgTVRgUFkVZV1kSC1lB
 WUpMSlVDSFVOVUpNTVlXWQgBWUFKTUpPNwY+
X-HM-Tid: 0a80974d30f3da03kuwse3be4280687
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bo liu <bo.liu@senarytech.com>
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

The current kernel does not support the SN6140 codec chip.
Add the SN6140 codec configuration item to kernel.

Signed-off-by: bo liu <bo.liu@senarytech.com>
---
 sound/pci/hda/patch_conexant.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 0515137a75b0..aa360a0af284 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -1105,6 +1105,7 @@ static int patch_conexant_auto(struct hda_codec *codec)
 
 static const struct hda_device_id snd_hda_id_conexant[] = {
 	HDA_CODEC_ENTRY(0x14f11f86, "CX8070", patch_conexant_auto),
+	HDA_CODEC_ENTRY(0x14f11f87, "SN6140", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f12008, "CX8200", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f120d0, "CX11970", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f15045, "CX20549 (Venice)", patch_conexant_auto),
-- 
2.34.1

