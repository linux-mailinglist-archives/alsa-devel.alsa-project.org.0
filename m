Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 091B18787F9
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 19:46:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0451E65;
	Mon, 11 Mar 2024 19:46:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0451E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710182800;
	bh=NbFoFKDFJZ/lAIRyGGvrwioKM5cI7LsQ0SBfnOwu3Sg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ii+ee3EDrLbAw7Wxy6LDxKTiArwa14tHpshGXUEbuyDzBHsjx44fa17dbqvbnmTEB
	 pUyDUHGuucqvBZhuk0l0qraoTyBHobiL0XKjfw/ASiTLHFvvf68ql6TsRuzbUtBLxX
	 H1na+MjfZJKmo3ZHUdkUnmzxNboqkzkwZ6qZFUMM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B863F805F1; Mon, 11 Mar 2024 19:43:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F265FF805BB;
	Mon, 11 Mar 2024 19:43:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A58CF8070D; Mon, 11 Mar 2024 19:41:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DA58F806CA
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 19:40:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DA58F806CA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RZrX1bLy
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9ED7D60F70;
	Mon, 11 Mar 2024 18:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B7EC43399;
	Mon, 11 Mar 2024 18:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710182437;
	bh=NbFoFKDFJZ/lAIRyGGvrwioKM5cI7LsQ0SBfnOwu3Sg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RZrX1bLyIzljat8nEoaKKSd2xkU1YoZFY0lNKZarRlrtwm87McyvJbOFyIhgPS3Oq
	 xSlcaE/s6dag8E9JSBWQKLcx23JGnxwHvPReBsjXiUBqQYweGpFOffDNuLPBUHvrco
	 qCpf7rQvBS2uGv4oMpAzd3KQ/wSWPLu3M0MfGmtZqlJHMs0zCqFlE7fYbSB/1jJ9FM
	 C+miP+9lMGbLDU+G+tx5f4Uw9WiuZGfj3aTBjfas3wkm9D0mCR5wzlZQ7Jb87fr9uk
	 DWzRGp0HCcfIzGBcMRuxTY8xx7aKd+oCAUfMJlUVyAsIYuB02zOQ6CwHfgLxa0GFQT
	 M/TuksDGEh3TQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stuart Henderson <stuarth@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 4.19 5/5] ASoC: wm8962: Fix up incorrect error message
 in wm8962_set_fll
Date: Mon, 11 Mar 2024 14:40:11 -0400
Message-ID: <20240311184011.329314-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240311184011.329314-1-sashal@kernel.org>
References: <20240311184011.329314-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.309
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FSBUJON5SIJIAO5FWWVC7XC3CSYF4L6I
X-Message-ID-Hash: FSBUJON5SIJIAO5FWWVC7XC3CSYF4L6I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FSBUJON5SIJIAO5FWWVC7XC3CSYF4L6I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Stuart Henderson <stuarth@opensource.cirrus.com>

[ Upstream commit 96e202f8c52ac49452f83317cf3b34cd1ad81e18 ]

Use source instead of ret, which seems to be unrelated and will always
be zero.

Signed-off-by: Stuart Henderson <stuarth@opensource.cirrus.com>
Link: https://msgid.link/r/20240306161439.1385643-5-stuarth@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm8962.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 55e041031d398..74321c16e41f4 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2867,7 +2867,7 @@ static int wm8962_set_fll(struct snd_soc_component *component, int fll_id, int s
 				    WM8962_FLL_FRC_NCO, WM8962_FLL_FRC_NCO);
 		break;
 	default:
-		dev_err(component->dev, "Unknown FLL source %d\n", ret);
+		dev_err(component->dev, "Unknown FLL source %d\n", source);
 		return -EINVAL;
 	}
 
-- 
2.43.0

