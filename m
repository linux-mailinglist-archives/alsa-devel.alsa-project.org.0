Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F6A623177
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:27:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC80F16C8;
	Wed,  9 Nov 2022 18:26:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC80F16C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014859;
	bh=MU365S7LvxnU0/mEpmFM2xpKbG55b4ok0Uc3MaRprqg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AKT9VZWq+Is1qxbYtiooznKPO5OWGCDqRbX2M6BlNV5VxHtdtt15hm5k6M2VCYztF
	 DtWsWQ4+ImtdnRuRMy9MFVJ77XPPBlm7jEoHYLg+ln/6ScgdUIuvFc97muxLrd1oqi
	 dFC+OcQv6aunEOwk7/r39tt/6tMIqXR91xKmQK/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02A2BF8063E;
	Wed,  9 Nov 2022 18:16:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89010F800EC; Wed,  9 Nov 2022 17:09:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27FFBF800EC
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 17:09:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27FFBF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Nhzsx/MX"
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-13bd2aea61bso20174895fac.0
 for <alsa-devel@alsa-project.org>; Wed, 09 Nov 2022 08:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O+ciU0sT4u08NPKcl9DaTETZGeZkMHiw1jZdMv7xqPA=;
 b=Nhzsx/MXbsrcTW6OPRS65Q2x1pW8SkzzX0qe0CPMwyqh6lMJioVuYKk8cZdhlyiHk5
 CDd/Zbz3ZfSElh9nXrQMGB6+EVviYtfJ4SVTgn2HBHJg/8WsM6ksrNbTju4Q8oavP7oN
 NcWCXx+6+8hGQY+KIoezMKuC2y3IltPSnMnx45tQs4APRne1Yqzb/aZhAxueIKRJ2V/X
 YoekutVytnKf47rkRISok7hKDpCsG5WO5ogvDr7tnfsioxiWmlvpmZIvF7Gs7SwuoIPZ
 csK8/CkNPB6caBjEUdrOSGFl5OEis/wIDi0VXBGJIw3gfoyQ50cayCbq+6MAYqdRMLLT
 krtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O+ciU0sT4u08NPKcl9DaTETZGeZkMHiw1jZdMv7xqPA=;
 b=I5wmLJwqMELvniuRe0xt39GWik/yrHkQ+uWa0enjU5e4lu5g5FkVuzzmBXrf+S7Dz9
 F2qJGbD/rlyC6oVVABap+gNpi6w7X7FNovBZgxJduKMM3AoOhQrLRbvkQhSwvh1wWPhB
 DZ7te/uZ4yUASHfr1fhP7m5/0tA6267eZTv4+F5aFL1ScUFasv8UbPZrJPSitUnrF8Y2
 mXmbaoNAsLZaQnCzb3KZ3q6g8gtYxEI2FduLbPTG6WZ7z+wp/EOOQK2nBO4Wui9oKTam
 DYDTtdw1/4W7SzPU/GqT4gvGiGu3tZhjFr9vgyy5eCLkt9VyVz+Yc0HXbpll6w2W8aBg
 +V1Q==
X-Gm-Message-State: ACrzQf0QREOqQ/FJRUCOAYJdOJ4zqXbBELUAiI+mk6rJd/Z3eaHMXxw9
 NxKKsBX7wqJAJYascSm3k28=
X-Google-Smtp-Source: AMsMyM6wwbn6xwC/Fg/sKQ455dcLPp7rGKAYrAwqHjIU7B0a7G/zSF7QfASMHfrCtAWW1JzmgUwR/w==
X-Received: by 2002:a05:6870:610d:b0:13c:3fc4:4e9d with SMTP id
 s13-20020a056870610d00b0013c3fc44e9dmr43974657oae.156.1668010174847; 
 Wed, 09 Nov 2022 08:09:34 -0800 (PST)
Received: from x-VJFE44F11X-XXXXXX.cardume.local ([177.134.206.108])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a4ad0d0000000b0049ea9654facsm4273704oor.32.2022.11.09.08.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:09:34 -0800 (PST)
From: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
To: perex@perex.cz
Subject: [PATCH] ALSA: hda/realtek: Add Positivo C6300 model quirk
Date: Wed,  9 Nov 2022 12:09:09 -0400
Message-Id: <20221109160909.4578-1-edson.drosdeck@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 09 Nov 2022 18:15:50 +0100
Cc: sbinding@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 tangmeng@uniontech.com, p.jungkamp@gmx.net, tcrawford@system76.com,
 tiwai@suse.com, wse@tuxedocomputers.com, linux-kernel@vger.kernel.org,
 edson.drosdeck@gmail.com, kai.heng.feng@canonical.com,
 alsa-devel@alsa-project.org
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

Positivo Master C6300 (1849:a233) require quirk for anabling headset-mic

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 701a72ec5629..ad2987888966 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9608,6 +9608,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x511f, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x9e54, "LENOVO NB", ALC269_FIXUP_LENOVO_EAPD),
 	SND_PCI_QUIRK(0x1849, 0x1233, "ASRock NUC Box 1100", ALC233_FIXUP_NO_AUDIO_JACK),
+	SND_PCI_QUIRK(0x1849, 0xa233, "Positivo Master C6300", ALC233_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x19e5, 0x3204, "Huawei MACH-WX9", ALC256_FIXUP_HUAWEI_MACH_WX9_PINS),
 	SND_PCI_QUIRK(0x19e5, 0x320f, "Huawei WRT-WX9 ", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1b35, 0x1235, "CZC B20", ALC269_FIXUP_CZC_B20),
-- 
2.37.2

