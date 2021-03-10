Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A44E9333B73
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 12:31:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 352581792;
	Wed, 10 Mar 2021 12:30:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 352581792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615375864;
	bh=I86zCA6O5f75+SAT+bmv6eTkQr4g4CTHpAWspo55UVg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RfOav30u0GyesvaogVn3fyfO5ZH9AkWiaIwDHjqprtTBccVdxHA/ZhrEDu8/M4YG4
	 zm57d0T8m/mzUfbqZaUlW1Do3ygI/YgxjLU6GlhEUUr23uukqp2j77o0DYDUJ9/uE9
	 EI8NGrcelYnLS6BXriuDCB1KRd9V8AnYo8FqCgxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25916F80424;
	Wed, 10 Mar 2021 12:28:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AF4DF80217; Wed, 10 Mar 2021 12:28:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB80BF801D8
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 12:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB80BF801D8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CBB6AEBD;
 Wed, 10 Mar 2021 11:28:15 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ALSA: hda/hdmi: Cancel pending works before suspend
Date: Wed, 10 Mar 2021 12:28:09 +0100
Message-Id: <20210310112809.9215-4-tiwai@suse.de>
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

The per_pin->work might be still floating at the suspend, and this may
hit the access to the hardware at an unexpected timing.  Cancel the
work properly at the suspend callback for avoiding the buggy access.

Note that the bug doesn't trigger easily in the recent kernels since
the work is queued only when the repoll count is set, and usually it's
only at the resume callback, but it's still possible to hit in
theory.

BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1182377
Reported-and-tested-by: Abhishek Sahu <abhsahu@nvidia.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index e6d0843ee9df..45ae845e82df 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2480,6 +2480,18 @@ static void generic_hdmi_free(struct hda_codec *codec)
 }
 
 #ifdef CONFIG_PM
+static int generic_hdmi_suspend(struct hda_codec *codec)
+{
+	struct hdmi_spec *spec = codec->spec;
+	int pin_idx;
+
+	for (pin_idx = 0; pin_idx < spec->num_pins; pin_idx++) {
+		struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
+		cancel_delayed_work_sync(&per_pin->work);
+	}
+	return 0;
+}
+
 static int generic_hdmi_resume(struct hda_codec *codec)
 {
 	struct hdmi_spec *spec = codec->spec;
@@ -2503,6 +2515,7 @@ static const struct hda_codec_ops generic_hdmi_patch_ops = {
 	.build_controls		= generic_hdmi_build_controls,
 	.unsol_event		= hdmi_unsol_event,
 #ifdef CONFIG_PM
+	.suspend		= generic_hdmi_suspend,
 	.resume			= generic_hdmi_resume,
 #endif
 };
-- 
2.26.2

