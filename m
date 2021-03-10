Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF1333B72
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 12:30:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66E17178C;
	Wed, 10 Mar 2021 12:30:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66E17178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615375854;
	bh=lfITUwJV9tNOR0VL8kVJxYzsYz9bFdzbng4ak0o3bjs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V/2XnjWxKH1/cUk7sFgGvsVFQSLFKmahZ1dsrC6+RpwejysMaWd2X/MjuvXpqv5s3
	 4hielwrAFKY3cXYYe4BBw6bNfb3zdxec11WEOFN/ojCNCqt6+EHynAchx6BfxYL9mi
	 bFdaZ/IznbhDnjI51j+VVXfMmcFQGlO3t5XprlYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE989F8014E;
	Wed, 10 Mar 2021 12:28:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BB98F801ED; Wed, 10 Mar 2021 12:28:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB75FF8016C
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 12:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB75FF8016C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79FCAAEB9;
 Wed, 10 Mar 2021 11:28:15 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: hda: Avoid spurious unsol event handling during
 S3/S4
Date: Wed, 10 Mar 2021 12:28:08 +0100
Message-Id: <20210310112809.9215-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310112809.9215-1-tiwai@suse.de>
References: <20210310112809.9215-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Abhishek Sahu <abhsahu@nvidia.com>
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

When HD-audio bus receives unsolicited events during its system
suspend/resume (S3 and S4) phase, the controller driver may still try
to process events although the codec chips are already (or yet)
powered down.  This might screw up the codec communication, resulting
in CORB/RIRB errors.  Such events should be rather skipped, as the
codec chip status such as the jack status will be fully refreshed at
the system resume time.

Since we're tracking the system suspend/resume state in codec
power.power_state field, let's add the check in the common unsol event
handler entry point to filter out such events.

BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1182377
Tested-by: Abhishek Sahu <abhsahu@nvidia.com>
Cc: <stable@vger.kernel.org> # 183ab39eb0ea: ALSA: hda: Initialize power_state
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_bind.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/hda_bind.c b/sound/pci/hda/hda_bind.c
index 6a8564566375..17a25e453f60 100644
--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -47,6 +47,10 @@ static void hda_codec_unsol_event(struct hdac_device *dev, unsigned int ev)
 	if (codec->bus->shutdown)
 		return;
 
+	/* ignore unsol events during system suspend/resume */
+	if (codec->core.dev.power.power_state.event != PM_EVENT_ON)
+		return;
+
 	if (codec->patch_ops.unsol_event)
 		codec->patch_ops.unsol_event(codec, ev);
 }
-- 
2.26.2

