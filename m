Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 522E2827A1F
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jan 2024 22:18:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA8AA823;
	Mon,  8 Jan 2024 22:18:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA8AA823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704748699;
	bh=tPoKJLonMCqwPFdVygj197M+FIh66060a+HYLQ7ZNAI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Hzl3YufOqxD7tC5S0NoxQAy2zmgWLKXHfMhqjmdPupZJyF9A1nJIfM6DCT+U+DK37
	 RodcCH4GPI847iS2VKBvwnY5zmLnuimysFuBRK9tMJ2mcrLWRgyPJrBH2kvcSf5Ooa
	 zNA4PWWbsgQaVzSY8Dp54Y2UsqsEkzoV9v6reYcY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 182E6F8057F; Mon,  8 Jan 2024 22:17:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10223F8057F;
	Mon,  8 Jan 2024 22:17:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 832C5F80254; Mon,  8 Jan 2024 22:17:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 87108F80086
	for <alsa-devel@alsa-project.org>; Mon,  8 Jan 2024 22:17:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87108F80086
Received: from fedori.lan (51b681dd.dsl.pool.telekom.hu
 [::ffff:81.182.129.221])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000072D22.00000000659C666B.00161D8E;
 Mon, 08 Jan 2024 22:17:30 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  linux-sound@vger.kernel.org, Gergo Koteles <soyer@irl.hu>,
  kernel test robot <lkp@intel.com>
Subject: [PATCH] ALSA: hda/tas2781: annotate calibration data endianness
Date: Mon,  8 Jan 2024 22:16:46 +0100
Message-ID: 
 <3852ff28ea7d5d8f2086d8dd78aeff8d1d984991.1704748435.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: PIPJ6OXIJD3OYV4OJKLUCKY72665RLCJ
X-Message-ID-Hash: PIPJ6OXIJD3OYV4OJKLUCKY72665RLCJ
X-MailFrom: soyer@irl.hu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PIPJ6OXIJD3OYV4OJKLUCKY72665RLCJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Sparse reports an endian mismatch.
The amplifier expects the calibration data as big-endian.
Use the __be32 type to express endianness better.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401072137.Oc7pQgRW-lkp@intel.com/

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 4805cf0b6480..2dd809de62e5 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -424,8 +424,8 @@ static const struct snd_kcontrol_new tas2781_dsp_conf_ctrl = {
 
 static void tas2563_apply_calib(struct tasdevice_priv *tas_priv)
 {
-	unsigned int data;
 	int offset = 0;
+	__be32 data;
 	int ret;
 
 	for (int i = 0; i < tas_priv->ndev; i++) {

base-commit: 736c40609d31481b3b2fffe8c239f2c86fb2b54c
-- 
2.43.0

