Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B66012F5C61
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 09:29:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC166165D;
	Thu, 14 Jan 2021 09:28:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC166165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610612966;
	bh=oC/O7nD5TnVPapSRdKDNVz+B3Jijz3iGRMAn9MSEWQs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Pu/Z+EUabgPlbWWwOWo1QcT/iVmHNgpwMhgCFwjbfWphdJ/dZzULlbx+JpIWKRjbx
	 8I1/W2EetLtMn+Y49tePPYIYa4eBHx3IZstvYJAdfudKwJjhSsKOVB33hWsJhqELCE
	 98EVII1f7604WhBxbHAgX1FAzC+7q/AkKbpm2ano=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9974DF80249;
	Thu, 14 Jan 2021 09:27:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3A27F8025E; Thu, 14 Jan 2021 09:27:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3797DF80118
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 09:27:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3797DF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="ohx/RaUX"
Received: by mail-pj1-x1033.google.com with SMTP id y12so2694716pji.1
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 00:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qlp0Ya7zu9BzVSD7Qg7ivfoy7HFP536rfCtMI+DYOvY=;
 b=ohx/RaUXQ2dLL0l8qHkeqrFLndxV4612E0nM1uVgQK4CIvl1DR4jMu82wUJDogG44z
 kKHkmw1oHJYkpXU83dHC4T+af09UOSB4n7G+Nib+TRzNRRLKsjp2OvwNrxCHanubyh+U
 0QK/P59+DVU1yJVY1duwo3hmq1YoygDec7QmfcAUkFAKNMMNGJ3Xw/85J0568tMxXfiE
 rZLZNiQK7Z25wFU/j8kFkV41Ft508PfeBCtTw+VXTgjYX90WOtDjP1kYJNh3MizI37BV
 vATZDYOC6qqzQNNqI7Ym5kDQtaaKiYGZoa6eHnaO98f8qXMhpIBBTHO7BAGPP2auzs2N
 1k4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qlp0Ya7zu9BzVSD7Qg7ivfoy7HFP536rfCtMI+DYOvY=;
 b=gwd1LXfM7Yc8yRoxsiT0UBLI/pvZjeYykSIf2rAGWvszQJB78ld4RJJx2uUaKhuUaE
 Dh5Qw8twqwiQIXSmVPnG6xtaIU3YvC0Alk3kHpCvANp/SHXzuZ07YmK7K8v0eF7qMJBM
 PUU4o46PseWpzxImc5bcK3nEZpJ77ucc7dYnnNh2OWn/+w5X58l8Vf8FsXltmH4cM5bN
 I2dtfuuckrJho9vxLVs9NpUOY/VKGstGsyay33DhVBx1NTgSB2k8vTO4/UjbixHgS45j
 JEIKosJ2wuWJgpEsgBhpspsKhueHtVDjiI22bFz6zhgUx51a1IwL5P0mfQWjer2HBS3o
 aGUA==
X-Gm-Message-State: AOAM532YjIXK0/TlaKozPUqj43gMsW9S3MkQsSBcJOOvGE7mW3o424Q3
 kaqtSEYTrk6Dpz5qlUtvbhmNxQ==
X-Google-Smtp-Source: ABdhPJzAlRrFZ6HBqyY7D5bN2DQri3LbmVWP1G6yVxzSCc53B+OeI1jYBH7Aaubf+PudSy+VDfaTkg==
X-Received: by 2002:a17:902:7793:b029:da:d44d:1968 with SMTP id
 o19-20020a1709027793b02900dad44d1968mr6696098pll.47.1610612860074; 
 Thu, 14 Jan 2021 00:27:40 -0800 (PST)
Received: from localhost.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id x23sm4591418pgk.14.2021.01.14.00.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 00:27:39 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com
Subject: [PATCH] ALSA: hda/realtek - Limit int mic boost on Acer Aspire E5-575T
Date: Thu, 14 Jan 2021 16:27:28 +0800
Message-Id: <20210114082728.74729-1-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Chris Chiu <chiu@endlessos.org>,
 linux-kernel@vger.kernel.org, linux@endlessos.org
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

The Acer Apire E5-575T laptop with codec ALC255 has a terrible
background noise comes from internal mic capture. And the jack
sensing dose not work for headset like some other Acer laptops.

This patch limits the internal mic boost on top of the existing
ALC255_FIXUP_ACER_MIC_NO_PRESENCE quirk for Acer Aspire E5-575T.

Signed-off-by: Chris Chiu <chiu@endlessos.org>
---
 sound/pci/hda/patch_realtek.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3c1d2a3fb1a4..60eb8383a704 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6371,6 +6371,7 @@ enum {
 	ALC256_FIXUP_HP_HEADSET_MIC,
 	ALC236_FIXUP_DELL_AIO_HEADSET_MIC,
 	ALC282_FIXUP_ACER_DISABLE_LINEOUT,
+	ALC255_FIXUP_ACER_LIMIT_INT_MIC_BOOST,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7808,6 +7809,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE
 	},
+	[ALC255_FIXUP_ACER_LIMIT_INT_MIC_BOOST] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc269_fixup_limit_int_mic_boost,
+		.chained = true,
+		.chain_id = ALC255_FIXUP_ACER_MIC_NO_PRESENCE,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7826,6 +7833,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x102b, "Acer Aspire C24-860", ALC286_FIXUP_ACER_AIO_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1065, "Acer Aspire C20-820", ALC269VC_FIXUP_ACER_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x106d, "Acer Cloudbook 14", ALC283_FIXUP_CHROME_BOOK),
+	SND_PCI_QUIRK(0x1025, 0x1094, "Acer Aspire E5-575T", ALC255_FIXUP_ACER_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1025, 0x1099, "Acer Aspire E5-523G", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x110e, "Acer Aspire ES1-432", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1166, "Acer Veriton N4640G", ALC269_FIXUP_LIFEBOOK),
-- 
2.20.1

