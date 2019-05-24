Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C15C2A023
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 22:52:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFB0D172E;
	Fri, 24 May 2019 22:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFB0D172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558731165;
	bh=mfmZ7c/j121HlWdlNYAJbdfqkwbRBhyGiBQeYqtMNvs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rp6DfGhRdhePhnCgEQyCo2cZo5DITBWvrmM2mFEo9L4w+s8YgGan7ufpWn6gT+Kvm
	 ooc+kyfmEjWik2Puu935gH6ZomeU5wFtlmEPYYmp/l82T1um2gu05XmY6zQU/Eeqi2
	 SP/jW3tmGZZHDrY07PxWEqKjZPbkcYVmmF5mtP/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 756A3F806F7;
	Fri, 24 May 2019 22:51:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C99CDF8963E; Fri, 24 May 2019 22:50:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35000F8962F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 22:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35000F8962F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="NM+AmP1b"; 
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="Q5MPMp42"
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 935D060256; Fri, 24 May 2019 20:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558730454;
 bh=gne908NtTubk5TiL/aykKkAesdYmaRXs+4vJQcGFdSQ=;
 h=From:To:Cc:Subject:Date:From;
 b=NM+AmP1b0A8P3Fmdtfc2On/2/yI2Zvsf2AujwNmWQSk5S+koC2y435XhTdszEgyml
 urvh+y95XVXYZtlrDbba2ubB/kN5XS9q6EkJajU1Lpi4cCGE/Gy/QxvjckpCRB/X2x
 uGOnn6PG8pQD+NgmUCHZ3U0dPfMLgAjZ0WQK7ATE=
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: bgoswami@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1751060907;
 Fri, 24 May 2019 20:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558730453;
 bh=gne908NtTubk5TiL/aykKkAesdYmaRXs+4vJQcGFdSQ=;
 h=From:To:Cc:Subject:Date:From;
 b=Q5MPMp42IqtC8SZ10B1PNcllcRGOwUWDMBcXjAiAdijIkXQHsumEybiHuoIucyhSm
 f8IF94IBgofgXBr/xPD/n7zuKcMoi4CAVPVwlDX++xR9IxgxG2iWYUrlkk9X9MsBn0
 +NY68XFJCnk3jb8LJwJ+7V/VWYJyoWpYDfn2/5s4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1751060907
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=bgoswami@codeaurora.org
From: bgoswami@codeaurora.org
To: perex@perex.cz,
	tiwai@suse.com
Date: Fri, 24 May 2019 13:40:50 -0700
Message-Id: <1558730450-16580-1-git-send-email-bgoswami@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 plai@codeaurora.org, Gopikrishnaiah Anandan <agopik@codeaurora.org>,
 broonie@kernel.org, srinivas.kandagatla@linaro.org
Subject: [alsa-devel] [PATCH 3/3] ALSA: jack: add switch event for
	unsupported jack types
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Banajit Goswami <bgoswami@codeaurora.org>

Add a jack switch event to report unsupported plug type.
This event can be used to report a headset or an extension
cable with GND/MIC swap etc., which may not be supported by
the device.

Signed-off-by: Gopikrishnaiah Anandan <agopik@codeaurora.org>
Signed-off-by: Banajit Goswami <bgoswami@codeaurora.org>
---
 sound/core/jack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/jack.c b/sound/core/jack.c
index 36b047b..4c21e48 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -40,6 +40,7 @@ struct snd_jack_kctl {
 	SW_JACK_PHYSICAL_INSERT,
 	SW_VIDEOOUT_INSERT,
 	SW_LINEIN_INSERT,
+	SW_UNSUPPORT_INSERT,
 };
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
