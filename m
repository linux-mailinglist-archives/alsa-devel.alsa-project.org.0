Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2233FBFC0
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Aug 2021 02:27:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E68351731;
	Tue, 31 Aug 2021 02:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E68351731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630369625;
	bh=ucDtNPuu0dIl4wO72uqfYgrrBGtPylLOZ3HjMXQ9pCw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qhIASzNeRbYRNnTFJjPlXi8gx6XQIHIzjuvs123uQ9tDgp/uI+JAUunaHTDhaxMLh
	 BNZvE5cQmSwah2poCHCwmY3wnlTl2jotFVm4hzwklBQ9F4VzPhKdxD1EHbd5bKwjtx
	 9qC9Z2bv7gPEDWicQK0bI62MEo0zAEbaSuhLidd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BC29F80227;
	Tue, 31 Aug 2021 02:25:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19B9AF80218; Tue, 31 Aug 2021 02:25:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC8A0F80169
 for <alsa-devel@alsa-project.org>; Tue, 31 Aug 2021 02:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC8A0F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="YQir5gZ8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DjRBAJLbVJz8C2CKdEdUTiFx6vV+nzbRpDnQgq5ggQw=; b=YQir5gZ8Dz34g5sYKCa5vYoIQw
 jco9VtylObt0ZQeTS057/qI+MlejNKB5xprTP6Z3NuTip3IDMIRZ9frc+n87cnZbaSJabPs1WXIik
 bLsVQV8YfIOpS4NX8yFeGoAHLkgDEAZ5TPBDYMUzBcXdu1UsjcjWgwQjQ3bdp072X4sk=;
Received: from [2a00:1370:8125:e297::525] (helo=work.mail.msk)
 by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <puleglot@puleglot.ru>)
 id 1mKran-000Kof-14; Tue, 31 Aug 2021 03:25:33 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add registration quirk for JBL Quantum 800
Date: Tue, 31 Aug 2021 03:25:31 +0300
Message-Id: <20210831002531.116957-1-alexander@tsoy.me>
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

Add another device ID for JBL Quantum 800. It requires the same quirk as
other JBL Quantum devices.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 4479a590194f..6ee6d24c847f 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1743,6 +1743,7 @@ static const struct registration_quirk registration_quirks[] = {
 	REG_QUIRK_ENTRY(0x0951, 0x16ed, 2),	/* Kingston HyperX Cloud Alpha S */
 	REG_QUIRK_ENTRY(0x0951, 0x16ea, 2),	/* Kingston HyperX Cloud Flight S */
 	REG_QUIRK_ENTRY(0x0ecb, 0x1f46, 2),	/* JBL Quantum 600 */
+	REG_QUIRK_ENTRY(0x0ecb, 0x1f47, 2),	/* JBL Quantum 800 */
 	REG_QUIRK_ENTRY(0x0ecb, 0x2039, 2),	/* JBL Quantum 400 */
 	REG_QUIRK_ENTRY(0x0ecb, 0x203c, 2),	/* JBL Quantum 600 */
 	REG_QUIRK_ENTRY(0x0ecb, 0x203e, 2),	/* JBL Quantum 800 */
-- 
2.31.1

