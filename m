Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E28B69077B7
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:02:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E81B14E9;
	Thu, 13 Jun 2024 18:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E81B14E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294566;
	bh=KAepm0zVeydI0pRgzEaYJ31b2FrM4Y1N1Yazuuth9OU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AaWygV9R08uZrf6rZUG3c/5yqlJLoLRMhSC7jHh6szBdP7WVXTs8EhGJZx3ddEVO6
	 N+qGjFYG5w5Z6egDCJ+HtwW5vfBDN3/7E6LYWrcq0FkAGR5AE/phaXe8jN0uadCGJt
	 maYVGMNCuIfN2qgS4HSyGvVQ8jY5Ws/cqIK5/Ank=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBA77F806AB; Thu, 13 Jun 2024 18:00:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED1B2F806AB;
	Thu, 13 Jun 2024 18:00:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0640BF8025A; Sun,  2 Jun 2024 00:55:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4135F800FA
	for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2024 00:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4135F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256
 header.s=bytemarkmx header.b=o+OpDDa6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=zE9JgmmMZ6U8BhzqjST5MxZKepiOun6rHIaYJ4bIKGY=; b=o+OpDDa6V4qYLJVC
	e4Lj8RsB7K+/fkfUTYprd9loTt4SjWBLUsDYUDmo6FsQ6gLw95ulAvqdt0cLsIgF3NKmOWL0rkuAN
	WXfUiZw6sW25qXbXVR5UD58vHd/bguts0aG6IuAtvsCc+nokfv+rIck+raKbb1t8H6jCstYIl0yrC
	wv7Wv6OASYEGUjWwQLE+bLli2nU/wKp8G7LYT/Y9w3XIHzDZeP/jSIRa+PY4LBnxozheqGbWszdcJ
	4GkjU+Iwrcla+2fQSkgi8ADhRrrBQAkUNjIDLPGJSwfjTP99oLYdITn1pvt6fHfU4NADvQ+W+Pbcb
	WS+nnupcsERleIsM6g==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sDXcs-003lZO-2V;
	Sat, 01 Jun 2024 22:55:03 +0000
From: linux@treblig.org
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	srinivas.kandagatla@linaro.org
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/3] ASoC: codecs: wm0010: remove unused struct
 'wm0010_spi_msg'
Date: Sat,  1 Jun 2024 23:54:45 +0100
Message-ID: <20240601225446.183505-3-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240601225446.183505-1-linux@treblig.org>
References: <20240601225446.183505-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: linux@treblig.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: U55WIJ5ZQVALERJM6IEAELOSGYINYYEW
X-Message-ID-Hash: U55WIJ5ZQVALERJM6IEAELOSGYINYYEW
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:00:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U55WIJ5ZQVALERJM6IEAELOSGYINYYEW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'wm0010_spi_msg' has been unused since the original
commit e3523e01869d ("ASoC: wm0010: Add initial wm0010 DSP driver").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/soc/codecs/wm0010.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 8f862729a2ca..edd2cb185c42 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -115,14 +115,6 @@ struct wm0010_priv {
 	struct completion boot_completion;
 };
 
-struct wm0010_spi_msg {
-	struct spi_message m;
-	struct spi_transfer t;
-	u8 *tx_buf;
-	u8 *rx_buf;
-	size_t len;
-};
-
 static const struct snd_soc_dapm_widget wm0010_dapm_widgets[] = {
 SND_SOC_DAPM_SUPPLY("CLKIN",  SND_SOC_NOPM, 0, 0, NULL, 0),
 };
-- 
2.45.1

