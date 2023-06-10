Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4483372AC03
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:01:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98BB884A;
	Sat, 10 Jun 2023 16:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98BB884A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405691;
	bh=vxEDe8vjA8z9d57igjoloqO/L6WkCJvO5JdUOQEYABA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CZXyZwDV6WKxJCDrLJHSoD6sL7zCMjyohsXq9boWQhyx+LslZ5DCQo7rrXJg7IXR7
	 sftw1S0KZq1fPjLkl1gG9yv0D9xAs8A8I2tHFfODRoW2gEMlZthKzYexvEnIi3N6jz
	 wKZF5k3mxb9zCFskC9Wf15Z8B3bG68Iul8MpWySA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 867DFF805C5; Sat, 10 Jun 2023 15:59:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F1E2F805A1;
	Sat, 10 Jun 2023 15:59:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60F5FF80551; Sat, 10 Jun 2023 15:56:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 233B9F80155
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 233B9F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GdXJd+TN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C47BE61168;
	Sat, 10 Jun 2023 13:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0D5C433EF;
	Sat, 10 Jun 2023 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405403;
	bh=vxEDe8vjA8z9d57igjoloqO/L6WkCJvO5JdUOQEYABA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GdXJd+TNviiSJPPiFdgTRquF2ouG+VIXLj7UO6kytuBkv5JMa+p4aBJr8alATO9p1
	 h4YU7fghhPexiER7NYFwuVThiP3rXETC569cZfolCz7jTi1z1gRG9Zi7wxFOGr43zH
	 MDBcsfkHgByCZSgaBYf2lsGh7YdEdhtOzA65fIlLuhnAYcr7R/EmQkvDO6fk9lBUK2
	 Hn02tLrzCZgvWhQ6L4CstsYz0WFEPPmTRTXeKPBljf+d28B/a9HetFQcuUa9JtMlzK
	 JnBYUWdxeZnWdqlCmQziRjDR7pvMcs8ws40Q541Ek6HaSL5hGjK1KNlcj1Et5AlvMo
	 pp1qmtNMTkgXw==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:56:24 +0100
Subject: [PATCH 04/10] ASoC: cs35l35: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-cirrus-maple-v1-4-b806c4cbd1d4@kernel.org>
References: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
In-Reply-To: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=949; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vxEDe8vjA8z9d57igjoloqO/L6WkCJvO5JdUOQEYABA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIEK+vfo/XsH5hugthRpqLJrnD2o7Fk3Jx0zTw60
 KnEr3E+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBCgAKCRAk1otyXVSH0NTBB/
 9iawD+VC3SoCsctAuzus8RqWXNm7LMUPsq39Zvc30xrCj6uuQVuJ7x2T/q8V+EhByTpM+W/0rk0bR2
 YCyldWk//RIh0qUh+P9xsvCtdIaSRfxytKe8vHm+4M3P6P8838Fs0UYpoxBRmZxrUJGmhq/XRPlnZ8
 ArD+HFfx1v5JdJXCRv+/8DvPIY0DnAtWxSo4ZPDnfr6MZAsupxuAtYg7tkD4+hNYWSMjaDHGr8+/uc
 ii8FkvoyVkrgZFWzSr/OwYV8spiBYSmN+3zknPkwIZbRNh+pr+2iRJoE3XDieYdogZ2xtUI19BF3aW
 77D+Hqq36BTPGBmL9TUznsMxXTOj9S
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: XYX32I5WIVBCUMVN3L6U7DYWYZDNIXHW
X-Message-ID-Hash: XYX32I5WIVBCUMVN3L6U7DYWYZDNIXHW
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYX32I5WIVBCUMVN3L6U7DYWYZDNIXHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs35l35 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs35l35.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 947a440a3a47..d37a49b372ff 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -1099,7 +1099,7 @@ static struct regmap_config cs35l35_regmap = {
 	.volatile_reg = cs35l35_volatile_register,
 	.readable_reg = cs35l35_readable_register,
 	.precious_reg = cs35l35_precious_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };

-- 
2.30.2

