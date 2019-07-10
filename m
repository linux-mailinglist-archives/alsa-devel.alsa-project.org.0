Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 681206405D
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 07:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBDA51665;
	Wed, 10 Jul 2019 07:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBDA51665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562735234;
	bh=DGKDRDgKqAbTgmC+iA/BbpEa4vB88L+5WHTAbGvguyQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ktU+rx6Jxn6qqu3+/iJrmj4P7d+5HHp2B32jwkMjQpouw0WSWXjCoMk1/S09SfUQe
	 DhYxoJLOlzsIn5BLNqkUdLxEqfJuLtrcgyYY1NrwVJNK+1O/SdE+JttP6BZH4/UvF+
	 ONYosdpHGVuYSKrBMB3QKwG9E3wEVMgz3RTc5H0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90FA1F802E0;
	Wed, 10 Jul 2019 07:05:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1D5CF802BE; Wed, 10 Jul 2019 07:05:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0161.hostedemail.com
 [216.40.44.161])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B30FF800DE
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 07:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B30FF800DE
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id C1E6E180A68D1;
 Wed, 10 Jul 2019 05:04:58 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: pain10_e348f2364e1f
X-Filterd-Recvd-Size: 1743
Received: from joe-laptop.perches.com (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Wed, 10 Jul 2019 05:04:57 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Date: Tue,  9 Jul 2019 22:04:25 -0700
Message-Id: <92e31a9f321fe731d428ec3ec9d4654ea8a16d1b.1562734889.git.joe@perches.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1562734889.git.joe@perches.com>
References: <cover.1562734889.git.joe@perches.com>
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 12/12] ASoC: wcd9335: Fix misuse of GENMASK
	macro
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Arguments are supposed to be ordered high then low.

Signed-off-by: Joe Perches <joe@perches.com>
---
 sound/soc/codecs/wcd-clsh-v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd-clsh-v2.c b/sound/soc/codecs/wcd-clsh-v2.c
index c397d713f01a..cc5a9c9b918b 100644
--- a/sound/soc/codecs/wcd-clsh-v2.c
+++ b/sound/soc/codecs/wcd-clsh-v2.c
@@ -65,7 +65,7 @@ struct wcd_clsh_ctrl {
 #define WCD9XXX_FLYBACK_EN_PWDN_WITH_DELAY			0
 #define WCD9XXX_RX_BIAS_FLYB_BUFF			WCD9335_REG(0x6, 0xC7)
 #define WCD9XXX_RX_BIAS_FLYB_VNEG_5_UA_MASK		GENMASK(7, 4)
-#define WCD9XXX_RX_BIAS_FLYB_VPOS_5_UA_MASK		GENMASK(0, 3)
+#define WCD9XXX_RX_BIAS_FLYB_VPOS_5_UA_MASK		GENMASK(3, 0)
 #define WCD9XXX_HPH_L_EN				WCD9335_REG(0x6, 0xD3)
 #define WCD9XXX_HPH_CONST_SEL_L_MASK			GENMASK(7, 3)
 #define WCD9XXX_HPH_CONST_SEL_BYPASS			0
-- 
2.15.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
