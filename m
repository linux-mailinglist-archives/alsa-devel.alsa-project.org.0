Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDF4732DBF
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 12:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F8D0851;
	Fri, 16 Jun 2023 12:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F8D0851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686911248;
	bh=HGNwtmBNEq7tGVmoFyJY42ip5IfyHQ8hZyNAmVrk+UU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pdzmRG2r3/ieNgg3JUkhDWToo8oGwLIcQUx5+CnjosmUJxUpPCOPESdlMQweM845k
	 2vp9HGHB5XDB4jIFDzC1DywaJwZJDZaMHVWN+FGhPu/biXlDIcY2wbmDmmE5l5MO7q
	 D/Vp9Se7HWDaLCYU2Pt1qlwjpMcis1joFvQMm3oc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F11FF8056F; Fri, 16 Jun 2023 12:25:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2F32F8055C;
	Fri, 16 Jun 2023 12:25:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DD9CF80155; Fri, 16 Jun 2023 12:25:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C8DFF80132
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 12:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C8DFF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EeWY8L2u
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 356FA635C2;
	Fri, 16 Jun 2023 10:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E6EC433BB;
	Fri, 16 Jun 2023 10:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686911136;
	bh=HGNwtmBNEq7tGVmoFyJY42ip5IfyHQ8hZyNAmVrk+UU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EeWY8L2uFlhp+pZETakACn5Sr9Szf0XYMv6k5REymx0OLgxm5TLglapLc+TE/Eq6e
	 EE1QHVO/9yFLbL+6Dau0+POEnhDgHnhXLc9dFM36jZQ2fj2UeEt6oC0JHChbSnPlkd
	 JHYbpigYnuEKKXURqlYr1we+Olg3mpXh9RP2ZG8pJoPrrsfNJAw2Xs2oAavcokWC+t
	 LUWRBMV8Ts7t8zDYHgscONxagzm/RC0sz62LgvRcJMioNBjKpi2T7Y74xzWaZhGMa6
	 NRkLOritWRuZyapsEgTIlOX4BZet7EiL7D+Xn1aFPP62zlPafS+qKxWjegwUulBgkb
	 JLJw8MfhbuldA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Herve Codina <herve.codina@bootlin.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	astrid.rost@axis.com,
	spujar@nvidia.com,
	aidanmacdonald.0x0@gmail.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.3 07/30] ASoC: simple-card: Add missing
 of_node_put() in case of error
Date: Fri, 16 Jun 2023 06:24:55 -0400
Message-Id: <20230616102521.673087-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102521.673087-1-sashal@kernel.org>
References: <20230616102521.673087-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5BIYMDI4OKE5PUNEOZMTW5BS7GRLLXS7
X-Message-ID-Hash: 5BIYMDI4OKE5PUNEOZMTW5BS7GRLLXS7
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5BIYMDI4OKE5PUNEOZMTW5BS7GRLLXS7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Herve Codina <herve.codina@bootlin.com>

[ Upstream commit 8938f75a5e35c597a647c28984a0304da7a33d63 ]

In the error path, a of_node_put() for platform is missing.
Just add it.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/20230523151223.109551-9-herve.codina@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/generic/simple-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index e98932c167542..5f8468ff36562 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -416,6 +416,7 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 
 			if (ret < 0) {
 				of_node_put(codec);
+				of_node_put(plat);
 				of_node_put(np);
 				goto error;
 			}
-- 
2.39.2

