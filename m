Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED3452A2BC
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 15:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 236751632;
	Tue, 17 May 2022 15:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 236751632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652792942;
	bh=vPXAydqvMUnP+6SGU/jXN/1TEPlpKDg/Oxov3e/0KmM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=obQkyZoYpHGcINChWCqbmQotormsVIUe/8hnWoSmETPwQ1BCpL/nVPAtfqIXTcoiO
	 6wLa3hmiCQzBvkVZMLdDCeudSxDIJc/Ura2RfV3L2FR3HjlUnQ6zIGewUIhURdVuq5
	 AZErq//fg3dNrWAqg2Kz4Yl80beWPm6wRwiYlYrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1662F80520;
	Tue, 17 May 2022 15:07:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C12D4F8014B; Tue, 17 May 2022 03:18:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A32BF800F8
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 03:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A32BF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kvaTLuko"
Received: by mail-ed1-x52b.google.com with SMTP id i9so1402294edr.8
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 18:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UJNPFC3CeDSNqqGUH4ql5DApCLRNT8G9vJ7nfo2b2oQ=;
 b=kvaTLukoDxQ2EHWsD5GQR49yqK6PfkNpSNBzzwLRUs4ONqt3csIVELufV740O0MaIg
 VJ5IdtwZBiYzvPOwkcUQon7ovqQ1Q1Sy+6ZNf4bCGHVvF4tLsDscY3cMKCmO917gOIFk
 3HguC7ZgndpWNGs/33lxkdQGUiwTH/Xw4sebgOCHKfEoFa6OuJViC2AeyqGqUBFA+1Lr
 /T4TK7PhZwvT/u+I1he7JqIixJOKkgTDyYtDAJ4XTz/BI5mv13JnNeK873e+dszPe1CB
 st2nyp2cmT16UgPyzx1F7TzOUXRoeqApxvb33tG/ZawoJlA/WCLjAD1mm/5iPgGGfobD
 kQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UJNPFC3CeDSNqqGUH4ql5DApCLRNT8G9vJ7nfo2b2oQ=;
 b=PegJoAz0EjvtQhpHREShaoUosknMhn8e6woApMofBoEEoU2v5/5k138CDOZ2Ne/eB/
 R3u2w6ANfWp15MizLJaS5JSqsnEe86ZvlqPWwW733wv0YBPpXjNc2vRzEfP8UZipm4At
 BMCmLTOzDJ34cDkBPJiVYVBeNKNK3mARMqgPqEh0Vp8H2fXG4AmM9KkpGc13rKfpSG+2
 LPOr0KH3CU1L28iEVUFQScKZwGAZPEzbM4ev1ys3A6TYFyU7Z14d7MXquAM9UOZvWy5/
 fgzTblaM5LnfNd4wh4MDqCF5ckC8NC4aGei7awtSE2aRtI4kEKHWcc6SI0+feV2EBZkK
 OKHA==
X-Gm-Message-State: AOAM530sYfJ9kFJf5ALlJTO6a+ZowBicj0bSk/bQfQotY2NUVaInv/A0
 ALZCV1Om6+KTx76usuWTJpUq+Kqr723EGiOM
X-Google-Smtp-Source: ABdhPJxORibv/T7DUCBNlC8C2wiaADsTyW/tx1WkupojvwG6DD1Z5rim/1vwFpxlHZ6gF5rAnhuYeA==
X-Received: by 2002:a05:6402:26d6:b0:428:c30:3a45 with SMTP id
 x22-20020a05640226d600b004280c303a45mr16292094edd.210.1652750283948; 
 Mon, 16 May 2022 18:18:03 -0700 (PDT)
Received: from void.localdomain ([178.233.88.73])
 by smtp.googlemail.com with ESMTPSA id
 hy6-20020a1709068a6600b006f3ef214e70sm352626ejc.214.2022.05.16.18.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 18:18:03 -0700 (PDT)
From: Tan Nayir <tannayir@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: ops: Fix the bounds checking in snd_soc_put_volsw_sx
 and snd_soc_put_xr_sx
Date: Tue, 17 May 2022 04:12:04 +0300
Message-Id: <20220517011201.23530-1-tannayir@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <c2163c71-2f71-9011-3966-baeab8e8dc8f@gmail.com>
References: <c2163c71-2f71-9011-3966-baeab8e8dc8f@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 May 2022 15:07:02 +0200
Cc: Marek Vasut <marex@denx.de>, Tan Nayir <tannayir@gmail.com>,
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
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

The $val in both functions has a range between 0 and an arbitrary limit
whereas the range specified with the $min and $max can start
from a negative number. To do the out of bound check correctly, the
$val must be added the $min offset.

Previous-discussion: https://lore.kernel.org/all/c2163c71-2f71-9011-3966-baeab8e8dc8f@gmail.com/
Fixes: 4f1e50d6a9cf9 ("ASoC: ops: Reject out of bounds values in snd_soc_put_volsw_sx()")
Fixes: 4cf28e9ae6e2e ("ASoC: ops: Reject out of bounds values in snd_soc_put_xr_sx()")
Signed-off-by: Tan Nayir <tannayir@gmail.com>
---
 sound/soc/soc-ops.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index e693070f5..42191968c 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -433,7 +433,7 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.integer.value[0] < 0)
 		return -EINVAL;
 	val = ucontrol->value.integer.value[0];
-	if (mc->platform_max && val > mc->platform_max)
+	if (mc->platform_max && ((int)val + min) > mc->platform_max)
 		return -EINVAL;
 	if (val > max - min)
 		return -EINVAL;
@@ -910,11 +910,12 @@ int snd_soc_put_xr_sx(struct snd_kcontrol *kcontrol,
 	unsigned int invert = mc->invert;
 	unsigned long mask = (1UL<<mc->nbits)-1;
 	long max = mc->max;
+	long min = mc->min;
 	long val = ucontrol->value.integer.value[0];
 	int ret = 0;
 	unsigned int i;
 
-	if (val < mc->min || val > mc->max)
+	if (val < mc->min || ((int)val + min) > mc->max)
 		return -EINVAL;
 	if (invert)
 		val = max - val;
-- 
2.25.1

