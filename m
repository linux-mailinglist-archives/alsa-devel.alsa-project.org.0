Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F952E023B
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Dec 2020 22:57:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA14F170E;
	Mon, 21 Dec 2020 22:57:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA14F170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608587877;
	bh=NHs6WRD7nxeaeXNEhmk737XfCDZJmsyzd110qoCbazc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U2jODfc56e5xNHFIRSj8x6s1RnfQEnMrQLT+5cxe+h8qgEJosQrZRkyI1XohGIY/n
	 QaJ8gUSL1oGN6Q+fwCjmHe3G/MScEtMcvM2h6VtiBlmi9834luSnERIewEV3pIChxu
	 gl7NQ9ok5jTLRDCd13995Lv12AnLlLV+HQOZODuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B84FF80168;
	Mon, 21 Dec 2020 22:56:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84CC0F801D5; Mon, 21 Dec 2020 22:56:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D761F800EC
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 22:56:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D761F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="rCJIamVR"
Received: by mail-pj1-x1029.google.com with SMTP id n3so375787pjm.1
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 13:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+rzappeTJmqsxSoeE+vnqFjNpPOiDuOh0FNMa/1UK1s=;
 b=rCJIamVRLisVVcpeD9PQ/0h3PGXFpI+/NEuDVIsShutZkgof29ZWsuq8ZKhmbf8VR+
 jJ8Bedr7HMZ7DyrEQ/dIe7pqRVPaQBP5GdrSYprwmLpecl23oIxfAxItx6Sx+N7Q1AKX
 J96z0eLb6CJH7xGs0e3kBkNgF9tLf0KjmcCwOYBBtwiNNVShoaOhf6YO7+CIe1aJQLU1
 zyMMyqfkLnJk5ZI68K12PAfMCkPmS53Bb3ADq8OQ+gQ6XveFtfEcUiWOqkkfkQWBRoXD
 TKSgFHR9hV47pr6bQPAbxIZx+txQHSHRsAAsn8pD4bDlZ3LaYN65HYZ9lhGnVdL2akPW
 U/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+rzappeTJmqsxSoeE+vnqFjNpPOiDuOh0FNMa/1UK1s=;
 b=Hqw/UK78ktg5Sd6yCKtZn9JwiJlLUIHSZYYXpnRwCHMAowzOJHGwABR4wzNqwH+pta
 mU5hEF3A/R2bfmt7vpwMUGW5XWuGrXiijglKSklVmsrtHCNceulaR2Avm2DoaHa2wMrl
 GQ0ore2+OrhGN0QbkG4o2skKyZx++lqk2jFJTEcBJHS+4uw/bKDPQ1g67Re7oDn/682B
 QcB1vulq3QtIY0NxGWR+FaK18UcdlO6a7bjzZKD1dR6vG+2K98T2fw/GOIjAwV6SuFao
 7ZQoEDOYaHB0bgYKLib8CsaNu8QKYV0L5lR/OYiXBgY0qkN9Mxm08Uqv8I5x0IK7mUXO
 DbjA==
X-Gm-Message-State: AOAM531JSixzJpizyU1gxE2uNk2TsBe3wWONUD5AdxWJmU1MkxIfJ7Ye
 t6wDpW55P1dQqguMupHsPCy5G2slXa0y8g==
X-Google-Smtp-Source: ABdhPJxkMONkdLlNQPsXd6ehKvwzNJJG/U0huMNsPf9nZHDgQ+KCOCpi2n4yDnk83e+ZII2n20l2gg==
X-Received: by 2002:a17:90a:f286:: with SMTP id
 fs6mr19372171pjb.65.1608587759209; 
 Mon, 21 Dec 2020 13:55:59 -0800 (PST)
Received: from localhost.localdomain (cpe-76-172-68-221.socal.res.rr.com.
 [76.172.68.221])
 by smtp.googlemail.com with ESMTPSA id w70sm17278930pfd.65.2020.12.21.13.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 13:55:58 -0800 (PST)
From: Mike Oliphant <oliphant@nostatic.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add implicit feeback support for the BOSS
 GT-1
Date: Mon, 21 Dec 2020 13:55:33 -0800
Message-Id: <20201221215533.2511-1-oliphant@nostatic.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mike Oliphant <oliphant@nostatic.org>
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

The BOSS GT-1 (USB ID 0582:01d6) requires implicit feedback
like other similar BOSS devices. This patch adds this support.

Signed-off-by: Mike Oliphant <oliphant@nostatic.org>
---
 sound/usb/implicit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 4e911d200..d44997e49 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -77,6 +77,7 @@ static const struct snd_usb_implicit_fb_match playback_implicit_fb_quirks[] = {
 	IMPLICIT_FB_SKIP_DEV(0x0582, 0x0189),	/* BOSS GT-100v2 */
 	IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d8),	/* BOSS Katana */
 	IMPLICIT_FB_SKIP_DEV(0x0582, 0x01e5),	/* BOSS GT-001 */
+	IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d6),	/* BOSS GT-1 */
 
 	{} /* terminator */
 };
@@ -87,6 +88,7 @@ static const struct snd_usb_implicit_fb_match capture_implicit_fb_quirks[] = {
 	IMPLICIT_FB_FIXED_DEV(0x0582, 0x0189, 0x0d, 0x01), /* BOSS GT-100v2 */
 	IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana */
 	IMPLICIT_FB_FIXED_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
+	IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
 
 	{} /* terminator */
 };
-- 
2.29.2

