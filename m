Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 957DE6446C6
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 15:54:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 269BB1701;
	Tue,  6 Dec 2022 15:53:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 269BB1701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670338476;
	bh=coBLO2HEEiCQrF7ECwQkdbdaKq7KtN/KKFzM9jyV6lM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tDF0e4h114Gfcf6UZK+8IamuDKJyN8DGAL69h4saPpCsK4OD/kAKsBNXxrzjtL3Tm
	 7OXxefu+0l89QA6qElXgLt8BGRz4AVJOTFrkd9yZ+EzXDDyqJkC1znuHRxUCm1sudf
	 vK6qc5zzxTj+YoYjQc+U4wdudr3dR89uU78pIFkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A12A8F8014C;
	Tue,  6 Dec 2022 15:53:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71F88F80155; Tue,  6 Dec 2022 15:53:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8616EF8014E
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 15:53:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8616EF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.b="ub64oIL0"
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4NRNhN3NNkz9sR3;
 Tue,  6 Dec 2022 15:53:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1670338404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4NLTs1EBMlQbCcgVeNihmV7lwEP6dQdXCJdw5AJKbsc=;
 b=ub64oIL02hDbOUKdpEWA3zx3VHi90Q5ttNOH0GJAnCq5ePEGdQ9pKTBByPbx7pmoo2toBS
 FnFIi65KBbE55L0L9x+w+qdkgZviA+MlR8SwQp6Qth1DkkbidGjvdrWCNsyotO+k34Q33m
 e3jKhgeaXuELhxO5SZUAN6AaQZGI7bgSwEI/o+88WGS3opMfmGRQYaFJbVIIEbQqlP8Jmj
 GP43cbCUOYDe0meD+SW5XAnd1cg5PLvOuzbDZs4vCaG1LMS/g8cZJHWysP7S3f1IEKO4xQ
 Evm1uBf/WHxB/JZGXDFSRSAssh8UC9aF9QR5JPjS+FfCxCb++DK/HHFfQpYYvA==
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: compress: Add AC3, EAC3, TrueHD, DTS,
 MPEG-H 3D Audio Stream (MHAS)
Date: Tue,  6 Dec 2022 15:53:17 +0100
Message-Id: <20221206145317.99934-1-crg7475@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 52f4f053256e4590c5a
X-MBO-RS-META: nboczzk1n7697gwjxge8w453m4nnrn8e
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

These audio codecs are used in sound bars and digital TVs, and benefit
from off-loading to a DSP. In particular, Dolby Atmos and MPEG-H 3D audio
spatialization is done in dedicated DSPs. Thus, adding these codecs  to
the Compress-Offload API makes sense.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 include/uapi/sound/compress_params.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index ddc77322d571..7a58e2026be3 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -43,7 +43,13 @@
 #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
 #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
 #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
-#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
+#define SND_AUDIOCODEC_AC3                   ((__u32) 0x00000011)
+#define SND_AUDIOCODEC_EAC3                  ((__u32) 0x00000012)
+#define SND_AUDIOCODEC_TRUEHD                ((__u32) 0x00000013)
+#define SND_AUDIOCODEC_DTS                   ((__u32) 0x00000014)
+/* MPEG-H 3D Audio Stream (MHAS) as defined in ISO/IEC 23008-3 */
+#define SND_AUDIOCODEC_MHAS                  ((__u32) 0x00000015)
+#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_MHAS
 
 /*
  * Profile and modes are listed with bit masks. This allows for a
-- 
2.34.1

