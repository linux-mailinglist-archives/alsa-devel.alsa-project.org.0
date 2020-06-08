Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2B51F1347
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 09:11:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 319721661;
	Mon,  8 Jun 2020 09:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 319721661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591600280;
	bh=2L3mRX8ktZLxvDgTdxXkikQXvheUdjBANsf4vlU2KcA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZWZgqnhyxGn79h8HCYQc3cpvT0c6Ke3B4icXFRzqvzs8JTj8tvM/sc1iF5GnMFDk7
	 FmZpYb0v2W2vC0qsWLzvaFI+27x4JRWIwW7Lu2yZZ2Asx7NCDreBvT8ul8ykVA8TEM
	 nNun1U7vSlzssYEhEm7+tJrMjoV35bc6zAKlNKj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59F37F801EB;
	Mon,  8 Jun 2020 09:09:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B5DDF8021C; Mon,  8 Jun 2020 09:09:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91FAEF801EB
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 09:09:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91FAEF801EB
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1jiBuS-0007Tz-0O; Mon, 08 Jun 2020 07:09:28 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib] conf: USB-Audio: Add HP Thunderbolt Dock in the
 IEC958 blacklist
Date: Mon,  8 Jun 2020 15:09:23 +0800
Message-Id: <20200608070923.11614-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
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

Both headset and speaker on HP Thunderbolt Dock don't support IEC958
interface.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 src/conf/cards/USB-Audio.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/conf/cards/USB-Audio.conf b/src/conf/cards/USB-Audio.conf
index 735079e3..01664abf 100644
--- a/src/conf/cards/USB-Audio.conf
+++ b/src/conf/cards/USB-Audio.conf
@@ -62,6 +62,8 @@ USB-Audio.pcm.iec958_device {
 	"Scarlett 2i4 USB" 999
 	"Sennheiser USB headset" 999
 	"SWTOR Gaming Headset by Razer" 999
+	"Thunderbolt Dock Audio Headset" 999
+	"Thunderbolt Dock Audio Module" 999
 	"USB Device 0x46d_0x821" 999
 	"USB Device 0x46d_0x992" 999
 	"WD15 Dock" 999
-- 
2.17.1

