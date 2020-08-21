Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E4424E01C
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 20:56:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D82961691;
	Fri, 21 Aug 2020 20:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D82961691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598036175;
	bh=NKXrLn2QqR1oWrDJefifdjrYxF45Ak2t79/sjDMab88=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aXhN0AMTH+0En6UklHi0EsR5XLe42H3+3s9aaCg1l1yoYOeikwbO7154PEgug5bp9
	 NjDAs5C2y/nvJoqv2x4LUui2jvlNukf9XvAPc92I9wKlP0hBwFM4BmqEjFgswD6PLe
	 Hr5YCdf1gdc+Omq5pr794X2j/J4PCx9BvWP8Xc7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F025F80255;
	Fri, 21 Aug 2020 20:53:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D2B5F80253; Fri, 21 Aug 2020 20:53:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15FBBF800D2
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 20:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15FBBF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hhuq0Hx4"
Received: by mail-qk1-x742.google.com with SMTP id j187so2253113qke.11
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 11:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lo2pPs5Z3dtcsHghWeXAbSPyEkVTw+1ChIKWljdMLdA=;
 b=hhuq0Hx4TJPHClzp9r74EhJLSdpuxu8ResuY2frq/hEdhYs4zdfv5NRfjUkFTHZ+S1
 iz58WdMPtsh9Y9D4F2mjX22GtYfGei9JE1D6+Oiu4BxB5M+ECpQDLolCDl+40q1SOH0m
 H5fmQAaikv4BqVKHN6qKr7P60TPef4ctDHwd7cuvcAOug38h4UXH6sll1Yg4+SdJihXy
 4c8U5Nvt4ln1ViHQRW7i1NdtST9Kr/vg3YG2524X9mdmSs6XWRBLKMErzO5U23z1aK5f
 FMAFo55F/G0UlnlL5q+mD2R4x0keZtNpjxw/vHLD5yJObLTS2ki1oWDHlbOjlo5hWA0R
 xryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lo2pPs5Z3dtcsHghWeXAbSPyEkVTw+1ChIKWljdMLdA=;
 b=Q+SsWvZlt26TE+fX1zsA+FLl3Fu7brUj4m3z0G8z3s/8Ceh62I8CcKlGYu68swUB6r
 pEMwBLPyT+N2llk6znSGarbXoZpHdh8XNhrrYfbmf6qJZ+Fq8KXVNYD9ql9ay0MF6w0e
 /y9umYhnvh08HiYW8RuNlTLKPIt2feC2q/1Rhahhosvsqcg4OSbO8lC085CYb3tVCQEc
 8VpyryhIB9UzyqlCzodylfguvbT7pTn3Z1sKk1ZwYPKMwFjQU5zVlgqeJzKQv8i4BIIi
 pYuk6o2gkSQ/dphHAGF7KfUGDfRoVHw0uPGEXnWTpLA2Kmpo4JJv5AyLp63AKENpLHav
 Yo8Q==
X-Gm-Message-State: AOAM530v9zDqP7lzpv9+HCOdtelCQhJ5pSjGrXAEtO8apk/7R/S0/sO7
 Bz21l9xJv5raRaWnS2tPG54=
X-Google-Smtp-Source: ABdhPJzfHeyDtR/Zz7BUePb7KVyMb+ysLTTOtkU1enog/lyv/qDAs4rhuFZUp4+drONrbrZ61Ni8yA==
X-Received: by 2002:a37:d201:: with SMTP id f1mr4008345qkj.188.1598036022319; 
 Fri, 21 Aug 2020 11:53:42 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id o72sm2468426qka.113.2020.08.21.11.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 11:53:41 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 01/20] ALSA: hda/ca0132 - Cleanup ca0132_mmio_init function.
Date: Fri, 21 Aug 2020 14:52:18 -0400
Message-Id: <20200821185239.26133-2-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200821185239.26133-1-conmanx360@gmail.com>
References: <20200821185239.26133-1-conmanx360@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, conmanx360@gmail.com,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
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

Cleanup the ca0132_mmio_init function, separating into two separate
functions, one for Sound Blaster Z/ZxR/Recon3D, and another for the
AE-5.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 158 ++++++++++++++++++++++-------------
 1 file changed, 99 insertions(+), 59 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index b7dbf2e7f77a..7491e2044638 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -8108,78 +8108,118 @@ static void r3di_pre_dsp_setup(struct hda_codec *codec)
  * what they do, or if they're necessary. Could possibly
  * be removed. Figure they're better to leave in.
  */
-static void ca0132_mmio_init(struct hda_codec *codec)
+static const unsigned int ca0113_mmio_init_address_sbz[] = {
+	0x400, 0x408, 0x40c, 0x01c, 0xc0c, 0xc00, 0xc04, 0xc0c, 0xc0c, 0xc0c,
+	0xc0c, 0xc08, 0xc08, 0xc08, 0xc08, 0xc08, 0xc04
+};
+
+static const unsigned int ca0113_mmio_init_data_sbz[] = {
+	0x00000030, 0x00000000, 0x00000003, 0x00000003, 0x00000003,
+	0x00000003, 0x000000c1, 0x000000f1, 0x00000001, 0x000000c7,
+	0x000000c1, 0x00000080
+};
+
+static const unsigned int ca0113_mmio_init_data_zxr[] = {
+	0x00000030, 0x00000000, 0x00000000, 0x00000003, 0x00000003,
+	0x00000003, 0x00000001, 0x000000f1, 0x00000001, 0x000000c7,
+	0x000000c1, 0x00000080
+};
+
+static const unsigned int ca0113_mmio_init_address_ae5[] = {
+	0x400, 0x42c, 0x46c, 0x4ac, 0x4ec, 0x43c, 0x47c, 0x4bc, 0x4fc, 0x408,
+	0x100, 0x410, 0x40c, 0x100, 0x100, 0x830, 0x86c, 0x800, 0x86c, 0x800,
+	0x804, 0x20c, 0x01c, 0xc0c, 0xc00, 0xc04, 0xc0c, 0xc0c, 0xc0c, 0xc0c,
+	0xc08, 0xc08, 0xc08, 0xc08, 0xc08, 0xc04, 0x01c
+};
+
+static const unsigned int ca0113_mmio_init_data_ae5[] = {
+	0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000001,
+	0x00000600, 0x00000014, 0x00000001, 0x0000060f, 0x0000070f,
+	0x00000aff, 0x00000000, 0x0000006b, 0x00000001, 0x0000006b,
+	0x00000057, 0x00800000, 0x00880680, 0x00000080, 0x00000030,
+	0x00000000, 0x00000000, 0x00000003, 0x00000003, 0x00000003,
+	0x00000001, 0x000000f1, 0x00000001, 0x000000c7, 0x000000c1,
+	0x00000080, 0x00880680
+};
+
+static void ca0132_mmio_init_sbz(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
+	unsigned int tmp[2], i, count, cur_addr;
+	const unsigned int *addr, *data;
 
-	if (ca0132_quirk(spec) == QUIRK_AE5)
-		writel(0x00000001, spec->mem_base + 0x400);
-	else
-		writel(0x00000000, spec->mem_base + 0x400);
+	addr = ca0113_mmio_init_address_sbz;
+	for (i = 0; i < 3; i++)
+		writel(0x00000000, spec->mem_base + addr[i]);
 
-	if (ca0132_quirk(spec) == QUIRK_AE5)
-		writel(0x00000001, spec->mem_base + 0x408);
-	else
-		writel(0x00000000, spec->mem_base + 0x408);
+	cur_addr = i;
+	switch (ca0132_quirk(spec)) {
+	case QUIRK_ZXR:
+		tmp[0] = 0x00880480;
+		tmp[1] = 0x00000080;
+		break;
+	case QUIRK_SBZ:
+		tmp[0] = 0x00820680;
+		tmp[1] = 0x00000083;
+		break;
+	case QUIRK_R3D:
+		tmp[0] = 0x00880680;
+		tmp[1] = 0x00000083;
+		break;
+	default:
+		tmp[0] = 0x00000000;
+		tmp[1] = 0x00000000;
+		break;
+	}
 
-	if (ca0132_quirk(spec) == QUIRK_AE5)
-		writel(0x00000001, spec->mem_base + 0x40c);
-	else
-		writel(0x00000000, spec->mem_base + 0x40C);
+	for (i = 0; i < 2; i++)
+		writel(tmp[i], spec->mem_base + addr[cur_addr + i]);
 
-	if (ca0132_quirk(spec) == QUIRK_ZXR)
-		writel(0x00880640, spec->mem_base + 0x01C);
-	else
-		writel(0x00880680, spec->mem_base + 0x01C);
+	cur_addr += i;
 
-	if (ca0132_quirk(spec) == QUIRK_AE5)
-		writel(0x00000080, spec->mem_base + 0xC0C);
-	else
-		writel(0x00000083, spec->mem_base + 0xC0C);
+	switch (ca0132_quirk(spec)) {
+	case QUIRK_ZXR:
+		count = ARRAY_SIZE(ca0113_mmio_init_data_zxr);
+		data = ca0113_mmio_init_data_zxr;
+		break;
+	default:
+		count = ARRAY_SIZE(ca0113_mmio_init_data_sbz);
+		data = ca0113_mmio_init_data_sbz;
+		break;
+	}
 
-	writel(0x00000030, spec->mem_base + 0xC00);
-	writel(0x00000000, spec->mem_base + 0xC04);
+	for (i = 0; i < count; i++)
+		writel(data[i], spec->mem_base + addr[cur_addr + i]);
+}
 
-	if (ca0132_quirk(spec) == QUIRK_AE5)
-		writel(0x00000000, spec->mem_base + 0xC0C);
-	else
-		writel(0x00000003, spec->mem_base + 0xC0C);
+static void ca0132_mmio_init_ae5(struct hda_codec *codec)
+{
+	struct ca0132_spec *spec = codec->spec;
+	const unsigned int *addr, *data;
+	unsigned int i, count;
 
-	writel(0x00000003, spec->mem_base + 0xC0C);
-	writel(0x00000003, spec->mem_base + 0xC0C);
-	writel(0x00000003, spec->mem_base + 0xC0C);
+	addr = ca0113_mmio_init_address_ae5;
+	data = ca0113_mmio_init_data_ae5;
+	count = ARRAY_SIZE(ca0113_mmio_init_data_ae5);
 
-	if (ca0132_quirk(spec) == QUIRK_AE5)
-		writel(0x00000001, spec->mem_base + 0xC08);
-	else
-		writel(0x000000C1, spec->mem_base + 0xC08);
+	for (i = 0; i < count; i++)
+		writel(data[i], spec->mem_base + addr[i]);
+}
 
-	writel(0x000000F1, spec->mem_base + 0xC08);
-	writel(0x00000001, spec->mem_base + 0xC08);
-	writel(0x000000C7, spec->mem_base + 0xC08);
-	writel(0x000000C1, spec->mem_base + 0xC08);
-	writel(0x00000080, spec->mem_base + 0xC04);
+static void ca0132_mmio_init(struct hda_codec *codec)
+{
+	struct ca0132_spec *spec = codec->spec;
 
-	if (ca0132_quirk(spec) == QUIRK_AE5) {
-		writel(0x00000000, spec->mem_base + 0x42c);
-		writel(0x00000000, spec->mem_base + 0x46c);
-		writel(0x00000000, spec->mem_base + 0x4ac);
-		writel(0x00000000, spec->mem_base + 0x4ec);
-		writel(0x00000000, spec->mem_base + 0x43c);
-		writel(0x00000000, spec->mem_base + 0x47c);
-		writel(0x00000000, spec->mem_base + 0x4bc);
-		writel(0x00000000, spec->mem_base + 0x4fc);
-		writel(0x00000600, spec->mem_base + 0x100);
-		writel(0x00000014, spec->mem_base + 0x410);
-		writel(0x0000060f, spec->mem_base + 0x100);
-		writel(0x0000070f, spec->mem_base + 0x100);
-		writel(0x00000aff, spec->mem_base + 0x830);
-		writel(0x00000000, spec->mem_base + 0x86c);
-		writel(0x0000006b, spec->mem_base + 0x800);
-		writel(0x00000001, spec->mem_base + 0x86c);
-		writel(0x0000006b, spec->mem_base + 0x800);
-		writel(0x00000057, spec->mem_base + 0x804);
-		writel(0x00800000, spec->mem_base + 0x20c);
+	switch (ca0132_quirk(spec)) {
+	case QUIRK_R3D:
+	case QUIRK_SBZ:
+	case QUIRK_ZXR:
+		ca0132_mmio_init_sbz(codec);
+		break;
+	case QUIRK_AE5:
+		ca0132_mmio_init_ae5(codec);
+		break;
 	}
 }
 
-- 
2.20.1

