Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 995058221B9
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:07:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A040E8A;
	Tue,  2 Jan 2024 20:07:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A040E8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704222430;
	bh=ZxhrJsKWxq9E+ZCF97Hlhn6tkPMhiHPIcePMRLYZSTY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bRdUElfpho667tCKXTuZVm8707kUHC5pX6iDJ3F1pw1JGWpCsfpqzVzxKdtDPy4he
	 eRaUZfoHVX7fx3SKWlL2I3p6mgHRKXmAYGo3CrFI46izm8zrKADtAAaeIsf8fIII41
	 tn7ta0O2V0YMYBqAZPo5qSw07Rue2cRozXyea0EY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DA04F80579; Tue,  2 Jan 2024 20:06:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A38EF8055A;
	Tue,  2 Jan 2024 20:06:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD17EF8065A; Tue,  2 Jan 2024 19:59:32 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 1F9DEF8067E
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 19:54:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F9DEF8067E
Received: from fedori.lan (51b6838a.dsl.pool.telekom.hu
 [::ffff:81.182.131.138])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071ED9.00000000658F60B8.0014D4ED;
 Sat, 30 Dec 2023 01:13:44 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  alsa-devel@alsa-project.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH] ALSA: hda/tas2781: configure the amp after firmware load
Date: Sat, 30 Dec 2023 01:13:41 +0100
Message-ID: 
 <7f2f65d9212aa16edd4db8725489ae59dbe74c66.1703895108.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: SQWRUZGPVPYDM52TD2FSFXNBEOCODGFY
X-Message-ID-Hash: SQWRUZGPVPYDM52TD2FSFXNBEOCODGFY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SQWRUZGPVPYDM52TD2FSFXNBEOCODGFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Make the amp available immediately after a module
load to avoid having to wait for a PCM hook action.
(eg. unloading & loading the module while listening
music)

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index dfe281b57aa6..c8523df4105f 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -584,6 +584,8 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	 */
 	tas2781_save_calibration(tas_priv);
 
+	tasdevice_tuning_switch(tas_hda->priv, 0);
+
 out:
 	mutex_unlock(&tas_hda->priv->codec_lock);
 	if (fmw)

base-commit: 64bf8dec54cfe57f416884a6b3d54c7f4259e93f
-- 
2.43.0

