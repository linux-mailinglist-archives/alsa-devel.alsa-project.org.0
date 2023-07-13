Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B40751513
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:18:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 830157F8;
	Thu, 13 Jul 2023 02:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 830157F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207499;
	bh=QadRCauUHc3luCjo1nsfoeYTP1Ic9HjyB1JlffjTMmI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TQa1r6bpDp1FfWIGU5P2QH/4d++M4zQ5qSUCIHiw3SIVdYvWhGEXRNEHdxJvCuIAG
	 70ZUcR/NVSQtQafmNZnTHTS0dWbafaESiJiTuOfc6USuHikx32rPYN/uYNbDdb2qcI
	 cci0EJu2Y5xQfaoEjuVZyV1GWxvGlEm+j0+Ny8lA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A40ADF805E8; Thu, 13 Jul 2023 02:14:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7FD1F805DA;
	Thu, 13 Jul 2023 02:14:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3407F805B1; Thu, 13 Jul 2023 02:14:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8174BF80580
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8174BF80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qakehfuc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 757BC619B0;
	Thu, 13 Jul 2023 00:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7789CC433C8;
	Thu, 13 Jul 2023 00:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207278;
	bh=QadRCauUHc3luCjo1nsfoeYTP1Ic9HjyB1JlffjTMmI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qakehfucf6g65K6T9I6399OdBbxKnyrjcNC+rrPCudTB37/k45hbLQlLKwczwhENX
	 k/abj/DU8Qm5t3nadnKbNw22Ao+bdII69gIpoGyRn/drgQog9dCYgyybxLVcBRBreK
	 25eVQ9was9fWzBxGq2ig3tPZOAmNwKV6E8ny/QrbYGOYwU5qxtBWkAmREuC1osVVbo
	 ZOlmB9oxmYdrckfKTRXmTg1WM3HkPdaD4dTmxf/1bCDCWoNgyOqR4+oHXlvINYPft8
	 lec+RQJcL6hVdIzNKbz8dNqaUOiqrpy/8usuWqip8DY1AmL/kFEmKjrIiPXTIRN9Os
	 u98SR/fSBAngg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:22 +0100
Subject: [PATCH 09/48] ASoC: cs42l56: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-9-a62651831735@kernel.org>
References: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
In-Reply-To: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=QadRCauUHc3luCjo1nsfoeYTP1Ic9HjyB1JlffjTMmI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0GzW8o4fQ0QlgmF3NDt8zfFx2A0EEOPSj96M
 y6FNaPf2kKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BswAKCRAk1otyXVSH
 0HbKB/4urZQGWznkNFSST1RUI3j/WUdl9oUkYrbBN54Meapd9UJJDyQpRpDb9wYn09JkBcOlWpn
 uWCqPjctzJp6f9BFZAPHoBHfUA5B9YWpHeF0C0HKJZ1y4czwH6xQfjnt+7/jcg9DOXQ1OteAs6X
 1EBE4JuQ9W9TyTGZ871wJ+8D3RsYLTGI8w54q9TPd0KVFViODJ9ZLZmP/yfd+oIEVflXfPqtNzN
 J+l4XlnA4ANBVs4gYtGOtBNme62tyHGLlUW6r/CWjOdBs9wHhpA5p8P2I4kafWCyG1gIzdlDVLT
 Nb5uHCv83AyCyyvq54dJjVWNF72rm94szneS6xKVWBmpr5gP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: F6NEQXFFBNAIQXL5QIBZWUAYDU35MKCR
X-Message-ID-Hash: F6NEQXFFBNAIQXL5QIBZWUAYDU35MKCR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6NEQXFFBNAIQXL5QIBZWUAYDU35MKCR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the cs42l56 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42l56.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 4c646e8d72aa..1714857594fb 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -1125,7 +1125,7 @@ static const struct regmap_config cs42l56_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(cs42l56_reg_defaults),
 	.readable_reg = cs42l56_readable_register,
 	.volatile_reg = cs42l56_volatile_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int cs42l56_handle_of_data(struct i2c_client *i2c_client,

-- 
2.39.2

