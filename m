Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E0E336BA3
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:29:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7E331745;
	Thu, 11 Mar 2021 06:28:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7E331745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440564;
	bh=4gGhQEflyU+oi6w1WzQ9TAOysKzm/K4E0EaBNTugjB4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QCzs51nH6ouoComXUYlxXwr/F2MMoJ4uqxF+92efJKDS0aBS62623149N1bW9WChG
	 t0KlC0vMZxcVppDz0E/FEnwUiCmdeo4PUOZr8PiR6ZBSTfwv/m58kWMI1kqoCL2b4H
	 HpthogBZwwRlRM6nK4BsAnyx+YLL0BI+H6SHsieQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B038AF80524;
	Thu, 11 Mar 2021 06:23:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67FCFF804ED; Thu, 11 Mar 2021 06:22:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76C87F8019B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:22:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76C87F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="udS8/Wfb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="nGeEUDSp"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C71F12FB1;
 Thu, 11 Mar 2021 00:22:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:22:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=VFcSEjkdAFaQv
 Dbt65kFzXcJZaVcyUHzaDAHX7DHzJ8=; b=udS8/WfbH0qGRJrf6z66osxi5WQ54
 9lOmmgy24xwjwCPdpUQzm2tXrDQRt5rvmmbw9hPFROFGIclgtzO/4fNCsyH0SbRV
 kNFfwwYEjUqmYaWBRrBcbXqTJf0F3MNcprWtyXK4hOybveQKDCS88E8LTr6XPrX8
 kAaRxs2DjttnEgezCEb4ZysK9Ie0Du9GIT+z+25y1T1OksjeFH9E4HDqqLo2xiDI
 e3AOaur85RYe5vs8TzCGbVuwTCCi0JUqrRNtspTIcuSAF49L0JQvVX6Y1WW5m4cf
 rkwdKJw6+KejSeO/YwggqithWyvTIzWF0OURi5QjBKO9s4vCsQOo61L5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=VFcSEjkdAFaQvDbt65kFzXcJZaVcyUHzaDAHX7DHzJ8=; b=nGeEUDSp
 rO3ry/dyqUHT8hNAl/Ei4cbLUPstR05oLjQNRCeQV14PuikbtYUN1DwZxYTA4Smi
 2FDupI9shOtt6lWQoMyo5T7IYifBOpuA7eqYKuH0hNh4Px11egnKnKcGpiXKDn9K
 WnlnbtsNjti4U4yVCkP/gkEpiNw47Mi59vFsAggkoKPSpyG59qdCAErJ2xgVxZuc
 IrqCt++C52aZEMFaq7NlJzvdZ3i5qYtE7DYaVxTQg3ctIACR6Lk/GLDgPNEqNSZW
 Yu5fqDL9TXDWaYwtTHz0Ldvp/XcT7fYGXQ9O86IhL1R7V0pgrahNtHwOaf/gdXgL
 Etdk7YytZrNZlA==
X-ME-Sender: <xms:AalJYIM4CRiRgXZpbzRYFDWtlKZ1ABx6-BVVxfrZV6KMSGYjQTzXFw>
 <xme:AalJYO_dbH_350KZrb-RtlTgReJ2I4pKZL-hSk87xNZ_Uq55jXFJCixMo_M-BgCIL
 zxML5Wc_JL9hKyq7M4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:AalJYPSQc-I7v7S04lO7Gh1Cd6ED6XqLugR4IF_9vKEpFxaMJbi_1A>
 <xmx:AalJYAtcQ73QqGaoIhc8j8cjmtXWUE2YY-FbN2R5ZvI8gPvaGcFYTQ>
 <xmx:AalJYAfXx7rlX1Fu2GLz7k-kvyfkmw2x_LsBMULyLG_mnIArzNGoZw>
 <xmx:AalJYIlYfp8l-FkOhDNdn4xWOlQnmNnHpsVqdbwHLPVHqhqjr1a1IA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6653E240054;
 Thu, 11 Mar 2021 00:22:08 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-utils][PATCH 13/13] Revert "axfer: test - add
 run-test-in-tmpdir.sh script"
Date: Thu, 11 Mar 2021 14:21:44 +0900
Message-Id: <20210311052146.404003-14-o-takashi@sakamocchi.jp>
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

