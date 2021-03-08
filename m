Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B698331FA8
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 08:04:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D281817EB;
	Tue,  9 Mar 2021 08:03:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D281817EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615273474;
	bh=YGBxhPTOk2ekPaLbLhkFHDWLh03HfLoGKAZOMXeb9e8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=insYr12e4pSiPwLS3QESHfX4H6SVMJG/mhhKBtceFrxaJoMglBLukx/4F0+EUoxbX
	 tGPvfW9rV91yXSRL8Ijyn8HbiGxLPrU1whRuW+vKMKzzCLA+/U7T92wIlbt6r41bu7
	 2ZS/QN0jtzm3HPnV0if/OxTY1fUFpjnN7agtGOio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50BD1F8029B;
	Tue,  9 Mar 2021 08:02:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E00FF801D8; Mon,  8 Mar 2021 23:14:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D23EF80139
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 23:13:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D23EF80139
Received: by mail-qk1-f177.google.com with SMTP id s7so11075912qkg.4
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 14:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e5o1B3y2FZl9WKBya7lKm8m6f9aCIBy5Yz2JgDz/INg=;
 b=Yy31kGsw0YEI75iIWWPqacw7ENwUBwrnT1CIDLA2SrYtKJyr57RbizANwuEHGOeDwO
 Ue5JeL659eUb2JCk2xufwGXfYndA4dVb0EtKITIlOLt4mRRBoqCYzPSDZjekAaFdhsEh
 b+I2YIZKASJNXClOiaKVQ+Tl6qrMt0CzcxsRo3MxcdfTGz3eljMpkzOlItsebvEENth8
 We71tjzS0uMe+zJtyak2gAICBf8O7a3l1bN2bsb7m5RoOxhUK2wm5WFrOol3Tw6eJm9q
 k7lhuzvLQ9+rgLwq0xY8TLDHgLOk8l1oDmueJ41dSjz2q+36aLOFrNr3WRNBND9joC8T
 dJLg==
X-Gm-Message-State: AOAM53126iitxJsjXD/OS/QciSCkW9C1woQxwb0Z2NvwX7BU31vjOVRz
 llfrBuziG1lmAe2iOBSW2a8=
X-Google-Smtp-Source: ABdhPJyJJmbAGyWKBFn3lCNJ68+RF+IF6iD0+1BMLheYEs2SSYDg2gRFP01q1w8kh7AQHLumrRU8Yg==
X-Received: by 2002:a37:4d57:: with SMTP id a84mr23380660qkb.464.1615241635775; 
 Mon, 08 Mar 2021 14:13:55 -0800 (PST)
Received: from dpward-laptop.. ([2601:184:417f:5914::53e7:ddc3])
 by smtp.gmail.com with ESMTPSA id w197sm8538298qkb.89.2021.03.08.14.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 14:13:55 -0800 (PST)
From: David Ward <david.ward@gatech.edu>
To: Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: rt286: Fix upper byte in DMIC2 configuration
Date: Mon,  8 Mar 2021 17:13:54 -0500
Message-Id: <20210308221354.12755-1-david.ward@gatech.edu>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Mar 2021 08:01:59 +0100
Cc: David Ward <david.ward@gatech.edu>
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

This HDA verb sets the upper byte of the Configuration Default register, so
it expects an 8-bit value here. For the rt298, the same fix was applied in
commit f8f2dc4a7127 ("ASoC: rt298: fix wrong setting of gpio2_en").

Signed-off-by: David Ward <david.ward@gatech.edu>
---
 sound/soc/codecs/rt286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index 8abe232ca4a4..f9b29782b62a 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -1204,7 +1204,7 @@ static int rt286_i2c_probe(struct i2c_client *i2c,
 	mdelay(10);
 
 	if (!rt286->pdata.gpio2_en)
-		regmap_write(rt286->regmap, RT286_SET_DMIC2_DEFAULT, 0x4000);
+		regmap_write(rt286->regmap, RT286_SET_DMIC2_DEFAULT, 0x40);
 	else
 		regmap_write(rt286->regmap, RT286_SET_DMIC2_DEFAULT, 0);
 
-- 
2.30.1

