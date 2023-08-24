Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3490787A0D
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 23:14:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D5E3857;
	Thu, 24 Aug 2023 23:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D5E3857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692911680;
	bh=ZEk4vxttkiExCnA+WQA0eWrX8wJNdUD6swJb0CzA9Uw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Za0kZKDhrxDXNnlwIiX0ln94UJpRRD3rtZTU+bRlskKitmZOVk2ybqKgnLuoe6gsD
	 eYlPivEQtDW3nLoyf7KGP9ec+v28BxdKDo88F4piXGa8uB4X6dcehG1/O2taAwj27Y
	 2vkId9GfI6+HrmQiL0HpJ8J2rjjnNVRs2TElkGgk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F16CF80557; Thu, 24 Aug 2023 23:13:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2096BF80549;
	Thu, 24 Aug 2023 23:13:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 038FBF8022B; Thu, 24 Aug 2023 23:12:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 31267F800BF
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 23:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31267F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=nzQyrE6j
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DDB496607281;
	Thu, 24 Aug 2023 22:12:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692911568;
	bh=ZEk4vxttkiExCnA+WQA0eWrX8wJNdUD6swJb0CzA9Uw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nzQyrE6j+7k2SQ4rJqt4CtrpRT0K7+LW9s+ZtLgre9uJKLDisAz/d59ApKK9SnQk2
	 75zBJv7S5knRqC5zuM19nchhsY8HS9nXTu5cdOdvTEt12w9FO7q5BDAhOmmRmjLc8S
	 iqQWfCAEF6yT6SyAKuyN4A9z/beQUWvX/LTNcvYgqUAEG8MMq6TmG0inDEeyod1V0/
	 SnWM7ww97PyOyRr1knTgYRXguPIyIhiM5rl7glnUMBDLZSCXgkjs/+LAS94ywDR3cT
	 nS45Bz8CRx+5tnK3654jvweplaEjZY+VQmZ72kHO2A20cUHw/ufwxoIOuBqtLJ8FF8
	 owJMK+HYXAZ0A==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 1/2] ASoC: core: Do not error if a DAI link component is
 not found
Date: Fri, 25 Aug 2023 00:12:40 +0300
Message-ID: <20230824211241.388201-2-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824211241.388201-1-cristian.ciocaltea@collabora.com>
References: <20230824211241.388201-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5K4KJ23U27QL4CEJQPJDBSV7RWBJFAZS
X-Message-ID-Hash: 5K4KJ23U27QL4CEJQPJDBSV7RWBJFAZS
X-MailFrom: cristian.ciocaltea@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5K4KJ23U27QL4CEJQPJDBSV7RWBJFAZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A recent cleanup of soc_dai_link_sanity_check() is responsible for
generating lots of confusing errors before returning -EPROBE_DEFER:

  acp5x_mach acp5x_mach.0: ASoC: Component acp5x_i2s_dma.0 not found for link acp5x-8821-play
  [...]
  acp5x_mach acp5x_mach.0: ASoC: Component spi-VLV1776:00 not found for link acp5x-CS35L41-Stereo
  [...]
  acp5x_mach acp5x_mach.0: ASoC: Component spi-VLV1776:01 not found for link acp5x-CS35L41-Stereo

Switch back to the initial behaviour of logging those messages on
KERN_DEBUG level instead of KERN_ERR.

Fixes: 0e66a2c69409 ("ASoC: soc-core.c: cleanup soc_dai_link_sanity_check()")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/soc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index a5b96c17633a..75a9641349ee 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1003,7 +1003,7 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 	return -EINVAL;
 
 component_not_find:
-	dev_err(card->dev, "ASoC: Component %s not found for link %s\n", dlc->name, link->name);
+	dev_dbg(card->dev, "ASoC: Component %s not found for link %s\n", dlc->name, link->name);
 	return -EPROBE_DEFER;
 
 dai_empty:
-- 
2.41.0

