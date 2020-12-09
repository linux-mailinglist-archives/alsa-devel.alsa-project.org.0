Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4C22D3A00
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 05:59:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD7E216D9;
	Wed,  9 Dec 2020 05:58:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD7E216D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607489964;
	bh=6LbhrhXd+BL4GBHJz0OjkvBsg5lZkhUqVdBLKBLcxhY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ncKaXoFfkb8ydMndldk3CK7PE5HBvsaXJaad8brhNrlevAAv7W/87iTpc9nKvRV/z
	 wgshGZlH6jbUSDkGc98nGn+Y2JWwEg5YYyvV5kM/We6/7NT0ElGisEz0100Nu6Yq0y
	 Jzuuifxu6qQaJsOvRx1Uv6xriloCAq6lnZOlajrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE8A6F80217;
	Wed,  9 Dec 2020 05:57:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7CE4F8020D; Wed,  9 Dec 2020 05:57:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9378F800E1
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 05:57:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9378F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="dn95pMcd"
Received: by mail-pg1-x541.google.com with SMTP id e2so437346pgi.5
 for <alsa-devel@alsa-project.org>; Tue, 08 Dec 2020 20:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=95+j/heHWe1WaIW2wuU06rCfMJ7fLe/PVC+mrAa/tbA=;
 b=dn95pMcdeUnm+YT4tp8+Y2wFkXWa4mb4yIE+j4JqPFZv0xSXN+VZAhyIqRBTLTtZq9
 yCGI3qb6HXfKNBvUVDEXdUPlK3lQUNaFkHOF30JBV6uFO+jbkkVOLP8KPW2I6wYiQPkR
 OKFsXlyNbL8s44Xcv4XkG4tf9KBirJfTEu1SQoPpVEGoLYLzzXF0emSyy1ONZPIyHbHj
 gaYNGXWoPzcKKBpo/RzWauBZAt2mj3X1q9UuVEc58nUTW/zOB96YJZ5+ScVNgb62GNRk
 RZpw5fZODkQqZio0GhVmqecZBUBDSpthofgKGrkao98rsdpsz/hAI0+JFBC93vveSwLA
 HPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=95+j/heHWe1WaIW2wuU06rCfMJ7fLe/PVC+mrAa/tbA=;
 b=lL0ggzY59UKtBeNVeA7FwsccrSDrMkEpM+GNHyPY9xbbaOxcUScf3b2nA2RhBomCFy
 VfKmf8S6S2Nps4Leh/Yvx6D4BNb5RqWo5DAEM2ZfyD6JU5TLIaAsfgk6Pot/9WMwHd8y
 S1TsoYFP72ucZ/Fu5vmg89Cl7Wi8czQ7Qionpmh6Fe4NG5E3EX5sitfsNSNyYMw42GvP
 XmUQE71baZ7b70fws6yd/QKFOXctAEFD0Kh9w3tvqR8I7RofBgkGiq5NVXt6mqShm2wI
 n3MW1h0C4On2JKz4W0y0/GCS5FUXUCjCF58QIPhjZwRDA9ekZuz1FYmK1KFdC+00WznV
 mP6g==
X-Gm-Message-State: AOAM531yXOqYBi5r/VkytT2NMAMvFrNDcnuhdx+HMLnv4/EPL0R6cH/f
 pfgPSPR9ToFgbaZN+zS1ZDHtnQ==
X-Google-Smtp-Source: ABdhPJxg65ZgHF/vA6oW5WocO5sz3Kfy3kVIIlBzbILfcXSFpS1uQBomSZDQw7WhHPdbmUCWr1U8mw==
X-Received: by 2002:a62:5205:0:b029:19e:a0f:2c81 with SMTP id
 g5-20020a6252050000b029019e0a0f2c81mr678023pfb.50.1607489856851; 
 Tue, 08 Dec 2020 20:57:36 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-3814-7903-632e-aa12-9563-de14.dynamic-ip6.hinet.net.
 [2001:b011:3814:7903:632e:aa12:9563:de14])
 by smtp.googlemail.com with ESMTPSA id v9sm551295pff.102.2020.12.08.20.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 20:57:36 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: tiwai@suse.com,
	kailang@realtek.com
Subject: [PATCH] ALSA: hda/realtek - Enable headset mic of ASUS Q524UQK with
 ALC255
Date: Wed,  9 Dec 2020 12:57:30 +0800
Message-Id: <20201209045730.9972-1-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The ASUS laptop Q524UQK with ALC255 codec can't detect the headset
microphone until ALC255_FIXUP_ASUS_MIC_NO_PRESENCE quirk applied.

Signed-off-by: Chris Chiu <chiu@endlessos.org>
Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8616c5624870..2d4bb9019cb8 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7976,6 +7976,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1b13, "Asus U41SV", ALC269_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x1bbd, "ASUS Z550MA", ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1c23, "Asus X55U", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x1043, 0x125e, "ASUS Q524UQK", ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1ccd, "ASUS X555UB", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1d4e, "ASUS TM420", ALC256_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x1e11, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA502),
-- 
2.20.1

