Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7515B336BA2
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:29:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 077C9823;
	Thu, 11 Mar 2021 06:28:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 077C9823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440543;
	bh=4gGhQEflyU+oi6w1WzQ9TAOysKzm/K4E0EaBNTugjB4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HY6BQBUrVjIIMUH0GNJp/bTsgm+yy8ySJHwBEcaQm+w862VPVCapf6Y1eOooBiy9W
	 HKEz2WTyHaxl+Dp/ISvKlh/vyqB8jePtdzqyUwCzTZStvLEN0qMrKpS3e01V0wWUdg
	 YkOrV8c0mXpIMG1p8Iemb6k1pP4ZIoPlk5zQmolY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBF64F80519;
	Thu, 11 Mar 2021 06:23:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54EBFF804EB; Thu, 11 Mar 2021 06:22:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2503EF80431
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:22:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2503EF80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="WL75j8EL"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="pss/YvT0"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7F3A82FCB;
 Thu, 11 Mar 2021 00:22:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=VFcSEjkdAFaQv
 Dbt65kFzXcJZaVcyUHzaDAHX7DHzJ8=; b=WL75j8ELdFczgNGzAGm3+5cDodl01
 ju0RbacdjroHTKNQzy0uEQLtKqDq+YlsUSLnWaFZ5Hoy7T+Qbw/JmnBbwOSGt2yZ
 ne6/W7MvaoNSW6cphDdBFOgI1VrkueKySltNySs4l9xr9OY621SKWENW0NqJOnKH
 9UjOv5BMbDZlrLmeHX9UybBd+wOhM/3HDM3Z9qw7pSmXPxyIOQbFcRazSygQUArg
 UGYQ2oezTONNSMXY1sJMWht1QEBlXdjTvZVcj9Hui2xtdUerjp4iSSOlXVHHkACP
 dNyJbM0nYKNr6d14slAqUBecCqFIEX5YRRIzJ4WXHBovbUNiw1RHKn8Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=VFcSEjkdAFaQvDbt65kFzXcJZaVcyUHzaDAHX7DHzJ8=; b=pss/YvT0
 gdyjsRoSzN+qFeVoZJ+Lni4eNhjlsXcl3f471M8xkQ5qmdxS+dB16OLy6pUVBftI
 bOp7vxCKBTvr4srTVv3rgueXYtVqhVN6QBqpW3xZoLFor1IRGubz904khLawVvsb
 EkBajDxl6f0EPSpEpJ8RbWC9fU6D96L1JAFN0+rAbuqJYLjc1oNGAfSH3GDf0O89
 nqQCw1Zqdu4NB9EJtVeN94OfewHcq2XY7wxZFDWuSRY5dxQotY+ZXBmdJ6kmmEnS
 d7piqgB+Men2AsLT+OWnrIvwGfmiri4ln6+E/iyJMWlBwwLAGHj3jPDgnCYoL/87
 olcJocT/rAZd1A==
X-ME-Sender: <xms:BKlJYGhZcCHePVng51B5N8VMmzmJ60GKEbroK1faoKmNh9Jv5Vh1RQ>
 <xme:BKlJYHCd_xDaotUQn8rcNhB9I_C0XZ2zuZqyouyPVSAdA9_QT79LNiu7e8SB6Nr14
 XNgn-BLfBQN8BZwvf8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:BKlJYOEA6R6ALI4wl8xyRMBsF6ApBr0sY142mskWJ2u1G3Z6mDdtQA>
 <xmx:BKlJYPTxTrKLWFHdWmeQ9eGR9-SQuQwtTZTbkKH_VjFh-lT9CYu_Dg>
 <xmx:BKlJYDwBMrpi1FBk8JXFOESLsPuAZEFMVm0RYsMqeqtPqllZE6klcQ>
 <xmx:BKlJYBb5ZrsJxrLXnwq2kTJ5ewFS-pSnac2wbD0wi8c2efv-G_rgdg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 13AA7240054;
 Thu, 11 Mar 2021 00:22:10 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-utils][PATCH 14/14] Revert "axfer: test - add
 run-test-in-tmpdir.sh script"
Date: Thu, 11 Mar 2021 14:21:46 +0900
Message-Id: <20210311052146.404003-16-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311052146.404003-1-o-takashi@sakamocchi.jp>
References: <20210311052146.404003-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

This reverts commit e1551de8dd28c3a63f8d7c146952a8d2649ac9de since tests
run for in-memory files now.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 axfer/test/run-test-in-tmpdir.sh | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100755 axfer/test/run-test-in-tmpdir.sh

diff --git a/axfer/test/run-test-in-tmpdir.sh b/axfer/test/run-test-in-tmpdir.sh
deleted file mode 100755
index e66fa73..0000000
--- a/axfer/test/run-test-in-tmpdir.sh
+++ /dev/null
@@ -1,19 +0,0 @@
-#!/bin/sh
-
-bin="$1"
-
-test -z ${bin} && exit 90
-test ! -x ${bin} && exit 91
-test -z ${TMPDIR} && exit 92
-test ! -d ${TMPDIR} && exit 93
-
-tmp_dir=$(mktemp -d ${TMPDIR}/container-test.XXXXX)
-cur_dir=$(pwd)
-
-echo ${tmp_dir}
-cd ${tmp_dir}
-${cur_dir}/${bin}
-retval=$?
-cd ${cur_dir}
-rm -rf ${tmp_dir}
-exit $retval
-- 
2.27.0

