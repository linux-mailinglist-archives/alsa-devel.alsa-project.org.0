Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 466BE482555
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Dec 2021 18:16:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF2D1166D;
	Fri, 31 Dec 2021 18:15:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF2D1166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640970996;
	bh=9T6kCLYLAKxkTKTCpZZ6w0DHQCq+226UqSOg8OnDVKc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s95tHLcfCVjNpUYkqisTQUZuj66mgmdpzcjPXAah5UV0UKuXSvnfmmUo8EfS/OJmo
	 s/ZcZdpiBiUDACCdbfwdecfPHGZNfi+FkuC9ZsABDzndqtgFOU6oZ8tzSmWYgJIUpl
	 z/j6srucqQsm4wJUDM5waeI+f32k5OK02bU+6DeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCBE5F804E2;
	Fri, 31 Dec 2021 18:15:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF3AAF800C9; Fri, 31 Dec 2021 11:22:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DBFDF800C9
 for <alsa-devel@alsa-project.org>; Fri, 31 Dec 2021 11:22:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DBFDF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Bgrehd2h"
Received: by mail-wm1-x332.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso14771122wmc.3
 for <alsa-devel@alsa-project.org>; Fri, 31 Dec 2021 02:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gqPo3AQwT34o4wIP3ITTlrURYZBEnnpC+j9JjGC0c9o=;
 b=Bgrehd2hTqxs8QZv4R6f5RU6KwtXgMMhOY0OSxe1wx/OSWCdEqUX/dDjHlRZnTKPaC
 znaSyT7uZSXDvkYHcUE7QwSNdsMt8UuidmTE1HT6AZKkhrHvdNDZApIlQHvKQSjjKq/q
 u/ozYttbLxA0eh7MPw3jIPzXaTuwFR6c9f6SX7XHjvchPFllw5QcyT2eR/yEDcYBI+/8
 IauvQIs6mX0YLJRCkKBAw9nQ6nQDb8R9ksBbxOEU80IjWbSjKdZW47l9G4VNsAgPav15
 Ac7Z2WhgTcCGAS9Z+jip0sqrUBEm75qO3vENu2zmhVBvA7HYyzg8SyzN+xZ9wvlz3AZw
 /hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gqPo3AQwT34o4wIP3ITTlrURYZBEnnpC+j9JjGC0c9o=;
 b=G1SOFl5zIkg7s+HytRXIxdoX4C04bW2y0oo6zhHY9bdzbROuFajWbx0045TjSiNkLW
 zbdQkTwY0EcatHHJnyE9ks4Xkih8yHILCEQ1aN7J1Q/huhe5VBQBPxVTudvqU1EoR2jl
 gM80HUXgD0NRZsK3ZXaATsywxpDMP8rozaeR9HN1MqIMFRMVw51p4ebpXtCgXusTUA69
 iMJ5+qShMe/po/5QiZtd7Zh+DcmEJQs2/za9zGjVpWjeFzfJqt6a7d7tzECNOzSL5PIp
 FQSAmkuLzbuvmkO/FCar5A+5XwfC5IjJnGRtV5hVyBq0kkSYoBDyqJok+6IU7h9eYW4l
 S4AA==
X-Gm-Message-State: AOAM5311U9k5JlmsG3JOQrvj3V+61hdQeNA6WLO4mT+hHnHRE7TpoWn5
 4wgYsD8RTCJ9ZqKffRf6UlA=
X-Google-Smtp-Source: ABdhPJxE4LGuA3IT/1r1fdq5MmB51YHtQDxKt5T7HpFUuF0eKgCVM77BwhFsQFfAYdCNsnahf3FRQw==
X-Received: by 2002:a1c:cc0f:: with SMTP id h15mr29192305wmb.38.1640946155732; 
 Fri, 31 Dec 2021 02:22:35 -0800 (PST)
Received: from cosmos.lan (77.116.53.251.wireless.dyn.drei.com.
 [77.116.53.251])
 by smtp.gmail.com with ESMTPSA id d22sm26230509wmq.17.2021.12.31.02.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 02:22:35 -0800 (PST)
From: Christian Lachner <gladiac@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com
Subject: [PATCH 1/1] ALSA: hda/realtek - Fix silent output on Gigabyte X570
 Aorus Master after reboot from Windows
Date: Fri, 31 Dec 2021 11:21:38 +0100
Message-Id: <20211231102138.3226-2-gladiac@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211231102138.3226-1-gladiac@gmail.com>
References: <20211231102138.3226-1-gladiac@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 31 Dec 2021 18:15:28 +0100
Cc: Christian Lachner <gladiac@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

This patch addresses an issue where after rebooting from Windows into Linux
there would be no audio output.

It turns out that the Realtek Audio driver on Windows changes some coeffs
which are not being reset/reinitialized when rebooting the machine. As a
result, there is no audio output until these coeffs are being reset to
their initial state. This patch takes care of that by setting known-good
(initial) values to the coeffs.

We initially relied upon alc1220_fixup_clevo_p950() to fix some pins in the
connection list. However, it also sets coef 0x7 which does not need to be
touched. Furthermore, to prevent mixing device-specific quirks I introduced
a new alc1220_fixup_gb_x570() which is heavily based on
alc1220_fixup_clevo_p950() but does not set coeff 0x7 and fixes the coeffs
that are actually needed instead.

This new alc1220_fixup_gb_x570() is believed to also work for other boards,
like the Gigabyte X570 Aorus Extreme and the newer Gigabyte Aorus X570S
Master. However, as there is no way for me to test these I initially only
enable this new behaviour for the mainboard I have which is the Gigabyte
X570(non-S) Aorus Master.

I tested this patch on the 5.15 branch as well as on master and it is
working well for me.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=205275
Signed-off-by: Christian Lachner <gladiac@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 28255e752c4a..1463d7d62465 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -1924,6 +1924,7 @@ enum {
 	ALC887_FIXUP_ASUS_BASS,
 	ALC887_FIXUP_BASS_CHMAP,
 	ALC1220_FIXUP_GB_DUAL_CODECS,
+	ALC1220_FIXUP_GB_X570,
 	ALC1220_FIXUP_CLEVO_P950,
 	ALC1220_FIXUP_CLEVO_PB51ED,
 	ALC1220_FIXUP_CLEVO_PB51ED_PINS,
@@ -2113,6 +2114,26 @@ static void alc1220_fixup_gb_dual_codecs(struct hda_codec *codec,
 	}
 }
 
+static void alc1220_fixup_gb_x570(struct hda_codec *codec,
+				     const struct hda_fixup *fix,
+				     int action)
+{
+	static const hda_nid_t conn1[] = { 0x0c };
+
+	if (action != HDA_FIXUP_ACT_PRE_PROBE)
+		return;
+
+	alc_write_coef_idx(codec, 0x1a, 0x01c1);
+	alc_write_coef_idx(codec, 0x1b, 0x0202);
+	alc_write_coef_idx(codec, 0x43, 0x3005);
+	alc_write_coef_idx(codec, 0x58, 0x8fd6);
+	alc_write_coef_idx(codec, 0x5f, 0xa3c5);
+	alc_write_coef_idx(codec, 0x6a, 0x0232);
+
+	snd_hda_override_conn_list(codec, 0x14, ARRAY_SIZE(conn1), conn1);
+	snd_hda_override_conn_list(codec, 0x1b, ARRAY_SIZE(conn1), conn1);
+}
+
 static void alc1220_fixup_clevo_p950(struct hda_codec *codec,
 				     const struct hda_fixup *fix,
 				     int action)
@@ -2415,6 +2436,10 @@ static const struct hda_fixup alc882_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc1220_fixup_gb_dual_codecs,
 	},
+	[ALC1220_FIXUP_GB_X570] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc1220_fixup_gb_x570,
+	},
 	[ALC1220_FIXUP_CLEVO_P950] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc1220_fixup_clevo_p950,
@@ -2517,7 +2542,7 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x13fe, 0x1009, "Advantech MIT-W101", ALC886_FIXUP_EAPD),
 	SND_PCI_QUIRK(0x1458, 0xa002, "Gigabyte EP45-DS3/Z87X-UD3H", ALC889_FIXUP_FRONT_HP_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1458, 0xa0b8, "Gigabyte AZ370-Gaming", ALC1220_FIXUP_GB_DUAL_CODECS),
-	SND_PCI_QUIRK(0x1458, 0xa0cd, "Gigabyte X570 Aorus Master", ALC1220_FIXUP_CLEVO_P950),
+	SND_PCI_QUIRK(0x1458, 0xa0cd, "Gigabyte X570 Aorus Master", ALC1220_FIXUP_GB_X570),
 	SND_PCI_QUIRK(0x1458, 0xa0ce, "Gigabyte X570 Aorus Xtreme", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1462, 0x11f7, "MSI-GE63", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1462, 0x1228, "MSI-GP63", ALC1220_FIXUP_CLEVO_P950),
-- 
2.34.1

