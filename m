Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD094EE37D
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 23:54:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A4CB18B1;
	Thu, 31 Mar 2022 23:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A4CB18B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648763665;
	bh=yaWOGGxVwULFbOTEnedG4LrTQUX9qJLLkh6ctiOAYRE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m6JS7St96bwRfeRwoigxZCk5uQiNVDxMp+cwtLz8Lw73pSH3eSFs+JWVXnF7Lllip
	 xj8qBSzg0OujA1nfUPHXxtdrnv5y+++mV2QV50V+lp8WGPdG6A2q4aqQkTogQDQ6Gl
	 dK3WRdWTDcEzpXHBsmqGekx5GbKaxllbPygVPCow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE306F802D2;
	Thu, 31 Mar 2022 23:53:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 946C7F8025A; Thu, 31 Mar 2022 23:53:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7456F80100
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 23:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7456F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JtxdpIwi"
Received: by mail-ej1-x633.google.com with SMTP id i16so1971001ejk.12
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 14:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0sd4Dv+ZWOb6q2yQLaNmeg8xynhdTU6RpDxBF/RZvfQ=;
 b=JtxdpIwivwnUVSniHaAcy7hQSSplDsADhwqzWl1+x8iL63xUZDqKO2N52/nhmLa0ie
 FlDJm2eXWgm+PoK9FatL2QWsapCHPQ2qOgB/6Uzg7ySRdIm7lPNprYIH1G7QpOZnBBe9
 VJ3Cljp9Jn3RvFR6HWI/1Im0+8dLznGp41+gucIagQlIl6FGpRpGiPuzzBjRz9FiSohO
 nqe6A2Bh5o0TKxn2l/AUFkIIAouvA+HmrcVypLIzYJT5hYaOdlM93EOpBLL0j9O1s+wO
 GdA4uf+9U7exz1UmK+1zNG3y/yuF9DKJWgrzefFzfJJDKxcxGu9rUXaRccLHPbO29rYd
 wWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0sd4Dv+ZWOb6q2yQLaNmeg8xynhdTU6RpDxBF/RZvfQ=;
 b=zutu4x0yihzfLK0NCm25uWXOEVac2SaAaZKORF2jRnX0/Zkq5CZ0zCaJzThC8Mg9FR
 5sckUH7wOVCiBNZSkm8qE7EZW6qz57jSlXftoC8vJsA0EEpRem4lRuOGWxZP5tVMVDy0
 PKfC2G76Aude6GwhaUGDr0DgeGQerfNTFfrGAMMo1qYNlOqSlgcE1rzqD/Z7kI1De+Qk
 JleL//owOMtA3BkxcfiJXgos0LFFkLMcy+Tg8nE0mDxH3IMLn4BQhEypeVonJughueJg
 dixIVmPf9mEa5iiQaeflZ3IT12IyKPENR2dWRDrIq7yidm4giVJwHUCC6WyOdD8+UBZa
 dbfA==
X-Gm-Message-State: AOAM5326RCZ5QyFMpXN9DXUxQTypEqqmzs6EOjTXZNAtuxN/185GdJI9
 jFY6abyexaMP2zTOr88v2wg=
X-Google-Smtp-Source: ABdhPJwz4mdkoYMH3cHppROvh1hEcYupPDv5nUTRyVfJOCK+JnHGSyDSxVNZ5NpoYM4hYMsdq+4Nkg==
X-Received: by 2002:a17:907:7284:b0:6df:9120:d935 with SMTP id
 dt4-20020a170907728400b006df9120d935mr6837306ejc.276.1648763576045; 
 Thu, 31 Mar 2022 14:52:56 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 g20-20020aa7c594000000b004194b07bbfasm299980edq.10.2022.03.31.14.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 14:52:55 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH 2/3] ASoC: sprd: remove check of list iterator against head
 past the loop body
Date: Thu, 31 Mar 2022 23:50:02 +0200
Message-Id: <20220331215003.882143-2-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331215003.882143-1-jakobkoschel@gmail.com>
References: <20220331215003.882143-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Bos,
 H.J." <h.j.bos@vu.nl>, Yang Yingliang <yangyingliang@huawei.com>,
 Orson Zhai <orsonzhai@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jakob Koschel <jakobkoschel@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Baolin Wang <baolin.wang7@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Mike Rapoport <rppt@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When list_for_each_entry() completes the iteration over the whole list
without breaking the loop, the iterator value will be a bogus pointer
computed based on the head element.

While it is safe to use the pointer to determine if it was computed
based on the head element, either with list_entry_is_head() or
&pos->member == head, using the iterator variable after the loop should
be avoided.

In preparation to limiting the scope of a list iterator to the list
traversal loop, use a dedicated pointer to point to the found element [1].

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 sound/soc/sprd/sprd-mcdt.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sprd/sprd-mcdt.c b/sound/soc/sprd/sprd-mcdt.c
index f6a55fa60c1b..6e27789a0df5 100644
--- a/sound/soc/sprd/sprd-mcdt.c
+++ b/sound/soc/sprd/sprd-mcdt.c
@@ -866,20 +866,19 @@ EXPORT_SYMBOL_GPL(sprd_mcdt_chan_dma_disable);
 struct sprd_mcdt_chan *sprd_mcdt_request_chan(u8 channel,
 					      enum sprd_mcdt_channel_type type)
 {
-	struct sprd_mcdt_chan *temp;
+	struct sprd_mcdt_chan *temp = NULL;
+	struct sprd_mcdt_chan *iter;
 
 	mutex_lock(&sprd_mcdt_list_mutex);
 
-	list_for_each_entry(temp, &sprd_mcdt_chan_list, list) {
-		if (temp->type == type && temp->id == channel) {
-			list_del_init(&temp->list);
+	list_for_each_entry(iter, &sprd_mcdt_chan_list, list) {
+		if (iter->type == type && iter->id == channel) {
+			list_del_init(&iter->list);
+			temp = iter;
 			break;
 		}
 	}
 
-	if (list_entry_is_head(temp, &sprd_mcdt_chan_list, list))
-		temp = NULL;
-
 	mutex_unlock(&sprd_mcdt_list_mutex);
 
 	return temp;
-- 
2.25.1

