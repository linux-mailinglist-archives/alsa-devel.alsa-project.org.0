Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D2980CCB6
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 15:03:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5117DE7B;
	Mon, 11 Dec 2023 15:03:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5117DE7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702303394;
	bh=uNrzFIHW5arvNF8Q+6qd4P78lIhkuakWAiBbRtTZw5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iCmE1zueG5rN6lgM6QE9g2APMDn06tjcTDTFMmVkcnpgobTQX1NFO6pJA+tCoroz7
	 PN69KG2PWE9dEh8cx7mv1JWqdq9IKrx8xgRSB97BgF479gsS5BCpzR6oo43idc7Q00
	 OMEhMrZYVwG9dl640Mjr+WGxXcFJ7GXs4G4vJN+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EE0AF80618; Mon, 11 Dec 2023 15:02:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B49F80620;
	Mon, 11 Dec 2023 15:02:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C6F9F8059F; Mon, 11 Dec 2023 15:01:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14B4EF80166
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 15:01:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14B4EF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AF3aoQqh
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CB95CB80E58;
	Mon, 11 Dec 2023 14:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A547C433CA;
	Mon, 11 Dec 2023 14:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702303300;
	bh=uNrzFIHW5arvNF8Q+6qd4P78lIhkuakWAiBbRtTZw5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AF3aoQqhQZtmegR62jvgNQMSYr1C6S/U6TNYWRsv5zIlcO1ytd/X7x33X3KRpKZhy
	 Wvcju5ARmVAvuUplhkOkWKHZESpge81ctPv+MAqu4I1O3EfVD98vhyQ1lvOpEjQ4JW
	 XnbOEhbTyZ1JrmdrJyUdCoi5i6tKKPAFROgXlAzTecuIKmILEZjFfKp8Yi3nj5mEsK
	 JzwO/E1rSKSPCeEev+kbkK9qMLNtUmIX+4v4bT4o0olO4AI/iaObHzabx2kWLKRIze
	 l5SAxwM0/fizDr/MEc1ye9Ga0JoZodq//ZWB3r/thKLNkXMmlUf3Rrx/BqI9XE70v4
	 9zZbZ8vQYeZoA==
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
Subject: [PATCH AUTOSEL 5.10 06/16] ASoC: cs43130: Fix incorrect frame delay
 configuration
Date: Mon, 11 Dec 2023 09:00:30 -0500
Message-ID: <20231211140116.391986-6-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211140116.391986-1-sashal@kernel.org>
References: <20231211140116.391986-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.203
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NLY5SY6MOGLEKPDRXJIJOINEOO6IUUHN
X-Message-ID-Hash: NLY5SY6MOGLEKPDRXJIJOINEOO6IUUHN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NLY5SY6MOGLEKPDRXJIJOINEOO6IUUHN/>
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
index 285806868c405..02fb9317b6970 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -578,7 +578,7 @@ static int cs43130_set_sp_fmt(int dai_id, unsigned int bitwidth_sclk,
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

