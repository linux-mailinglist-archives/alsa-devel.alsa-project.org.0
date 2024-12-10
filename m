Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A92AA9ECB3F
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:31:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6998E2BDB;
	Wed, 11 Dec 2024 12:31:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6998E2BDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916715;
	bh=cB+Bpu7l1dV+zM88HO7Ze3t/5fdXwi7jPTuxAvUk+U8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jufOG+t80clhvHD8REwFhftMEUsICSSsZBzTbQGYlAEXkEc+wCKUUgQhnXho/p6ve
	 hSbRq4uDg2nZ8oq56XovRqhgcqDv+FL3xzMV8B7J9jvjtFnkeqEvUvr/oD9hMfF691
	 pzuSvZE8FYzQOX/16eHWD73nNyqPX0+R7WJ206+s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEAD2F805D9; Wed, 11 Dec 2024 12:27:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75DFFF80C7B;
	Wed, 11 Dec 2024 12:27:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AA6EF805AA; Tue, 10 Dec 2024 18:11:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4921F80448
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4921F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=ZS3ZvS08
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5d3d2a30afcso6571967a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850638; x=1734455438;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6Hy/pRodMw2d91URONzNaEgR8YWtQs7fLTqCwO7+FQ=;
        b=ZS3ZvS087SlzV6h3Ossjkglu8zME7tU4FfLQxo7JxLYVTsiE8Fqd2BrX/dC/I3F5BR
         jT0DQ1mzL0kstSv+p/sFsxu4VRork0jB9w9Fk1OQ+Tg7Ove63AblXd435QP37lewPYkn
         Y4eAPZ3oq7wZYrOUMNvIwu+E6SZNlUk6Lt0Ltjpp2yYoWMEqtJJx+TTY/+AiQ4c5tRGk
         d+riefXCVQbxto1vwIfdXADjM7Lj0vKtNGSd4L9jCgxhS6ufnZWhezLQ1xBihRQ4y+Wj
         93DLiC8rWq+hFaptwf0hMsmY3g5cFuCqsJVvWI7k9X8bQ600s+PdoEP7MFGn0kpNtuqi
         wX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850638; x=1734455438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6Hy/pRodMw2d91URONzNaEgR8YWtQs7fLTqCwO7+FQ=;
        b=bryEPxir6hLFX42mpCFWyQVRu7NOaXvHc6MBCdUws4dfUwHg7Bmt76EXBFXzBHRXzP
         /0b+DdoDU0yGS9PZ8fWdOb7MnN8RgZkTavDSXxI/orf1aPhaHFKBddQ+PpX4lfeK8vOs
         hdxg14bk6l/GzCiuzYsWtmXXHFaERFXrQJB7miTDIBu5oAXHSGTx0YJhuyz2dvXQ3UTh
         SzfuN8m8JypJULt2h5CMey3R8IqlXgUBB2fwjtm89BYThqpu7QMDikKqRpDzQ7rouJEs
         bckDt0dOy8/zRNdVDEJiDUSuP48hWOP+1YhIS5fvCMsO5b1cOelwj9YfTs1/tPPPbUJQ
         +kvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVij8LMWWZENLRiUyGngfrtKipe1PMEcIe6UkgsNMY/lijf5wuFi0nFxHTLri2acoTi1NLeP0ezZa+b@alsa-project.org
X-Gm-Message-State: AOJu0YzzQR3qUZgkbjK/c2yyaDAR0TPWJRuzoeOAhUmbkUmQJD2kpBbc
	kGW9RGcl2Q8yIhJWCPdKE3+9Q5/WaoGOYCOAaMXRbx6K4cm+CE1k35hc64MFSr8=
X-Gm-Gg: ASbGncv3rWZhsrxQ3gFavfQjprgPBCxVBTIrs3j464QZ/qAgMTlBKr7OG3A/ua95CjJ
	PEo0LUd5ZWWZIJXTJ4y+LfNhyWhOCN/2eSdeoj8T6EpqPykapu+tU8Vy11cL1Bpus4u7PYtbZm5
	EhOP1Z/KFQwMfXAdKtfvaTUrk56uGAJQ8uRAJ+5yR5UI9UrtV7xUL/KkTkSahWm1qjUKZDtvMlb
	33sAxx9uQ0pscWoOnJgWe0ysPXmHnEilrYWXIrx6M8TCMVLeXh6orzAK1bBT1iocT2+dXdcVPh+
	KiluQ179m60=
X-Google-Smtp-Source: 
 AGHT+IGqcJ6bqhwIIKJrt+yeOZgP79f+Ka5SbVUv4mcFJwjMu+9gX00sz7DE8koWILZTW546alVDvg==
X-Received: by 2002:a05:6402:1f10:b0:5d0:b4ea:9743 with SMTP id
 4fb4d7f45d1cf-5d3be67e142mr17354125a12.8.1733850638421;
        Tue, 10 Dec 2024 09:10:38 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:37 -0800 (PST)
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
Subject: [PATCH v4 14/24] ASoC: renesas: rz-ssi: Enable runtime PM autosuspend
 support
Date: Tue, 10 Dec 2024 19:09:43 +0200
Message-Id: <20241210170953.2936724-15-claudiu.beznea.uj@bp.renesas.com>
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
Message-ID-Hash: 7D5766WGOJUKDXMLVJTFVYBBTPYAMUV4
X-Message-ID-Hash: 7D5766WGOJUKDXMLVJTFVYBBTPYAMUV4
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7D5766WGOJUKDXMLVJTFVYBBTPYAMUV4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable runtime PM autosuspend support. The chosen autosuspend delay is
zero for immediate autosuspend. In case there are users that need a
different autosuspend delay, it can be adjusted through sysfs.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 878158344f88..eebf2d647ef2 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1140,6 +1140,9 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	}
 
 	reset_control_deassert(ssi->rstc);
+	/* Default 0 for power saving. Can be overridden via sysfs. */
+	pm_runtime_set_autosuspend_delay(dev, 0);
+	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable runtime PM!\n");
-- 
2.39.2

