Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA482B19C64
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Aug 2025 09:22:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7056760279;
	Mon,  4 Aug 2025 09:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7056760279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754292166;
	bh=XKr5AQLTpe/9o2Ut4mAq8cRpm/bxnnJLpr/to5+kjwI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Kzx9MX2Sp9H1G1JtOIxkUWoJ7Q8vUuyZvfo+CblBID1Jo2Urm25924YCYYYyBGPbi
	 5HmrOUodx0VAC3LTy4hnhE8EvX1/nFCYufgY3tSxu71UX5C0++VCRd8leqjRQKCN2b
	 ZAVpr/uDFgLQlAgW0m30SJaGK2krWA04iupgBgco=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ABEEF805C2; Mon,  4 Aug 2025 09:22:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58113F80553;
	Mon,  4 Aug 2025 09:22:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 400AAF804FB; Mon,  4 Aug 2025 05:05:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by alsa1.perex.cz (Postfix) with ESMTP id 68C8EF800E4
	for <alsa-devel@alsa-project.org>; Mon,  4 Aug 2025 05:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68C8EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=V7JUQ43v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ys
	qQmWamYIYco22fUSPqUsEq0HJ6AU5htrVCYU+nqmE=; b=V7JUQ43v2It6MWY9oK
	7cPQOitHNMn/Bmbm0xRNn4pPkgBgAR6rxWPWE0HaaOPt4jJZjCKFcKKV2WEmd0XS
	Tl2Talb1JlOkjlM+0Mer0VDVSWCrVV1xEEs5gsMgVFRU4SlZE7GDRuFT8HdljgSh
	Xst/KdJA+5ZnV0dJJ2vYmHjLs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id
 _____wBHOs5_I5BoPnvzJQ--.25158S2;
	Mon, 04 Aug 2025 11:05:39 +0800 (CST)
From: wangdich9700@163.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH 1/2] ALSA: hda/realtek: Accelerate the front MIC charging and
 discharging of the 897 codec
Date: Mon,  4 Aug 2025 11:05:17 +0800
Message-Id: <20250804030518.424229-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHOs5_I5BoPnvzJQ--.25158S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF13Xry8XFW8uw1DWry8Xwb_yoW8JFWfpr
	WrCFy3XFs3Xr4jyw48tr4fua4kGa45ZrW3C3yYk3W7XrsxuryktFyrG342v3W7KFWYkr1j
	qr1Fy34kJ3y5Kr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UZ6pQUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1tbibgSfT2iQGr-xBwAAsR
X-MailFrom: wangdich9700@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EPKAV5SSLKYENZG4XPSRKZNXHPSPQKAM
X-Message-ID-Hash: EPKAV5SSLKYENZG4XPSRKZNXHPSPQKAM
X-Mailman-Approved-At: Mon, 04 Aug 2025 07:21:39 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPKAV5SSLKYENZG4XPSRKZNXHPSPQKAM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: wangdicheng <wangdicheng@kylinos.cn>

The front MIC capacitance of the Inspur board is too large, resulting in a longer charging and discharging time required,
which in turn prevents recording for 5 seconds before startup.
Therefore, software is used to increase the delay by 2 seconds to avoid this issue.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/pci/hda/patch_realtek.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 877137cb09ac..88675eae9447 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -1001,6 +1001,14 @@ static int alc_resume(struct hda_codec *codec)
 	if (!spec->no_depop_delay)
 		msleep(150); /* to avoid pop noise */
 	codec->patch_ops.init(codec);
+
+	if (codec->core.subsystem_id == 0x10ec1304) {
+		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x04);
+		msleep(50);
+		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x44);
+		msleep(2000);
+		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, PIN_VREF80);
+	}
 	snd_hda_regmap_sync(codec);
 	hda_call_check_power_status(codec, 0x01);
 	return 0;
-- 
2.25.1

