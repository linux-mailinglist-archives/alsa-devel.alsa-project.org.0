Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7372F239D11
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 02:32:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D1771669;
	Mon,  3 Aug 2020 02:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D1771669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596414736;
	bh=UMfld3p3OBRkvN+pPoormE1+aBpVHVy6KWrLzaiYvwc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QosZo4dbsb+FsMqDXBlL5VjmC1p6jk1f6aE2ENGMtumRMbi5t/OOQscHAikZMMteS
	 UmRoR11sFE3hhAyfm0XOT9DVqfuh0ayJ8+OcHCo+EVEgcA4xIepEtUUh9y3p6kmscv
	 JfWxaMsuHFsvYiJcD0Zhqn0my3rm8GM+Qfq2KtHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A10CEF8015D;
	Mon,  3 Aug 2020 02:29:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5E25F8015C; Mon,  3 Aug 2020 02:29:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FA06F800B7
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 02:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FA06F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UhHemzLk"
Received: by mail-qt1-x841.google.com with SMTP id w9so27102640qts.6
 for <alsa-devel@alsa-project.org>; Sun, 02 Aug 2020 17:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6DcF2CQ32e+6T5/Eij0S3nNKEWsEJxFYAl3hAL1skHs=;
 b=UhHemzLkoLwi0a/DM7/+VsmtHjz3MNMEYycZRp61AOazxWaPvS9SmhweW3Pg5ViAU8
 2N/Yx5bfETvcDv7rlczF4Xoev+qzCy0eglCrf2VSh9p0HP9xrJSr/ycImcV9WWcmNo3b
 q7/ZuaPAkT+qQbcN7uLHlN2y+kv3ub/cXajqPwLVNik5USqtvmsfrilx+ZdGrIwUht/y
 oW9oXn2Rmy2UdIkyTZTSApuej4wi+0t8c93vNrB3PMk45TsxOnHJtGuE6mBrFXKCG7Jv
 9UmFXZqttvwCQF2cpHdmpSgZW2CuN4bEnbfoW3AAHaNXOsbHS3KJ7B7z/CnVD1FflgHe
 DjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6DcF2CQ32e+6T5/Eij0S3nNKEWsEJxFYAl3hAL1skHs=;
 b=e7uURGeurVsjGLOC1vWxZaup6HldgGIJkvTqosQhfuV3Dh70OC7mIBApHnJ3tDE0HS
 RedzyxXWvabbp+lLAKSoAhZDl3Mk39A4hX+O0YErOTKsWHfBXRDmBrhIWFR4WgfJCvtS
 s4cKLrZXp4v6lLOdorhO5sJnAfH9i+1nPAii/eop8IItlSB81lyflsJiaTEBRVku7hiS
 GZmGiICBMAXSfZGWIflXWXkgIWOPAaVluYqACSEpE6rEMfVxTDl3YABF89wp7UBAhJyv
 V7s4S7GPkbVIIaBwvNcDFAHuf7ZBYU8ahWjBqMQGhGAp7L20iG/P3a3wCoDf4GMXQy++
 /iew==
X-Gm-Message-State: AOAM533hxOGMewspB8MvqSBbB/dA43REfBst1RlkJkJWWTw0nwenwLlK
 Z6VFU5qq+NaqsApp0bc25VY=
X-Google-Smtp-Source: ABdhPJxdbpufdzGT1QAY4uOYq5MtdXAGk9PrJwux/EjOnuLwxvNY6TW1aPj7cLO6DV4Lh8bggdUJBA==
X-Received: by 2002:ac8:678b:: with SMTP id b11mr14547229qtp.386.1596414575650; 
 Sun, 02 Aug 2020 17:29:35 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id e23sm18261614qto.15.2020.08.02.17.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 17:29:35 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 1/3] ALSA: hda/ca0132 - Fix ZxR Headphone gain control get
 value.
Date: Sun,  2 Aug 2020 20:29:25 -0400
Message-Id: <20200803002928.8638-1-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Geoffrey Allott <geoffrey@allott.email>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 conmanx360@gmail.com, =?UTF-8?q?Pawe=C5=82=20Rekowski?= <p.rekowski@gmail.com>
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

When the ZxR headphone gain control was added, the ca0132_switch_get
function was not updated, which meant that the changes to the control
state were not saved when entering/exiting alsamixer.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 19c575fd28a1..2cbe01d59c16 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -5748,6 +5748,11 @@ static int ca0132_switch_get(struct snd_kcontrol *kcontrol,
 		return 0;
 	}
 
+	if (nid == ZXR_HEADPHONE_GAIN) {
+		*valp = spec->zxr_gain_set;
+		return 0;
+	}
+
 	return 0;
 }
 
-- 
2.20.1

