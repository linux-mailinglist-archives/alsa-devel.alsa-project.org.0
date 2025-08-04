Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB54B19C68
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Aug 2025 09:23:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19D7A6024F;
	Mon,  4 Aug 2025 09:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19D7A6024F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754292187;
	bh=aRhhJa9/9ViCdgD8GDjba5LOR9SNDQwa3S5lWHQCQEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WlRcsZEIGOhlbAJb5rYTbVuIc/C08L28G4LwYUuaa1wuzDsRNYn49BJF4zr8eNmfp
	 +Ci13F943vdbdXi1o/Y9WImJ7K4mO3jzgeMxPwjNgDaZfTeNOhkoAIfQaK92euH/16
	 htRmpsFwGYGsHGQ4MTBUADtDeL9C9PDBvIuuTWNA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40D19F8061C; Mon,  4 Aug 2025 09:22:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E435F805F0;
	Mon,  4 Aug 2025 09:22:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2E70F804CF; Mon,  4 Aug 2025 05:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by alsa1.perex.cz (Postfix) with ESMTP id C30D0F8003C
	for <alsa-devel@alsa-project.org>; Mon,  4 Aug 2025 05:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C30D0F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=DL2H5VV+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5u
	ajuGA4O8ZmH1OAMXAjwo6x5Mp+YdmlXiyesPEcWhs=; b=DL2H5VV+94vSCReGJz
	AJEnHd0lalLN2Dn7kWqFuFOYXCUJSL8FY8k0u8uAVJLeefhgmvjJMXlhCUQcfCje
	rbmex0irmeYWK25KNYORDtXQh33+PAQVpEEq1oFsvWOZTF9j4X80Tv60BcPcQ8j4
	tiWZKlTCPLUVtHJ4ymWCVEjV0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id
 _____wBHOs5_I5BoPnvzJQ--.25158S3;
	Mon, 04 Aug 2025 11:05:44 +0800 (CST)
From: wangdich9700@163.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH 2/2] ALSA: hda/realtek: Fix ALC662 codec pop noise on
 recording
Date: Mon,  4 Aug 2025 11:05:18 +0800
Message-Id: <20250804030518.424229-2-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250804030518.424229-1-wangdich9700@163.com>
References: <20250804030518.424229-1-wangdich9700@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHOs5_I5BoPnvzJQ--.25158S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tryfJr1kWry5AF15CFyfZwb_yoW8XrWrpr
	WfCFyfWF47Jryjyw18tw47u3W8Ga48ZrW3C3yYkw1xJrsY93s3KF1fA3srZFW2kFZ0gFWj
	vr1rta4kXrWYkF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jfeOJUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1tbibgSfT2iQGr-xBwABsQ
X-MailFrom: wangdich9700@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZLHO3YKDVIIZM6HORZY6XAUDDTMFF42G
X-Message-ID-Hash: ZLHO3YKDVIIZM6HORZY6XAUDDTMFF42G
X-Mailman-Approved-At: Mon, 04 Aug 2025 07:21:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZLHO3YKDVIIZM6HORZY6XAUDDTMFF42G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: wangdicheng <wangdicheng@kylinos.cn>

Pop noise originates from unstable mic_vref during power_save transitions.
Remediation: Disable VREF at resume, delay 1000ms before re-enabling to guarantee circuit stabilization pre-capture.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/pci/hda/patch_realtek.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 88675eae9447..665e291dea75 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -997,16 +997,21 @@ static int alc_suspend(struct hda_codec *codec)
 static int alc_resume(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
+	int vref_delay = 0;
 
 	if (!spec->no_depop_delay)
 		msleep(150); /* to avoid pop noise */
 	codec->patch_ops.init(codec);
 
-	if (codec->core.subsystem_id == 0x10ec1304) {
+	if (codec->core.subsystem_id == 0x10ec1304)
+		vref_delay = 2000;
+	else if (codec->core.subsystem_id == 0x1b505809)
+		vref_delay = 1000;
+	if (vref_delay > 0) {
 		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x04);
 		msleep(50);
 		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x44);
-		msleep(2000);
+		msleep(vref_delay);
 		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, PIN_VREF80);
 	}
 	snd_hda_regmap_sync(codec);
-- 
2.25.1

