Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8444E78AEF6
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 13:36:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FCB5AEA;
	Mon, 28 Aug 2023 13:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FCB5AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693222604;
	bh=Lm3R2ZuI8tRyjtfY19WXDdftcp2118e6V7CIDKli7z8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dmxvaI5K+AHzeA5jKPjA+37gDeKp7EftU2SsId3pdpEtOxSAhX2NuF/egaeY7X/9o
	 z7MTrSnPvsmpyR5NCJ8XgHBshbL9OlRewAX3g6C2YY+CQe3jny0Ru15sPxTt6Y7f7A
	 C3FFKh8ZPwaJwYdd8LnyJcCe6IkjnzeG6Qw9QS8w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89184F804DA; Mon, 28 Aug 2023 13:35:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B7B6F80155;
	Mon, 28 Aug 2023 13:35:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96252F80158; Mon, 28 Aug 2023 13:35:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EBEAF80074
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 13:35:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EBEAF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=p8EwcmH5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=BwTXFQBQ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AC694219A5;
	Mon, 28 Aug 2023 11:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693222543;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=DW5B4ee3btXQsZsWdthYMgeEVhbpCV9HbWks6sCFjAs=;
	b=p8EwcmH5KSfFLK0qO3/Iju2lGaUdpMKwaOzV8GNPP3pveqAX/pctro707w3BuThpa1+VX7
	9Ac2UW+SAlTsazBfTGvWB0wi72xIGNIoptY9uFZVIp1yYho12zRvPh0B/ajvFhzIY5ycuy
	Br9GaW/Ac/17s+stIMkz0KXfUWCwXzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693222543;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=DW5B4ee3btXQsZsWdthYMgeEVhbpCV9HbWks6sCFjAs=;
	b=BwTXFQBQb5q2PE25B3ozi+AKGD1lp2qpcWIG7wkjd5/Ay8c8hXVRnRyPG0RVHNc8zEdq7J
	dQ8YPA2ETwZhtQCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D09F139CC;
	Mon, 28 Aug 2023 11:35:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 1VB+IY+G7GRVeQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 28 Aug 2023 11:35:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: dwc: i2s: Fix unused functions
Date: Mon, 28 Aug 2023 13:35:37 +0200
Message-Id: <20230828113537.27600-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4J4552AJSGOL3HVHZQKTCASJ3PHL7XBY
X-Message-ID-Hash: 4J4552AJSGOL3HVHZQKTCASJ3PHL7XBY
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4J4552AJSGOL3HVHZQKTCASJ3PHL7XBY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A few newly added functions aren't built unless CONFIG_OF is set,
which result in the build failure due to defined-but-not-used errors.

Put "#ifdef CONFIG_OF" around those functions to suppress the build
error.

Fixes: 52ea7c0543f8 ("ASoC: dwc: i2s: Add StarFive JH7110 SoC support")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/dwc/dwc-i2s.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 5ab1b3eb2d28..22c004179214 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -729,6 +729,7 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 
 }
 
+#ifdef CONFIG_OF
 /* clocks initialization with master mode on JH7110 SoC */
 static int jh7110_i2s_crg_master_init(struct dw_i2s_dev *dev)
 {
@@ -912,6 +913,7 @@ static int jh7110_i2stx0_clk_cfg(struct i2s_clk_config_data *config)
 
 	return clk_set_rate(dev->clk, bclk_rate);
 }
+#endif /* CONFIG_OF */
 
 static int dw_i2s_probe(struct platform_device *pdev)
 {
-- 
2.35.3

