Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFA39ECB3D
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:31:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B5E62BB2;
	Wed, 11 Dec 2024 12:31:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B5E62BB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916683;
	bh=nYG4Bh/KOUygEwsE3gKVUjg9VDgkI5hhLIDAicMnjio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LG+14g5041FBQ++mTkPyndDJrHJH20c1QOZMpK9zhj7l0LAeNCrCM8oGoLZ2d/bhv
	 8famKhVoFhj9DU9atEsZDt4WG8YB5bqlxac6xNKxi8nyh6JSQe2rElte3hiLKV4HnM
	 yt/4PrlBaHUo1GXHsmr4R2A9bG6R8sWX7BrwokUk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9C13F808C9; Wed, 11 Dec 2024 12:27:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2226BF808AF;
	Wed, 11 Dec 2024 12:27:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0875F805AA; Tue, 10 Dec 2024 18:11:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B166F80482
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B166F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=FUhDczOU
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5d122cf8e52so9171032a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850633; x=1734455433;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+Q7Wyi2VpUxYoA4m3KALmoe6y3o5M1OmNQXa4v/tj4=;
        b=FUhDczOUM0KtUyuKbBUbS0CgB16h0/MeDPdHek6wrUQTlBkfr6pkpt8HUpzwU7GbCE
         wvph/4owPVpNHK4hCk8ltmCIfL58G8dcTpwA102RUB3xTTz58HO8hHQ6fMAJx49vqEuD
         5x270EHJKxbORIK8y9qoHxfQ1dyAM6PqV2kb7UmXdEAlUoo3byOWnuKVI+fbiyROpWm8
         Xdu6hSlPEEDR0v3CAcIVEJjxNqk3ntOPIvd5ZTe2VTNMEvFneYSunYwkRehkylqaxFuP
         TUJ6N0YD301rS0zB+2IhyoRM5DUAcDSouZbZ2eVr+zUUyFZWbqy+ufZBGcbxSgOK0LFa
         Rlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850633; x=1734455433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+Q7Wyi2VpUxYoA4m3KALmoe6y3o5M1OmNQXa4v/tj4=;
        b=LkSinV4ZtM+q/CxnDMgZOKIfvG2s7pURuG3zcUfo8LS2eyOe2lJxubt+PtiFcGw9CZ
         Z3ffXZkjjWGQEM9pFQtecbHBwqSRajC3KEtzAKT67SCi8EyS0SICtofwiy31kOwFIQjs
         PZLUO7jpYV9AvtE0fZ9HWav+Vxn8b+7BpnsgtVnnAUA7wtjiod8SEEjkP7xRKk8bex/P
         hsR63x9xjSxKXpE76CxZD9tmMrCyPXxcT6Tp0TQQ5m7s+bdUZ2AnsaCi6mzTA8tiSliu
         IP5APz8swKX1w9unMDpLwi93mr1fobSOQn/c78Qsc7trAwgJx8/EO7KtoQT0+ulNpI2l
         H1tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6ARbSTbSUPtVKDey0zF74Kt7NUo5M5B3QSj8IJl5DefXjDJHBS0BknQm5+aoVZwnhmrqjxlK0G7UA@alsa-project.org
X-Gm-Message-State: AOJu0YwS4ShHOhnwV8AZWSxxrIr+Qd11RhqvV3s2/mfj6QFdw0MWluug
	XNiGVUbn4U+mOg+iik3oASgCLWrp55bBZX5qpmowfK29fKl7Lmvpf+FzLylLVLA=
X-Gm-Gg: ASbGncvZaFTrEs0Ze8udfLHlsfK3g5CznsswpIEL4hza2TY+ZInzFoPHcTFPnssM8fo
	yjZ0qI8oaHZabM0BFJ+CXpoLAyEt973En5rTL0lJH4bF61RHGPfixjGYAv45XsV4Im5rERfk+s+
	2iBAXqRg8a0YMQzHvjw9kPtAZDBRuCjBTDpgupWFDdVrgz4fMu0COOSeE8I/gIG1u/J3uO8SsmP
	J4bnA6txZDWbE7focgj+1W6sdq3/OLVAKG4E6T0w4N7X++XcQrk4bIYHIjP+d3Kn3GeLmG9Z3I8
	ZFC0lHJw
X-Google-Smtp-Source: 
 AGHT+IEBCVJ5ksFpp4FwClVaCrJfMHHPabOYnva4BY/zYpG72K/0Fg/nCKLr56XOe4brB+WYlaK2nA==
X-Received: by 2002:a05:6402:2688:b0:5d2:7199:ae6 with SMTP id
 4fb4d7f45d1cf-5d41852f3dcmr6281078a12.9.1733850632877;
        Tue, 10 Dec 2024 09:10:32 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:32 -0800 (PST)
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
Subject: [PATCH v4 12/24] ASoC: renesas: rz-ssi: Use goto label names that
 specify their actions
Date: Tue, 10 Dec 2024 19:09:41 +0200
Message-Id: <20241210170953.2936724-13-claudiu.beznea.uj@bp.renesas.com>
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
Message-ID-Hash: TIUVDNVNIPBO2RWO4XAKFHPN6RJJZI5N
X-Message-ID-Hash: TIUVDNVNIPBO2RWO4XAKFHPN6RJJZI5N
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TIUVDNVNIPBO2RWO4XAKFHPN6RJJZI5N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use goto label names that specify their action. In this way we can have
a better understanding of what is the action associated with the label
by just reading the label name.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 74632e2482f8..209b5b8827e5 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1084,15 +1084,15 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	/* Error Interrupt */
 	ssi->irq_int = platform_get_irq_byname(pdev, "int_req");
 	if (ssi->irq_int < 0) {
-		rz_ssi_release_dma_channels(ssi);
-		return ssi->irq_int;
+		ret = ssi->irq_int;
+		goto err_release_dma_chs;
 	}
 
 	ret = devm_request_irq(dev, ssi->irq_int, &rz_ssi_interrupt,
 			       0, dev_name(dev), ssi);
 	if (ret < 0) {
-		rz_ssi_release_dma_channels(ssi);
-		return dev_err_probe(dev, ret, "irq request error (int_req)\n");
+		dev_err_probe(dev, ret, "irq request error (int_req)\n");
+		goto err_release_dma_chs;
 	}
 
 	if (!rz_ssi_is_dma_enabled(ssi)) {
@@ -1136,7 +1136,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	ssi->rstc = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(ssi->rstc)) {
 		ret = PTR_ERR(ssi->rstc);
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	reset_control_deassert(ssi->rstc);
@@ -1152,17 +1152,17 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
 		dev_err(dev, "failed to register snd component\n");
-		goto err_snd_soc;
+		goto err_pm_put;
 	}
 
 	return 0;
 
-err_snd_soc:
+err_pm_put:
 	pm_runtime_put(dev);
 err_pm:
 	pm_runtime_disable(dev);
 	reset_control_assert(ssi->rstc);
-err_reset:
+err_release_dma_chs:
 	rz_ssi_release_dma_channels(ssi);
 
 	return ret;
-- 
2.39.2

