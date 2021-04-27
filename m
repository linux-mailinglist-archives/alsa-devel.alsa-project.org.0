Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D0836C461
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Apr 2021 12:51:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 584B716E9;
	Tue, 27 Apr 2021 12:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 584B716E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619520702;
	bh=TOtUd3yP7V+11B2s7KmjDKKjR6kiSRraV3W0HX/ToIk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dFJ+iM4wSa4+vcAkyZAsVLoXOP5DBvwHDhoZMJp+zinGOcxHtezBZI09PoEF2EZpp
	 oCPWHUSiNfChwdrhFplkVUPqbbYa7sEahtXfQnQ6gR0V/H/GgHXjls1BieKvXj6igw
	 G2W79bIrBdrFi0R44w6wI3FOxP/XfySljA87APd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FFA1F8020D;
	Tue, 27 Apr 2021 12:50:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D466F801ED; Tue, 27 Apr 2021 12:50:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73ACEF800C0
 for <alsa-devel@alsa-project.org>; Tue, 27 Apr 2021 12:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73ACEF800C0
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B56251A164A;
 Tue, 27 Apr 2021 12:49:54 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6DDC51A0A59;
 Tue, 27 Apr 2021 12:49:52 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3F03E4029D;
 Tue, 27 Apr 2021 12:49:49 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: [PATCH 1/2] ALSA: pcm: Add support for 705.6KHz and 768KHz sample rate
Date: Tue, 27 Apr 2021 18:34:22 +0800
Message-Id: <1619519663-10406-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

Some high resolution codecs support 705.6KHz and 768KHz rates.
So extend supported sample rate to 768kHz in pcm.h.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 include/sound/pcm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 2e1200d17d0c..88056824ffec 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -121,6 +121,8 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_RATE_192000		(1<<12)		/* 192000Hz */
 #define SNDRV_PCM_RATE_352800		(1<<13)		/* 352800Hz */
 #define SNDRV_PCM_RATE_384000		(1<<14)		/* 384000Hz */
+#define SNDRV_PCM_RATE_705600		(1<<15)		/* 705600Hz */
+#define SNDRV_PCM_RATE_768000		(1<<16)		/* 768000Hz */
 
 #define SNDRV_PCM_RATE_CONTINUOUS	(1<<30)		/* continuous range */
 #define SNDRV_PCM_RATE_KNOT		(1<<31)		/* supports more non-continuos rates */
@@ -136,6 +138,9 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_RATE_8000_384000	(SNDRV_PCM_RATE_8000_192000|\
 					 SNDRV_PCM_RATE_352800|\
 					 SNDRV_PCM_RATE_384000)
+#define SNDRV_PCM_RATE_8000_768000	(SNDRV_PCM_RATE_8000_768000|\
+					 SNDRV_PCM_RATE_705600|\
+					 SNDRV_PCM_RATE_768000)
 #define _SNDRV_PCM_FMTBIT(fmt)		(1ULL << (__force int)SNDRV_PCM_FORMAT_##fmt)
 #define SNDRV_PCM_FMTBIT_S8		_SNDRV_PCM_FMTBIT(S8)
 #define SNDRV_PCM_FMTBIT_U8		_SNDRV_PCM_FMTBIT(U8)
-- 
2.27.0

