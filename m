Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E59C77227E9
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 15:54:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 431D1843;
	Mon,  5 Jun 2023 15:53:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 431D1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685973271;
	bh=PjXX2zE4e2Lq8yVi0PfGCjj2tGLEeRhhAMqZOho1kN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vvq3NJhRUnmZQ8s+ZffcEZfbhF1tEhN0VTVWk8xcrLyzS691ZEb13/vmuKrL/Qo05
	 ejVdMKBMd2aQ77imIZJe56oHKzKA1yq8c9Bdjhkj3wvX0kAkSjjrCFseBRYMn1yD1M
	 qYva34U9oQ7b8PayzF+1oSQ8E7DYdgYwgE8hf4/0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63768F80570; Mon,  5 Jun 2023 15:52:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B90C7F8055C;
	Mon,  5 Jun 2023 15:52:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C157F804DA; Fri,  2 Jun 2023 11:03:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27434F800ED
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 11:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27434F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=pqrs.dk header.i=@pqrs.dk header.a=rsa-sha256
 header.s=google header.b=W7A072+4
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-514859f3ffbso2644329a12.1
        for <alsa-devel@alsa-project.org>;
 Fri, 02 Jun 2023 02:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google; t=1685696628; x=1688288628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppOouDsw2ZJBp9Pb63smrW3GHRr3r6Vq+ntYkWdxiUU=;
        b=W7A072+4L5LVDFH8xeLtIvjZhQinq7JukGEfUyDMsfu3Ltgt+G1BtIcw7ak1xEEHGl
         hAUqRouAfhJg//9Q+p9+8CJGUpYPUOHUrUGQLFmt/FgEgERYhiqusJZ/e0ZQu9O6eSc4
         DmqOcdWC7yH1yDWj3Mg1nCVroO1VyUTPGMiUYTYRge94t/W+DcZlKQs6ItelryoyQ93m
         AEse3zS9XK/8Xz0VxP5mXPBfOf9dJj5ZVZ6CBqR4kiMc1Y4YCpeB0HjfKGSca7+rNxCz
         j7/GQhJUvGMovqQPDjqKV+Ah7gqBFlQFoVekcAxbhOM1gWsPj9HXrKGxgdKQrIOH6NjA
         ZO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685696628; x=1688288628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppOouDsw2ZJBp9Pb63smrW3GHRr3r6Vq+ntYkWdxiUU=;
        b=kvQoHbNUULsDT+SFAE6H3LgD+NWdUNG9kUgpHVqTaUujzZlMxOYt+ZxR7YW3eDwbRH
         m5uOjogRdP0Gv3kmRTlojiegKZ1L2t4cpiS1CgsVsfgl9Ka5CH2ac3PtP8N+EjqHXg4+
         6rySdLWql3NRFTMXdshtMnPz6u9+oZTGyVwqvyIcuqpZwClPctIfWzk04yLO5x+p5YQL
         VFpaGLB0qmDRhcNZaituuG+fVxwdKcR08ZWhwteEU41Fr2gc5j/E/xUJaJSMoT5SUf9c
         UIEmsaL/9uirm3AV9oc5Z8K1N10sSK6Nt59ch6NxeGiIJikrkpxJIn6gHimeYI4LA2Ux
         6EbQ==
X-Gm-Message-State: AC+VfDzvT8QVh5KXyGs9qb1+p/jMXpBuaKGI5rS/7t7cxLz04D6lwRHh
	Bt+Xer3H1BbO8d/hjwgP64EF1g==
X-Google-Smtp-Source: 
 ACHHUZ4S9FTeGd8RGDT+UXj2VgaTZT2QVwDEvvsYF+21upP5MdbUrrtn+d9nL+oT4j4acVNL6wfeEg==
X-Received: by 2002:a17:907:d17:b0:966:eb8:2f12 with SMTP id
 gn23-20020a1709070d1700b009660eb82f12mr10334273ejc.11.1685696628034;
        Fri, 02 Jun 2023 02:03:48 -0700 (PDT)
Received: from localhost.localdomain (80.71.142.18.ipv4.parknet.dk.
 [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id
 w23-20020a170906385700b009707fa1c316sm488031ejc.213.2023.06.02.02.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 02:03:47 -0700 (PDT)
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
Subject: [PATCH 3/4] ASoC: audio-graph-card2: parse symmetric-clock-roles
 property
Date: Fri,  2 Jun 2023 11:03:20 +0200
Message-Id: <20230602090322.1876359-4-alvin@pqrs.dk>
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
Message-ID-Hash: WT7X56H34JRDGZNKKUM75PVRQ7PFS4GA
X-Message-ID-Hash: WT7X56H34JRDGZNKKUM75PVRQ7PFS4GA
X-Mailman-Approved-At: Mon, 05 Jun 2023 13:52:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WT7X56H34JRDGZNKKUM75PVRQ7PFS4GA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Alvin Šipraga <alsi@bang-olufsen.dk>

The property, when set, specifies that both ends of the dai-link should
have the same clock consumer/provider roles. Like with parsing of DAI
format, the property can be specified in multiple places:

	ports {
 (A)
		port {
 (B)
			endpoint {
 (C)
			};
		};
	};

So each place has to be checked. In case the clock roles are symmetric,
there is then no need to flip the role when parsing the DAI format on
the CPU side, as it should then be the same on the Codec side.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 sound/soc/generic/audio-graph-card2.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 25aa79dd55b3..9b4ebfd0c0b6 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -721,13 +721,18 @@ static void graph_link_init(struct asoc_simple_priv *priv,
 	if (of_node_name_eq(ports, "ports"))
 		graph_parse_daifmt(ports, &daifmt, &bit_frame);	/* (A) */
 
+	if (of_property_read_bool(ep, "symmetric-clock-roles") ||
+	    of_property_read_bool(port, "symmetric-clock-roles") ||
+	    of_property_read_bool(ports, "symmetric-clock-roles"))
+		dai_link->symmetric_clock_roles = 1;
+
 	/*
 	 * convert bit_frame
 	 * We need to flip clock_provider if it was CPU node,
 	 * because it is Codec base.
 	 */
 	daiclk = snd_soc_daifmt_clock_provider_from_bitmap(bit_frame);
-	if (is_cpu_node)
+	if (is_cpu_node && !dai_link->symmetric_clock_roles)
 		daiclk = snd_soc_daifmt_clock_provider_flipped(daiclk);
 
 	dai_link->dai_fmt	= daifmt | daiclk;
-- 
2.40.0

