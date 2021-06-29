Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A053B6F68
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Jun 2021 10:31:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8B871681;
	Tue, 29 Jun 2021 10:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8B871681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624955481;
	bh=YHzWIa69ElM68S511DfZwwMO3O+q84es27oKk79zhyY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bnLFp85YznGOv84RGumFM5OTCKll9U8rE8YfDXwF/Hyjep4uvkJxaSABQDbaRsEYi
	 mJ4qKgOXNd0LjUcd17aKqJIUGWlrBN6FPseMZrhCgA/o4KMt+Z7Ty3JdMhevdIoWcJ
	 5YC2jdwn7LVA6gpuymO9dl0Ck4v4U79jxbyMTsoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1B2DF802D2;
	Tue, 29 Jun 2021 10:29:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56BEDF8025D; Tue, 29 Jun 2021 10:29:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE51BF80240
 for <alsa-devel@alsa-project.org>; Tue, 29 Jun 2021 10:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE51BF80240
Received: from mail-pg1-f199.google.com ([209.85.215.199])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <andy.chi@canonical.com>) id 1ly97W-0000L4-TY
 for alsa-devel@alsa-project.org; Tue, 29 Jun 2021 08:29:27 +0000
Received: by mail-pg1-f199.google.com with SMTP id
 p14-20020a63fe0e0000b0290223af1026abso13689392pgh.20
 for <alsa-devel@alsa-project.org>; Tue, 29 Jun 2021 01:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=toSlKwLIoJaylZ3jHBQTTvJkInZwz79Yfvkqkzo/W98=;
 b=sLasDBVWOaU2AwTN753wKpRuhTj4hYpVyvUvlLNNHtCXCl7gV5hLwD4J0fyLza3SOt
 4VL5AoXGf/Bu0YcZstygUM0Jyfh7pau1z938xUHjcRrHov3a68MwFNuQwWFSk2rB9Yfe
 dYf8cSWx8lmn9a3xqVoQokXBXJWXfIXOgGw3fLe6VF9O1qoFW/LDLMWdmTP1QRwSRheo
 4zwyXfVWj+N1X4TE4waOd3BgiZ0XPEPGDAUIdY8knHrJ5XPnBq6FbLgv06kM4X0Jy6AX
 2K0ckG05fiXLhtwxQhQ4mopsAOr1DgZRIckB3LC4bBcnna+HASLCRGepD7JQMQwcdea8
 x3dg==
X-Gm-Message-State: AOAM531OlsAdkue1AKC+Id3GTtkU8n0ZKcZTwWfbK8A19XzGRjBOMU/d
 eZ11azx9KM7E2bOoxiJZUdKgJKqxhptFQW+k6Z1ICIBUWsbl8639Bm+kuH13u89sXahOM4gBI+G
 OSJnmIZBkBKfsgIrMN50MyxdHdzqPKiK47dH0PdRS
X-Received: by 2002:a17:902:7446:b029:128:ec77:b41e with SMTP id
 e6-20020a1709027446b0290128ec77b41emr5395336plt.80.1624955365642; 
 Tue, 29 Jun 2021 01:29:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3rJTpLAVpOugSkqbdGzg37BM1HfA5uvI4BBZMTPky38pJlKqaSYVeohwYjsgN0PugSolhoQ==
X-Received: by 2002:a17:902:7446:b029:128:ec77:b41e with SMTP id
 e6-20020a1709027446b0290128ec77b41emr5395324plt.80.1624955365446; 
 Tue, 29 Jun 2021 01:29:25 -0700 (PDT)
Received: from localhost.localdomain (36-224-198-238.dynamic-ip.hinet.net.
 [36.224.198.238])
 by smtp.gmail.com with ESMTPSA id 28sm17526830pgq.39.2021.06.29.01.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 01:29:25 -0700 (PDT)
From: Andy Chi <andy.chi@canonical.com>
To: 
Subject: [PATCH 3/3] ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook
 630 G8
Date: Tue, 29 Jun 2021 16:28:59 +0800
Message-Id: <20210629082902.408881-3-andy.chi@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629082902.408881-1-andy.chi@canonical.com>
References: <20210629082902.408881-1-andy.chi@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Chris Chiu <chris.chiu@canonical.com>, Jian-Hong Pan <jhp@endlessos.org>,
 Kailang Yang <kailang@realtek.com>, alsa-devel@alsa-project.org,
 Jeremy Szu <jeremy.szu@canonical.com>, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Hui Wang <hui.wang@canonical.com>, andy.chi@canonical.com,
 Sami Loone <sami@loone.fi>
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

The HP ProBook 630 G8 using ALC236 codec which using 0x02 to
control mute LED and 0x01 to control micmute LED.
Therefore, add a quirk to make it works.

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 25a32b718fbc..58e185c6e77f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8337,6 +8337,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x87f1, "HP ProBook 630 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f2, "HP ProBook 640 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f4, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f5, "HP", ALC287_FIXUP_HP_GPIO_LED),
-- 
2.25.1

