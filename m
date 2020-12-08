Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C1C2D32D0
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 20:54:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B511916E3;
	Tue,  8 Dec 2020 20:53:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B511916E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607457250;
	bh=g/xf2//q6vllYwiQ7SKvF3CMO9X4gMDNWk1V1NbvzrI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pMYR/DUiV2dn/4fBVDPe3Dny58zKGWUTLhq4bX5cIftk9KtwWikDVllo3bW+NDaQO
	 DM2zXFWOzwfci7IP9INQN4hOP7oQ8hebMOCiTvJDa1UYrWd17Uthlt92hRwMevZDZq
	 W20ggiBtGoNYffA46p+rVF8znmBHDJWAmlWL+DlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC093F80253;
	Tue,  8 Dec 2020 20:52:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 604F4F8019D; Tue,  8 Dec 2020 20:52:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E30C7F8010A
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 20:52:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E30C7F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KLKJlgWg"
Received: by mail-qv1-xf41.google.com with SMTP id l14so497359qvh.2
 for <alsa-devel@alsa-project.org>; Tue, 08 Dec 2020 11:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ggClf1qYaX1ZYfaRMUNT7oZqY0pd3cd9hPip2Wzk4F4=;
 b=KLKJlgWgWbN67LPCenCHeeJkjwAUvUak89ba7ygQ2WI2d0DKFSd+sOpBSK0ltfZCE8
 aPs6ZvvEOxVB2SCOitevu7LEKNGkR6P7yvGSeqlhiF55Zy2XUclnSeH76/V7dw1BdjHd
 T/E7rarteJFj2n2b0aUhMSkMlHDNu8zb66QZw0bzQ40w4SXthUiQXvxsXmRd9qp3GuiT
 cOnXpkLKjF9LcspElKGDZ3wMrG5f8i2GC/QoBhHKquE+wt9VZ31tRvL+ibw1hKobGYTv
 jtfJECveexzrQpKRV2zAMdI5aXZljhIsFYQoexnSTs/dGzdYO3/tadaiwYFozfteBWUR
 e0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ggClf1qYaX1ZYfaRMUNT7oZqY0pd3cd9hPip2Wzk4F4=;
 b=RC3DAj60hRjn6s7JiOsJ+Dpfj74RCmub4onWZFnMqCEoiA1X1fC+eOcMydmk4ph4yN
 p4jiYHSolFTR+t/G6+2XwnS8l1INasgTUJOLKR4SIrLrUc6n0XonHUkMWhz+4iS5Zb4i
 gx+643Yo6U1PXpTK4n6BkKVS36qaT9cX57koN2HTLgH5U1/w6fm8qNa8QCix9HFyME4y
 lKCDTdZRlFklrUAwDztk4FFaPtYExFLi2rVrYbgkH6l5S9sqhN+B3aDAUBri3UdP9i3D
 HL4sK6OY52AhNfO/oK60IRoD4g3/wxPveYoD3jjNwmEcZ8MSvft/yoU/oUg5UikQtpKb
 z4BQ==
X-Gm-Message-State: AOAM5324oN/BQX6Cq50bcy5F627LiDAFl2PPlLBCN/2KK7I4rdmi/VVZ
 fEr6mqPfu4xUIhwAmJUrG6M=
X-Google-Smtp-Source: ABdhPJwLRmltK/EpGlS75VZoegn0zu1cz6U5kI4SqVbpM4KQKxgxNlbJQcRwUyD+ahl8etD1DfXmwA==
X-Received: by 2002:a05:6214:12ab:: with SMTP id
 w11mr29040746qvu.42.1607457149690; 
 Tue, 08 Dec 2020 11:52:29 -0800 (PST)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id x24sm14169458qkx.23.2020.12.08.11.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:52:29 -0800 (PST)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 1/3] ALSA: hda/ca0132 - Fix AE-5 rear headphone pincfg.
Date: Tue,  8 Dec 2020 14:52:20 -0500
Message-Id: <20201208195223.424753-1-conmanx360@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, conmanx360@gmail.com, stable@kernel.org
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

The Windows driver sets the pincfg for the AE-5's rear-headphone to
report as a microphone. This causes issues with Pulseaudio mistakenly
believing there is no headphone plugged in. In Linux, we should instead
set it to be a headphone.

Fixes: a6b0961b39896 ("ALSA: hda/ca0132 - fix AE-5 pincfg")
Cc: <stable@kernel.org>
Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v2 changes:
- Add fixes references to previous commits that these patches now fix.

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 4fbec4258f58..e96db73c32f5 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -1223,7 +1223,7 @@ static const struct hda_pintbl ae5_pincfgs[] = {
 	{ 0x0e, 0x01c510f0 }, /* SPDIF In */
 	{ 0x0f, 0x01017114 }, /* Port A -- Rear L/R. */
 	{ 0x10, 0x01017012 }, /* Port D -- Center/LFE or FP Hp */
-	{ 0x11, 0x01a170ff }, /* Port B -- LineMicIn2 / Rear Headphone */
+	{ 0x11, 0x012170ff }, /* Port B -- LineMicIn2 / Rear Headphone */
 	{ 0x12, 0x01a170f0 }, /* Port C -- LineIn1 */
 	{ 0x13, 0x908700f0 }, /* What U Hear In*/
 	{ 0x18, 0x50d000f0 }, /* N/A */
-- 
2.25.1

