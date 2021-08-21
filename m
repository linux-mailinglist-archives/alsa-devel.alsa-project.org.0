Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 396FF3F3986
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Aug 2021 10:31:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1A251660;
	Sat, 21 Aug 2021 10:30:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1A251660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629534672;
	bh=yPThFMFTwpc216zFmRbfkrTSjWiMvkfjM2UeRIjBRUI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z3+Fb2le5B7FwF5t42emfMZ2mnXl54FjL0MpdCXVp+bVB99eABGX3qNzejy/C9PTM
	 hlhh7wv5equAxDFcNmpcMHiBmFg4vTXhoxqPomwlkhb2d1cS5nNS1nOb79NW5FbceQ
	 bcbL74oEtWVzdqIBOsB89+Lr4TfbDv8iF14oCJqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E24EF804E1;
	Sat, 21 Aug 2021 10:29:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0951F8016B; Sat, 21 Aug 2021 10:29:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B593F801EC
 for <alsa-devel@alsa-project.org>; Sat, 21 Aug 2021 10:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B593F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com
 header.i=@timesys-com.20150623.gappssmtp.com header.b="1+/KsbAf"
Received: by mail-ed1-x529.google.com with SMTP id q3so17540164edt.5
 for <alsa-devel@alsa-project.org>; Sat, 21 Aug 2021 01:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=timesys-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7qokDYwm5y8o6WtoZwHcyAOA0+R6VnBovyHislD9r3U=;
 b=1+/KsbAf5ARReDnX16DDXkFtgGcxncZOmduxqbv/oGmEZH55VKoGuV2lFZaOvdL3o4
 EhmE5YShXuyPcCHg0otY6fH7T51wxCHsobefpCLthSMr86/f7OUiMF5etKBzSRvyz47t
 775hUaIbrDIvYd65dRaNkOo46Dsb22CkFVpZid7yWFWOWLwv0ehnRLvJFrDa8sx8VvTh
 cPHJt+MY0qAtvTl7DDpQi9EMSZW3HAY52Vs2sdNwxpH90KH8hOSZr6bNvaC47mcfB2/V
 TX30tvHQQkaJz8AzYlMyKqaNnYvi1STqaKO51i4ffKQTG/ue/vloBd0t44M3DMInCtW+
 uU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7qokDYwm5y8o6WtoZwHcyAOA0+R6VnBovyHislD9r3U=;
 b=ccWOLMyHGJahPjic617Ye9xZqqBLFumiFMMIFcRAD2nK4EH/2XvXD+y3StyPE62Utw
 rMAgFL1AcaJFZ2x2PdipqqkWkh1bYqk3lhPeJlEnAjl6bwDXZqURI4nXdPPgn2Mb4Gc7
 5ON2822WmCcLCZeKqfRSguLV23IFnkz4KdwcESf2MZtjYixYGSIRXFaa55shxyiEll9M
 P1RKBtu+151gCiDzekkShEBQsPNitohsHswEQJkXS0jrX2wnnXPySD/asQ4u1ET9pAgD
 PkN9njMGGl+xKpV+j7f8VeCKZ3qCkTrdBUFaE71aliOnd2eXbdGAvOdEwQpzhB8028JH
 8k6w==
X-Gm-Message-State: AOAM531cBr90NbPAhcObW7JkEcNOFN75oJsgy3N0RRbJEzEUvF/u8bkJ
 WDqA66IQIht2FFXG+M3Zs3KA+1UYqICBlTFP
X-Google-Smtp-Source: ABdhPJy6rzyDAR8ThicHKPvzoWYOBRPFrwSzg5Lz5ZPItln43GV4MRazNQFl12I1NJpqV8+Ub9nu1w==
X-Received: by 2002:a05:6402:31ae:: with SMTP id
 dj14mr26401764edb.94.1629534537243; 
 Sat, 21 Aug 2021 01:28:57 -0700 (PDT)
Received: from dfj.1.1.1.1 (host-95-246-39-126.retail.telecomitalia.it.
 [95.246.39.126])
 by smtp.gmail.com with ESMTPSA id a22sm3960296ejb.90.2021.08.21.01.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 01:28:56 -0700 (PDT)
From: Angelo Dureghello <angelo.dureghello@timesys.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Subject: [RESEND 3/3] ASoC: ics43432: add compatible for CUI Devices
Date: Sat, 21 Aug 2021 10:26:58 +0200
Message-Id: <20210821082658.4147595-3-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210821082658.4147595-1-angelo.dureghello@timesys.com>
References: <20210821082658.4147595-1-angelo.dureghello@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ricard.wanderlof@axis.com,
 Angelo Dureghello <angelo.dureghello@timesys.com>
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

Add compatible for CUI Devices CMM-4030D-261-I2S-TR.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 Documentation/devicetree/bindings/sound/ics43432.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ics43432.txt b/Documentation/devicetree/bindings/sound/ics43432.txt
index b02e3a6c0fef..e6f05f2f6c4e 100644
--- a/Documentation/devicetree/bindings/sound/ics43432.txt
+++ b/Documentation/devicetree/bindings/sound/ics43432.txt
@@ -1,4 +1,4 @@
-Invensense ICS-43432 MEMS microphone with I2S output.
+Invensense ICS-43432-compatible MEMS microphone with I2S output.
 
 There are no software configuration options for this device, indeed, the only
 host connection is the I2S interface. Apart from requirements on clock
@@ -8,7 +8,9 @@ contain audio data. A hardware pin determines if the device outputs data
 on the left or right channel of the I2S frame.
 
 Required properties:
-  - compatible : Must be "invensense,ics43432"
+  - compatible: should be one of the following.
+     "invensense,ics43432": For the Invensense ICS43432
+     "cui,cmm-4030d-261": For the CUI CMM-4030D-261-I2S-TR
 
 Example:
 
-- 
2.32.0

