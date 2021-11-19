Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC29D457966
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Nov 2021 00:15:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A0191737;
	Sat, 20 Nov 2021 00:14:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A0191737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637363732;
	bh=xQ9GcuX4BjsrtskKzQhW8vM5VEFeURsi33iuVf8Zgdc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p1Ge3klggTOpT8IFQAxKIGpluIJS3Oz+n1qkbqsNoCMotiKPyMeLKqDcSSAkv1Wq5
	 zOuo2sD7GJRKJVQtH974hiMz1VGVLQgJesMYMFdis7whuTtPmzGbMHjpxAfp0InKf5
	 dnOSRsxzjNz1AiF2V2MJmZyhvewS7to/tbBIpXGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00C59F800FA;
	Sat, 20 Nov 2021 00:14:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11329F800FA; Sat, 20 Nov 2021 00:14:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17488F800FA
 for <alsa-devel@alsa-project.org>; Sat, 20 Nov 2021 00:14:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17488F800FA
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="297926209"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="297926209"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 15:14:00 -0800
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="508096251"
Received: from mredenti-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.30.252])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 15:14:00 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: sof-pci-dev: use community key on all Up boards
Date: Fri, 19 Nov 2021 17:13:27 -0600
Message-Id: <20211119231327.211946-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

There are already 3 versions of the Up boards with support for the SOF
community key (ApolloLake, WhiskyLake, TigerLake). Rather than
continue to add quirks for each version, let's add a wildcard.

For WHL and TGL, the authentication supports both the SOF community
key and the firmware signed with the Intel production key. Given two
choices, the community key is the preferred option to allow developers
to sign their own firmware. The firmware signed with production key
can still be selected if needed with a kernel module
option (snd-sof-pci.fw_path="intel/sof")

Tested-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-pci-dev.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index bc9e70765678..b4bc4f887b43 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -64,17 +64,9 @@ static const struct dmi_system_id sof_tplg_table[] = {
 
 static const struct dmi_system_id community_key_platforms[] = {
 	{
-		.ident = "Up Squared",
+		.ident = "Up boards",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "AAEON"),
-			DMI_MATCH(DMI_BOARD_NAME, "UP-APL01"),
-		}
-	},
-	{
-		.ident = "Up Extreme",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "AAEON"),
-			DMI_MATCH(DMI_BOARD_NAME, "UP-WHL01"),
 		}
 	},
 	{
-- 
2.25.1

