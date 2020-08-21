Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0579724E070
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 21:05:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB77A168D;
	Fri, 21 Aug 2020 21:04:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB77A168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598036734;
	bh=bK141jokSuVa+qRhNWCNHGtH7vlrtxW6EzlqheQyRH4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fpknnWGpidN7uMMhl2SzHj6rmQCMm9wCnBiyLqpCCtUfeauOvXgSVGKqWFG0UL7RH
	 VBlGC6aUYBJlu3Yv4SMTDztx19jiF7JkK6fhhbdnXLQ/nI3FAeonDG65QknLrnffqM
	 0guu7e2OpHf16DjRw0+OA2HCGgLyTxdNHIt5C9DI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BD26F80363;
	Fri, 21 Aug 2020 20:54:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E579F80317; Fri, 21 Aug 2020 20:54:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0709F80308
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 20:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0709F80308
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mE+a7e+L"
Received: by mail-qv1-xf42.google.com with SMTP id cs12so1088073qvb.2
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 11:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nh1SeH655blb1lMsGRsZcuvpTaQWPjWEn/zrRW9ahdk=;
 b=mE+a7e+L2zMvC3oBW95DSznj8stF0K+CCHUS7uvPsHY2jNp+L2nhKvp1nNnfpk3bIe
 jOxyztVEfgvd7sf8pbyzkprs0aNnNrElB8py6oBxLjx6+1u6rRUWFmlcdH4PWmNDVMIG
 zshJDg8WrAiyHQea1lJB9G2YN3hCVt69g2ZmK2ZijznzbY9HGfTXerRQAApQXwx5oB5k
 0O1u0C3ba6Pwh5fZVNML/PErCmcyf+ZwEalBXFM3Oz5TzCKuaoq+WG1l+WpyQwchg0Ls
 2oQFChZEF+Hb3P326cFah7Qi4l4PEay+Z6lA5I9mVOdFABo80L8nAl/WDScRbMDUtcyT
 GsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nh1SeH655blb1lMsGRsZcuvpTaQWPjWEn/zrRW9ahdk=;
 b=V2w+e40F61J3cCTUa669HSpG+rHQ7my9XlwIJvO0c6WdzTKEuQIoO7rwx2b5olO9Q3
 ypNp9YWaI0YwiBuYk0/cr4RUEA90h/ldWiIuHdz7qk2CEi9WCCYGnNnzaXOMb+VXjgIW
 9RQ5AzUmHUV4GzoYd0oeNee+5+6sEDl8/K+WOGhs1eDt7hkx4hpFY9D8KU1O7QgIlQc9
 fld4VW0rHlhg8XCquD67GQS6eARypaPJZS+pvQEZMz1utdb1TbHCZCshiHUOTX6kViMa
 4GYfacjA7waXbUBxqSVer89lrKH66Oti2Mzf52Wq+iJyAWT4N2vvDEziQqV5BAceCIJU
 1h6A==
X-Gm-Message-State: AOAM5318smqRoJw7YKIgioNe/dIzsYlAyrFjdUmuRO46ZW64XteJQJCl
 8UW6WWNZFT3yO/CO8Xpf76o=
X-Google-Smtp-Source: ABdhPJwE4nMumlYjaLS4lWaAmu6jEEVGiRXoA1KUQpzmOPGLoyj3FUleVHp+0RO/r0PTDtY2AX2QIA==
X-Received: by 2002:ad4:510b:: with SMTP id g11mr3567035qvp.20.1598036054969; 
 Fri, 21 Aug 2020 11:54:14 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id o72sm2468426qka.113.2020.08.21.11.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 11:54:14 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 18/20] ALSA: hda/ca0132 - Add AE-7 microphone selection
 commands.
Date: Fri, 21 Aug 2020 14:52:35 -0400
Message-Id: <20200821185239.26133-19-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200821185239.26133-1-conmanx360@gmail.com>
References: <20200821185239.26133-1-conmanx360@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, conmanx360@gmail.com,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
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

Add AE-7 quirk data for setting of microphone. The AE-7 has no front
panel connector, so only rear-mic/line-in have new commands.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index ad594c2d47ec..933f3b0be63e 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -4997,6 +4997,15 @@ static int ca0132_alt_select_in(struct hda_codec *codec)
 			ca0113_mmio_command_set(codec, 0x30, 0x28, 0x00);
 			tmp = FLOAT_THREE;
 			break;
+		case QUIRK_AE7:
+			ca0113_mmio_command_set(codec, 0x30, 0x28, 0x00);
+			tmp = FLOAT_THREE;
+			chipio_set_conn_rate(codec, MEM_CONNID_MICIN2,
+					SR_96_000);
+			chipio_set_conn_rate(codec, MEM_CONNID_MICOUT2,
+					SR_96_000);
+			dspio_set_uint_param(codec, 0x80, 0x01, FLOAT_ZERO);
+			break;
 		default:
 			tmp = FLOAT_ONE;
 			break;
@@ -5042,6 +5051,14 @@ static int ca0132_alt_select_in(struct hda_codec *codec)
 		case QUIRK_AE5:
 			ca0113_mmio_command_set(codec, 0x30, 0x28, 0x00);
 			break;
+		case QUIRK_AE7:
+			ca0113_mmio_command_set(codec, 0x30, 0x28, 0x3f);
+			chipio_set_conn_rate(codec, MEM_CONNID_MICIN2,
+					SR_96_000);
+			chipio_set_conn_rate(codec, MEM_CONNID_MICOUT2,
+					SR_96_000);
+			dspio_set_uint_param(codec, 0x80, 0x01, FLOAT_ZERO);
+			break;
 		default:
 			break;
 		}
@@ -5051,7 +5068,10 @@ static int ca0132_alt_select_in(struct hda_codec *codec)
 		if (ca0132_quirk(spec) == QUIRK_R3DI)
 			chipio_set_conn_rate(codec, 0x0F, SR_96_000);
 
-		tmp = FLOAT_ZERO;
+		if (ca0132_quirk(spec) == QUIRK_AE7)
+			tmp = FLOAT_THREE;
+		else
+			tmp = FLOAT_ZERO;
 		dspio_set_uint_param(codec, 0x80, 0x00, tmp);
 
 		switch (ca0132_quirk(spec)) {
-- 
2.20.1

