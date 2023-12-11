Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EEA80CBA8
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 14:53:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ECB1857;
	Mon, 11 Dec 2023 14:53:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ECB1857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702302822;
	bh=rnIVZ5NoqCQIqFSODCtBfY9Y52CWqEGI28+S0xTxYaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YbtivtFKtJhOz3sv1A8JfLoYtTIgjBtrtUfRLvmlPqTZcXRGlKwcAjFwls4/fzF4q
	 kEgHyxPqFAgHevXF83Poqels8e6JXV1xX6MJhkRAztxTrf+5wmXxWdOiss4TFehCW0
	 pOWuKIcZPkL9Yxg6mMqIPAb0EInlHJZFCcdrSQCs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49BA1F80618; Mon, 11 Dec 2023 14:52:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 865B2F8060D;
	Mon, 11 Dec 2023 14:52:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7B04F805DF; Mon, 11 Dec 2023 14:52:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4EA15F805BE
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 14:52:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EA15F805BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G16tMg/2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C23D2CE127F;
	Mon, 11 Dec 2023 13:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 695FEC433CA;
	Mon, 11 Dec 2023 13:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702302742;
	bh=rnIVZ5NoqCQIqFSODCtBfY9Y52CWqEGI28+S0xTxYaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G16tMg/2fD+VamOP4Nm3kuLPCOrTvlpcZilW8J25mYsNXgLlkPrGuTNE6WuaqeLlz
	 Uzw+dZEaW3eSv3cAzh4i5cy8XKawZkQzeHWv0/t4omk16jvDWR+vhJKyxhIuUd1ZwL
	 taCwojDWUKaqHMNDPk5C3b/wNzHW92P3oQk3pMoK4DOviMeJt+qXq+64hebqPXcfr5
	 9OvKhHpv/lmWkloi2yxiNPWotPemhCdDJ0889NdrwVwHAMt+AEvWWSCQjfIPFoxRmt
	 fTQmVUMdjyh9mhYdsUFZHS1v6HL2Vxiep6EjSgsB3ehbZk/9OiuX9UhY93SoXdXEJv
	 E7S3ONiCNrjxg==
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
Subject: [PATCH AUTOSEL 6.6 11/47] ASoC: cs43130: Fix incorrect frame delay
 configuration
Date: Mon, 11 Dec 2023 08:50:12 -0500
Message-ID: <20231211135147.380223-11-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211135147.380223-1-sashal@kernel.org>
References: <20231211135147.380223-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.5
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MJFK3PK5OJYKMM4V5DROYUQ7XA2BASJZ
X-Message-ID-Hash: MJFK3PK5OJYKMM4V5DROYUQ7XA2BASJZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJFK3PK5OJYKMM4V5DROYUQ7XA2BASJZ/>
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
index 778a62e57d456..206008bdecac3 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -579,7 +579,7 @@ static int cs43130_set_sp_fmt(int dai_id, unsigned int bitwidth_sclk,
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

