Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C092DE53A
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 15:59:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CE4A17C1;
	Fri, 18 Dec 2020 15:59:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CE4A17C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608303598;
	bh=y9NjSkZGz/klgC/Ra+ckvB9I/fLr1i1FLXjQZNMBTzM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EwklWk+2UrytL9oYFZP+qHI3hbmOPcZE3RshE2W5yzDg7uq4SQDHKEg/Eu9WBd5I+
	 jwjaYFhWvt2+vDzv7ie2yUcN2ooLKrVZLAoNa1CiHfX6qcL+oue5tzi/QeF8rXWhmA
	 DToyMIW6jhCW1/lo6Fkqk6wCVDAWM7gZSLtThf84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1934AF80171;
	Fri, 18 Dec 2020 15:59:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 188A3F80240; Fri, 18 Dec 2020 15:59:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C5F1F80168
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 15:59:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C5F1F80168
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE37FAD09
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 14:58:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Disable sample read check if firmware
 doesn't give back
Date: Fri, 18 Dec 2020 15:58:58 +0100
Message-Id: <20201218145858.2357-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Some buggy firmware don't give the current sample rate but leaves
zero.  Handle this case more gracefully without warning but just skip
the current rate verification from the next time.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/clock.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index e940dcee792b..31051f2be46d 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -534,6 +534,12 @@ static int set_sample_rate_v1(struct snd_usb_audio *chip,
 	}
 
 	crate = data[0] | (data[1] << 8) | (data[2] << 16);
+	if (!crate) {
+		dev_info(&dev->dev, "failed to read current rate; disabling the check\n");
+		chip->sample_rate_read_error = 3; /* three strikes, see above */
+		return 0;
+	}
+
 	if (crate != rate) {
 		dev_warn(&dev->dev, "current rate %d is different from the runtime rate %d\n", crate, rate);
 		// runtime->rate = crate;
-- 
2.26.2

