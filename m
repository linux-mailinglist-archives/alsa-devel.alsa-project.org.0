Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4D05653B2
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:36:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 446561747;
	Mon,  4 Jul 2022 13:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 446561747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934587;
	bh=7JUnMoy4giwcuP6ZA8CZPPGu7TGkMLEhpS/sJq2CBmg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T8bDY2gYmMcQjTeIq8mdt28555Xthkb5BK72uIZlS8/tR12NbhraP3QA6xndRNCQo
	 +Wu/1RG2AO1JyjGtG3vPIUaEv7P1LI34h6pXeF0cDE0OfoSlqkLfw6B341RmDKdQsr
	 oolvZCg33fwEqKvqmvzYxUmEyjqioPI98OBirPN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE22BF80671;
	Mon,  4 Jul 2022 13:23:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D80B8F80249; Sun,  3 Jul 2022 07:33:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55F48F8014E
 for <alsa-devel@alsa-project.org>; Sun,  3 Jul 2022 07:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55F48F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pHB2278y"
Received: by mail-pj1-x102d.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so52867pjn.0
 for <alsa-devel@alsa-project.org>; Sat, 02 Jul 2022 22:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BsiPX2KtJdPnGqWVYZ5PsoFOkPFG/BSZesutbERBSQ0=;
 b=pHB2278yWNvovHSqE8wCj33lriFx16XfuVkuvvOfGzCj6h0ok8qbczqPmJbcUz3Ha5
 FVOtYLqd9+B4fwmk+UhUI7jF34NHb2o7xfYYVUBOPm+eZ6A9uCZtWM/XEDax9q/j+6vY
 so6bwmMEKZq1K2lNI0r8cdfumxLVn4hCnrI+2hR/xuj2FtIW4+112sAEiSQC1PqTaiYh
 D3HUYIdk5wNJjmpzSBCohTYapB714bZtQBE+EhMRWdl65LFcoOVxixJquIYVxXfN+nhO
 Nx/tKMZG4bFSxhfqLqqAHClnalmqHT0kpC+UDLRSqUc9rAwvnvFWqkco08sNutXEhfeP
 IpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BsiPX2KtJdPnGqWVYZ5PsoFOkPFG/BSZesutbERBSQ0=;
 b=oS2dv5XxyJ2gQkFaURDtgojDtkxGP91zYr8LBNluAewwC7hlZsPuv/HcKAI/9ISlHG
 AKNBHj8sxeD9RKEY3Wd31hvvEv6n8DhcKCjHbeBLXhHtC7ikP0xSWnMpaPhgXA26FOHI
 u3vPX5aahVwayq3mAvdNVzPvVTZFZ0kwDscA8Fs53wWJ749a597YGBSkUyubb8lnNPuL
 AdHmWeKjp8yEOL1UHYIyI+jlKaS3ACKLeUwpLVK8z0M0sjnt/WXLK7GEdi/2S5uvExiL
 mS5Rbn5Du5dOy+OZ7cgfp5/t/wLHLnWlfw9q6NTtPxRp1blNuYyyd1vyOe5tc53Eb86u
 /YbA==
X-Gm-Message-State: AJIora8YoLPdZCmbZji8tE1m1AUi+OV2aqH9BpcbpFJbamV0DwmPkIU7
 MprfyXkEjc+BStoz2jEaWso=
X-Google-Smtp-Source: AGRyM1vC3FjdkteKWfObrEzsO7RZCoKas+zX8IhpUVBdVRBxojZ5RAS3o5pKL7UZ293S7TDTvpRFfw==
X-Received: by 2002:a17:903:2443:b0:16a:29ac:27c2 with SMTP id
 l3-20020a170903244300b0016a29ac27c2mr28024083pls.46.1656826380197; 
 Sat, 02 Jul 2022 22:33:00 -0700 (PDT)
Received: from ZEN.. ([23.225.169.79]) by smtp.googlemail.com with ESMTPSA id
 e9-20020a170902784900b001636d95fe59sm18384354pln.172.2022.07.02.22.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 22:32:59 -0700 (PDT)
From: xhe <xw897002528@gmail.com>
To: 
Subject: [PATCH] ALSA: hda: add CSC3551 support for UM5302TA
Date: Sun,  3 Jul 2022 13:32:23 +0800
Message-Id: <20220703053225.2203-1-xw897002528@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:03 +0200
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Kailang Yang <kailang@realtek.com>, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Xiaoyan Li <lxy.lixiaoyan@gmail.com>,
 xw897002528@gmail.com, James Schulman <james.schulman@cirrus.com>,
 alsa-devel@alsa-project.org, Cameron Berkenpas <cam@neo-zeon.de>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Tim Crawford <tcrawford@system76.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 David Rhodes <david.rhodes@cirrus.com>, Yong Wu <yong.wu@mediatek.com>,
 Andy Chi <andy.chi@canonical.com>
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

From: He Wang <xw897002528@gmail.com>

ASUS UM5302TA are using csc3551, or cs35l41, which is connected to the
laptop by I2C bus. This patch adds quirk for the sound card, and avoid
ACPI DSD things for i2c-multi-instantiate cases like CLSA0100.

Patch is made by XiaoYan Li. It is tested by us on ASUS UM5302TA.

Signed-off-by: He Wang <xw897002528@gmail.com>
Signed-off-by: Xiaoyan Li <lxy.lixiaoyan@gmail.com>
---
 sound/pci/hda/cs35l41_hda.c   | 2 +-
 sound/pci/hda/patch_realtek.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index cce27a86267f..7374565ecf15 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -420,7 +420,7 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	 * And devm functions expect that the device requesting the resource has the correct
 	 * fwnode.
 	 */
-	if (strncmp(hid, "CLSA0100", 8) != 0)
+	if (strncmp(hid, "CLSA0100", 8) != 0 && strncmp(hid, "CSC3551", 7) != 0)
 		return -EINVAL;
 
 	/* check I2C address to assign the index */
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cee69fa7e246..49c27d948582 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9138,6 +9138,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1e8e, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1d42, "ASUS Zephyrus G14 2022", ALC289_FIXUP_ASUS_GA401),
+	SND_PCI_QUIRK(0x1043, 0x1f12, "ASUS UM5302TA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE", ALC256_FIXUP_ASUS_AIO_GPIO2),
 	SND_PCI_QUIRK(0x1043, 0x831a, "ASUS P901", ALC269_FIXUP_STEREO_DMIC),
-- 
2.33.0

