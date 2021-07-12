Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 881D13C4648
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 11:37:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 089DD167C;
	Mon, 12 Jul 2021 11:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 089DD167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626082649;
	bh=S21WxVvQHpG/CezokHY86ZETHklVB0JcU/LqIMyAWOQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B7Yb1Wrneqcw576QIzdA6Ma0Jv/Ab1KrfM5MPiyKZiE0KhsORlrq3SfX1VRHDsiav
	 Cwa63l6N5heevXIX80MRp988TazbZgH7SozEJX12ojW+UnwXCIXOMuE9m8SkzDeJL1
	 ejygwjK+3ZaP7UVOETv3xaC60YnJwE5+H75VP5KA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82AA4F8025B;
	Mon, 12 Jul 2021 11:36:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFF3AF80254; Mon, 12 Jul 2021 11:35:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3C20F8020C
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 11:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3C20F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="KTbFoBJP"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="R+zftUAb"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9DC0F2213D
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 09:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626082552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7F3/MtpPK7htspEnpjqBMk7qcI1w6mVDyNZMi76IR54=;
 b=KTbFoBJPKdJRUjSuiHeeB4Qycjq3Ul47PWwV+g8vCWXyxCLP6wA4OBORNOuwsEwXXMuRqL
 bIaIcatH6nJypMF9bNmSoMuVA2WE1hvvDx2oEB1DtIaTUTaGZsquPDZp/aP6s+uhJGEz7L
 oCN5ZU3rqmym79yZErKqrLyjhtdspI0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626082552;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7F3/MtpPK7htspEnpjqBMk7qcI1w6mVDyNZMi76IR54=;
 b=R+zftUAbCGtqjkGQmntTPuB2MAkFkrmCMjAFez9EHqJPQKbiSSbPpAJCj1jwq25n9oGSjF
 Og0gJfCUTj8w7CDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 97ABEA3B84;
 Mon, 12 Jul 2021 09:35:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/hdmi: Add option to enable all pins forcibly
Date: Mon, 12 Jul 2021 11:35:51 +0200
Message-Id: <20210712093551.29007-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Intel platforms, we always enable all pins no matter what BIOS
sets, but for others, we still take the conservative approach, and the
HD-audio HDMI codec driver enables the streams only for the pins that
are enabled by BIOS, and skips the disabled pins.  This seems not good
for some machines that have (as expected) broken BIOS, resulting in
the lack of needed outputs.

There is an allow-list in the driver code to enable all pins, but its
addition needs a recompilation.  This patch adds a module option for
user's convenience to enable all pins forcibly on the fly.  User can
pass snd_hda_codec_hdmi.enable_all_pins=1 option for testing, and once
confirmed, we may add a static entry in force_connect_list[].

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 4b2cc8cb55c4..672fd28e2449 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -47,6 +47,10 @@ IS_ENABLED(CONFIG_SND_HDA_INTEL_HDMI_SILENT_STREAM);
 module_param(enable_silent_stream, bool, 0644);
 MODULE_PARM_DESC(enable_silent_stream, "Enable Silent Stream for HDMI devices");
 
+static bool enable_all_pins;
+module_param(enable_all_pins, bool, 0444);
+MODULE_PARM_DESC(enable_all_pins, "Forcibly enable all pins");
+
 struct hdmi_spec_per_cvt {
 	hda_nid_t cvt_nid;
 	int assigned;
@@ -1957,6 +1961,9 @@ static int hdmi_parse_codec(struct hda_codec *codec)
 		return -EINVAL;
 	}
 
+	if (enable_all_pins)
+		spec->force_connect = true;
+
 	q = snd_pci_quirk_lookup(codec->bus->pci, force_connect_list);
 
 	if (q && q->value)
-- 
2.26.2

