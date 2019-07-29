Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9570A785FF
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 09:16:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A20F182B;
	Mon, 29 Jul 2019 09:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A20F182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564384589;
	bh=H1IHxL/v8UPme/61K/t6/PwbjaJgB+5cDN49Sj/YawE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RlNJGEuSrorjRvTobSdKBtUWa1M4x6o+M3S0vzJFCoucsHmjlnh2NytIhwO75jUUE
	 vWv1Z2cienqYo6KXT5W1X8gV4P15b6zJJN3xw6sLOlYVsfWeBeY7pYAOp5p7fO2unl
	 Pl9o6Gs0j+ZAJ+IytuAswXpbgwglxR+dRw1Pr3Xo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 534DFF800BF;
	Mon, 29 Jul 2019 09:14:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96AE3F8048D; Mon, 29 Jul 2019 09:14:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5947AF803D5
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 09:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5947AF803D5
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <johannes@sipsolutions.net>)
 id 1hrzrh-0005kZ-Ei; Mon, 29 Jul 2019 09:14:37 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: alsa-devel@alsa-project.org
Date: Mon, 29 Jul 2019 09:14:22 +0200
Message-Id: <20190729071422.6424-1-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [alsa-devel] [PATCH] ALSA: aoa: onyx: always initalize register
	read value
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A lot of places in the driver use onyx_read_register() without
checking the return value, and it's been working OK for ~10 years
or so, so probably never fails ... Rather than trying to check the
return value everywhere, which would be relatively intrusive, at
least make sure we don't use an uninitialized value.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Johannes Berg <johannes@sipsolutions.net>
---
 sound/aoa/codecs/onyx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/aoa/codecs/onyx.c b/sound/aoa/codecs/onyx.c
index db917546965d..9827bee109c1 100644
--- a/sound/aoa/codecs/onyx.c
+++ b/sound/aoa/codecs/onyx.c
@@ -71,8 +71,10 @@ static int onyx_read_register(struct onyx *onyx, u8 reg, u8 *value)
 		return 0;
 	}
 	v = i2c_smbus_read_byte_data(onyx->i2c, reg);
-	if (v < 0)
+	if (v < 0) {
+		*value = 0;
 		return -1;
+	}
 	*value = (u8)v;
 	onyx->cache[ONYX_REG_CONTROL-FIRSTREGISTER] = *value;
 	return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
