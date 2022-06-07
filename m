Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 505545407A1
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 19:52:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F97F1A28;
	Tue,  7 Jun 2022 19:51:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F97F1A28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654624342;
	bh=mSmapjDN1hLuiRaMFbGcdot/5OABdk/qIsbPhTmZHB0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KMx2ep5rxnvn0I+l5BHYfdJEYy6Uma3M/YyTgwdDbp6gpR3Gm5XKXwKD+pF4QiEV1
	 GdHaFiwMEAiYWUd2xDgNOOJBqM96GWjK3c4fHQ8/ypsEV71eIBRu+a8GTGvTL58hyY
	 UNlGWc6JLDV7olvaSkTGQaeTZvDn/fIQKZLHV10A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A176F80527;
	Tue,  7 Jun 2022 19:51:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6F45F80302; Tue,  7 Jun 2022 19:51:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 828F5F800ED
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 19:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 828F5F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zzs+efBh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B3A26159C;
 Tue,  7 Jun 2022 17:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671A4C34115;
 Tue,  7 Jun 2022 17:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654624266;
 bh=mSmapjDN1hLuiRaMFbGcdot/5OABdk/qIsbPhTmZHB0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zzs+efBhEZHp9l98Ftgfnv3JHjFzpD/hMfKf6M26Xjvhl34PCD2+rdhABGqpa/7Ak
 kP204X3Fcb342LXdLAkI6fM6aNogl385ofgePy1b9CFEp8w5tfP2pOOL0q4xE+wLl9
 uqrbqX6aTJ05EnnQcWsoV4H0ooxjshyBXVsTvHY+MwbuqvsuCI2NiGwY+sDvbhDR4K
 Zxuvm//eY5c7JxlZDbK0U/2k1Pd72lVT2fU+MyClfGgYPrR9SG7jw+F7cReeoDveLc
 J6m2N47H9PRjZE/UI64WuW/De62718jwR2tdf7MbVz/e8z4NQhC4OURPNl5eLQGfwv
 1hCHJAs/6xqgQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 37/68] ASoC: SOF: amd: Fixed Build error
Date: Tue,  7 Jun 2022 13:48:03 -0400
Message-Id: <20220607174846.477972-37-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607174846.477972-1-sashal@kernel.org>
References: <20220607174846.477972-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Syed Saba kareem <ssabakar@amd.com>, AjitKumar.Pandey@amd.com, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 kernel test robot <lkp@intel.com>
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

From: Syed Saba kareem <ssabakar@amd.com>

[ Upstream commit 803a1f7272797faa15a7879cdc70f9adaf3fdcba ]

Add linux/module.h in acp-pci.c to solve the below dependency

All error/warnings (new ones prefixed by >>):

>> sound/soc/amd/acp/acp-pci.c:148:1: warning: data definition has no type or storage class
148 | MODULE_DEVICE_TABLE(pci, acp_pci_ids);
| ^~~~~~~~~~~~~~~~~~~
>> sound/soc/amd/acp/acp-pci.c:148:1: error: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE' [-Werror=implicit-int]
...

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Syed Saba Kareem<ssabakar@amd.com>
Link: https://lore.kernel.org/r/20220523112956.3087604-1-ssabakar@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/acp/acp-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 340e39d7f420..c893963ee2d0 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -16,6 +16,7 @@
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/module.h>
 
 #include "amd.h"
 #include "../mach-config.h"
-- 
2.35.1

