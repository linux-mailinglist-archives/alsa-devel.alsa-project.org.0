Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA3699170
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 11:35:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73D00DFA;
	Thu, 16 Feb 2023 11:34:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73D00DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676543743;
	bh=VHRkSn0YnTcjuOlw01AI/fSVRsUsk4QbQgU+wC4C4Ok=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=htZ8e1kpVwvc+6bzlrGH3Y6F+jpbyFQBIG6akjz/9dz7/qDIeRK+oGDtJ2T+lLcV8
	 A8+9zuATpJOb26V2aWYf31Ch872ycR839TZ3lrCspCi82mExnkrHnAfgTpWr+OoM2+
	 YdvtrNlNnYnUD0WT6Brsnk4mvpbxby0c4Wk8ENPc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38FF0F80083;
	Thu, 16 Feb 2023 11:33:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B59CF80529; Thu, 16 Feb 2023 11:33:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4BF6F800E4
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 11:33:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4BF6F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=HX5faCVU
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B6BC466021A6;
	Thu, 16 Feb 2023 10:33:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676543596;
	bh=VHRkSn0YnTcjuOlw01AI/fSVRsUsk4QbQgU+wC4C4Ok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HX5faCVUvtrcauQ3nDoj32lCNd93NRVHloTDZFIXMRHzW9sIiN3w/FyqCiDYO4my0
	 czZKEE7fy3flR3vqU1OuV6Y2B0EAnkGZE/CllbSOZ1xQbVXHVwhgP6mgZp+AXvUU0e
	 qE307I0nUk5kVFD18U8Idqv6HbOntnoKPKaWXggFY96ZgGurP3DRoPi+2vckH5dTt5
	 fE4cFcU03z8g8E96o29+IieU66Z8J5w9prrTHfoWcScZDivm4Fau74TfgQObQ9oEIz
	 xXk8eL+m4AcI5ReKjrXOWb/SkxVWgbCUJAovKqRp13MhQ0RnVZAcPiheIYrb9KKLv2
	 uaNSFbDXM5stA==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 3/9] ASoC: amd: vangogh: use sizeof of variable instead of
 struct type
Date: Thu, 16 Feb 2023 10:32:54 +0000
Message-Id: <20230216103300.360016-4-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230216103300.360016-1-lucas.tanure@collabora.com>
References: <20230216103300.360016-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AVP4AERHQFQBAJVDTKUOP6FQOCL5BFFC
X-Message-ID-Hash: AVP4AERHQFQBAJVDTKUOP6FQOCL5BFFC
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <lucas.tanure@collabora.com>, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVP4AERHQFQBAJVDTKUOP6FQOCL5BFFC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use sizeof(*machine) instead of sizeof(struct acp5x_platform_info)

There is a possibility of bug when variable type has changed but
corresponding struct passed to the sizeof has not.

Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 2675fbff9f6f..ec67345bcda4 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -329,7 +329,7 @@ static int acp5x_probe(struct platform_device *pdev)
 	struct snd_soc_card *card;
 	int ret;
 
-	machine = devm_kzalloc(&pdev->dev, sizeof(struct acp5x_platform_info), GFP_KERNEL);
+	machine = devm_kzalloc(&pdev->dev, sizeof(*machine), GFP_KERNEL);
 	if (!machine)
 		return -ENOMEM;
 
-- 
2.39.2

