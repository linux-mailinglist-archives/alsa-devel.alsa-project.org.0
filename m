Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B220301684
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Jan 2021 16:59:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C55C1AA8;
	Sat, 23 Jan 2021 16:58:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C55C1AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611417584;
	bh=He3ayklLkXusYmIgULjlOTxy8cWeLDumf96Dd4bCHfQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n5f+6/9iMOGjko+vrWFRlWVvmHdMX0bAxBSoexGFGaW9C3mclfWEWYi0MuyfpcB5M
	 asgd5BBnsjEhmsEswZNQePvf3l67FQtlUeTOyKtR8KwITiH7BehHHBlyY+VxeDU3Ox
	 YUvypRFKFoL82NB7v4zdwdFq0zG97CDQMnxjvERc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59627F80273;
	Sat, 23 Jan 2021 16:58:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DEA5F80272; Sat, 23 Jan 2021 16:58:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 283FAF80257
 for <alsa-devel@alsa-project.org>; Sat, 23 Jan 2021 16:58:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 283FAF80257
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 40690AC8F;
 Sat, 23 Jan 2021 15:58:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: workaround for iface reset issue
Date: Sat, 23 Jan 2021 16:58:42 +0100
Message-Id: <20210123155842.22652-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jamie Heilman <jamie@audible.transient.net>
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

The recently introduced sample rate validation code seems causing a
problem on some devices; namely, after performing this, the bus gets
screwed and it influences even on other USB devices.
As a quick workaround, perform it only for the necessary devices;
currently MOTU devices are known to need the valid altset checks, so
filter out other devices.

Fixes: 93db51d06b32 ("ALSA: usb-audio: Check valid altsetting at parsing rates for UAC2/3")
Reported-by: Jamie Heilman <jamie@audible.transient.net>
BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1178203
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/format.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 9ebc5d202c87..e6ff317a6785 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -466,6 +466,17 @@ static int validate_sample_rate_table_v2v3(struct snd_usb_audio *chip,
 	unsigned int nr_rates;
 	int i, err;
 
+	/* performing the rate verification may lead to unexpected USB bus
+	 * behavior afterwards by some unknown reason.  Do this only for the
+	 * known devices.
+	 */
+	switch (USB_ID_VENDOR(chip->usb_id)) {
+	case 0x07fd: /* MOTU */
+		break;
+	default:
+		return 0; /* don't perform the validation as default */
+	}
+
 	table = kcalloc(fp->nr_rates, sizeof(*table), GFP_KERNEL);
 	if (!table)
 		return -ENOMEM;
-- 
2.26.2

