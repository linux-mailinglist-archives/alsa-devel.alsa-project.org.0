Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F0374FD59
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 05:00:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25498E7A;
	Wed, 12 Jul 2023 04:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25498E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689130844;
	bh=Vu+T9Vt/xiVSWZ4dm1ABkenYAfRvDzwc92fSuwmIzUE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EBRIUILqGvPYZVxHpJmZbjVmwQLi34HYur4r6d6N3FjQDtqQvEh1OQ+YMI1wVWHuP
	 e+a+lSuJWtTCqgMPrals9E1C0Quukq/GqzNG1I4fVsToAUYvJW0BIz9FKH4Ks4Lkrj
	 QVmzeiF31b8PUl+KS6pMPyptRHAtOUvZ8Bha6USA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 196C5F80093; Wed, 12 Jul 2023 04:59:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96D4BF80153;
	Wed, 12 Jul 2023 04:59:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC6A2F80249; Wed, 12 Jul 2023 04:59:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from n169-112.mail.139.com (n169-112.mail.139.com [120.232.169.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05A48F80093
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 04:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05A48F80093
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[183.194.159.125])
	by rmsmtp-lg-appmail-19-12022 (RichMail) with SMTP id 2ef664ae17086da-de900;
	Wed, 12 Jul 2023 10:59:22 +0800 (CST)
X-RM-TRANSID: 2ef664ae17086da-de900
From: Shenghao Ding <13916275206@139.com>
To: broonie@kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	pierre-louis.bossart@linux.intel.com
Cc: kevin-lu@ti.com,
	shenghao-ding@ti.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com,
	mengdong.lin@intel.com,
	x1077012@ti.com,
	peeyush@ti.com,
	navada@ti.com,
	tiwai@suse.de,
	Shenghao Ding <13916275206@139.com>
Subject: [PATCH v1] ALSA: hda/tas2781: fix 'fw_entry' is used uninitialized
Date: Wed, 12 Jul 2023 10:44:08 +0800
Message-Id: <20230712024408.316793-1-13916275206@139.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GCHFKYKSPQGWDP3IZMMGJNRH4C4ITVDZ
X-Message-ID-Hash: GCHFKYKSPQGWDP3IZMMGJNRH4C4ITVDZ
X-MailFrom: 13916275206@139.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GCHFKYKSPQGWDP3IZMMGJNRH4C4ITVDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix 'fw_entry' is used uninitialized.

Signed-off-by: Shenghao Ding <13916275206@139.com>

Changes in v1:
 | Reported-by: kernel test robot <lkp@intel.com>
 | Closes: https://lore.kernel.org/oe-kbuild-all/202307070922.doxi1HFc-lkp@intel.com/
---
 sound/soc/codecs/tas2781-fmwlib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index eb55abae0d7b..0b08e24ed23a 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -1908,7 +1908,7 @@ int tas2781_load_calibration(void *context, char *file_name,
 {
 	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *)context;
 	struct tasdevice *tasdev = &(tas_priv->tasdevice[i]);
-	const struct firmware *fw_entry;
+	const struct firmware *fw_entry = NULL;
 	struct tasdevice_fw *tas_fmw;
 	struct firmware fmw;
 	int offset = 0;
-- 
2.34.1


