Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF42575144B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 01:15:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1F40203;
	Thu, 13 Jul 2023 01:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1F40203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689203715;
	bh=bzq3WHttJpF9JCkXSgypfA3QQJIpnk7D8kHSnBUJiTM=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vDCRRMWPg19JdfwVFZ5wgovbpWcCIcoZGC+9WXhe/3943rPr7WI3Vu1F5scIWthlX
	 ur1nH4CoW0sp4Xh08i9QTYkWNS0BwVHA3FPZeKanHlMHxRULu/hO2nnPxh0Be9a6gS
	 Yp7Ouxx3KaexbMyEO8mkdARL710tzltm1UnspFh8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63662F80290; Thu, 13 Jul 2023 01:14:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D946EF8047D;
	Thu, 13 Jul 2023 01:14:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF03CF80290; Thu, 13 Jul 2023 01:14:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B504F800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 01:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B504F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=us0TM9sB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9D5B6618B3;
	Wed, 12 Jul 2023 23:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2AFC433C7;
	Wed, 12 Jul 2023 23:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689203647;
	bh=bzq3WHttJpF9JCkXSgypfA3QQJIpnk7D8kHSnBUJiTM=;
	h=From:Subject:Date:To:Cc:From;
	b=us0TM9sBarySL3ac5QHBxWwqrTr/ngTa+CHitP6NTcP8KvreX2XhUASj3wi53DwnV
	 wl4uNhb61sZdAlYKGqrj/akCfiwTB3NsySLRZC6cUQJ8PIZi862gGfoVpyeRrUxgDW
	 a4rAxqW+fIsUeScbWXCZsYnnzpFMpnJnRHvQ7jh5h16fvjRJkY9tm9fRVIKqullrkW
	 apx3xg3+KBwlqmtQsg5KngrgksjCOMVuJPqqfibn+aTfRZ6CsYq0JH7haSiRdDm9QX
	 uzx+jyRsNI326XZhwSfhXLOLlUPo/SVPnAVeKzMCUNhKfG95LzPuGOJrBMjMsk4aw9
	 l7KFzDnKA0y7A==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/10] ASoC: ad: Update Analog Devices drivers to maple
 tree register cache
Date: Thu, 13 Jul 2023 00:13:49 +0100
Message-Id: <20230713-asoc-ad-maple-v1-0-7d2f35d42b5f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK0zr2QC/x3MQQqAIBBA0avIrBsYDbK6SrQQG2ugLBQikO6et
 HyL/wtkTsIZRlUg8S1ZzlihGwV+c3FllKUaDJmWLGl0+fToFjzctTNqS9T1PpBvB6jNlTjI8/+
 m+X0/6FRJcV8AAAA=
To: Liam Girdwood <lgirdwood@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1587; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bzq3WHttJpF9JCkXSgypfA3QQJIpnk7D8kHSnBUJiTM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrzOz2ybmvPRTa27hpNOrapDCRUNq9HtPI6Tna
 EXPoPkpJDqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK8zswAKCRAk1otyXVSH
 0DUNB/48ygscaJ3UWRpP4INkkCDV63FkejOEoIbWiWzyS7uQEul2Jjjj0MCvw/7kviyeoK3AOFc
 RamkNvYNAyJjdPHc31bbRJ+fso3tWsNTAZ0O3iosxNPrX+jBNWazo+7TJiD0eRdzdO9yo5ijV+o
 fzDbbiWJzNEwB2sOYz/NL81T1Wpv/KLrfK2LrtHTyRjaLIUDfKlpjPr0rX2F30h8gSEWSZug6ZF
 YbSIVYmKZp+D5fSM2ekssFs9hU9nNQSs4u1cMZScYRcns9caYh9zwkKSuaj22t6g2bHofDLv5lb
 NLqSDTUbmapavLUHU5ECvSGDRs+504ctZ/GX/EjvTXETZN95
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: JH2K4IIPGKUKDMQQDMRBJRGEBIJFHKLZ
X-Message-ID-Hash: JH2K4IIPGKUKDMQQDMRBJRGEBIJFHKLZ
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JH2K4IIPGKUKDMQQDMRBJRGEBIJFHKLZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The maple tree register cache has now got to feature parity with the
rbtree cache, there are some different tradeoffs made and it should be a
better choice for most modern systems.  Convert the Analog Devices
drivers to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (10):
      ASoC: ad1836: Update to use maple tree register cache
      ASoC: ad1980: Update to use maple tree register cache
      ASoC: adau1372: Update to use maple tree register cache
      ASoC: adau1373: Update to use maple tree register cache
      ASoC: adau1701: Update to use maple tree register cache
      ASoC: adau1761: Update to use maple tree register cache
      ASoC: adau1781: Update to use maple tree register cache
      ASoC: adau1977: Update to use maple tree register cache
      ASoC: adau7118: Update to use maple tree register cache
      ASoC: adav80x: Update to use maple tree register cache

 sound/soc/codecs/ad1836.c       | 2 +-
 sound/soc/codecs/ad1980.c       | 2 +-
 sound/soc/codecs/adau1372.c     | 2 +-
 sound/soc/codecs/adau1373.c     | 2 +-
 sound/soc/codecs/adau1701.c     | 2 +-
 sound/soc/codecs/adau1761.c     | 2 +-
 sound/soc/codecs/adau1781.c     | 2 +-
 sound/soc/codecs/adau1977.c     | 2 +-
 sound/soc/codecs/adau7118-i2c.c | 2 +-
 sound/soc/codecs/adav80x.c      | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230701-asoc-ad-maple-170068cf0c39

Best regards,
-- 
Mark Brown <broonie@kernel.org>

