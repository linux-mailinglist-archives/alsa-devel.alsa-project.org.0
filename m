Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19688890DD1
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Mar 2024 23:48:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68F8A2CB1;
	Thu, 28 Mar 2024 23:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68F8A2CB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711666124;
	bh=4ad7yQtm68+AT2mdcchsQ2drGN+aCD6c8DrgJXxKOTI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rNEGjkbewAAalRqNkvaZnZswdNWznvM9/cbPAhrKg49UL5Pqpu1AhzHQuBl53GHrw
	 rWKmFoKWqJAwLfptrRcVRc+N4uSQJ8PnDHQqw8KgRHT6LqWYgcUh1BbQRis8wIUBik
	 +oFwz9DLazplmxAaomafGgyTlPybkcpHU3pvmBdk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9239FF805AA; Thu, 28 Mar 2024 23:48:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8800F805A0;
	Thu, 28 Mar 2024 23:48:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9D2BF80236; Thu, 28 Mar 2024 23:48:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 5F6AAF801EB
	for <alsa-devel@alsa-project.org>; Thu, 28 Mar 2024 23:47:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F6AAF801EB
Received: from fedori.lan (51b68717.dsl.pool.telekom.hu
 [::ffff:81.182.135.23])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000069CB0.000000006605F396.0024401B;
 Thu, 28 Mar 2024 23:47:50 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>,
  kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: tas2781: mark dvc_tlv with __maybe_unused
Date: Thu, 28 Mar 2024 23:47:37 +0100
Message-ID: 
 <0e461545a2a6e9b6152985143e50526322e5f76b.1711665731.git.soyer@irl.hu>
X-Mailer: git-send-email 2.44.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: A3PFJJ3HZAAHFKVLBNAKUHWNOLXBQF5M
X-Message-ID-Hash: A3PFJJ3HZAAHFKVLBNAKUHWNOLXBQF5M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A3PFJJ3HZAAHFKVLBNAKUHWNOLXBQF5M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since we put dvc_tlv static variable to a header file it's copied to
each module that includes the header. But not all of them are actually
used it.

Fix this W=1 build warning:

include/sound/tas2781-tlv.h:18:35: warning: 'dvc_tlv' defined but not
used [-Wunused-const-variable=]

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202403290354.v0StnRpc-lkp@intel.com/
Fixes: ae065d0ce9e3 ("ALSA: hda/tas2781: remove digital gain kcontrol")
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 include/sound/tas2781-tlv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/tas2781-tlv.h b/include/sound/tas2781-tlv.h
index 4038dd421150..1dc59005d241 100644
--- a/include/sound/tas2781-tlv.h
+++ b/include/sound/tas2781-tlv.h
@@ -15,7 +15,7 @@
 #ifndef __TAS2781_TLV_H__
 #define __TAS2781_TLV_H__
 
-static const DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
+static const __maybe_unused DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
 static const DECLARE_TLV_DB_SCALE(amp_vol_tlv, 1100, 50, 0);
 
 #endif

base-commit: 2d0401ee38d43ab0e4cdd02dfc9d402befb2b5c8
-- 
2.44.0

