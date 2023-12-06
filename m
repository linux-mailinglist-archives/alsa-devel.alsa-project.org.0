Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E31807CB2
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 01:05:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A1B385D;
	Thu,  7 Dec 2023 01:04:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A1B385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701907503;
	bh=kdQ5ux1dJTEDlskRCn36fXaLOIKi8eBnV0vlrnzDhYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f9NbwZyU1BWdXHpsbfleieoa/2qGS28Jd/YplhiYAu3iXbm3oaAqG+5JURKVvNVF1
	 eXVSFLmaw0CS6YwzpC1SkB/7f40SnsU8EtVV6pOssTbVZp6OL4avkwwQgpo4QLk5Pk
	 igGNm3/kzWoPl6ESw6F5pa67MNnf//m2gViNVBZQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 351FCF805BD; Thu,  7 Dec 2023 01:04:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB8E4F805BB;
	Thu,  7 Dec 2023 01:04:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4B0AF800D2; Thu,  7 Dec 2023 01:04:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id DCE01F8025A
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 01:00:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCE01F8025A
Received: from fedori.lan (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000716ED.0000000065710B04.00119052;
 Thu, 07 Dec 2023 01:00:04 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 05/16] ALSA: hda/tas2781: fix typos in comment
Date: Thu,  7 Dec 2023 00:59:46 +0100
Message-ID: 
 <b97a869c029a9bd62482262e2aa4139bdb6589c0.1701906455.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701906455.git.soyer@irl.hu>
References: <cover.1701906455.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: 4YAIWIBSMT764POKBL6BBMCTNKJOJDOU
X-Message-ID-Hash: 4YAIWIBSMT764POKBL6BBMCTNKJOJDOU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4YAIWIBSMT764POKBL6BBMCTNKJOJDOU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Correct typos.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 7c286802b273..70085177230e 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -421,9 +421,9 @@ static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
 	}
 }
 
-/* Update the calibrate data, including speaker impedance, f0, etc, into algo.
+/* Update the calibration data, including speaker impedance, f0, etc, into algo.
  * Calibrate data is done by manufacturer in the factory. These data are used
- * by Algo for calucating the speaker temperature, speaker membrance excursion
+ * by Algo for calcucating the speaker temperature, speaker membrane excursion
  * and f0 in real time during playback.
  */
 static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
-- 
2.43.0

