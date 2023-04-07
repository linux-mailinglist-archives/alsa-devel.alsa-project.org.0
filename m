Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6201C6DABA1
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Apr 2023 12:50:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA6BEEBE;
	Fri,  7 Apr 2023 12:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA6BEEBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680864606;
	bh=Y0vX2vlOrPzxSNdCvvzTqPrzMxREQV6LswkplgbNyuQ=;
	h=Subject:From:To:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CE1qHlI3Zen2da24nYngsAJPezSa1oCQhANDEvsu5weOATMr9ycWzhTN1VpS6KBPw
	 vMCyKc+o2GJ03+3QVJhjs+d9YPC1M+qf7VnQlnX61H7JfVxeWiLlcWwbbSI9jBHMmV
	 B2fZVA1r/sF2Rov2Ldu2vMq8VNgD2lPZyXIraVnA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CA43F80249;
	Fri,  7 Apr 2023 12:49:16 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id A68D5F800E5
	for <alsa-devel@alsa-project.org>; Fri,  7 Apr 2023 12:49:10 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [PATCH] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP into DMI table
From: "Baishan Jiang" <bjiang400@outlook.com>
To: alsa-devel@alsa-project.org
Date: Fri, 07 Apr 2023 10:49:10 -0000
Message-ID: 
 <168086455067.21.10066265691382154300@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: NVNACAEKPIZ4M7Y2CDIXTA43DW7DVA2G
X-Message-ID-Hash: NVNACAEKPIZ4M7Y2CDIXTA43DW7DVA2G
X-MailFrom: bjiang400@outlook.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C464B5OATI7KHX4N6KRP2EXBH3AOVGWO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ThinkBook 14 G5+ ARP uses Ryzen 7735H processor, and has the same 
microphone problem as ThinkBook 14 G4+ ARA.


Adding 21HY to quirks table solves this microphone problem for 
ThinkBook 14 G5+ ARP.


Signed-off-by: Baishan Jiang bjiang400@outlook.com
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)


diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 4a69ce702360..c0eea3dbd339 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -178,6 +178,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21EN"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21HY"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
