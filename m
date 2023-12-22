Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFA981C239
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 01:12:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40049DF1;
	Fri, 22 Dec 2023 01:12:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40049DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703203978;
	bh=CsP0NPLWWEKqxO+0d501Qs6z6NGt126y2BBn0/XaA7Y=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TSxU5NiM+ADBn62tkUv/A4n/5SNxdBzDSdmskvH1+y0PXvYq26MYyd3nDfdpYSBPp
	 TikYCACgGFEnvuZR6XL+Lw765bEUJb0UULzmFcTumxl4uYms0iy9IysyIkHSIcliNU
	 UHlKPEcY2pvd1sEX+H84PKRHM7AZ3EHxtE9z8fX0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FF61F80580; Fri, 22 Dec 2023 01:12:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C72CF80578;
	Fri, 22 Dec 2023 01:12:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FFBCF8016E; Fri, 22 Dec 2023 01:12:20 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 20C9CF800F5
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 01:12:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20C9CF800F5
Received: from fedori.lan (51b681e3.dsl.pool.telekom.hu
 [::ffff:81.182.129.227])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071DC1.000000006584D45A.0013B197;
 Fri, 22 Dec 2023 01:12:09 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  alsa-devel@alsa-project.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH] ALSA: hda/tas2781: fix typos in comment
Date: Fri, 22 Dec 2023 01:11:54 +0100
Message-ID: 
 <ead5609d63e71e8e87c13e1767decca5b272d696.1703203812.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: 2BGUAON5CY3HV3ZN7HTMTAOOV4WYZTEG
X-Message-ID-Hash: 2BGUAON5CY3HV3ZN7HTMTAOOV4WYZTEG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2BGUAON5CY3HV3ZN7HTMTAOOV4WYZTEG/>
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
index fb802802939e..8f63e3099d3e 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -421,9 +421,9 @@ static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
 	}
 }
 
-/* Update the calibrate data, including speaker impedance, f0, etc, into algo.
+/* Update the calibration data, including speaker impedance, f0, etc, into algo.
  * Calibrate data is done by manufacturer in the factory. These data are used
- * by Algo for calucating the speaker temperature, speaker membrance excursion
+ * by Algo for calculating the speaker temperature, speaker membrane excursion
  * and f0 in real time during playback.
  */
 static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)

base-commit: c7e37b07cc7564a07125ae48c11fd1ca2bcbeae2
-- 
2.43.0

