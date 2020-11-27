Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBA62C88EA
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 17:05:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEA1D1736;
	Mon, 30 Nov 2020 17:05:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEA1D1736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606752355;
	bh=cSl4KqfrhlKBFWpxHerD+K77kz72auzAlYprqUcH3mU=;
	h=From:To:Date:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qDxJDs3qJ7fl9EVDqHtw4TItmLWp7yNr6g/dcJeUOUj+CAVGdvImv11l4JBdCCx9U
	 xMu7zJ4r7OFy61kQ4kWpLxl9brHkXD6IehOjzFcHfGATu2VyM8tuVD64rp5WElJxKu
	 ItlkFMUimBONyXOwTLyHhbmyRN4j0tt5ff0Erl7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39FB2F804CA;
	Mon, 30 Nov 2020 17:03:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4469F8019D; Fri, 27 Nov 2020 16:24:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF781F8015A
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 16:24:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF781F8015A
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <lgo@pengutronix.de>)
 id 1kifb3-0002Iv-2c; Fri, 27 Nov 2020 16:23:41 +0100
Received: from lgo by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <lgo@dude03.red.stw.pengutronix.de>)
 id 1kifax-006ATZ-FC; Fri, 27 Nov 2020 16:23:35 +0100
From: Leonard Goehrs <l.goehrs@pengutronix.de>
To: u.kleine-koenig@pengutronix.de, geoff@infradead.org, perex@perex.cz,
 tiwai@suse.com, mpe@ellerman.id.au
Date: Fri, 27 Nov 2020 16:22:59 +0100
Message-Id: <20201127152259.1470079-1-l.goehrs@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201127094547.4zcyeycfrriitkqx@pengutronix.de>
References: <20201127094547.4zcyeycfrriitkqx@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: lgo@pengutronix.de
Subject: [PATCH] ALSA: ppc: remove redundant checks in PS3 driver probe
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Mon, 30 Nov 2020 17:02:42 +0100
Cc: alsa-devel@alsa-project.org, benh@kernel.crashing.org, paulus@samba.org,
 kernel@pengutronix.de, Geert Uytterhoeven <geert@linux-m68k.org>,
 Leonard Goehrs <l.goehrs@pengutronix.de>, linuxppc-dev@lists.ozlabs.org
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

The check for the FW_FEATURE_PS3_LV1 firmware feature is already performed
in ps3_system_bus_init() before registering the driver. So if the probe
function is actually used, this feature is already known to be available.

The check for the match id is also superfluous; the condition is always
true because the bus' match function (ps3_system_bus_match()) only
considers this driver for devices having:
dev->match_id == snd_ps3_bus_driver_info.match_id.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Leonard Goehrs <l.goehrs@pengutronix.de>
---
 sound/ppc/snd_ps3.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/ppc/snd_ps3.c b/sound/ppc/snd_ps3.c
index 58bb49fff184..b6e4aa3df870 100644
--- a/sound/ppc/snd_ps3.c
+++ b/sound/ppc/snd_ps3.c
@@ -896,11 +896,6 @@ static int snd_ps3_driver_probe(struct ps3_system_bus_device *dev)
 	u64 lpar_addr, lpar_size;
 	static u64 dummy_mask;
 
-	if (WARN_ON(!firmware_has_feature(FW_FEATURE_PS3_LV1)))
-		return -ENODEV;
-	if (WARN_ON(dev->match_id != PS3_MATCH_ID_SOUND))
-		return -ENODEV;
-
 	the_card.ps3_dev = dev;
 
 	ret = ps3_open_hv_device(dev);
-- 
2.20.1

