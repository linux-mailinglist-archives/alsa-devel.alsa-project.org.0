Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9305977E3B
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:11:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53781E9F;
	Fri, 13 Sep 2024 13:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53781E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726225915;
	bh=n/pIzbx0MgOH7Vt1ursNZ7uh5AqRZVYjSubczslHHrQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P/WHa9q1PoAvvnWRdfUMbDpLunhwd9qrwShFbluRi8tlKVMyWQsSFHnzW4U071gAl
	 TEzYdzWrLVBsjyatKJLpl/ssL4jyXqyq87vJy7/gtKjsxBMJpY5l1oNao8Y1rAsQ4C
	 7LjepQBiZsYd3oFGRlXGJlyYrnzDMVzGAwmNIr1o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 223EDF805E9; Fri, 13 Sep 2024 13:11:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86DA0F805F5;
	Fri, 13 Sep 2024 13:11:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9656AF801F5; Mon,  9 Sep 2024 10:36:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FFB0F80107
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 10:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FFB0F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=Ks93PaYj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725870971; x=1757406971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n/pIzbx0MgOH7Vt1ursNZ7uh5AqRZVYjSubczslHHrQ=;
  b=Ks93PaYjAtPiJ+/DUqulDnst0bqG7UqqwIt2vpk4ARjfD2xIfHxvSjjd
   EopbmWLGozwZC8WtqlzL4FJTk+5UvbtyUSqnOMa4b0WUrVJKWLYr3GGcz
   MQAHp0jm2pX7imX9uBgSJyxa+jKNAN+hwgUURa7l3bb4z9k5icoy5y8Qa
   1zhX3WJVI4CfVBSHnA0lCxOFN9Y0+61VbDHDHx6x9UZSpgafujaZbVD6e
   hIbrF++WT59p87YK42tN4wFf449lGVybJZmHLOU18yLYqdlYJwU02WzYy
   AmOA7+lCz9uU/WXQ8qZqvF2IhJGuBI03s5jw2Qctk3Bpus9K6xB4lnoht
   w==;
X-CSE-ConnectionGUID: 3+qBZ8ypT7qJuXQunlVkIA==
X-CSE-MsgGUID: q5fUTtzfSs+p1sYbOgJ7MQ==
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600";
   d="scan'208";a="198940348"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Sep 2024 01:36:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 9 Sep 2024 01:35:45 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 9 Sep 2024 01:35:41 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH 1/2] ASoC: atmel: mchp-i2s-mcc: Remove interface name from
 stream_name
Date: Mon, 9 Sep 2024 11:35:29 +0300
Message-ID: <20240909083530.14695-2-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909083530.14695-1-andrei.simion@microchip.com>
References: <20240909083530.14695-1-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=97557f232=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VD6J4FPKULHM64KCW4XIHTSCX344T2QV
X-Message-ID-Hash: VD6J4FPKULHM64KCW4XIHTSCX344T2QV
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:11:04 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VD6J4FPKULHM64KCW4XIHTSCX344T2QV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Remove the interface name from the stream_name. The interface name (and the
index of the interface) can be set in DT using the sound-name-prefix string
property.

[andrei.simion@microchip: Adjust the commit title]

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 35a56b266b8d..f40508668ac5 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -936,14 +936,14 @@ static const struct snd_soc_dai_ops mchp_i2s_mcc_dai_ops = {
 
 static struct snd_soc_dai_driver mchp_i2s_mcc_dai = {
 	.playback = {
-		.stream_name = "I2SMCC-Playback",
+		.stream_name = "Playback",
 		.channels_min = 1,
 		.channels_max = 8,
 		.rates = MCHP_I2SMCC_RATES,
 		.formats = MCHP_I2SMCC_FORMATS,
 	},
 	.capture = {
-		.stream_name = "I2SMCC-Capture",
+		.stream_name = "Capture",
 		.channels_min = 1,
 		.channels_max = 8,
 		.rates = MCHP_I2SMCC_RATES,
-- 
2.34.1

