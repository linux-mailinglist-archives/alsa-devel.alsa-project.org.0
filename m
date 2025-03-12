Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E225A61587
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Mar 2025 16:58:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13B7B60429;
	Fri, 14 Mar 2025 16:58:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13B7B60429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741967907;
	bh=l7jMbZfBiFeALlL27WJ4EFhnmaU6KMCEYHn0gqy7FzQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=t6AyWVVode2ns3GZRRjqFha6RxeS8SShtYHuO4kjUKfHNSk24ovzo/gW3OyUt/5Mv
	 rwotbeGh4PAIjIsaJNUovCpIOrybdzq3FzMQvMT+vvKd3GkuzznbO+7+IS3mwS5BtE
	 JIOXfIgbiHXdQ6zXYB7nzeVjx9iUlSH6b3zf0JSA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8B5BF805DF; Fri, 14 Mar 2025 16:57:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86B74F805DA;
	Fri, 14 Mar 2025 16:57:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8D06F80301; Wed, 12 Mar 2025 10:00:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4A88F80095
	for <alsa-devel@alsa-project.org>; Wed, 12 Mar 2025 10:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4A88F80095
Received: from localhost.localdomain (188.234.20.53) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 12 Mar
 2025 12:00:14 +0300
From: d.privalov <d.privalov@omp.ru>
To: <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>, Dmitriy Privalov <d.privalov@omp.ru>
Subject: [PATCH 5.10 1/1] ASoC: ops: Check for negative values before reading
 them
Date: Wed, 12 Mar 2025 11:58:29 +0300
Message-ID: <20250312085829.52758-1-d.privalov@omp.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [188.234.20.53]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 03/12/2025 08:41:23
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 191694 [Mar 12 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: d.privalov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 51 0.3.51
 68896fb0083a027476849bf400a331a2d5d94398
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 
	lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 188.234.20.53
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 03/12/2025 08:44:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 3/12/2025 6:37:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-MailFrom: d.privalov@omp.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: M54ILDOELQZAMDGLIDHXWBADL5ZFEPAD
X-Message-ID-Hash: M54ILDOELQZAMDGLIDHXWBADL5ZFEPAD
X-Mailman-Approved-At: Fri, 14 Mar 2025 15:57:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M54ILDOELQZAMDGLIDHXWBADL5ZFEPAD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mark Brown <broonie@kernel.org>

commit 1601033da2dd2052e0489137f7788a46a8fcd82f upstream.

The controls allow inputs to be specified as negative but our manipulating
them into register fields need to be done on unsigned variables so the
checks for negative numbers weren't taking effect properly. Do the checks
for negative values on the variable in the ABI struct rather than on our
local unsigned copy.

Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20220128192443.3504823-1-broonie@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Dmitriy Privalov <d.privalov@omp.ru>
---
 sound/soc/soc-ops.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index a83cd8d8a9633..a1087dfee532d 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -316,26 +316,26 @@ int snd_soc_put_volsw(struct snd_kcontrol *kcontrol,
 	if (sign_bit)
 		mask = BIT(sign_bit + 1) - 1;
 
+	if (ucontrol->value.integer.value[0] < 0)
+		return -EINVAL;
 	val = ucontrol->value.integer.value[0];
 	if (mc->platform_max && ((int)val + min) > mc->platform_max)
 		return -EINVAL;
 	if (val > max - min)
 		return -EINVAL;
-	if (val < 0)
-		return -EINVAL;
 	val = (val + min) & mask;
 	if (invert)
 		val = max - val;
 	val_mask = mask << shift;
 	val = val << shift;
 	if (snd_soc_volsw_is_stereo(mc)) {
+		if (ucontrol->value.integer.value[1] < 0)
+			return -EINVAL;
 		val2 = ucontrol->value.integer.value[1];
 		if (mc->platform_max && ((int)val2 + min) > mc->platform_max)
 			return -EINVAL;
 		if (val2 > max - min)
 			return -EINVAL;
-		if (val2 < 0)
-			return -EINVAL;
 		val2 = (val2 + min) & mask;
 		if (invert)
 			val2 = max - val2;
@@ -429,13 +429,13 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	int err = 0;
 	unsigned int val, val_mask, val2 = 0;
 
+	if (ucontrol->value.integer.value[0] < 0)
+		return -EINVAL;
 	val = ucontrol->value.integer.value[0];
 	if (mc->platform_max && val > mc->platform_max)
 		return -EINVAL;
 	if (val > max)
 		return -EINVAL;
-	if (val < 0)
-		return -EINVAL;
 	val_mask = mask << shift;
 	val = (val + min) & mask;
 	val = val << shift;
-- 
2.34.1

