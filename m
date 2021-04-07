Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D02583565D9
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 09:56:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47335167F;
	Wed,  7 Apr 2021 09:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47335167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617782166;
	bh=CLCRDi+77gCWDlerWFlOW56IEbEOy4AbCcAAleJkdpE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZApiT42Qwfc49bNDzEsuLQ7XubUE8LbfvR4T/tv1GouEMG5jJp+2n5lS4c1VZZUCd
	 ITW+ZqlEz2eEvOQYFND7/5MhSIOUD6jemHrch4QLy/hXkEjSrVh2JYv96CAVfq0cQb
	 0EcL7J1c2j7430hgm7Wdje4l12Z+7ZLj04zBcmcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 794F7F800BD;
	Wed,  7 Apr 2021 09:54:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A179BF8016A; Wed,  7 Apr 2021 09:54:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06775F800BD
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 09:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06775F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="ArOz3Usf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1617782072;
 x=1649318072; h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bLOXTbfkAb9gwNO6weZ5ORyuJJ7xGVy31mdD30BGh7U=;
 b=ArOz3UsfaZGAKJOdzEQrc4LwQaJIcO1glmeb0pmaWEXYSeA8O7Jl6iRi
 Aq0Swv5K0vdQHGFI7ZDmalaFPeCL7yYgnZXO9jTndSes+RJY9ktqNmA06
 87OXVaP/yQFJLChWgB7Q5QF6Av+e8npQW1Mvp5knboiSWj5vKeKbOtgYN
 HVTZg8JCqz7EbuZ96AxZrzj+RiIAVp9RlnT5iPWiUqEPL414yqbfainZZ
 WW1Q233LXImW/kndZWytQHft8Ej2UlOrXv1KkpdSkLhglM1AyeacfWMB5
 moj8KhWh5nMGHFsJw+yqE5zwxnaAR8XS8bobMz4bnJRnKpXsOAh6aNjfF g==;
From: Jonas Holmberg <jonashg@axis.com>
To: <tiwai@suse.de>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: aloop: Fix initialization of controls
Date: Wed, 7 Apr 2021 09:54:28 +0200
Message-ID: <20210407075428.2666787-1-jonashg@axis.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Add a control to the card before copying the id so that the numid field
is initialized in the copy. Otherwise the numid field of active_id,
format_id, rate_id and channels_id will be the same (0) and
snd_ctl_notify() will not queue the events properly.

Signed-off-by: Jonas Holmberg <jonashg@axis.com>
---
 sound/drivers/aloop.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 52637180af33..80b814b9922a 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1571,6 +1571,14 @@ static int loopback_mixer_new(struct loopback *loopback, int notify)
 					return -ENOMEM;
 				kctl->id.device = dev;
 				kctl->id.subdevice = substr;
+
+				/* Add the control before copying the id so that
+				 * the numid field of the id is set in the copy.
+				 */
+				err = snd_ctl_add(card, kctl);
+				if (err < 0)
+					return err;
+
 				switch (idx) {
 				case ACTIVE_IDX:
 					setup->active_id = kctl->id;
@@ -1587,9 +1595,6 @@ static int loopback_mixer_new(struct loopback *loopback, int notify)
 				default:
 					break;
 				}
-				err = snd_ctl_add(card, kctl);
-				if (err < 0)
-					return err;
 			}
 		}
 	}
-- 
2.26.3

