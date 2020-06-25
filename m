Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B8E209B72
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 10:41:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FFB618C5;
	Thu, 25 Jun 2020 10:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FFB618C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593074481;
	bh=ZE+m9DpaktA2befVQlj5Xv5a6IxBE2l93EFllQB09ts=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sJWFr14wD+v8NAg/YQWHrtfqr8U1Gok1gO9z7MiDZFkdu0GxliXcg5CrI+FVuaLRY
	 QaEORoTDIOGBBTmpm5bLPgJTT96oGkJ4S5/gqh4e1uKCZQFCF/nw8wZmX1FEcD31Nt
	 SWVBYXaqg32g5YX27awWggW42BABtlo8Aiwjv5vE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CA89F8023E;
	Thu, 25 Jun 2020 10:39:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 202ADF80158; Thu, 25 Jun 2020 10:39:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF6DAF80158
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 10:39:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF6DAF80158
Received: from 1.general.hwang4.us.vpn ([10.172.67.16]
 helo=localhost.localdomain) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1joNPs-0003mZ-Na; Thu, 25 Jun 2020 08:39:29 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda - let hs_mic be picked ahead of hp_mic
Date: Thu, 25 Jun 2020 16:38:33 +0800
Message-Id: <20200625083833.11264-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: stable@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

We have a Dell AIO, there is neither internal speaker nor internal
mic, only a multi-function audio jack on it.

Users reported that after freshly installing the OS and plug
a headset to the audio jack, the headset can't output sound. I
reproduced this bug, at that moment, the Input Source is as below:
Simple mixer control 'Input Source',0
  Capabilities: cenum
  Items: 'Headphone Mic' 'Headset Mic'
  Item0: 'Headphone Mic'

That is because the patch_realtek will set this audio jack as mic_in
mode if Input Source's value is hp_mic.

If it is not fresh installing, this issue will not happen since the
systemd will run alsactl restore -f /var/lib/alsa/asound.state, this
will set the 'Input Source' according to history value.

If there is internal speaker or internal mic, this issue will not
happen since there is valid sink/source in the pulseaudio, the PA will
set the 'Input Source' according to active_port.

To fix this issue, change the parser function to let the hs_mic be
stored ahead of hp_mic.

Cc: stable@vger.kernel.org
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/hda_auto_parser.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/pci/hda/hda_auto_parser.c
index 2c6d2becfe1a..824f4ac1a8ce 100644
--- a/sound/pci/hda/hda_auto_parser.c
+++ b/sound/pci/hda/hda_auto_parser.c
@@ -72,6 +72,12 @@ static int compare_input_type(const void *ap, const void *bp)
 	if (a->type != b->type)
 		return (int)(a->type - b->type);
 
+	/* If has both hs_mic and hp_mic, pick the hs_mic ahead of hp_mic. */
+	if (a->is_headset_mic && b->is_headphone_mic)
+		return -1; /* don't swap */
+	else if (a->is_headphone_mic && b->is_headset_mic)
+		return 1; /* swap */
+
 	/* In case one has boost and the other one has not,
 	   pick the one with boost first. */
 	return (int)(b->has_boost_on_pin - a->has_boost_on_pin);
-- 
2.17.1

