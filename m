Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D1A6F3650
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 20:53:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E5A9186B;
	Mon,  1 May 2023 20:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E5A9186B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682967185;
	bh=X0Ak+rqhBBA7z/q8sWObCHUD88+HEdPKPnLe1vWnRU0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XN1eZ0AaGrzEk7fdAokH5wbymBEdJ29cszBiGwjbA945UFTp5u4KnOcxUEk44fRjb
	 oe7TbPhoeGO6YV2Gv+BPXlNp3Ll2Vfm3bcXKqP4qYJ5y7LF8yOiZIqX5FdI6AlZjtR
	 yAvCvsRHW+MiK6axo2Do7Jf0Hx0twI59T6vrENys=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A8A7F8032B;
	Mon,  1 May 2023 20:51:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13E62F8049E; Mon,  1 May 2023 20:51:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from durkon.wrar.name (wrar.name [116.203.248.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CC55F80137
	for <alsa-devel@alsa-project.org>; Mon,  1 May 2023 20:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CC55F80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=wrar.name header.i=@wrar.name header.a=rsa-sha256
 header.s=20160710 header.b=qJpGyV3I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wrar.name;
	s=20160710; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Content-Disposition:In-Reply-To:References;
	bh=DDk0mv84ix/RSWWUpia4gKlf8DL3/XKnr62jxyEC3kU=; b=qJpGyV3Ijr69nex0WVGhRgMt3r
	+s/WYms0ojxGVsyZDanilWBvcTQH1rREbd1uAZfL4kRKuUEnOAGMP/E9v9DFaoBG0qxuzsngpMJqZ
	QF2iZuOC5MyhKKQ1DBRtJbGGQMNVh5Nw2vHgnku7S0tAQU4b3dLoN1aB0WJmkqKr4ouQ=;
Received: from [212.58.102.86] (helo=malack.wrar.name)
	by durkon.wrar.name with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <wrar@wrar.name>)
	id 1ptYcZ-00Ag1q-2J;
	Mon, 01 May 2023 20:51:35 +0200
Received: (nullmailer pid 34603 invoked by uid 1000);
	Mon, 01 May 2023 18:51:34 -0000
From: Andrey Rakhmatullin <wrar@wrar.name>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ASoC: amd: yc: Add Asus VivoBook Pro 14 OLED M6400RC to the
 quirks list for acp6x
Date: Mon,  1 May 2023 22:51:34 +0400
Message-Id: <20230501185134.34591-1-wrar@wrar.name>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4WCBP6ZZDQYMDVWGVZBGXGNTTR7LM5LH
X-Message-ID-Hash: 4WCBP6ZZDQYMDVWGVZBGXGNTTR7LM5LH
X-MailFrom: wrar@wrar.name
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4WCBP6ZZDQYMDVWGVZBGXGNTTR7LM5LH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is needed (and enough) to get the internal mic visible and working.

Signed-off-by: Andrey Rakhmatullin <wrar@wrar.name>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index b9958e555367..0208cb0ae978 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -227,6 +227,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "M5402RA"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "M6400RC"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.39.2

