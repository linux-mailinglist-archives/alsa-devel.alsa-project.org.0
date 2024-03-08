Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A94B8876A3B
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 18:52:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB69BB65;
	Fri,  8 Mar 2024 18:52:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB69BB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709920353;
	bh=OFsGiRJS3vdez2Ml9BC4Ee8OzmfGGCHo+Z3cewRSeiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BXBzlo5i39YqdqADgJ8qG2LaCdPENiNGTZSyqiIdxfTIYQS9nbQVegfgvfbwyeCdJ
	 d/cgxNWmRDx3FbBOyk8cTclx7GRMVhQcE+CCg4KDmNaQVnZympp6VLuET30tQ72p/v
	 yoPBJoSmIE5LiQkOvc9xEuv5jc/WcRSFuGbQ+FgI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DA38F805F2; Fri,  8 Mar 2024 18:51:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6B9EF805D5;
	Fri,  8 Mar 2024 18:51:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DDD0F801F5; Fri,  8 Mar 2024 18:46:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 74F59F801F5
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 18:42:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74F59F801F5
Received: from fedori.lan (51b693e7.dsl.pool.telekom.hu
 [::ffff:81.182.147.231])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000007680B.0000000065EB4DEE.0020A5AC;
 Fri, 08 Mar 2024 18:42:06 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 1/5] ALSA: hda/tas2781: use dev_dbg in system_resume
Date: Fri,  8 Mar 2024 18:41:40 +0100
Message-ID: 
 <140f3c689c9eb5874e6eb48a570fcd8207f06a41.1709918447.git.soyer@irl.hu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1709918447.git.soyer@irl.hu>
References: <cover.1709918447.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: D3RCYGFL2URGMFE4KDDX6IJSDDPPDJA5
X-Message-ID-Hash: D3RCYGFL2URGMFE4KDDX6IJSDDPPDJA5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D3RCYGFL2URGMFE4KDDX6IJSDDPPDJA5/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The system_resume function uses dev_info for tracing, but the other pm
functions use dev_dbg.

Use dev_dbg as the other pm functions.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 1bfb00102a77..ee3e0afc9b31 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -900,7 +900,7 @@ static int tas2781_system_resume(struct device *dev)
 	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
 	int i, ret;
 
-	dev_info(tas_hda->priv->dev, "System Resume\n");
+	dev_dbg(tas_hda->priv->dev, "System Resume\n");
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-- 
2.44.0

