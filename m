Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D6F3B54B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 14:55:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2F501698;
	Mon, 10 Jun 2019 14:54:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2F501698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560171344;
	bh=LehyMnvlquSbkanH8R2ZmmVr/0apzlXmQppnZv0GHgg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ff7J0qcwSdA/mlLxpcfiR2kAkQaBcP46TIGDaM1aUeXf4jiEFqsUHooaojLLLPjCE
	 0NQU0CC6RpRK6CITSagQqN94gw08V3ZcSW12+jzHppo0yCD13Q1AOAKN2Vqg1WJ8Bt
	 nz++I4I+zF4fWc7FLLIFws3g3Q9SeNB0aA7tfpBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17A2BF896E0;
	Mon, 10 Jun 2019 14:54:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38EF0F896E0; Mon, 10 Jun 2019 14:53:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88B0FF8070E
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 14:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88B0FF8070E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="n3Fu5kN6"
Received: by mail-wr1-x442.google.com with SMTP id m3so9093834wrv.2
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 05:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8T69aUvAi+maIZ8yBvTWOJzaeXiOR3Dqg9+a+MoRXDA=;
 b=n3Fu5kN6wdtGKh9YWexo8ZjfsnSBwADVRCC+C4XPOPSXHT5eKEAqT5i79KL9bKa4wd
 c0hqIJpI7gTWCxibbx6XId2oyRuITeCfXqD/vuxY73kQof26ZidBERPABjLwlljWAlZv
 /RaBmnpuINADHE0WgkCb9CXCUgwj4Yxvz2Ql+sdrVda1v3DhaMUlSuiQFVX9hxE2M59c
 2v8lzULQ5grpGHh307iNtaYcW5R1JoPcHlI5ob+LjUqV8Yn8AMYEPWaBB5TBDRQZQhyb
 tXVbYg6wQvy59GmMAsTdVK+sHPTjGUCBNjYtFOVx9d4p2BBvJ5leqMnY4TuY0XvTNUme
 i8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8T69aUvAi+maIZ8yBvTWOJzaeXiOR3Dqg9+a+MoRXDA=;
 b=BWtGNJHbadUASVhUUFWjZHRyn/RwucRlmT40wlwZ64k7JS9M4lxPW9T77e9Malzoyw
 m76IB3/6cECttvRD6sow4x11gUFZNwDsJwAh48Jr8YDqijNGh9nvQ4AS8yCuN5W3AL/P
 j8oh5HRWCUG4vBVA+eHJhnjrMNVUt2giKnjDfUaDQnr2SPIbmSaD87B4oOCsgKAcxRgj
 mOj+E0Z9k69DsG636yUvU49ujWWzREr6ErAP0a41uqACUTDKoLm+CMFKCpRBmmzYyRV4
 I76lhqmklMkp9YRuUiNnowwbsMpGVNs51lZFM8in7vN1KjPWHSuyoQZD10PDS1kW1cYu
 rrNg==
X-Gm-Message-State: APjAAAXzj2+Kgso6KB2g7aDEdlSpNEqmeU38TvOFAwKf8Qk4cI0RqLHX
 10UWSeyEoLhAq1P020FRE/N93g==
X-Google-Smtp-Source: APXvYqyF38CXjmJlFWQvmC/4HOPRMLGbV8IW7oGgE73werPfKioCG3d1XJdAyRcyyO0juNIRqqCB+Q==
X-Received: by 2002:adf:9267:: with SMTP id 94mr22877356wrj.338.1560171233499; 
 Mon, 10 Jun 2019 05:53:53 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id 135sm11871603wmb.28.2019.06.10.05.53.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 05:53:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Mon, 10 Jun 2019 14:53:44 +0200
Message-Id: <20190610125344.18221-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH] ASoC: meson: axg-card: fix null pointer
	dereference in clean up
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When using modern dai_link style, we must first make sure the
struct snd_soc_dai_link_component exists before accessing its members.

In case of early probe deferral, some of the '.cpus' or '.codecs' may not
have been allocated yet. Check this before calling of_node_put() on the
structure member.

Fixes: c84836d7f650 ("ASoC: meson: axg-card: use modern dai_link style")
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index fb03258d00ae..70bb0cbad233 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -115,9 +115,11 @@ static void axg_card_clean_references(struct axg_card *priv)
 
 	if (card->dai_link) {
 		for_each_card_prelinks(card, i, link) {
-			of_node_put(link->cpus->of_node);
+			if (link->cpus)
+				of_node_put(link->cpus->of_node);
 			for_each_link_codecs(link, j, codec)
-				of_node_put(codec->of_node);
+				if (codec)
+					of_node_put(codec->of_node);
 		}
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
