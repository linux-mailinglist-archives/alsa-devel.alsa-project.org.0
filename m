Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D62B0595EA
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 10:19:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51DD31657;
	Fri, 28 Jun 2019 10:18:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51DD31657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561709943;
	bh=6MdkDNPc8HV+hP8/No3hEK/YKa3KBHulDKm3fbLwao0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ODlJ+WlJVW2fsJ1xyWLweMk8r38eCnXwOzMPnEV87I57EbF0tPQOO1vkHerFnF/1L
	 gbmYng9A+56a5AV6LKuhc/S5ETyL4sHARj+jJtIROREp27kbEwvh6jKwx7/LfS3lid
	 Jhd8/0aJOu+gkwDhKu/aK55eacgBV/HZdpB0XXqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA17FF896CB;
	Fri, 28 Jun 2019 10:17:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C564F896B9; Fri, 28 Jun 2019 10:17:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9ADF1F80C0B
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 10:17:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ADF1F80C0B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="pqUrZZrH"
Received: by mail-wr1-x442.google.com with SMTP id v14so5294242wrr.4
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 01:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0iX4GoXUMjYo0yWAqnak7nWNu9SahWjJ+qIlyX2DjnA=;
 b=pqUrZZrHnpMwYQiyu/1jCW1Vn1dbIBUApoVZMhyhBwvnhvhfumKMpGn/HD06hkyLKV
 mAr70tgH1UWNF40M5i4Iu7TZyBCOF9E4DVrgXNhfgFoe68UERxt7W4BtnpD/aXQbHgrr
 KSKRFDsze0oQlGIrrEesEJEXxvjGoX7ByoMNidbjknRj4Bylt+bqRjjgIIVO6eX4pKnN
 1AmfDbD/NeC/4Z9WHyrLlNhDEE1EW62NsHUnaW1L+cOpLHwoL1tVmmD214BJEgmzEGJp
 UBCPbzQkK8BSlSG9gz7fGNCBlajjvLjh/2C21gkCh6AjXCuIST7i+hrq6mn684QyGZ60
 KhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0iX4GoXUMjYo0yWAqnak7nWNu9SahWjJ+qIlyX2DjnA=;
 b=Kt/BblyFTlyFgavyM01ayMi0F/+353oZ6r5Vcl1YwyP+mNR9f5XlXPz9c4w7dWCV6L
 jY8KHrwq5jC1x9htBQEu5cF4w4ykiifca6zaJeYBkAGbQFKwsFdKIIEA8lvp/EioMCnM
 1A4dGLWaNYDpKqrYAyh0+pY+rubPlhkT+t6K5m3DE2hvGHakZ442edFbVcYxzHUMxojN
 1Lr5cZ+MNRwabYWoyAwVQ/Ocno4EDWEqVwr6V9MCjJHzcJTrjyHybuQ3bzDtJVGvqx3J
 Tm54SrWm58BbokevNJQ0tVexD8IJL8WGUSEeXGRcgOD+fCCckgGpyKUQKRXyaLjWKnYH
 Crlg==
X-Gm-Message-State: APjAAAV7o2Bcam9EaOafSwLntlHCNMd+C1WDRqn0CfbOSrN/kQ0zsgDh
 NoIh0YyR3XHyYWNo31DU5otfsw==
X-Google-Smtp-Source: APXvYqw+rkcyh3PTU9URJjuIKiu4kZ97NgtKOX3PAukWMiU12hf7kxkJIrnT5wyWxV6LyDzzRWcw8A==
X-Received: by 2002:a05:6000:124a:: with SMTP id
 j10mr6749454wrx.191.1561709832291; 
 Fri, 28 Jun 2019 01:17:12 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id r5sm2819216wrg.10.2019.06.28.01.17.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 01:17:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Fri, 28 Jun 2019 10:17:08 +0200
Message-Id: <20190628081708.22039-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH] ASoC: meson: axg-card: remove useless check on
	codec
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

While checking cpus before dereferencing the pointer is required, it is
not necessary for codecs. 'codec' can't possibly be NULL in the loop

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 70bb0cbad233..14a8321744da 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -118,8 +118,7 @@ static void axg_card_clean_references(struct axg_card *priv)
 			if (link->cpus)
 				of_node_put(link->cpus->of_node);
 			for_each_link_codecs(link, j, codec)
-				if (codec)
-					of_node_put(codec->of_node);
+				of_node_put(codec->of_node);
 		}
 	}
 
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
