Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC371F8DE4
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 08:32:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 530F3166E;
	Mon, 15 Jun 2020 08:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 530F3166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592202775;
	bh=/gjYfFsTFTr30hScNyckcjvUvo0OFb9ewAyg+9FlvHs=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WjhKnkK8SPCgk7AFmRVag44lZKl+lGwY+U3r72nVvvu4UPFxxwdJYumB0Ak+x7llg
	 pqPMHdMdKXFXJCyf+gJ14OjCjxpbT/m9J+D1OuELSPhA1GYbm+GGsUBpoArS5dJOuZ
	 XnrlF9AC/fjyrBhTJfrV7jSnAZ1A8QDDQI1PMbD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5309EF802FD;
	Mon, 15 Jun 2020 08:26:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6B64F8022B; Mon, 15 Jun 2020 02:12:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6ABCBF800CD
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 02:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ABCBF800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=pobox.com header.i=@pobox.com
 header.b="BnLo03Z5"; 
 dkim=fail reason="key not found in DNS" (0-bit key) header.d=swenson.io
 header.i=@swenson.io header.b="U6M4eIJ3"
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id BC3E163DEF;
 Sun, 14 Jun 2020 20:11:50 -0400 (EDT)
 (envelope-from swenson@swenson.io)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=to:cc:from
 :subject:message-id:date:mime-version:content-type
 :content-transfer-encoding; s=sasl; bh=/Bo2AmDNtGSNIbI5a/aRIdqCK
 8Y=; b=BnLo03Z5UKZ7XF+6vd1Isc4CsWO37v9oOZskW1tI7cCkMbNdmrCvzWexf
 8YMa4QkEhiBeoqfXkXJbc5tOU25bVMBLJnfLI/cXoEynpppsG7BKDVbLnRvoHJx2
 5V4jA4UWvZeb4NGu2tX6LwJ/Ob0hqKFDachUaojlpcxnXesIVI=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id B46A463DEE;
 Sun, 14 Jun 2020 20:11:50 -0400 (EDT)
 (envelope-from swenson@swenson.io)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=swenson.io;
 h=to:cc:from:subject:message-id:date:mime-version:content-type:content-transfer-encoding;
 s=mesmtp; bh=/gjYfFsTFTr30hScNyckcjvUvo0OFb9ewAyg+9FlvHs=;
 b=U6M4eIJ3Uhl+/AA2SR2g6TO7TamoNsqsYGvgOvCHVJg38o0aPfS5VAxT3nQdOI/PPko2aqVkgVVsVMpTOTyToz6FGWaSvPdaZAAgCeAmst3oXbhk8yVj2lAKBmkhtpb5qqH7pZMDs5kFUmhcAIUoph2deiSk/U4+bRAxYw7oJ3s=
Received: from [192.168.1.224] (unknown [70.59.135.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 9B04363DED;
 Sun, 14 Jun 2020 20:11:48 -0400 (EDT)
 (envelope-from swenson@swenson.io)
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Christopher Swenson <swenson@swenson.io>
Subject: [PATCH] ALSA: usb-audio: Set 48 kHz rate for Rodecaster
Message-ID: <ebdb9e72-9649-0b5e-b9b9-d757dbf26927@swenson.io>
Date: Sun, 14 Jun 2020 17:11:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Pobox-Relay-ID: CE7A6DDA-AE9C-11EA-ADBE-C28CBED8090B-87402259!pb-smtp1.pobox.com
X-Mailman-Approved-At: Mon, 15 Jun 2020 08:26:09 +0200
Cc: alsa-devel@alsa-project.org, Nicola Lunghi <nick83ola@gmail.com>,
 Nick Kossifidis <mickflemm@gmail.com>
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

From 22581d37726a17ed9c400b8c9ff8ade52c17f65a Mon Sep 17 00:00:00 2001
From: Christopher Swenson <swenson@swenson.io>
Date: Sun, 14 Jun 2020 15:19:41 -0700
Subject: [PATCH] ALSA: usb-audio: Set 48 kHz rate for Rodecaster

Like the Line6 devices, the Rode Rodecaster Pro does not support
UAC2_CS_RANGE and only supports a sample rate of 48 kHz.

Tested against a Rode Rodecaster Pro.

Tested-by: Christopher Swenson <swenson@swenson.io>
Signed-off-by: Christopher Swenson <swenson@swenson.io>
---
 sound/usb/format.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 5ffb457cc88c..1b28d01d1f4c 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -394,8 +394,9 @@ static int parse_uac2_sample_rate_range(struct snd_usb_audio *chip,
 	return nr_rates;
 }
 
-/* Line6 Helix series don't support the UAC2_CS_RANGE usb function
- * call. Return a static table of known clock rates.
+/* Line6 Helix series and the Rode Rodecaster Pro don't support the
+ * UAC2_CS_RANGE usb function call. Return a static table of known
+ * clock rates.
  */
 static int line6_parse_audio_format_rates_quirk(struct snd_usb_audio *chip,
 						struct audioformat *fp)
@@ -408,6 +409,7 @@ static int line6_parse_audio_format_rates_quirk(struct snd_usb_audio *chip,
 	case USB_ID(0x0e41, 0x4248): /* Line6 Helix >= fw 2.82 */
 	case USB_ID(0x0e41, 0x4249): /* Line6 Helix Rack >= fw 2.82 */
 	case USB_ID(0x0e41, 0x424a): /* Line6 Helix LT >= fw 2.82 */
+	case USB_ID(0x19f7, 0x0011): /* Rode Rodecaster Pro */
 		return set_fixed_rate(fp, 48000, SNDRV_PCM_RATE_48000);
 	}
 
-- 
2.26.0
