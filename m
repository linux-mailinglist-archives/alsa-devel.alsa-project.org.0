Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD9B90223C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2024 15:00:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54A9185D;
	Mon, 10 Jun 2024 15:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54A9185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718024432;
	bh=hs5yvBjMe5zbyXlRtFi3yH+jXaDN2jYG6b3IpAmMi7o=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RThUMNs8Ch6SoHeeu9DqyI9VlJAI9ZI0ZA1tKdtL1pXEv8K+KayiM8bCelJi0yjdT
	 UCf2gx6YSXLS1z4u3zb2wLdwmt64MF+WK88/JigdXt9ihuooQeuapxVzukxI4c3XPr
	 lML0owTTWzRXjd1frhRS8aqaWaHSj0r5dPm6DClQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AAE8F805B3; Mon, 10 Jun 2024 14:59:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBBD2F80588;
	Mon, 10 Jun 2024 14:59:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA26DF8057A; Mon, 10 Jun 2024 14:58:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AECCBF800D0
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 14:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AECCBF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=norik.com header.i=@norik.com header.a=rsa-sha256
 header.s=default header.b=azl33DBy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lqCp3QFYEQgLNcRwyp3g/NgBK3T6HGS8y29EGKEsL5Y=; b=azl33DByNfd1A9DZ9NIx0IA3mN
	WURR8bsMqFqZhOEttXkXv+u5vLA6Fg3S6pZ963/hjZUjqHjyuMPqxwrub0keq1vxGqUxkMt1Bw1Ln
	/ctOmoK0k9zn5no43SUCp7aEY5JpGlF1ECcvD0ZrkTZVAL21aZi71XowGd6Ufa5uFl1rM7HtLF0fa
	f0CdCsTkg5VkSfrgF4STHqT0TUjb+fRR0dXVftvT+GBIWkGhVZDmulU4p97GqRBUNgL7yDxoA/JGi
	j+gRdMqJipRG1iMgvCWY+fQejRbeoMwkZcLWr4t3aiPnNk4eDgzNiQ6cliuexnMv8MJs67ukdkUv9
	+NaI2vnQ==;
Received: from [89.212.21.243] (port=36862 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1sGebo-00CJLR-0O;
	Mon, 10 Jun 2024 14:58:48 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: upstream@lists.phytec.de
Subject: [PATCH v2] ASoC: ti: omap-hdmi: Fix too long driver name
Date: Mon, 10 Jun 2024 14:58:47 +0200
Message-Id: <20240610125847.773394-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id:
 primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Message-ID-Hash: E3I3LCMWG3ODXFUEMA4CZOONQYOPMKJ4
X-Message-ID-Hash: E3I3LCMWG3ODXFUEMA4CZOONQYOPMKJ4
X-MailFrom: primoz.fiser@norik.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3I3LCMWG3ODXFUEMA4CZOONQYOPMKJ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Set driver name to "HDMI". This simplifies the code and gets rid of
the following error messages:

  ASoC: driver name too long 'HDMI 58040000.encoder' -> 'HDMI_58040000_e'

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- use "HDMI" instead of DRV_NAME (requested)

 sound/soc/ti/omap-hdmi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 639bc83f4263..cf43ac19c4a6 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -354,11 +354,7 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	if (!card)
 		return -ENOMEM;
 
-	card->name = devm_kasprintf(dev, GFP_KERNEL,
-				    "HDMI %s", dev_name(ad->dssdev));
-	if (!card->name)
-		return -ENOMEM;
-
+	card->name = "HDMI";
 	card->owner = THIS_MODULE;
 	card->dai_link =
 		devm_kzalloc(dev, sizeof(*(card->dai_link)), GFP_KERNEL);
-- 
2.25.1

