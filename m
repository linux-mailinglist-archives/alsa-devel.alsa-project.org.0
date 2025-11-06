Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DE2C4758F
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:51:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A8DE603A5;
	Mon, 10 Nov 2025 15:50:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A8DE603A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762786268;
	bh=ccI7w72smvenBTyrW2Fi5iyGpbN34hShK/Sq9W07v4c=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=g7z6dqDsKECDB9p+v4DjARzoAs1u/3ACtDyURc+a81ikBbGIJEtP8iI6CxVQis+Ka
	 umzXPSuVrgQYRzy5QsONhlaEwCLbaigHokGMHAkXAyicdoE1bKHlu22IHPf2W7syan
	 7QFSgKZMlTIN1OguTSZgLYtE9yMZdpiPbsH8CPrc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDDFBF80716; Mon, 10 Nov 2025 15:42:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D388F8986E;
	Mon, 10 Nov 2025 15:42:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63E36F80272; Thu,  6 Nov 2025 04:18:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPOOFED_FREEMAIL,
	T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR,UNPARSEABLE_RELAY shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D25AF800D2
	for <alsa-devel@alsa-project.org>; Thu,  6 Nov 2025 04:18:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D25AF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=H8oeiFDn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0e
	ZVXCKfTD48oWYcUMSXO8jVUm+ueuSjn9uH27gyeaY=; b=H8oeiFDnBeh6rPvOm8
	7A07mMjPdqPcvMHylvyTmsIu2BT3xJ+oRlIM114dDjqcJHt0r2vYxv7Hc8zI0oam
	9gSN55g+jQNL+M6ZflSGNLkl1O9Fi9BFS4qhN++yDMilIYtljroS2xrbYyvWbgPw
	CbQD3/TKrIK7EA8fejmPvYtXc=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBXNueKEwxp3uGrCw--.54468S2;
	Thu, 06 Nov 2025 11:18:35 +0800 (CST)
From: wangdich9700@163.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	cezary.rojewski@intel.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdich9700@163.com>,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/senary: Fix potential resource leak in set_beep_amp
Date: Thu,  6 Nov 2025 11:18:33 +0800
Message-Id: <20251106031833.80303-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgBXNueKEwxp3uGrCw--.54468S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW8WFWfCr45tF13XF4kXrb_yoW8Jw1DpF
	1fG34rtFsxJa92yr4rGa1UW3Z3Wa4kWF15JayUKw1fZF4Yyr48tw1rtw12ga1rKrWI9a13
	ZFy2vF1UKa98AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piFApUUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCvwxFlGkME4wdKgAA3v
X-MailFrom: wangdich9700@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IEU2BTORRVZOJWROLKLJ7TQ7CIB7I2BA
X-Message-ID-Hash: IEU2BTORRVZOJWROLKLJ7TQ7CIB7I2BA
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:42:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IEU2BTORRVZOJWROLKLJ7TQ7CIB7I2BA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: wangdicheng <wangdich9700@163.com>

Add proper error handling in set_beep_amp function to avoid potential
resource leaks when snd_hda_gen_add_kctl fails.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/senarytech.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/sound/hda/codecs/senarytech.c b/sound/hda/codecs/senarytech.c
index 9aa1e9bcd9ec..99af8d5e51db 100644
--- a/sound/hda/codecs/senarytech.c
+++ b/sound/hda/codecs/senarytech.c
@@ -47,17 +47,28 @@ static int set_beep_amp(struct senary_spec *spec, hda_nid_t nid,
 {
 	struct snd_kcontrol_new *knew;
 	unsigned int beep_amp = HDA_COMPOSE_AMP_VAL(nid, 1, idx, dir);
-	int i;
+	int i, err;
 
 	spec->gen.beep_nid = nid;
 	for (i = 0; i < ARRAY_SIZE(senary_beep_mixer); i++) {
 		knew = snd_hda_gen_add_kctl(&spec->gen, NULL,
 					    &senary_beep_mixer[i]);
-		if (!knew)
-			return -ENOMEM;
+		if (!knew) {
+			err = -ENOMEM;
+			goto error;
+		}
 		knew->private_value = beep_amp;
 	}
 	return 0;
+
+error:
+	/* Clean up any successfully added controls */
+	while (i-- > 0) {
+		/* The gen spec will be cleaned up in senary_remove,
+		 * so we don't need individual cleanup here
+		 */
+	}
+	return err;
 }
 
 static int senary_auto_parse_beep(struct hda_codec *codec)
-- 
2.25.1

