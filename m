Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9777BC496
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Oct 2023 06:06:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A508E1F7;
	Sat,  7 Oct 2023 06:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A508E1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696651568;
	bh=na8ySLqEKzc9oa7oPW2GxxrO96pn/l00Ee9tK6OWbyI=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TtbK0PjMflJ9QpuuM3WjNbe/k+zYCKnP9P8o/3o6HLuz/O8Qi9iy19JHkbPf5nQD1
	 iPLUkxYjWBhT7J7pgeV7S9q5leEkC+/rbriOm2cJxMlX8Z7rrgr8oFuYlPMOs7SAkn
	 JV+MzMCnQfSjwYn8c7aUc7F/o9ceZP5XfelP/Wj0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3AD0F80130; Sat,  7 Oct 2023 06:05:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BBE3F80310;
	Sat,  7 Oct 2023 06:05:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DFFAF8047D; Sat,  7 Oct 2023 06:03:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E68C9F800C1
	for <alsa-devel@alsa-project.org>; Sat,  7 Oct 2023 06:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E68C9F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=ex5t5QSg
Received: from hwang4-ThinkPad-T14s-Gen-2a.conference (1.general.hwang4.uk.vpn
 [10.172.195.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 6BAF63F6BD;
	Sat,  7 Oct 2023 04:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1696651375;
	bh=k4dsUA/Dhp76Qf8xTwmzgDUgQX3GyTjRoiBnCS5z5xs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=ex5t5QSgXSDkFr4pokoFM0Pchj8yG8IUlJd59KWGUKJKdo4MXG1hVv13FZyoglaUY
	 kHG1PlzBAdF0xv/ez9RrHypS7nStId6VvIamuWGH2h8TvvVogbqcBizHZxH8H1Lx1o
	 glRq6o2sP2WzsmdDgTGGiv/xUt82oslW5v/VfWOlhBDBiMOYRtzeX86a3WgqQL55su
	 xrm0CtgBsAbtpg0kQ9ZWMU6ynRR/CRqlCsXtPlVlsU460q8PORmFJ/x0TcNR9Hlg2J
	 dATMjUE21IPsqS97lQAZJ4bM95naxJ419kbJ/+Gi0b5ZfJOIW5rQopMoiNWaD21rlr
	 F7fr2mIN1WbYg==
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: fsl-asoc-card: Add comment for mclk in the codec_priv
Date: Sat,  7 Oct 2023 12:01:17 +0800
Message-Id: <20231007040117.22446-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AZHUISVMZ7LY4CMFQPK5E2SIFIVJG2QR
X-Message-ID-Hash: AZHUISVMZ7LY4CMFQPK5E2SIFIVJG2QR
X-MailFrom: hui.wang@canonical.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AZHUISVMZ7LY4CMFQPK5E2SIFIVJG2QR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Otherwise a warning will be detected as below:
warning: Function parameter or member 'mclk' not described in
'codec_priv'

Fixes: 1075df4bdeb3 ("ASoC: fsl-asoc-card: add nau8822 support")
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 0957ff7c55c2..7518ab9d768e 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -41,6 +41,7 @@
 
 /**
  * struct codec_priv - CODEC private data
+ * @mclk: Main clock of the CODEC
  * @mclk_freq: Clock rate of MCLK
  * @free_freq: Clock rate of MCLK for hw_free()
  * @mclk_id: MCLK (or main clock) id for set_sysclk()
-- 
2.34.1

