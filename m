Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E0D2D0B39
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 08:40:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FB551747;
	Mon,  7 Dec 2020 08:40:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FB551747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607326853;
	bh=WhNWdPnmAKd249OWtJ1reTfF44j92pYBpQCyhet+yks=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IGtMRGGvOipg7UEQIl7uiN+xTJfqKY1CvZkKPVTkUItJlzO3wN8aX5xUL6OWsgPjG
	 rdNYeqaWPR7CrQdSNX1a7wL/cIH6+TCS9p07uDeQoiFpyVohjKwu/vRNyPHZBDXr7m
	 v1YoaefWDgjdIzHyrhTb90BU1Tze8cdxZmpAMcx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87F01F804D8;
	Mon,  7 Dec 2020 08:37:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A7D8F8020D; Mon,  7 Dec 2020 08:34:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2EB1F800E1
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 08:34:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2EB1F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="TWoY1ZMo"
Received: by mail-pf1-x444.google.com with SMTP id i3so5362979pfd.6
 for <alsa-devel@alsa-project.org>; Sun, 06 Dec 2020 23:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TIkKIzRH51h1L8SP1gRvc6+13g2+kyu7Qn+qiqmKw1w=;
 b=TWoY1ZMoAFOY9e0dzQ3N4Y01kI8BEw2I1EREyo9t7d0T60Yba/xevAfuO4HULhipHB
 KH+7o3JoXiWZMaTyathl9EQXx3kCq/gTL09EUzBS0Te8K6hAabQMlOvOHMzmpUji13LT
 FYV4bdcpbLyh7Clr8ITjoTRpMr7chFlDTY7mfImUNWsiA3I7uo6W1aAjgMWyvS7TrTCU
 enaeitbp/1GUm0jj0oFY+SQ8YfSCxLaI1fjj/AcesJOnffNmSOKRe4BL4BMOsTqZ5VzJ
 laPDsqxNKT8ygIZo8Vo4PtSztk9qLO8tR4WXK+CJsMHHtQygM6jGYFwuPGZoehavRq8U
 M9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TIkKIzRH51h1L8SP1gRvc6+13g2+kyu7Qn+qiqmKw1w=;
 b=Lq9BgHV8ag11lwn3Q+gaG2kCmMdw/ms9U4laQkrQSy0kT0BdiXlQEKrrLprlzrQbxL
 ldk2Z0S0OEYffgw/FltX5c0on7IvxwakAy5k6K3sRaIXmIlw6jx9Iir2c0Fw4v+WcBsy
 omhRgp2lX1T79PG4EEqkZH8TVP7bXmaENy5g4DLhpK5SQmEBjue+poPmRvQjLSF1xIQz
 LHtjqrC7gIScfNC0eDSMUym1oOX/A98A/TMwNqrgofYAlEq8gJ942x3CQ4gYbYUAMxUW
 OHr5bOI7OLx03Vwn521KC0lpI4k/WHFqQ4yHylWYCZdHUXQ4IibrOzIfNIblCbIPpgad
 US1Q==
X-Gm-Message-State: AOAM5316jNYR188sqPf80qRlOC4Ou4haNNqZ4jfe6Ru8sXFi1jNEpLDS
 s/lwOep7HVRTP4sIK5zrJcXYSA==
X-Google-Smtp-Source: ABdhPJyKvzuc7bl+SCli8jULWN87Ooi9a2yfuPQV02o2IviA6SkdwLFoD/KrkkD2zfO3B/wTCepo5g==
X-Received: by 2002:a05:6a00:1389:b029:18b:2d21:2f1a with SMTP id
 t9-20020a056a001389b029018b2d212f1amr14893752pfg.1.1607326442216; 
 Sun, 06 Dec 2020 23:34:02 -0800 (PST)
Received: from localhost.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id t22sm22526279pja.1.2020.12.06.23.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 23:34:01 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: tiwai@suse.com,
	kailang@realtek.com
Subject: [PATCH] ALSA: hda/realtek - Add support for Memeza EDL03 headset mic
Date: Mon,  7 Dec 2020 15:33:46 +0800
Message-Id: <20201207073346.16571-1-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:37:43 +0100
Cc: alsa-devel@alsa-project.org, Chris Chiu <chiu@endlessos.org>,
 linux-kernel@vger.kernel.org, Jian-Hong Pan <jhp@endlessos.org>,
 linux@endlessos.org
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

The Memeza laptop EDL03 with codec ALC256 can't detect the headset
microphone. The headphone jack sensing works after we add a pin
definition for it by ALC256_FIXUP_ASUS_MIC_NO_PRESENCE.

Signed-off-by: Chris Chiu <chiu@endlessos.org>
Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d5e4d0ba1008..8b9b94cfc67e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7871,6 +7871,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x10cf, 0x1629, "Lifebook U7x7", ALC255_FIXUP_LIFEBOOK_U7x7_HEADSET_MIC),
 	SND_PCI_QUIRK(0x10cf, 0x1845, "Lifebook U904", ALC269_FIXUP_LIFEBOOK_EXTMIC),
 	SND_PCI_QUIRK(0x10ec, 0x10f2, "Intel Reference board", ALC700_FIXUP_INTEL_REFERENCE),
+	SND_PCI_QUIRK(0x10ec, 0x115a, "Memeza EDL03", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x10ec, 0x1230, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10f7, 0x8338, "Panasonic CF-SZ6", ALC269_FIXUP_HEADSET_MODE),
 	SND_PCI_QUIRK(0x144d, 0xc109, "Samsung Ativ book 9 (NP900X3G)", ALC269_FIXUP_INV_DMIC),
-- 
2.20.1

