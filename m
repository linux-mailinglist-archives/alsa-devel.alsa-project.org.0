Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFA939629E
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 16:57:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19940850;
	Mon, 31 May 2021 16:56:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19940850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622473047;
	bh=GQcSv2yBJYd3VboFD+KFC7hkoMseN0+nyrwqucpMdL8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GuhzAaS+MZc8045pHDgsiKpDazrmsfPYT+yKmsQoLFAm3hrHLdsMOBS44eTjA9cqH
	 ou8o3rOJbzoQpEKHP/mW515PJzZmPR/rRIzlDfUYMdRa/HThjDbYMLY55OijBkxUa6
	 PzWxYesnly1Ev0ADcvysa2uWaAFmgklBMM3wsxzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B717F80424;
	Mon, 31 May 2021 16:55:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EABA7F802E2; Mon, 31 May 2021 16:55:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00548F80088
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 16:55:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00548F80088
Received: from [100.112.2.115] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-b.us-east-1.aws.symcld.net id 5E/BA-20778-2F8F4B06;
 Mon, 31 May 2021 14:55:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGIsWRWlGSWpSXmKPExsWSLveKTffjjy0
 JBvv6LSyuXDzEZDH14RM2i29XOpgsvvV8Yrfo3NXPavHp/AU2iw3f1zI6sHts+NzE5rFz1l12
 j02rOtk89r1dxuaxfstVlgDWKNbMvKT8igTWjPXPl7MUzOWpODtjKnsD4zyuLkZODiGB/4wSB
 y/XdzFyAdlPGCWaln9nBEmwCWhLbNnyi62LkYNDREBG4sNaT5AaZoGtjBIHNjSxgdQIC/hLPD
 uygwnEZhFQleg+cp0FxOYVsJK4dP4aWFxCQF7i9IlrYDM5gWrOdD1mgVisInH/wRI2iHpBiZM
 zn4DFmYHqm7fOZoawJSQOvnjBDDFHQeLzjiNQMxMkev49YpvAKDALSfssJO2zkLQvYGRexWia
 VJSZnlGSm5iZo2toYKBraGika6hrYamXWKWbpFdarJuaWFyia6iXWF6sV1yZm5yTopeXWrKJE
 RgdKQWMkTsY973+oHeIUZKDSUmUV1xxc4IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd7e71sShA
 SLUtNTK9Iyc4CRCpOW4OBREuE99xUozVtckJhbnJkOkTrFqCglztv7ASghAJLIKM2Da4Mlh0u
 MslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnXgGznycwrgZv+CmgxE9Diz6GbQBaXJCKkpBqY
 grTEtI2PXN+RqPb8ufjcINfE99/Xqr4zZzh9stV6xs1eq5MTpks9qTuufznSb4/m19pDZVuNd
 r+tL9T5bCyjJmMemcrP5j13ynlH1y1P1uWEftpv4CTuWbeE882txqPPTgd6zfS7ntk4xaYxq+
 W2rWqiWussox19qW81eadm3n5pXHRK5Mr2R5dmdZe3ceyY7/SL8Wb2TmZvibKEZZ7Wt5dp9zO
 ITLTr0Vxc9SNuebW57qoFSxUO3eJo5mJelhGzms22o5ux1thtQcTf1f0nmz1v7msUauzzvmCn
 fqHu9Q3xZpnr3Pfnz3zv2/P/zDd39WnHLGYXnFfWFg1fIPJu2SW57vyV67LtkuxkuuyVWIozE
 g21mIuKEwEbhzafiQMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-9.tower-386.messagelabs.com!1622472944!19953!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26965 invoked from network); 31 May 2021 14:55:45 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
 by server-9.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 31 May 2021 14:55:45 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 5655A1A08B41E1AB9CBE;
 Mon, 31 May 2021 22:55:42 +0800 (CST)
Received: from fedora.lenovo.com (10.85.31.217) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Mon, 31 May
 2021 10:55:36 -0400
From: Mark Pearson <markpearson@lenovo.com>
To: <markpearson@lenovo.com>
Subject: [PATCH] ASoC: AMD Renoir - add DMI entry for Lenovo 2020 AMD platforms
Date: Mon, 31 May 2021 10:55:02 -0400
Message-ID: <20210531145502.6079-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.85.31.217]
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

