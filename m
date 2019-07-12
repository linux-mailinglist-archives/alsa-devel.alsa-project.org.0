Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBF766979
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2019 10:58:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86262166A;
	Fri, 12 Jul 2019 10:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86262166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562921894;
	bh=7kIL6CTrMgWcIkXNeElKR3FXPvENk6OZiCCbgfdiyyY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RwR9oVvEA+pMK36EOrPxhHOt59Qm2Fosb9Wf3a/wbTor7m2tPtxCNFnoDk62/VwqN
	 6x0CbW29yhuAddfx5iVQg04JBYdPjUzuYyCGFkX4Tv4vWatqFcAoYXnLsXTJs0Sujl
	 Tf/fT2Hxr4BGM07qOBMAvPsWtPIQJ7fl/zdJ+DBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB3EBF80291;
	Fri, 12 Jul 2019 10:56:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E572F802A0; Fri, 12 Jul 2019 10:56:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4149F800DE
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 10:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4149F800DE
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MCsDe-1hd5uB1CKW-008uVX; Fri, 12 Jul 2019 10:56:07 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Date: Fri, 12 Jul 2019 10:55:53 +0200
Message-Id: <20190712085605.4062896-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Hsib/dpx4KDn7gfpU/f1Eq1bfZtFdE4qTB4i+zaN8zo+qEctdR3
 RKhbz0fWRM/pmG+ONdUgpTK6N83UxgmjuGxUxS7I+VEOkD9WOzCJOk4ZXdWmO7duzQNCSei
 A5NbDsnu3Sc6uMaOzDDc1fb0aJb5+RDDmrBVPEgI2QA6jlwg3/3937dYE5w8TcKd4KK1pOZ
 deGBhKhCt9y0/q8rpEaKQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H9OQC5DGb9s=:T6H67ZX8mqNhVjA447wWxh
 0xlDBQb6lbn9z8MwFJsVML6VitaX0n5WZCMegYpH2Jy0StVWv8lATqy/cHcn1tV+fKPAmiRhZ
 oHt/SGJfCX5s0+doh3Nf+k7pjQ9PH4qbuyia0jUmUCgqbQDSy9gl8EFegYzMvdeIffdUZlg+s
 6Sp7mKoJ1Ib3ka35DJzEpUrBWTPTN0n/SsrjYVsfHUXSeZSv7PF0hVM1/TH1bfXHA8xus7U2b
 isWiB7dFfUrW2bmfT/wRvgUKzPh/LkI/pcx00uSfTZc8yXEZbf6VY6fIz1xZ3Y7A5kSHvBBsi
 RuNMBXRhXQ1tf9uQUbTFGKJZmqXfCAkJzridws1PtHvOf8guQ0mhwkPADX/CjxraTT6Fx/cxk
 AswHICK7T/BCJii8NKWbmbGkUoiHDEYx3kTNC7Rb9+dD3jC2N82iRhxp2upDjBuBuf02MooPu
 QhIyEwkywdDOj6PxT7gTQxEO4MPvXcuw8yp45I8IiTtFFqt+SV5YNbn9Z3DTdS32BFr3T2UXC
 +1xGHKziI8ziqs+LGMsO/tozcLt2dza/qDnNx4j8MkzgxFB15O2oZA3IZWgZ+poZrEdmoYLY4
 sHvztlc6Q8LopIyPGAGE1X2vxh+wginAcrEuHK3wh+q7fsGJmPew8aodII75QTI6Rfp5o0FYW
 69ehGjuQkxZS5E1Ordsxhvy4mIfmW0dw6ebuxgojymabC/wA87Rc8aAPZiC8pccQuKHK35sx6
 DDbKua9LRG55+5mjhlfjSZ7drvWb4qT2eFa8tA==
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 alsa-devel@alsa-project.org, Wen Yang <wen.yang99@zte.com.cn>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: audio-graph-card: fix type mismatch
	warning
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The new temporary variable is lacks a 'const' annotation:

sound/soc/generic/audio-graph-card.c:87:7: error: assigning to 'u32 *' (aka 'unsigned int *') from 'const void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]

Fixes: c152f8491a8d ("ASoC: audio-graph-card: fix an use-after-free in graph_get_dai_id()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/generic/audio-graph-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index c8abb86afefa..288df245b2f0 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -63,7 +63,7 @@ static int graph_get_dai_id(struct device_node *ep)
 	struct device_node *endpoint;
 	struct of_endpoint info;
 	int i, id;
-	u32 *reg;
+	const u32 *reg;
 	int ret;
 
 	/* use driver specified DAI ID if exist */
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
