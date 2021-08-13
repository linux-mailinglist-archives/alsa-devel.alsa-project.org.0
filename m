Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7605B3EB264
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 10:14:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04699182B;
	Fri, 13 Aug 2021 10:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04699182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628842452;
	bh=UgvaUMvAevIEjFzqkuQdwCaUc3bAtLEAhUZTqMF1Xgw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lQNqHoKLHm4MWanjmU8EGf5XNbgLVshuFS1m8TYgruumHYTLpymtAxmtVHCZRsD3N
	 bJ5IWg/ILtBztM23lo4SRhz73e1pM123jDAkZ3SD8IwVHoY8jwOrWNRfuH1+4Rxtb8
	 63UO6osTCCrSOrwjD0qO+k/sMGJvKOHvd56Y7Ejw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 538C0F804AE;
	Fri, 13 Aug 2021 10:12:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73F0AF804AE; Fri, 13 Aug 2021 10:12:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83792F80129
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 10:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83792F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="TierabmI"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="KTHy3qsb"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B887D1FF91;
 Fri, 13 Aug 2021 08:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628842353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ecistz0P34c1ZnwoqgdwDCtvVgS9yvBwKzKIW6MuPLs=;
 b=TierabmIMB9ccPYpD6IHjJpjAG4BkU82xKvG9G/ECzIkviny6ntfvSMsiXNNizHjf+NFbr
 7yTIRjkX6vvpkjHP9xi00nfX1G9teKJGF3/4tt9zZsKhEpYq7SITjdidJpfWr0grvNwjaK
 VjjpiPJnFHNxsT5ser65WGwo0P66RxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628842353;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ecistz0P34c1ZnwoqgdwDCtvVgS9yvBwKzKIW6MuPLs=;
 b=KTHy3qsbIrvqupf1+bFLRRGGbhT4s8r2oIFhKoHhcYdRZ4p4qX1OVYVaPJPqc5D/zC08r6
 U/Jr28igqvcj/wDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B1B8CA3B85;
 Fri, 13 Aug 2021 08:12:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ALSA: hda: conexant: Turn off EAPD at suspend, too
Date: Fri, 13 Aug 2021 10:12:28 +0200
Message-Id: <20210813081230.4268-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210813081230.4268-1-tiwai@suse.de>
References: <20210813081230.4268-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: youling257@gmail.com, Imre Deak <imre.deak@intel.com>
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

Conexant codecs have a workaround for the noise at shutdown to turn
off EAPD, but it wasn't applied at suspend.  In the later patch, we'll
switch from reboot_notify callback to the general suspend-at-shutdown,
so let's apply the workaround to the suspend case, too.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=214045
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_conexant.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index d111258c6f45..6d2bdef7f017 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -177,13 +177,18 @@ static int cx_auto_init(struct hda_codec *codec)
 	return 0;
 }
 
-static void cx_auto_reboot_notify(struct hda_codec *codec)
+static void cx_auto_shutdown(struct hda_codec *codec)
 {
 	struct conexant_spec *spec = codec->spec;
 
 	/* Turn the problematic codec into D3 to avoid spurious noises
 	   from the internal speaker during (and after) reboot */
 	cx_auto_turn_eapd(codec, spec->num_eapds, spec->eapds, false);
+}
+
+static void cx_auto_reboot_notify(struct hda_codec *codec)
+{
+	cx_auto_shutdown(codec);
 	snd_hda_gen_reboot_notify(codec);
 }
 
@@ -193,6 +198,14 @@ static void cx_auto_free(struct hda_codec *codec)
 	snd_hda_gen_free(codec);
 }
 
+#ifdef CONFIG_PM
+static int cx_auto_suspend(struct hda_codec *codec)
+{
+	cx_auto_shutdown(codec);
+	return 0;
+}
+#endif
+
 static const struct hda_codec_ops cx_auto_patch_ops = {
 	.build_controls = snd_hda_gen_build_controls,
 	.build_pcms = snd_hda_gen_build_pcms,
@@ -201,6 +214,7 @@ static const struct hda_codec_ops cx_auto_patch_ops = {
 	.free = cx_auto_free,
 	.unsol_event = snd_hda_jack_unsol_event,
 #ifdef CONFIG_PM
+	.suspend = cx_auto_suspend,
 	.check_power_status = snd_hda_gen_check_power_status,
 #endif
 };
-- 
2.26.2

