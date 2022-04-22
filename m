Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1C350B1C8
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 09:40:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D4D51718;
	Fri, 22 Apr 2022 09:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D4D51718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650613252;
	bh=sad6W7fSsklcw+UfZSdqvXQD6rkLhymaGEPnnZRSXB8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IyxhB9ah1YOjFxFZSrKZzOf5n86qv5dabM1rFS6ywYwfmNknX4FuloBG9pOyDS3D4
	 bAJ7BtCv3fERBHqBbhW8NhSHWqjJs6WzRJB8z+KxtMz0wQcCTk6cVtuuDq8RenrZmo
	 O52VMzkHpY2ZF7nXTqbkOzptNX8dQBP2YR147cXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23F55F80249;
	Fri, 22 Apr 2022 09:39:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D22FEF80245; Fri, 22 Apr 2022 09:39:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA829F800D1
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 09:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA829F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="ClhivhJz"
Received: from localhost.localdomain (unknown [123.112.65.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 83A3A3F776; 
 Fri, 22 Apr 2022 07:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1650613185;
 bh=DuRiumab7zYn7BMLUjK5U9ntoOKgstDPwsQqBhHpL7g=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=ClhivhJzBOMVbiNj0h8nRKOQCatd/iTJU9YvPfe0DOHNbCZJ92qmjxv/CpY19700V
 p5AX8O8dJ7h9d+hYsR7OuywJ1Eb38Fngq9htTQ6CRXIBPzjACQXf3WKyJIbF69xcen
 q1ZfuvuB5vJrLSzlXTzay5QBy2BOjY+M6QEEfUHVYyPLXN76kkPKzsiGJWcD3EERiw
 u62TkVA+r9zBCgyjc7pfvhpypf8XgBfaGFPkjehwR71cJB8FLtPX9vgIvU4UcBtMF3
 yteyhYA01sgp1yXqZDoHTo7/auGGXfL2/SbK6xgq8/Kyp0z65hsF1zgmgDxIlsfFUG
 6FvzlKUpnRLXg==
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda/realtek: Fix mute led issue on thinkpad with
 cs35l41 s-codec
Date: Fri, 22 Apr 2022 15:39:37 +0800
Message-Id: <20220422073937.10073-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The quirk ALC287_FIXUP_CS35L41_I2C_2 needs to chain the quirk
ALC269_FIXUP_THINKPAD_ACPI, otherwise the mute led will not work if a
thinkpad machine applies that quirk.

And it will be safe if non-thinkpad machines apply that quirk since
hda_fixup_thinkpad_acpi() will check and return in this case.

Fixes: ae7abe36e352e ("ALSA: hda/realtek: Add CS35L41 support for Thinkpad laptops")
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4c0c593f3c0a..f9c3b2c9ca12 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8769,6 +8769,8 @@ static const struct hda_fixup alc269_fixups[] = {
 	[ALC287_FIXUP_CS35L41_I2C_2] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cs35l41_fixup_i2c_two,
+		.chained = true,
+		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
 	},
 	[ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED] = {
 		.type = HDA_FIXUP_FUNC,
-- 
2.25.1

