Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E62012A027
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 22:54:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D37B172E;
	Fri, 24 May 2019 22:53:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D37B172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558731249;
	bh=RtxLXUz9gZ7gzE3nztzhp/2NMBzlumasDABP8lXtDaQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=og5vCTz1NtWJ3G0lDv8Rj4Sv4+9yycLOSoXl1awaFr9BQB47RrWbPQfwIHRubhnO7
	 I0Dl6/agEBfL3U+NpfaH+VvqmbLgEuIxn6WmposnDS8Lfvv8ibPuvMOXrsVmP8LHAl
	 kAPVdfXWtkorhOARiqI99rlUv5fjOU4oPHuQ5aZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B68C4F8972D;
	Fri, 24 May 2019 22:51:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADD3BF89636; Fri, 24 May 2019 22:50:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A6EAF806F7
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 22:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A6EAF806F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="PTure5WS"; 
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="PTure5WS"
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 71B2760F38; Fri, 24 May 2019 20:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558730426;
 bh=77SbtK8sBzjfifXjysYcc4EGEuOLKBVbmjBb4rvne44=;
 h=From:To:Cc:Subject:Date:From;
 b=PTure5WSTnWUF7LniGUSmjLXTgHT1mUpo+D/ACXAFcoVllZGBzAXljg4NgHFjilvp
 3HXjGEQG8MrtFZyCtwsAhq4L7jkSifTGou5AWFlTh8FjS2H+yB3KJj5EKT1fHlRv11
 jIucDGJnXzbL72lU/0PGdJvr5khYMXEkObAoVris=
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: bgoswami@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EDFB460C60;
 Fri, 24 May 2019 20:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558730426;
 bh=77SbtK8sBzjfifXjysYcc4EGEuOLKBVbmjBb4rvne44=;
 h=From:To:Cc:Subject:Date:From;
 b=PTure5WSTnWUF7LniGUSmjLXTgHT1mUpo+D/ACXAFcoVllZGBzAXljg4NgHFjilvp
 3HXjGEQG8MrtFZyCtwsAhq4L7jkSifTGou5AWFlTh8FjS2H+yB3KJj5EKT1fHlRv11
 jIucDGJnXzbL72lU/0PGdJvr5khYMXEkObAoVris=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EDFB460C60
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=bgoswami@codeaurora.org
From: bgoswami@codeaurora.org
To: perex@perex.cz,
	tiwai@suse.com
Date: Fri, 24 May 2019 13:40:23 -0700
Message-Id: <1558730423-16490-1-git-send-email-bgoswami@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 plai@codeaurora.org, Gopikrishnaiah Anandan <agopik@codeaurora.org>,
 broonie@kernel.org, srinivas.kandagatla@linaro.org
Subject: [alsa-devel] [PATCH 1/3] ALSA: jack: Remove hard coding of
	jack_switch_types array size
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Banajit Goswami <bgoswami@codeaurora.org>

The size for jack_switch_types array is currently controlled by
a MACRO 'SND_JACK_SWITCH_TYPES', whose value needs to be updated
everytime a new jack switch type is added. Remove this MACRO
and use ARRAY_SIZE instead to get size of the array.

Signed-off-by: Gopikrishnaiah Anandan <agopik@codeaurora.org>
Signed-off-by: Banajit Goswami <bgoswami@codeaurora.org>
---
 include/sound/jack.h | 3 ---
 sound/core/jack.c    | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/sound/jack.h b/include/sound/jack.h
index 1e84bfb..b0791c5 100644
--- a/include/sound/jack.h
+++ b/include/sound/jack.h
@@ -68,9 +68,6 @@ enum snd_jack_types {
 	SND_JACK_BTN_5		= 0x0200,
 };
 
-/* Keep in sync with definitions above */
-#define SND_JACK_SWITCH_TYPES 6
-
 struct snd_jack {
 	struct list_head kctl_list;
 	struct snd_card *card;
diff --git a/sound/core/jack.c b/sound/core/jack.c
index 84c2a17..36b047b 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -33,7 +33,7 @@ struct snd_jack_kctl {
 };
 
 #ifdef CONFIG_SND_JACK_INPUT_DEV
-static int jack_switch_types[SND_JACK_SWITCH_TYPES] = {
+static int jack_switch_types[] = {
 	SW_HEADPHONE_INSERT,
 	SW_MICROPHONE_INSERT,
 	SW_LINEOUT_INSERT,
@@ -250,7 +250,7 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 
 		jack->type = type;
 
-		for (i = 0; i < SND_JACK_SWITCH_TYPES; i++)
+		for (i = 0; i < ARRAY_SIZE(jack_switch_types); i++)
 			if (type & (1 << i))
 				input_set_capability(jack->input_dev, EV_SW,
 						     jack_switch_types[i]);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
