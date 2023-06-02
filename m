Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E67737227EB
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 15:55:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9D481FE;
	Mon,  5 Jun 2023 15:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9D481FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685973307;
	bh=bjCG6Z1H4Y9mgflhUJNA4NwiuQy7EB2yOZM2exbxbcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qkKnyOCvQ+gofmx0Y/Y0T9+KJRGVgxa6/gai0DevbqgtDz/ZBX/XczmCbx+bgG4ah
	 /YoQu+RHeX1jezjdjtfzwOV7hy8mEgx85DpZrLv00hkfG3fhp/F/C+ZD3NIwzH3UY/
	 i1mt/lPsynyQM7eFZfphdVMzIxt/O8gIX0UyJUvw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14FD7F80588; Mon,  5 Jun 2023 15:52:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 780AAF80588;
	Mon,  5 Jun 2023 15:52:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25559F80132; Fri,  2 Jun 2023 11:04:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06430F80199
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 11:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06430F80199
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=pqrs.dk header.i=@pqrs.dk header.a=rsa-sha256
 header.s=google header.b=aG3Fb8X3
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51640b9ed95so241326a12.2
        for <alsa-devel@alsa-project.org>;
 Fri, 02 Jun 2023 02:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google; t=1685696629; x=1688288629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMKaght3EZRcwtR4hLhGpGozkma4rbwmuu+0lxvlO3A=;
        b=aG3Fb8X3K9WKKxNliXyqCzqEZZLOAoC6+28JL4RDvnce9WPai1yKdx0ChsOA6lzB7y
         sgOHuV1st30My66XqPWbpZNBLehHxsHl9kFZRb4hR8CuRGTZfAUA8pTLXzixnF/cixb5
         jPt1Pdg3POHJ5A2WTe56XJ2P0GNmJmOCmrvIIQUviHJgSY5tVV5CvfpKte6P6z/3oh4l
         PSHUkwTIQqidY85LpUOWYubwIctytCIgg7cbqb6ySfLJr/0Jw9w1RQU2wNtJGYmfrmaS
         RZyfs8UuR7zTmy/p6b+RZIJkHQg+dM/aGHLTvzNl2PD0I6gI2Ldpn2M+nbY4iTKv7H4X
         d5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685696629; x=1688288629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMKaght3EZRcwtR4hLhGpGozkma4rbwmuu+0lxvlO3A=;
        b=EChcYmdgDRuJAcwp1pLgSqmEZ/tDH7sgg3OV3W5W7wUkvD72cvDPtX+vRZSGo3mJya
         4GdgBod8whVzRNlo7YRJ5SF8y5jQGQdara0yHvAGu9+Lvbhz90/lhkC0J6pogdhSw/0L
         Ik3pDH/ScdVL4yTPkhlOkqCh/VnXFSp4k5WRd0aQd/MW1qGLBu6d37AX2vMLyLejA3BT
         HTfm4sXD3KKiQSbB0ENu6EDxcH3Q5d4kUetYAmEPgFcyKuoIQbWvUCc7Eby3XdlQoplg
         /EDg76dE4BKT2NzSk0FyAnYI7Uvcdak+AuQwJE4SbuP+4eOCTsRuvb2Fdn1lbf8Ja02P
         LRSA==
X-Gm-Message-State: AC+VfDzxZcxrr5SGvEOpl+vNLV1Db6CnEyYgJxxQTZApQNK0H9qb53xu
	y17Ppab8at6gH/2D709D5Srbxg==
X-Google-Smtp-Source: 
 ACHHUZ4jmlviWCEZ9d2sqlZKV0HRtlTNsu09RrXOh72/ySDy+4DwbEEj8oyV65wODyolmmip16qHpg==
X-Received: by 2002:a17:906:d550:b0:974:6334:f6b2 with SMTP id
 cr16-20020a170906d55000b009746334f6b2mr806371ejc.22.1685696629567;
        Fri, 02 Jun 2023 02:03:49 -0700 (PDT)
Received: from localhost.localdomain (80.71.142.18.ipv4.parknet.dk.
 [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id
 w23-20020a170906385700b009707fa1c316sm488031ejc.213.2023.06.02.02.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 02:03:49 -0700 (PDT)
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ASoC: simple-card: parse symmetric-clock-roles property
Date: Fri,  2 Jun 2023 11:03:21 +0200
Message-Id: <20230602090322.1876359-5-alvin@pqrs.dk>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230602090322.1876359-1-alvin@pqrs.dk>
References: <20230602090322.1876359-1-alvin@pqrs.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: alvin@pqrs.dk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7EP5RR44L5P67K54ABLBIV6MMIDG52SQ
X-Message-ID-Hash: 7EP5RR44L5P67K54ABLBIV6MMIDG52SQ
X-Mailman-Approved-At: Mon, 05 Jun 2023 13:52:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7EP5RR44L5P67K54ABLBIV6MMIDG52SQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Alvin Šipraga <alsi@bang-olufsen.dk>

The property, when set, specifies that both ends of the dai-link should
have the same clock consumer/provider roles. As with other simple-card
properties, a prefix can be specified.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 sound/soc/generic/simple-card.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 5a5e4ecd0f61..4513e30948b7 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -181,6 +181,7 @@ static int simple_link_init(struct asoc_simple_priv *priv,
 {
 	struct device *dev = simple_priv_to_dev(priv);
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
+	char prop[128];
 	int ret;
 
 	ret = asoc_simple_parse_daifmt(dev, node, codec,
@@ -188,6 +189,9 @@ static int simple_link_init(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		return 0;
 
+	snprintf(prop, sizeof(prop), "%ssymmetric-clock-roles", prefix);
+	dai_link->symmetric_clock_roles = of_property_read_bool(node, prop);
+
 	dai_link->init			= asoc_simple_dai_init;
 	dai_link->ops			= &simple_ops;
 
-- 
2.40.0

