Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D37414D7B4C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:10:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60A9618C1;
	Mon, 14 Mar 2022 08:09:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60A9618C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241802;
	bh=WWNCU2eEyTHUuKDWqVW/3uhFjvEwAR5ryqh51fGB+xc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D3QYzDBnle2vQNvuWuGvlZ+FXKaYdV3bCIR4BCqGbnZCmn5x5Jt0wetk7iz/PlqP4
	 XJMpBk6/+w21uYL/EaJZRTDZFGzs8H+hFJDoxlnmyF+B7PcqdzaX6GfdB/Qf6LDYqh
	 vh9/8oCUrz0C4W0GxC06Yf9a8EQe9SD0WcpC+brA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10F39F80600;
	Mon, 14 Mar 2022 07:59:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A2EFF80154; Sun, 13 Mar 2022 10:23:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A95B6F80154
 for <alsa-devel@alsa-project.org>; Sun, 13 Mar 2022 10:23:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A95B6F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OTW4dH3b"
Received: by mail-il1-x12a.google.com with SMTP id j29so8967046ila.4
 for <alsa-devel@alsa-project.org>; Sun, 13 Mar 2022 01:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ShzYyCrNq5KFVf43vqp/R2Urh005O/aXJKlVY3BXdUM=;
 b=OTW4dH3bmCxMdHw4Crs35gaE5zBSzQQpKK2PSN884/0EPNnGZAwDjzGwZZk8pcsS1b
 baAyjLovuFuiFHKumdCJmn8PqJxcIb+d4VwDEXNuvCK9FOks2EDd7ORowxQuHx1bIGxG
 Pwa+GZWi7WYjDJGGLSzyJY7XxNG9KHWKU/snoGe5aBCf84n98B2cwf4QmOeLLRBI3sk5
 OmfrzkYC43J9HWEL3ByzKtgTi1aOUeDU/URnluXq0XAKESdvGiI5FpAcl1t8Fam7tNoo
 /EpNznq5Zypf8w1x2WxdO1l11Q0YYmzK0fvrLh4MHC3/kx4ftt7ZEyT5oH4yfOfQgN1o
 jkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ShzYyCrNq5KFVf43vqp/R2Urh005O/aXJKlVY3BXdUM=;
 b=db8Mtt+waxvQhzNsMM5KGz0tsrOn4zrOcaMYaLGsEmtMIDwoH29EaJnBwVs6+G12/Z
 iDH3zNIVtkAcGPPa62ZcoQ9f+rp5hrRvzxXz2ahu8748GJqn9cEyYyHsaqOlwUKsTdEW
 YAbVgk00j5ktcDh37vZngHvjoo2hsVH1vaYD6VaoDYVZLuPho2FvoKBQbIEn5gt3yukh
 D0+V0uWEFfWhV+jbuGvXKcR7yTNN5xVB5ZDLTqlDIj2tptW8olg7Cgp0ZeAW8zW4Tddr
 iSvEgU4kePourgBWrSNQ3g19H9iRBsaeqqRwE+U9Wzlows7I9awVlTvHlOWyxrWAnokO
 pfIQ==
X-Gm-Message-State: AOAM5335MeWFOYt9uDm8fImPhxJIj8ISS5L14NNm1RneEWZpUpC5aQGV
 fGQdihcQpfbTyUO9nhqIKZg=
X-Google-Smtp-Source: ABdhPJykamSfcAqxiuy9u6Pemc1ZmJZiQsI5IN6WpVrcuTDo8PFbMPSjeYGAydJhpr6DrVE8LlsjKQ==
X-Received: by 2002:a05:6e02:1687:b0:2c2:787c:b35e with SMTP id
 f7-20020a056e02168700b002c2787cb35emr14359540ila.2.1647163411634; 
 Sun, 13 Mar 2022 01:23:31 -0800 (PST)
Received: from localhost.localdomain ([173.30.22.47])
 by smtp.gmail.com with ESMTPSA id
 7-20020a056e0220c700b002c75f643efesm5313269ilq.16.2022.03.13.01.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 01:23:31 -0800 (PST)
From: Jason Zheng <jasonzheng2004@gmail.com>
To: perex@perex.cz
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASUS GA402
Date: Sun, 13 Mar 2022 04:22:16 -0500
Message-Id: <20220313092216.29858-1-jasonzheng2004@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:51 +0100
Cc: Jason Zheng <jasonzheng2004@gmail.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com
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

ASUS GA402 requires a workaround to manage the routing of its 4 speakers
like the other ASUS models. Add a corresponding quirk entry to fix it.

Signed-off-by: Jason Zheng <jasonzheng2004@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3a42457984e9..ec67b5ba6005 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9020,6 +9020,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1e51, "ASUS Zephyrus M15", ALC294_FIXUP_ASUS_GU502_PINS),
 	SND_PCI_QUIRK(0x1043, 0x1e8e, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14", ALC289_FIXUP_ASUS_GA401),
+	SND_PCI_QUIRK(0x1043, 0x1d42, "ASUS Zephyrus G14 2022", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE", ALC256_FIXUP_ASUS_AIO_GPIO2),
 	SND_PCI_QUIRK(0x1043, 0x831a, "ASUS P901", ALC269_FIXUP_STEREO_DMIC),
-- 
2.35.1

