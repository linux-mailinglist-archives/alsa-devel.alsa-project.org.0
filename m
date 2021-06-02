Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 002A9399135
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 19:14:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76A07170A;
	Wed,  2 Jun 2021 19:13:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76A07170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622654041;
	bh=GQcSv2yBJYd3VboFD+KFC7hkoMseN0+nyrwqucpMdL8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GD+0stPgL8ZkgbTf4KyogzmdZbhtYvzs6tLy6/WbcaN898mePGVkshUpikk+LxQA9
	 luL66gy5tpOEkiddh6djWJPq2ltXzOg/JWIw5mlifbIzVcjFA9UH6xSH6aU9WxB5mJ
	 ebABdp1FbUEJWQlWS5DwZdkNuZtGrDD5c3cYO8C8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E697F80425;
	Wed,  2 Jun 2021 19:12:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F2D9F80103; Wed,  2 Jun 2021 19:12:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0359F80141
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 19:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0359F80141
Received: from [100.112.135.81] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-b.us-west-2.aws.symcld.net id 24/CE-38455-CEBB7B06;
 Wed, 02 Jun 2021 17:12:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOIsWRWlGSWpSXmKPExsWS8eIhr+6b3ds
 TDPb0yFlcuXiIyWLqwydsFt+udDBZfOv5xG7Ruauf1eLT+QtsFhu+r2V0YPfY8LmJzWPnrLvs
 HptWdbJ57Hu7jM1j/ZarLAGsUayZeUn5FQmsGeufL2cpmMtTcXbGVPYGxnlcXYxcHEIC/xklz
 ryfwQLhPGaU2L7jPmMXIycHm4C2xJYtv9i6GDk4RARkJD6s9QSpYRbYyihxYEMTG0iNsIC/xL
 MjO5hAbBYBFYlPs98yg9TzClhJPH8VDBKWEJCXOH3iGthITgFViTNdj1lAbCGg8vsPloCN4RU
 QlDg58wlYnBmovnnrbGYIW0Li4IsXzBBzFCQe7tnPDmEnSPT8e8Q2gVFgFpL2WUjaZyFpX8DI
 vIrRLKkoMz2jJDcxM0fX0MBA19DQSNfQ2EjXQi+xSjdJr7RYtzy1uETXSC+xvFivuDI3OSdFL
 y+1ZBMjMD5SClo4djAefv1B7xCjJAeTkihv4abtCUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeO
 /tAsoJFqWmp1akZeYAYxUmLcHBoyTCu2wbUJq3uCAxtzgzHSJ1ilFRSpw3FxjhQgIgiYzSPLg
 2WHq4xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYNxRkCk9mXgnc9FdAi5mAFgt4bQNZXJKI
 kJJqYJrKwZV+mGOp1/n6xKJWT64FDFXhov0tdVue3LVM2mUU0XvuXYnrKZ+IHXzZ3Y8j9l/Kq
 o1Ou2bz9Yra36dnpEyOcnl/kbwltNJzStFshzm759zd6Tbf+tLPaT3BRk9mT7owyUO/nu2SDc
 N0Jr7OzCyWTW/qgs5WevTFuP/elOS8V9GnIL/oenFBbvYlnd52yTcPmYLmTor88M1ts4Rz4rU
 WzT1zdsj7/FwwWdGPke9Tv2SYpvHlvoOJE03Z9p0QuR9Qc7THXYp7SZ/knd6Tu0/EygR/XqPi
 4T5FXmNWiszBFI1rc+J9jsb9EYhJjb96eEWGe3NFOPtLHuOb6yaVcDEuSE3w17z0YPWV43LpS
 izFGYmGWsxFxYkA6wFlYIoDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-10.tower-346.messagelabs.com!1622653931!3270!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22093 invoked from network); 2 Jun 2021 17:12:12 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
 by server-10.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Jun 2021 17:12:12 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 420C12099065F1035C74;
 Wed,  2 Jun 2021 13:12:11 -0400 (EDT)
Received: from fedora.lenovo.com (10.85.16.201) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Wed, 2 Jun 2021
 13:12:08 -0400
From: Mark Pearson <markpearson@lenovo.com>
To: <markpearson@lenovo.com>
Subject: [PATCH] ASoC: AMD Renoir - add DMI entry for Lenovo 2020 AMD platforms
Date: Wed, 2 Jun 2021 13:11:48 -0400
Message-ID: <20210602171148.3179-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.85.16.201]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Cc: alsa-devel@alsa-project.org, Gabriel Craciunescu <nix.or.die@gmail.com>,
 lgirdwood@gmail.com, tiwai@suse.com, broonie@kernel.org, stable@kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

More laptops identified where the AMD ACP bridge needs to be blocked
or the microphone will not work when connected to HDMI.

Use DMI to block the microphone PCM device for these platforms.

Suggested-by: Gabriel Craciunescu <nix.or.die@gmail.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 19438da5dfa5..c9fb1c8fbf8c 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -199,6 +199,41 @@ static const struct dmi_system_id rn_acp_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "20NLCTO1WW"),
 		}
 	},
+	{
+		/* Lenovo ThinkPad P14s Gen 1 (20Y1) */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "20Y1"),
+		}
+	},
+	{
+		/* Lenovo ThinkPad T14s Gen1 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "20UH"),
+		}
+	},
+	{
+		/* Lenovo ThinkPad T14s Gen1 Campus */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "20UJ"),
+		}
+	},
+	{
+		/* Lenovo ThinkPad T14 Gen 1*/
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "20UD"),
+		}
+	},
+	{
+		/* Lenovo ThinkPad X13 Gen 1*/
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "20UF"),
+		}
+	},
 	{}
 };
 
-- 
2.31.1

