Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A75B5787A0E
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 23:14:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D75F83B;
	Thu, 24 Aug 2023 23:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D75F83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692911688;
	bh=d4zubvJCvoX5O/QaOHaUQJ+vrBBsgC/+w6pj/RAtno4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h3ypPHa8XJa9veQoeHWr+cLZuy3G51A8CmWpvFmVF/ud4HjPNsCqgw83mzcfMGjgf
	 DPcqvQUHSoj7jujRUqbyICjwFY+AkCXeCgno/vETGsx7WGVMFecc/V9Ec7Il3u5zIx
	 vPjRd3VyIzPXC+SgiGSK+b4qhnzBRSRkge1s/5hk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 426F5F80579; Thu, 24 Aug 2023 23:13:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE59F80563;
	Thu, 24 Aug 2023 23:13:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCE8AF80158; Thu, 24 Aug 2023 23:12:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 319AAF800F5
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 23:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 319AAF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=E62eTY9Q
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 936386607287;
	Thu, 24 Aug 2023 22:12:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692911570;
	bh=d4zubvJCvoX5O/QaOHaUQJ+vrBBsgC/+w6pj/RAtno4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E62eTY9Qovw2dR/eYxINN9IWZpefYqNMtyqHE4yWoiEa2Y29560V/Wte9mfIEU9Sd
	 E90RMuj60OxFx0Ijail4qTM640oNzkfG46AGIdHGP1wNPD4PfC7hMsH8eYsncBgGrG
	 aWSrwABpgsq1kybqHpaM28SegUdPU5Jei7ncxMQKgcoj8/A/Fe7hNr8GskmUY3av3P
	 uZmAPCssv337+vhieeX0FpUX58mRHVmxzIWG2w85/A8UaDrOtPHg/teswuevC7v8tA
	 EuSbrm2O41XNo+JoiYIqVKNg3C0xMF6WJP8DtcCYswRnOjXXYKud6mtIzc04jJ2D33
	 2f29FLyuv7FJg==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 2/2] ASoC: core: Rename component_not_find label
Date: Fri, 25 Aug 2023 00:12:41 +0300
Message-ID: <20230824211241.388201-3-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824211241.388201-1-cristian.ciocaltea@collabora.com>
References: <20230824211241.388201-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CVBZG7HTPJW6QYZYDQ7M2SDB2FVQC4EW
X-Message-ID-Hash: CVBZG7HTPJW6QYZYDQ7M2SDB2FVQC4EW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CVBZG7HTPJW6QYZYDQ7M2SDB2FVQC4EW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the correct form of the verb in 'component_not_find' label, from
soc_dai_link_sanity_check() function.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/soc-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 75a9641349ee..cc442c52cdea 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -942,7 +942,7 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 		 * component list.
 		 */
 		if (!soc_find_component(dlc))
-			goto component_not_find;
+			goto component_not_found;
 	}
 
 	/* Platform check */
@@ -963,7 +963,7 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 		 * component list.
 		 */
 		if (!soc_find_component(dlc))
-			goto component_not_find;
+			goto component_not_found;
 	}
 
 	/* CPU check */
@@ -988,7 +988,7 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 			 * Defer card registration if Component is not added
 			 */
 			if (!soc_find_component(dlc))
-				goto component_not_find;
+				goto component_not_found;
 		}
 	}
 
@@ -1002,7 +1002,7 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 	dev_err(card->dev, "ASoC: Neither Component name/of_node are set for %s\n", link->name);
 	return -EINVAL;
 
-component_not_find:
+component_not_found:
 	dev_dbg(card->dev, "ASoC: Component %s not found for link %s\n", dlc->name, link->name);
 	return -EPROBE_DEFER;
 
-- 
2.41.0

