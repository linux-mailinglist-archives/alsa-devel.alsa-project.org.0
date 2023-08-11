Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA79677BB96
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 16:28:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69F7082C;
	Mon, 14 Aug 2023 16:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69F7082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692023298;
	bh=YucTHaRO62UNTFM7XNqmAkggchhCoPtLmxFTe/PjprM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Id1/WbQSgAINqr2ukC61+wvKZw7hcg4ni0JcBm0NEei2Xt7SkUc2x7tX09VXku2WH
	 4w6pGJpBNE6xMGk8QLum06JBdTzVcBvK+vpNp7Kup+q3FwcSnV3fAMOI9V4+484Lw+
	 o2oz4BIoaR1kwy7EmhRr8h3+7dy9Wql+3IIrCD5o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9940F8055C; Mon, 14 Aug 2023 16:26:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9348F80254;
	Mon, 14 Aug 2023 16:26:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4D91F80166; Fri, 11 Aug 2023 17:12:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_BL,
	RCVD_IN_MSPIKE_L3,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m126.mail.126.com (m126.mail.126.com [220.181.12.28])
	by alsa1.perex.cz (Postfix) with ESMTP id C15CBF800EE
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 17:12:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C15CBF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256
 header.s=s110527 header.b=FazuV9zS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=e88MQ
	slzeFNOhwbP09T0gkCxyvgGfzBt1X6iwwM3Rs8=; b=FazuV9zSijbunPZ2m72FX
	rMpPb+g2VnYeP7I7s1S9tkM0bCPIH25hX81JRoMy8TkEq3l6NtjlPFZ/WdPu5FFG
	ZvZpEyjcpzLNd4zH7GeAo0bg7CtMR2J96mymfRalXuoszSA0IHxkeCK92T5KIzRq
	6IWVwJcbrHrAGZ0vK01oLs=
Received: from localhost.localdomain (unknown [219.145.36.159])
	by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id
 _____wAHDw_HRNZkb3OEBw--.12956S2;
	Fri, 11 Aug 2023 22:25:13 +0800 (CST)
From: mnlife <mnlife@126.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org
Cc: mnlife@126.com
Subject: [PATCH] ASoC: soc-jack: calling snd_soc_jack_report causes a null
 pointer access
Date: Fri, 11 Aug 2023 22:25:11 +0800
Message-Id: <20230811142511.6570-1-mnlife@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAHDw_HRNZkb3OEBw--.12956S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1xCw4UXFyxuF18JFWrKrg_yoWxCFc_Ja
	1rWw4rWrWDGr42yryruFZ5Ar4UWan29rWfGFZ0qFy7GFW8JrWfG3Z8tr1xWFy5Ww4xWa43
	Wa1UKr18XrW7KjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKKZXDUUUUU==
X-Originating-IP: [219.145.36.159]
X-CM-SenderInfo: ppqoxwbh6rjloofrz/1tbiJgrI9lpD9U1xOQAAs7
X-MailFrom: mnlife@126.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HJOK4XMZHJZIKDAQTG3GJL4IMHTNXYEB
X-Message-ID-Hash: HJOK4XMZHJZIKDAQTG3GJL4IMHTNXYEB
X-Mailman-Approved-At: Mon, 14 Aug 2023 14:26:35 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJOK4XMZHJZIKDAQTG3GJL4IMHTNXYEB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When snd_soc_card_jack_new is not called or the call fails,
calling this function causes a null pointer access

Signed-off-by: mnlife <mnlife@126.com>
---
 sound/soc/soc-jack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-jack.c b/sound/soc/soc-jack.c
index f951acb2ce362..b2cc13b9c77b7 100644
--- a/sound/soc/soc-jack.c
+++ b/sound/soc/soc-jack.c
@@ -37,7 +37,7 @@ void snd_soc_jack_report(struct snd_soc_jack *jack, int status, int mask)
 	struct snd_soc_jack_pin *pin;
 	unsigned int sync = 0;
 
-	if (!jack)
+	if (!jack || !jack->jack)
 		return;
 	trace_snd_soc_jack_report(jack, mask, status);
 
-- 
2.25.1

