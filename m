Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFDD3D7219
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 11:35:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C6171EDA;
	Tue, 27 Jul 2021 11:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C6171EDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627378514;
	bh=fhv6Ii0aQXQrSLDHxLP11kkH2VbKKG7f10bs9Chf1qM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i2g4V84c+TTwGmfhKD4CiMgzunr3ngL8+ukplK9ODUv7XxfEVZJNTvIla7KuRpgOY
	 hfqDc9Sh8qAqKmRjQGE5RO4aoWsxIGcsYm5LzGjiHF0SytDWBkXF7jteKTEpvrsGXa
	 9pXobQWYs6E/jP8eMqRql4+1aAfa+h5jTI4AUr9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC5A7F8020D;
	Tue, 27 Jul 2021 11:33:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60C8AF8026C; Tue, 27 Jul 2021 11:33:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B2B6F8020D
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 11:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B2B6F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="LTiDI+bj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ff0TKrmVrdemjSMfMe4DqV1PqiQloD83VDZNoRiKJNk=; b=LTiDI+bjEJocNx/s5820y1zY4s
 NxDOld3b8dDhLWV2XjqJNDf0HBv/eqcsksJDALYGZgfI0gW3PhAtlPq5ihqtb5AJV908d17wpWwYZ
 XoJcmULNbFAI9dSsG4IGIU5zZl2JTZab7UM7JPowovv0WWHtmRIgOhZOVvL+XKWu6yio=;
Received: from [2a00:1370:8125:1b84::525] (helo=work.puleglot.ru)
 by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <puleglot@puleglot.ru>)
 id 1m8JSy-0000ta-0h; Tue, 27 Jul 2021 12:33:34 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add registration quirk for JBL Quantum 600
Date: Tue, 27 Jul 2021 12:33:26 +0300
Message-Id: <20210727093326.1153366-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

Apparently JBL Quantum 600 has multiple hardware revisions. Apply
registration quirk to another device id as well.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index e7accd87e063..326d1b0ea5e6 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1899,6 +1899,7 @@ static const struct registration_quirk registration_quirks[] = {
 	REG_QUIRK_ENTRY(0x0951, 0x16ea, 2),	/* Kingston HyperX Cloud Flight S */
 	REG_QUIRK_ENTRY(0x0ecb, 0x1f46, 2),	/* JBL Quantum 600 */
 	REG_QUIRK_ENTRY(0x0ecb, 0x2039, 2),	/* JBL Quantum 400 */
+	REG_QUIRK_ENTRY(0x0ecb, 0x203c, 2),	/* JBL Quantum 600 */
 	REG_QUIRK_ENTRY(0x0ecb, 0x203e, 2),	/* JBL Quantum 800 */
 	{ 0 }					/* terminator */
 };
-- 
2.31.1

