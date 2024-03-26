Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8903D88C8E4
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:20:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D45F72C63;
	Tue, 26 Mar 2024 17:20:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D45F72C63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711470056;
	bh=5aDrrnIyMvrzhrxVH1Ca2IiEhPa9yUeMCoC85ZSPPPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fR0OqUYlPuBKDCgMz6DE5GBA4pMBcZw5CghB2MTAykBr4AW1Xf1mscldcMXRIUOBJ
	 gbxkc1O291VhAFaAdp+Tf2qIU6SqIou1AwH5YF5tBclz4UC+A5oVrv7Km4AAVBwTjM
	 rk3nudCuh/wEJoNyxS1/vwtEEzA6H2ZgvDACazYc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBFB0F80652; Tue, 26 Mar 2024 17:19:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16F7EF80635;
	Tue, 26 Mar 2024 17:19:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33675F8025F; Tue, 26 Mar 2024 17:19:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 13C2CF80236
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:19:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13C2CF80236
Received: from fedori.lan (51b68717.dsl.pool.telekom.hu
 [::ffff:81.182.135.23])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000077340.000000006602F575.0023D3CD;
 Tue, 26 Mar 2024 17:19:00 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v2 4/4] ALSA: hda/tas2781: remove useless dev_dbg from
 playback_hook
Date: Tue, 26 Mar 2024 17:18:48 +0100
Message-ID: 
 <8b9546db6c92dea4476a7247a88d56248c2ba8c2.1711469583.git.soyer@irl.hu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1711469583.git.soyer@irl.hu>
References: <cover.1711469583.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: M5UDTUNK4TF4KF3EFFG37DY4RMN7FVME
X-Message-ID-Hash: M5UDTUNK4TF4KF3EFFG37DY4RMN7FVME
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M5UDTUNK4TF4KF3EFFG37DY4RMN7FVME/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The debug message "Playback action not supported: action" is not useful,
because the action was previously printed, and the list of supported
actions are intentional.

Remove the debug statement from the default switch case.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index f495caee38e1..48dae3339305 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -161,8 +161,6 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
 		pm_runtime_put_autosuspend(dev);
 		break;
 	default:
-		dev_dbg(tas_hda->dev, "Playback action not supported: %d\n",
-			action);
 		break;
 	}
 }
-- 
2.44.0

