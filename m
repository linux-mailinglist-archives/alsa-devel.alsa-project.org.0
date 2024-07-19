Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E1193764F
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2024 12:01:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B641CE9D;
	Fri, 19 Jul 2024 12:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B641CE9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721383287;
	bh=DgihQwGyJLD9i+lGfE827avXH+goKNy4YF325JpjvjI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hCy1kvjR/riIaemuobue9129pJ//iAH2ofDop1mtku/PAJq55Gosk+cuT6VYtK3hx
	 u/n1+jV0ThigFbRaTXMIUiBIjDy+l0gQR7BasFUFaWWEA4/yv+6XwJ/F234U/5flxw
	 QUHtiXf6AUSJ9DzuTF7N+SmbXBPosvfort4poE00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C826F805B4; Fri, 19 Jul 2024 12:00:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B15D8F805AE;
	Fri, 19 Jul 2024 12:00:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19C3DF804FC; Fri, 19 Jul 2024 11:57:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A009F8013D
	for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2024 11:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A009F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vD0SqM/4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBE48600BF;
	Fri, 19 Jul 2024 09:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323D2C32782;
	Fri, 19 Jul 2024 09:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721383006;
	bh=DgihQwGyJLD9i+lGfE827avXH+goKNy4YF325JpjvjI=;
	h=From:To:Cc:Subject:Date:From;
	b=vD0SqM/4Xd9sD0P+xZAVGFqZQrLirpXTV1WG2ruOoIok6P2hDCOjYFWu8+CQ5wO7D
	 hFVbkuihW/ba6wPha+6tpdipbPq+6X4sr8LJdGGFM4s52BTNk0I38hrBxNjEw18AQJ
	 ROOLPNp/+I33EsM4RzSyaISBQdAf+l07SYK8rTI71RUaySXx03aTmCv4HKISav93Qz
	 xY1m3VXBt2J9vicO31k/dzCgq9o2yWhdbPHBtBvgRPH6vlAt/BaColNfJWc8gCvUYO
	 S0KxiWJcD+CpE5kBiqeMLHPnjvZpxzLywZpse7qoTh/JrrNZZ4520KeVS3o52WAn2p
	 wiuky2sbd0BfQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Gergo Koteles <soyer@irl.hu>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sound: hda: tas2781: mark const variables as __maybe_unused
Date: Fri, 19 Jul 2024 11:56:34 +0200
Message-Id: <20240719095640.3741247-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MIKGE6PQSSQF344ALDQXHU7BUNJLS3HH
X-Message-ID-Hash: MIKGE6PQSSQF344ALDQXHU7BUNJLS3HH
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MIKGE6PQSSQF344ALDQXHU7BUNJLS3HH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

An earlier patch changed the DECLARE_TLV_DB_SCALE declaration, but
now there are additional static const variables that cause
the same build warnings:

In file included from sound/pci/hda/tas2781_hda_i2c.c:23:
include/sound/tas2781-tlv.h:23:28: error: 'tas2563_dvc_table' defined but not used [-Werror=unused-const-variable=]
   23 | static const unsigned char tas2563_dvc_table[][4] = {
      |                            ^~~~~~~~~~~~~~~~~
In file included from include/sound/tlv.h:10,
                 from sound/pci/hda/tas2781_hda_i2c.c:22:
include/sound/tas2781-tlv.h:20:35: error: 'tas2563_dvc_tlv' defined but not used [-Werror=unused-const-variable=]
   20 | static const DECLARE_TLV_DB_SCALE(tas2563_dvc_tlv, -12150, 50, 1);
      |                                   ^~~~~~~~~~~~~~~

Mark them all as unused as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/sound/tas2781-tlv.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/tas2781-tlv.h b/include/sound/tas2781-tlv.h
index 99c41bfc7827..00fd4d449ff3 100644
--- a/include/sound/tas2781-tlv.h
+++ b/include/sound/tas2781-tlv.h
@@ -16,11 +16,11 @@
 #define __TAS2781_TLV_H__
 
 static const __maybe_unused DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
-static const DECLARE_TLV_DB_SCALE(amp_vol_tlv, 1100, 50, 0);
-static const DECLARE_TLV_DB_SCALE(tas2563_dvc_tlv, -12150, 50, 1);
+static const __maybe_unused DECLARE_TLV_DB_SCALE(amp_vol_tlv, 1100, 50, 0);
+static const __maybe_unused DECLARE_TLV_DB_SCALE(tas2563_dvc_tlv, -12150, 50, 1);
 
 /* pow(10, db/20) * pow(2,30) */
-static const unsigned char tas2563_dvc_table[][4] = {
+static const __maybe_unused unsigned char tas2563_dvc_table[][4] = {
 	{ 0X00, 0X00, 0X00, 0X00 }, /* -121.5db */
 	{ 0X00, 0X00, 0X03, 0XBC }, /* -121.0db */
 	{ 0X00, 0X00, 0X03, 0XF5 }, /* -120.5db */
-- 
2.39.2

