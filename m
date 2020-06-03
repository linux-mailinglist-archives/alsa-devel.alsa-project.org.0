Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD8E1ECC8F
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 11:27:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E5C81664;
	Wed,  3 Jun 2020 11:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E5C81664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591176420;
	bh=T2Baua1ji97VefGilqXTRLjZ/rALTAyMHM/Zkkrg/1Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FRJd9HIw3/Ip2mV0wJ7NMhbvRvMb+c2jUT/ozw/fBpJDC9M5wQQntwPBg0ESI15a8
	 gDyYGaeJxwn3XfmEa912YtT+2vSU+j05izDevU892H5HbCYQKy6yvxvCSIGXL++U10
	 NRuJeslMjcL55D6OFT1o7ICJhN2es+zZpknpImpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2771CF800BC;
	Wed,  3 Jun 2020 11:25:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB011F801ED; Wed,  3 Jun 2020 11:25:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B894EF800BC
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 11:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B894EF800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vXGkfR/7"
Received: by mail-pg1-x544.google.com with SMTP id 185so1340486pgb.10
 for <alsa-devel@alsa-project.org>; Wed, 03 Jun 2020 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h9GWHN/DvK6JVin1rcNjThobH5dDbmXKSSUaeKlXzRE=;
 b=vXGkfR/7XSismMTy2xpUY5NzSV5dRMg7Guk1ZLQycKkPBte420Yl461lMIv/rglXKh
 w4il0wt8H6u5mGEF8JOzcWDpDIQauqQBF5XK7V+X7Q8ijutPrNAxUElJTbjfstPLLq29
 a8xzgCZGiK6K7QcxTlfOsI9ezP1PmXcn9ADWOaFeMXco2LIBgvGBEBZE3ZK782mUyJm1
 U9pEifOCdt5b8+46i0+Rf4sSaMk8Pji9J/TlxZcafoR3Luj+ltt+lx13AwdwgmKeSgH/
 O6janjDQ7zW+cPm3/nTTIDbDZk0xScqllUC+VgMJtvcQe68+ZxdKmltNxbU+VngFsjlK
 UTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h9GWHN/DvK6JVin1rcNjThobH5dDbmXKSSUaeKlXzRE=;
 b=IzfpgH4IawVHNls/kKa3pXeGXjgv6Goa8dOr6o3e6pJd8dA6E3DwcuiEc0r4+J28sg
 LAklJzAp4qkToj9vi9ljP+Yp9vmPLxSqAz/jD0Oek+m524mwiaatyB63WzeHRccF4op0
 CWtySf9Uj+8f5HvRZi43K3So9BWQydrAHQPLlaVqrlr5CehQcvzAaIJBhwMh/g9VoQKh
 uJ8RGfJ/xQ5LedODu8l1ikrv4QhJIpQLQ6KnsGQHrF882+nouRfbo5OJMF7xz3+Vvbld
 MuGPz+bppKwo0vb97Gl8w47hfGuQ1TlG02OqzCXJYkC1B0sC762nzuHU9W55bh3aRh4L
 HO3g==
X-Gm-Message-State: AOAM531C5s3E1jZUex9X1hSMDttqCVoDjfj9w9d2ccvhdmF55hSNVTtS
 TfyaN2i9ZK8ReFfiohcaZM0=
X-Google-Smtp-Source: ABdhPJxQJFUYXkI0isRKjX5Mhc1Yo7lqwg+c3t7XD2aFMg2edgicu2ExjwQ4hRDFq6zPrhjSBucpuw==
X-Received: by 2002:a63:4b55:: with SMTP id k21mr28425585pgl.46.1591176309952; 
 Wed, 03 Jun 2020 02:25:09 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id h21sm1945710pjz.6.2020.06.03.02.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 02:25:09 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] ALSA: es1688: Add the missed snd_card_free()
Date: Wed,  3 Jun 2020 17:24:59 +0800
Message-Id: <20200603092459.1424093-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Helt <krzysztof.h1@wp.pl>, alsa-devel@alsa-project.org,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

snd_es968_pnp_detect() misses a snd_card_free() in a failed path.
Add the missed function call to fix it.

Fixes: a20971b201ac ("ALSA: Merge es1688 and es968 drivers")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 sound/isa/es1688/es1688.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/isa/es1688/es1688.c b/sound/isa/es1688/es1688.c
index ff3a05ad99c0..64610571a5e1 100644
--- a/sound/isa/es1688/es1688.c
+++ b/sound/isa/es1688/es1688.c
@@ -267,8 +267,10 @@ static int snd_es968_pnp_detect(struct pnp_card_link *pcard,
 		return error;
 	}
 	error = snd_es1688_probe(card, dev);
-	if (error < 0)
+	if (error < 0) {
+		snd_card_free(card);
 		return error;
+	}
 	pnp_set_card_drvdata(pcard, card);
 	snd_es968_pnp_is_probed = 1;
 	return 0;
-- 
2.26.2

