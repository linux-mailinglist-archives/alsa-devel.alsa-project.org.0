Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF2399136
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 19:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFC681713;
	Wed,  2 Jun 2021 19:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFC681713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622654055;
	bh=I+iQpNLdGhKxIYjBqyqZliyreSZM076DE+DuYFbiQGA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U0Vj7J/dPqQynsCxrF5ijmjj1zOY2+RGCrXz3OyAUxHU98JBi9p8vtTEzBtDIE0F6
	 0F980fAu+Z7soiZEZGBrOLXKPcorsrVFGXvEezW+bn82B+u2KyFc2p26qzZ5Kv0xBy
	 SzgiqrAm8ykC6DrGatHb/gg5CFNN3feVeaUHsgcg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61C6BF80424;
	Wed,  2 Jun 2021 19:13:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDC1AF80431; Wed,  2 Jun 2021 19:13:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8646AF80141
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 19:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8646AF80141
Received: from [100.112.6.161] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-c.us-east-1.aws.symcld.net id 61/18-39641-12CB7B06;
 Wed, 02 Jun 2021 17:13:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmleJIrShJLcpLzFFi42LJePGQV1dxz/Y
 Eg+WLOSyuXDzEZDH14RM2i29XOpgsOnf1s1p8On+BzWLD97WMFotuMzuwe2z43MTmsXPWXXaP
 Tas62Tz2vV3G5rF+y1WWANYo1sy8pPyKBNaMfXdPsxXc4al4+P0oSwPjJa4uRi4OIYH/jBJP1
 y9jh3AeM0osvNfB1MXIycEmoC2xZcsvti5GDg4RARmJD2s9QWqYBbYxSvz7+Y4VpEZYIETi35
 mXbCA2i4CKxP+OT2A2r4CVxOGO94wgtoSAvMTpE9fAbE4BVYkzXY9ZQGwhoPr7D5ZA1QtKnJz
 5BCzODFTfvHU2M4QtIXHwxQtmiDkKEg/37GeHsBMkev49YpvAKDALSfssJO2zkLQvYGRexWiW
 VJSZnlGSm5iZo2toYKBraGika6JraGqsl1ilm6xXWqybmlhcomuol1herFdcmZuck6KXl1qyi
 REYHykFLDN3MLa9+aB3iFGSg0lJlLdw0/YEIb6k/JTKjMTijPii0pzU4kOMMhwcShK893YB5Q
 SLUtNTK9Iyc4CxCpOW4OBREuFdtg0ozVtckJhbnJkOkTrFqMux8+i8RcxCLHn5ealS4ry5u4G
 KBECKMkrz4EbA0sYlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8oSBTeDLzSuA2vQI6ggno
 CAGvbSBHlCQipKQamFLbSy00DYN0Vs0TSfr3N48p240h1s2mRvRTvs+bs50SHw/ynjDPfqDIO
 vfpvcOmW6wDfrp1nfqxq+uA/C8rT2OlOex3JlY6Hzxyd/PHR+9N1hVa86109OnWO/HIvlav8J
 zKpNwrNlmFEZqnwpWqIy/M0rnw+KheoO0vpsOnuN/Onx7gf+LVq2e1yz/quSaF3TTf7W25s+H
 8YimNX/mtKq066YmmVf8O5Jzw3v89cX5cQd7t1IuN7i/XcTyrKb21TK7JfZJu29aH55NcpygY
 5si7WTz80c/FH6hz6a5S0Gb5lhXny4PlNm1Off/9qaxgUOqbXQm8od6rfVfqyeXe/vD3sUj4f
 /Uj5/fXRrzhUWIpzkg01GIuKk4EAEQoj0+WAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-15.tower-416.messagelabs.com!1622653984!17391!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1568 invoked from network); 2 Jun 2021 17:13:05 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
 by server-15.tower-416.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Jun 2021 17:13:05 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id E85DF25673F8CBD28EA1;
 Wed,  2 Jun 2021 13:13:04 -0400 (EDT)
Received: from fedora.lenovo.com (10.85.16.201) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Wed, 2 Jun 2021
 13:13:02 -0400
From: Mark Pearson <markpearson@lenovo.com>
To: <markpearson@lenovo.com>
Subject: [PATCH] ASoC: AMD Renoir: Remove fix for DMI entry on Lenovo 2020
 platforms
Date: Wed, 2 Jun 2021 13:12:51 -0400
Message-ID: <20210602171251.3243-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.85.16.201]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Cc: Gabriel Craciunescu <unix.or.die@gmail.com>, alsa-devel@alsa-project.org,
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

Unfortunately the previous patch to fix issues using the AMD ACP bridge
has the side effect of breaking the dmic in other cases and needs to be
reverted.

Removing the changes while we revisit the fix and find something better.
Apologies for the churn.

Suggested-by: Gabriel Craciunescu <unix.or.die@gmail.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 35 -----------------------------
 1 file changed, 35 deletions(-)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index c9fb1c8fbf8c..19438da5dfa5 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -199,41 +199,6 @@ static const struct dmi_system_id rn_acp_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "20NLCTO1WW"),
 		}
 	},
-	{
-		/* Lenovo ThinkPad P14s Gen 1 (20Y1) */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_BOARD_NAME, "20Y1"),
-		}
-	},
-	{
-		/* Lenovo ThinkPad T14s Gen1 */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_BOARD_NAME, "20UH"),
-		}
-	},
-	{
-		/* Lenovo ThinkPad T14s Gen1 Campus */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_BOARD_NAME, "20UJ"),
-		}
-	},
-	{
-		/* Lenovo ThinkPad T14 Gen 1*/
-		.matches = {
-			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_BOARD_NAME, "20UD"),
-		}
-	},
-	{
-		/* Lenovo ThinkPad X13 Gen 1*/
-		.matches = {
-			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_BOARD_NAME, "20UF"),
-		}
-	},
 	{}
 };
 
-- 
2.31.1

