Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF342521C6
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:17:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89F8616A8;
	Tue, 25 Aug 2020 22:16:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89F8616A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598386656;
	bh=YJuaGycTNKsO/WDx4yvkbZ1X5573uoJvI9C0zr0ce/k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OXZtrBeLZW5YdQqhuDSWHl6OmuY0cVLNVoJd+ghcrNm0tQ6z9DZhlh/RK3oqAxWeo
	 rgjvLmqZNRn17lkaBXcDCftjGG/sxyRzlAsA1KFuvLNVm9wJuYs32GHffKbYEkK/fE
	 C426lx6yW6iDipc+XoYZSPB1bP02AaVt6zE2GieE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D831F80315;
	Tue, 25 Aug 2020 22:11:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B16AFF80315; Tue, 25 Aug 2020 22:11:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56873F802EC
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56873F802EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jHbWJG4Q"
Received: by mail-qt1-x841.google.com with SMTP id o22so9987622qtt.13
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 13:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vCrVUPubKOzmsdqyXoYpMT9N+gSsM1Nu0aoYNMzgvlk=;
 b=jHbWJG4QHgXXcAfc7xHWIpHF5DVgvMiRVC9da6Kgd0NdObYx3HZPrpSUbIFVds0IFv
 uTZjNDebfKRN1wxj33CQyZgnWfnKt8qg4dnkOGFNskezVTwEXMbHqXm7A2g2eP6kAsbU
 SS6OgGODKIeRna7UwfxWP3/ivBp1VQBqDOH3lyIE2K5IDXiaLeGBqhY2XtLXkLaupHO8
 2NoAKnKLlTzzgR6SsVc+3C0363ROxHjUX/sT6U05sfOIN7zIGlHRMo9azRe84LBmDwJc
 Wfz5TXOiHzPclnpmbB7nPjAjUdnDYLGS1vHUkIro+cM9PrGy9hHmKvTWLIOsSkTLJRpK
 AzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vCrVUPubKOzmsdqyXoYpMT9N+gSsM1Nu0aoYNMzgvlk=;
 b=eCiLvOfzIVrC8RS2YrzxF5YgDMeXkyIJpz3Vc5yD2NEVCtpwt9Ds/yuxyZYS5XMUmd
 xCANaaARuF0259KGQLXTXtXl+yvqukFNyJVXUOwOAotvh7KF6tPkwDrHDqRlpRzrmngp
 /NRIsVO8hS7ZPbJhSJVZJU5dt7HfBfO0N67Gfpk8NShsCFlsymxIIPtSu/Qmn/tMESg1
 niuKcEK3wJ4X94IRPFufBxb5ryt0/8o1lQGbjnalZDfesxgkLh0pX1J5vCvRYQHOQPcA
 TQL8tmEO7dgGeVjCqRExArSqvfmNuujUppO5zom2CMrhfaKfFkA6HQ8jWEscTmzNiB0S
 2cMQ==
X-Gm-Message-State: AOAM531NSOqRJv0lqj5s2mfows2FgcLpFGCyQcmqkPAxLgM+zn9U63T3
 vFO5XSSUDl/sH7JBGGwvAos=
X-Google-Smtp-Source: ABdhPJwTUl2JA8SbH+g9Zk3uvbAxTLrc+xHotqnRzH0Qvz8Iq23zz+uGyVNCLWJzuJMUTBlFBSUlzQ==
X-Received: by 2002:ac8:4f02:: with SMTP id b2mr2658390qte.44.1598386276821;
 Tue, 25 Aug 2020 13:11:16 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 n23sm12453459qkk.105.2020.08.25.13.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 13:11:16 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 09/20] ALSA: hda/ca0132 - Fix Recon3D Center/LFE output.
Date: Tue, 25 Aug 2020 16:10:28 -0400
Message-Id: <20200825201040.30339-10-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200825201040.30339-1-conmanx360@gmail.com>
References: <20200825201040.30339-1-conmanx360@gmail.com>
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

Properly set the GPIO pin to un-mute the Center/LFE channel on the
Recon3D.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index ab84ea397552..138403fd1639 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -7819,6 +7819,12 @@ static void r3d_setup_defaults(struct hda_codec *codec)
 	if (ca0132_quirk(spec) == QUIRK_R3DI)
 		r3di_gpio_dsp_status_set(codec, R3DI_DSP_DOWNLOADED);
 
+	/* Disable mute on Center/LFE. */
+	if (ca0132_quirk(spec) == QUIRK_R3D) {
+		ca0113_mmio_gpio_set(codec, 2, false);
+		ca0113_mmio_gpio_set(codec, 4, true);
+	}
+
 	/* Setup effect defaults */
 	num_fx = OUT_EFFECTS_COUNT + IN_EFFECTS_COUNT + 1;
 	for (idx = 0; idx < num_fx; idx++) {
-- 
2.20.1

