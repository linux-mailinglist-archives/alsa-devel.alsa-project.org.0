Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AB480CCE9
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 15:05:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EF6DEA4;
	Mon, 11 Dec 2023 15:05:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EF6DEA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702303512;
	bh=IJpioSTRJ4vBfYbGOTUXezj+GD42AXQJ13SUCUwtDxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AIsOj9ODDB3dSAA8MfMYRO9sU5fnfHftUTDCeOAo9LaIKQ20yORNGWrAtZxPOjwo/
	 nH5N66CUKkAAfXqW9RjzMubtE2GV5MZLa/+9vSkr7dVqtbYiyOmCHrudc9EcZ5C6nK
	 S94vDn61Eqac23o/lY2Kamzzl1F4whH6H+51wsIQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2C45F80631; Mon, 11 Dec 2023 15:03:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6140F8061E;
	Mon, 11 Dec 2023 15:03:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B311F8061E; Mon, 11 Dec 2023 15:03:25 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 73E85F8020D
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 15:03:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73E85F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gjql207L
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CD8D61280;
	Mon, 11 Dec 2023 14:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8D4C433C7;
	Mon, 11 Dec 2023 14:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702303382;
	bh=IJpioSTRJ4vBfYbGOTUXezj+GD42AXQJ13SUCUwtDxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gjql207LZgfj4o9ykHXGK0gd1Xwjr2kXeeUALQ5cw8HchBizc9s5UlrcF9YeCy5dC
	 21N+P6DnSRaA4lflezQznwU/Y58Y+xeRDDyJRe6AZ7PSyKmi8aZmYwsJbTBjUEU3X5
	 LSoYdOolaYE6emqBLpZKS69etwpgpLRq3WwvV26K1FmGoqN6ZMQBgZbzV0YBY8w9zl
	 Nh25mSjXRHPL21E63FN8srkbmu/vC6KF1Qm+0zo0BxQvtudrVR1+PKrst4a9ZX1DYK
	 8iOCeA3qJVIBlDUmsJj37IGllCcqcdVmNfklfw2LYKJRkIQNkv5c7M1zADQ88AnlmV
	 +Q+h2JGGfUzrA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 3/7] ASoC: cs43130: Fix incorrect frame delay
 configuration
Date: Mon, 11 Dec 2023 09:02:46 -0500
Message-ID: <20231211140254.392656-3-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211140254.392656-1-sashal@kernel.org>
References: <20231211140254.392656-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.301
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6ECU2PPGWDWLCQH3PDA4JRKS3NJ2CB4N
X-Message-ID-Hash: 6ECU2PPGWDWLCQH3PDA4JRKS3NJ2CB4N
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ECU2PPGWDWLCQH3PDA4JRKS3NJ2CB4N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

[ Upstream commit aa7e8e5e4011571022dc06e4d7a2f108feb53d1a ]

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20231117141344.64320-3-mstrozek@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs43130.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 95060ae7dbb40..0ffd935645553 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -581,7 +581,7 @@ static int cs43130_set_sp_fmt(int dai_id, unsigned int bitwidth_sclk,
 		break;
 	case SND_SOC_DAIFMT_LEFT_J:
 		hi_size = bitwidth_sclk;
-		frm_delay = 2;
+		frm_delay = 0;
 		frm_phase = 1;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
-- 
2.42.0

