Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9619ECB39
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:30:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7436C2BBC;
	Wed, 11 Dec 2024 12:30:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7436C2BBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916646;
	bh=cnajpc59mzRLWDYn+TlQEWJ18Tzqm1CRjbROQ6JPtZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G8B5lsZoQ4X0ux4y0Ia+sxPMhn3qX6jwqHYAqwvtL4WojIn7x3I490ishaQflgTyv
	 KnC3pAU9zT/iXNRoGGQN7FS6n1Xu1SBeYlRFAVqBOA7EjO5ZTx7oKHS9GuljP3QATV
	 Njok1XM1QwU8kvgoJ4vDtW+U2nuz2URSFpIZ5/0g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5A3DF80797; Wed, 11 Dec 2024 12:27:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AD99F8079B;
	Wed, 11 Dec 2024 12:27:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DFF7F80482; Tue, 10 Dec 2024 18:11:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 071C0F800E9
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 071C0F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=QF1uP6lI
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5d3d479b1e6so4966020a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850628; x=1734455428;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3F8PzVf1JVHBMdfZjuuSPBsoTNCHuDc7mT2swoePkeA=;
        b=QF1uP6lI6gzIzeJljQ9BISgUYVl93o3ji+nF7JxfEqvISZulwVVcsIUK/soJf+9d4D
         W6d3lLPPIwgtxCZphMof3x7rp+YGEC6Ek1++IGEoFwe0cmLfFxkct16BPbhuTO3nzk/M
         7sphaznUJtZFj7hy7/yCHQcFgtqV9qR6PS17bgaKZwb9na3iVcUvDmxYHfnVi75V5kts
         O0+OEwfk2JI5JfaRwLr/3YTdPxTpNVEnI+3SOBYaB5hui9yOa3HgDEP4spk9QM43oVIn
         QLj9pYb0c54K+dCdQzNow3ME3Qhh4XoWwa5DetbvGw836c1OgYDLzVogDQVYub6SxuOR
         8d4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850628; x=1734455428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3F8PzVf1JVHBMdfZjuuSPBsoTNCHuDc7mT2swoePkeA=;
        b=tT/Px40WVzt1qAJqe8jYGEdYnKjchV0RUhyev8Atd30gRN8P6GpnX0PY2TYxT1sZGM
         SYQTU5LzXF2nOV+g/p/7PKB4xXi9tAvEwX/Yivndk0AuzgYxoL0tdgsyEKnaPkK3v7/h
         tbY+vxz4l/jKH/9nfOgdJw7KOHArD1o+jo8yIpawXTaaOYWT0YbksxQcbxleoS+MUpJR
         tUYb6L1iCl1pF3P75Vi1THggNfe3h5kAn4YQIOdypjMw9Su7k1lnhbTsS+TGEJFz/STK
         eK/kEWKgDScHyTsYAWjnZYz4qDRbVLa3/i+wWZR7zn5w/QGBJzdNNGXhe4tWCcGjbGYU
         DQsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeu+wA4v1Kb6NLMH2OQgGAnt3jHanRa5ZC6T3TZ4EfAr8ZdghMwMEUoh7ezRixZHdso1jNnkNSLbFg@alsa-project.org
X-Gm-Message-State: AOJu0Ywj96RtsjcTfq63o1FUbXUR8Gnnk0gs4nbJ3r771wDsbnE5fm+l
	63JsSrF3MjT2bvtaiSjCqNQpwuVkfu/gX0iFI7VHxeoTdiD2HiOrQwwPBBGiLUs=
X-Gm-Gg: ASbGnctoX92FKwRQ+OyqQfiLOBPOWWwFWoXeaIYfKFahmde8phvCauhAbVGE6Wp5790
	EcZzZb4nCxZGhPtsOvAvtExR831F5fqiLcELQBV4Rwux1/Q3MQT5vMl0fNVWXBcXivcq+/icmty
	E81EkBFU03oJlDJwFsIoec2i9mLn31DE+aE20Mj5wP3TOZekg7NLC76Xd+hACq4iRvdvlGqrJU4
	CiXlH6sUqSRBVtaEOaA4i+LQD7e28KTU/7xkQmDCv9uwYc40rFyqUEb6Dt1aOp6TCL/FGCcOfdO
	PTEbw84l
X-Google-Smtp-Source: 
 AGHT+IF6mILseNMfJmIB9ZOyimXPXPfxpdkmjbt3WuqKLQbtoG5tgiV9L7CF+aAEAjMF8dRgPTsU9A==
X-Received: by 2002:a05:6402:42c6:b0:5d0:ea4f:972f with SMTP id
 4fb4d7f45d1cf-5d4185060b8mr11381588a12.8.1733850628448;
        Tue, 10 Dec 2024 09:10:28 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:27 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 10/24] ASoC: renesas: rz-ssi: Use
 readl_poll_timeout_atomic()
Date: Tue, 10 Dec 2024 19:09:39 +0200
Message-Id: <20241210170953.2936724-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: claudiu.beznea@tuxon.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SBMSDJPD4SWMPB2BMNCVHF7T6VU66XXP
X-Message-ID-Hash: SBMSDJPD4SWMPB2BMNCVHF7T6VU66XXP
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SBMSDJPD4SWMPB2BMNCVHF7T6VU66XXP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use readl_poll_timeout_atomic() instead of hardcoding something similar.
While at it replace dev_info() with dev_warn_ratelimited() as the
rz_ssi_set_idle() can also be called from IRQ context and if the SSI
idle is not properly set this is at least a warning for user.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 1a98f6b3e6a7..03d409d3070c 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
@@ -307,7 +308,8 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 
 static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 {
-	int timeout;
+	u32 tmp;
+	int ret;
 
 	/* Disable irqs */
 	rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TUIEN | SSICR_TOIEN |
@@ -320,15 +322,9 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 			      SSISR_RUIRQ), 0);
 
 	/* Wait for idle */
-	timeout = 100;
-	while (--timeout) {
-		if (rz_ssi_reg_readl(ssi, SSISR) & SSISR_IIRQ)
-			break;
-		udelay(1);
-	}
-
-	if (!timeout)
-		dev_info(ssi->dev, "timeout waiting for SSI idle\n");
+	ret = readl_poll_timeout_atomic(ssi->base + SSISR, tmp, (tmp & SSISR_IIRQ), 1, 100);
+	if (ret)
+		dev_warn_ratelimited(ssi->dev, "timeout waiting for SSI idle\n");
 
 	/* Hold FIFOs in reset */
 	rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_FIFO_RST);
-- 
2.39.2

