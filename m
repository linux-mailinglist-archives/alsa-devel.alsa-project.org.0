Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C803D3635AB
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Apr 2021 15:48:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D230168D;
	Sun, 18 Apr 2021 15:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D230168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618753733;
	bh=eyVzkalmr2zjBTcTyjWNxmae6JD5HN+3iObZotR8408=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u+nzp1KNgAfGxIMqKZxWA+j6t27byV9atXSkAVYXH2GspY4lqDNc9Z/dUVkQladje
	 p1MZiBP6jIlJLCY0yWYYnt0CTiQfUjx+iVQxuNvjin4lVIonZTdes4ufoso3krAw4R
	 pbqNGwpkTgRPHgxirs5j8SkKEuuuZtNOhV5hvijI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FDD8F8032C;
	Sun, 18 Apr 2021 15:47:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D985F80278; Sun, 18 Apr 2021 15:47:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C258AF80168
 for <alsa-devel@alsa-project.org>; Sun, 18 Apr 2021 15:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C258AF80168
Received: by mail-qv1-f45.google.com with SMTP id i9so15497200qvo.3
 for <alsa-devel@alsa-project.org>; Sun, 18 Apr 2021 06:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HCAzuIuwK5FgUK8s8GH5XGY5QjMnQT8rME19SVb24QU=;
 b=dVe/8AAPGcAHzQIZhUT9/jgOTQT0g8iAqp1AmGjybnY722knSc7wiNnFaEeTTiJI3p
 EZARCceD6DFl6KxZL1fE0H/RqZnwhDU7X27nUlP7sIDdH0Eq8OpSrzmLZHDbj1cd93Fx
 Iv5hnyKPjZr5+gQKAqgQ+erkRSY4Sza6eJSPKLGn492/Pe2BwAzJU+wp98MIO5p06AAI
 ZB/NouYHZS6FUeu2PIBRlvLhDit7oBGe58q3Cnbilez7DpPG+chVUzLM37tKfeN3n5SV
 /Npp6cmmuf+Du6ZZaJQsjQPtmQuYAJjIQnZA3yi9Jqz2jY4V6V+3JXD1dUHTNvTOhgjn
 KtEA==
X-Gm-Message-State: AOAM532qq+9SxQ5rwvJuC98I2Kj2BM4u8iqwGOfBmOKcsFuMB2PH+2s+
 64/TbZyBrmN99rW5/zSdFbk=
X-Google-Smtp-Source: ABdhPJy6jQxv92xagIcr2hVLrv0lw6VRpKPcdea+GgsQA8SF/15wv5Gp+kd/bk/0PkZyrH3PVLHJ4A==
X-Received: by 2002:a05:6214:17cd:: with SMTP id
 cu13mr17119370qvb.17.1618753621801; 
 Sun, 18 Apr 2021 06:47:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:184:417f:5b5f::f3be:e978])
 by smtp.gmail.com with ESMTPSA id p23sm3927937qtl.8.2021.04.18.06.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 06:47:01 -0700 (PDT)
From: David Ward <david.ward@gatech.edu>
To: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/5] ASoC: rt286: Configure combo jack for headphones
Date: Sun, 18 Apr 2021 09:46:55 -0400
Message-Id: <20210418134658.4333-3-david.ward@gatech.edu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210418134658.4333-1-david.ward@gatech.edu>
References: <20210418134658.4333-1-david.ward@gatech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Shuming Fan <shumingf@realtek.com>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mario Limonciello <mario_limonciello@dell.com>
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

During jack detection, the combo jack is configured for a CTIA headset, and
then for an OMTP headset, while sensing the mic connection. If a mic is not
found in either case, the combo jack should be re-configured for headphones
only. This is consistent with the HDA driver behavior.

Signed-off-by: David Ward <david.ward@gatech.edu>
---
 sound/soc/codecs/rt286.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index f9b29782b62a..67a5affdb705 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -252,11 +252,16 @@ static int rt286_jack_detect(struct rt286_priv *rt286, bool *hp, bool *mic)
 				msleep(300);
 				regmap_read(rt286->regmap,
 					RT286_CBJ_CTRL2, &val);
-				if (0x0070 == (val & 0x0070))
+				if (0x0070 == (val & 0x0070)) {
 					*mic = true;
-				else
+				} else {
 					*mic = false;
+					regmap_update_bits(rt286->regmap,
+						RT286_CBJ_CTRL1,
+						0xfcc0, 0xc400);
+				}
 			}
+
 			regmap_update_bits(rt286->regmap,
 				RT286_DC_GAIN, 0x200, 0x0);
 
-- 
2.31.1

