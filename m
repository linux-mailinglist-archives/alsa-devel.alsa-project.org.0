Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 665709ECB2E
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:29:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5399F27A8;
	Wed, 11 Dec 2024 12:29:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5399F27A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916564;
	bh=cYpvDeE6GTSqLQn4hyIC1LguXTCN6MR9BcYpMn3wlfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bPQFTIW7doHjYtC06O91HWbzjg3GXIEFewzAXKxpeRxdDqjB4rsoUE6CxrRM/gFOj
	 DTGqDOQQuf6+iGePbBV7cpYeZQhSa07jjUdfAFMgfmJ06F1iCFO6iBMzo5aRp9m50i
	 FR7Zt9lSmTVXkebNDmOuGdsHQjQHjZyz0+Hivu20=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5201F806B6; Wed, 11 Dec 2024 12:27:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FD9DF806B7;
	Wed, 11 Dec 2024 12:27:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B84DDF80518; Tue, 10 Dec 2024 18:11:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12EFEF8016C
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12EFEF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=eaN/1zyS
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5d41848901bso2976720a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850616; x=1734455416;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRP6aXMQvXzM2V4VFmQeuWDqqgGNHEkIoJ0Wes8B7Jk=;
        b=eaN/1zySMu9+wrpP3DuAKsArvmBK8Pw6c6JmPnIKhqcaJzQ0RE120BcgW8+75bvxGE
         3y+loISVr/TYUAorYZELoWNfk6XTvrCFt4JJArQEGIPQYH2YYdYAI4k8PoJnqXrUVv0J
         SDqRzTcbBloqTISMhEUwY7lUiOO31BDIvbP9IVIKiMOXQQCTbwhqiQYa7wC2a23sZ/GX
         PDkG2dbSxDQH1i2FFqmghz5PHnUrxminVtUwPhMLw2yMfIqbGVkIPpCosv1Z+NXRB+OV
         IwPX/KTNNBz3PQ9gQ565V1lyuGi5CvWmN3/Iz1VAbKvlfBd5l0bETYXKU7rw99EF+cck
         bYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850616; x=1734455416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRP6aXMQvXzM2V4VFmQeuWDqqgGNHEkIoJ0Wes8B7Jk=;
        b=dXRW+IWbHYDTs54zw6O0DC0jz5QZ6qqhDlDaz/QUx7DTrXiK0EVzoDQPPO+Ta8cSrz
         8RCcseZYAU5NFD+PZku197PxBaGt6G1CSaYhrzTY6X816/aD1kHuRTM5gq8aVzFh7IzK
         22KlnuodLEte+4iA+3dJaKVf0FRakSm+lQEYmIOHRm40oTmipk1w3OnT6oljPCVIMi+V
         teSFcthFpXd1Yf9+x0RPkZ+TZWcqr/waMwAwXnfUXlEC+lDQ8oD3Otsx6syFWxb4UJg8
         lqbBbTbS+PHotDewiju/cJMn/k1MBwk/ZO6bcZCrGDTOphlymieoMVa+9n/M8wQ3WBTm
         3UtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh0G12UykBjKPP0rK/G3SaoZI6x5qNFEFrrmNl5C1lhNFzyrIsqymz+LNAzVW4TizlKg6z/4ciN1Au@alsa-project.org
X-Gm-Message-State: AOJu0YyQenzsDDbR+ZFD2gY1Cu9DQg+KKbYgxN5lDJTolZ9m0zlQJCPi
	/2waGL6CWpyR1enRL9qXwUkF3rqjGNk5jZ9H9MLFlPWg8WFwUWVeiA4Sn55rFjoUB6aHyU9fmQ+
	m
X-Gm-Gg: ASbGncvqjevDCFmBjZEcGDpZNtneAG2+nkYDTYE3O/u2lFpFp1zORRzUU3GOOUAdweE
	BgU3b0Jlf0IbVRYT6GMFkvqqVV96BvLOQEvHIzjTqnzE0HK8kYPG1yrWvk5SVgCEpuQ+2X8urDm
	/+UXO4Lwm9PMmOQFedodj7nWUD+LilmUiUgjimHzR2ixJBfzeiLYa7uj7tLzIAk4oGNhw/sU53C
	ChwCMns9wXLOPEfSRKOTmJh6URAZbFWqjypTURZP2tqtmfhrAODDDBvxXrD5voxHtzjiWvzO/ld
	ySbBEHpS
X-Google-Smtp-Source: 
 AGHT+IHNyZ6Gmhi8CkHwki8iCp5hZVMJCqmLrVUuVJwgJ65+43JewzpqCE+zMexCnQ7438KBklSDKg==
X-Received: by 2002:a05:6402:510a:b0:5d0:d208:4cad with SMTP id
 4fb4d7f45d1cf-5d41e16362amr4618611a12.2.1733850616337;
        Tue, 10 Dec 2024 09:10:16 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:15 -0800 (PST)
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
Subject: [PATCH v4 05/24] ASoC: renesas: rz-ssi: Use only the proper amount of
 dividers
Date: Tue, 10 Dec 2024 19:09:34 +0200
Message-Id: <20241210170953.2936724-6-claudiu.beznea.uj@bp.renesas.com>
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
Message-ID-Hash: 7HMH7BYAHJY67OGYMUMTUS6IZWU2QJ55
X-Message-ID-Hash: 7HMH7BYAHJY67OGYMUMTUS6IZWU2QJ55
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7HMH7BYAHJY67OGYMUMTUS6IZWU2QJ55/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to populate the ckdv[] with invalid dividers as that
part will not be indexed anyway. The ssi->audio_mck/bclk_rate should
always be >= 0. While at it, change the ckdv type as u8, as the divider
128 was previously using the s8 sign bit.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- changed the ckdv type from s8 to u8 and updated patch description
  to reflect it

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 2d8721156099..178c915331e9 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -258,8 +258,7 @@ static void rz_ssi_stream_quit(struct rz_ssi_priv *ssi,
 static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 			    unsigned int channels)
 {
-	static s8 ckdv[16] = { 1,  2,  4,  8, 16, 32, 64, 128,
-			       6, 12, 24, 48, 96, -1, -1, -1 };
+	static u8 ckdv[] = { 1,  2,  4,  8, 16, 32, 64, 128, 6, 12, 24, 48, 96 };
 	unsigned int channel_bits = 32;	/* System Word Length */
 	unsigned long bclk_rate = rate * channels * channel_bits;
 	unsigned int div;
-- 
2.39.2

