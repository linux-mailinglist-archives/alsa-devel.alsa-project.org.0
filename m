Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EF842B243
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 03:31:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05E551693;
	Wed, 13 Oct 2021 03:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05E551693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634088693;
	bh=/cOy8PlN1whzX+xvFOJVyUCGRKS4s+6O3qP0C1RP35U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b+wy4ixRAE/WY2cLnxgstmxc+R3CeL1T8pd1PfWI+0OcffN8j81/CmFhdFKvng/+V
	 nge6jaijNi/AUXs38RAX2TE0pz05Zmmf+fvERrjqnblOtzSaHkUZfGvcFO3cY7yVLo
	 z7xM5KRhopGdsYH/UwHl2tab0ngVYV+9eGSQkeKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EECB5F80430;
	Wed, 13 Oct 2021 03:29:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06B7BF8028D; Wed, 13 Oct 2021 03:29:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFA61F80088
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 03:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFA61F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oybon7n1"
Received: by mail-pg1-x529.google.com with SMTP id 75so749887pga.3
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 18:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=IWgl1aq+EmvJ2d1nb99MQFV+HXmaPV8gEoyBP45tPlo=;
 b=oybon7n1j7VI3+S8Po2yOnHaq7Pl8/cuf4hjNsRkIFikANw1PNe6g9SbSedn5yYxHj
 bTs6BdxKLRT7CNTL364NGq+G+dSo2qGuT4HHAnS49NkCQjfiyoZLlrxmBBK53o2EjEfQ
 XeFh8MbAoaobg9rcxFQBYWi1fHSpCuNQwhiOKrQGcmVPmW/qoawLQW/12tdVSU3kvl1E
 Ki/0+PrAeWOnJwS1O1WOt9x8/cquw8UN0Kz23ffdx10Gt2JoaU4AHIxkOMzIWiOdw58G
 NR8wZK0MpLVbJG569YPEJVPpzytc5VNX5wg2Y2DZi8WuYRX9YUbuDadmjOaSujBES+By
 mZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IWgl1aq+EmvJ2d1nb99MQFV+HXmaPV8gEoyBP45tPlo=;
 b=CN3ZcVqhsZZX/eDGxJVgaPhAp//pfzY9hoXOFvGknZcNJZnp5LydBoVw/uyv/V67Np
 mZnDmkESvN2/7gDdNeozjH3Ln8P2h+6cb7HbDpqUKDYVTZIbnMFeulfcihw0IusjdZ4B
 dzKvuoAp/D11U0zA6s6e/cJxN6mLBAqqtB3bFRyXCY5YcMbkWwDlOF6mfwI121lc3tS7
 Q4B0jtuzuj8/i1nUj1JSQDS5wCUoiqbUDCefgGIZa905QfjCzmY2Y26FpQ5qaZTcknrd
 jT6oIPNGZkin43e6haJDnlSuNtUwA0DQ8N6Ki6hRi3Nj7K1/NbU2V6J6Wz0bivW/X82e
 84cQ==
X-Gm-Message-State: AOAM532CUsstjei42GnDCu7XpfOf6mstuq7tD9MEEgG5juuE9BiCFgzt
 328hQgNglvDh40OE8gB0LDI=
X-Google-Smtp-Source: ABdhPJwBrpexdxGh/CJ5RpGs1codruYtlEMm2qAbpV65dApsrHonnuOgePMXfn20uq17VGh/KGZpbQ==
X-Received: by 2002:aa7:8198:0:b0:44b:e191:7058 with SMTP id
 g24-20020aa78198000000b0044be1917058mr35290626pfi.39.1634088542216; 
 Tue, 12 Oct 2021 18:29:02 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:578:7fd7:52a:ae77:5bec:efe9])
 by smtp.gmail.com with ESMTPSA id
 b11sm12144788pge.57.2021.10.12.18.28.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Oct 2021 18:29:01 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: oder_chiou@realtek.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
Subject: [PATCH v4 0/2] ASoC: rt9120: Add Richtek RT9120 supprot
Date: Wed, 13 Oct 2021 09:28:37 +0800
Message-Id: <1634088519-995-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 allen_lin@richtek.com
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

From: ChiYuan Huang <cy_huang@richtek.com>

This patch series Add the Richtek RT9120 support.

In v4:
- Add 'classd_tlv' for 'SPK Gain Volume' control item.
- Unify the tlv declaration to the postfix '_tlv'.
- Fix 'digital_tlv' mute as 1 to declare the minimum is muted.

In v3:
- Add dvdd regulator binding to check the dvdd voltage domain.
- Refine sdo_select_text.
- Use switch case in 'internal_power_event' function.
- Remove the volume and mute initially write in component probe.
- Remove the mute API. It's no need by HW design.

In v2:
- Add missing #sound-dai-cells property.

ChiYuan Huang (2):
  ASoC: dt-bindings: rt9120: Add initial bindings
  ASoC: rt9120: Add rt9210 audio amplifier support

 .../devicetree/bindings/sound/richtek,rt9120.yaml  |  59 +++
 sound/soc/codecs/Kconfig                           |  10 +
 sound/soc/codecs/Makefile                          |   2 +
 sound/soc/codecs/rt9120.c                          | 495 +++++++++++++++++++++
 4 files changed, 566 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9120.yaml
 create mode 100644 sound/soc/codecs/rt9120.c

-- 
2.7.4

