Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD1C336B9A
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:26:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 408091710;
	Thu, 11 Mar 2021 06:25:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 408091710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440380;
	bh=m6bMN4ZF9dEvQvHJEteuHdraSc1UcerUQnAeIL3TIUk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BQS+u0l9bI+Mzmp+1M5wGadi+EhS8PsPhaU2pah+0h6iv2/GINFHeN2ehJrUvXxRq
	 pppGAdF45/I7HZCdI6iW2Glm2QrXnka+UF/ZQtBZoHK+Qo6C46MXM/Se8rjJ+52iy1
	 948Gxt6wTVyelkfJi6H3WEmnjDKyKcd76Xzbwxj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16734F804E4;
	Thu, 11 Mar 2021 06:22:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9000CF804BD; Thu, 11 Mar 2021 06:22:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0A13F80276
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:22:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0A13F80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="LLSdw3fX"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="v2DGwT+z"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2EF1E2F9D;
 Thu, 11 Mar 2021 00:22:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:22:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=8rhr5NULyixo+
 V2FgNFc4IgfMbSwV22Q1he19+J0e8g=; b=LLSdw3fXekYg6XGSG6iI/X4vSt5Yb
 8ldTFjLBGd4mhoNDLN8l4yl9q8SfFHrL+LJ/fNYE8zjOii5b8TFEUINVdWsrQHnD
 A/INAyBn7Y3UusWLiEyfTXaEuwA7d+79QyB71mJnAIWhPD1PmbGPOfghNpIFsR1d
 U71oKUVRfz6fieNrm4Yken3pdfNlwhHWLafBlsAoB2slCQWdQPu1M4RiK2K3+D7C
 0LWrEelgK8Pk4MRQQlhpfEy2znoY2H0M6zFa3rNZbrUBIKHzmbgHc5UiP0TixZxC
 9P0buqmI9IM6sx2gKIw6FCTWGqPtypEre87JSWsms/RdpVOE6AGtj9HYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=8rhr5NULyixo+V2FgNFc4IgfMbSwV22Q1he19+J0e8g=; b=v2DGwT+z
 EedaF3mUCpN/o/IfOWZEjn6vQc41gP5S4+7TsBXngb8J+p1c4GND6EhY0RglvBo2
 jfJiZEg6fk64+L0Kbvt7/Em1fXhETcETuCNNxB9mkbbmtTQj36TnuGEEizbOOnVn
 CGeGweE2nnGVB781NAs7IGsurNbNENk4gdPvxgaZcyk0iotiU/RTck+v8EMmP159
 yhBbOZ+D7EnZtkvS6VvbmFH1VuKFv2JSCJy2R+4+E3aN6kEQQLn+yiAZm2h61PtI
 UYy2MvwdiPNk3ZGAfS6/3nabwplKfSSqowuLanI32OklTJyRw7FKD0MJNJ5HzEMn
 Vj+DtVZ04NM3kQ==
X-ME-Sender: <xms:-KhJYB3v8qXp3aKXZF_smMJbU1C_Yr7zjO1RmZyHURK_JhmvyHZaUw>
 <xme:-KhJYIH59cfAOgqPr4_ulWQCESUwhdASSoM_xLyCgY0z7Jefvo3ClOSJ30FDG3Nly
 HJtXpr2_hNPVal-AZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:-KhJYB56Mfq6zhHK6iO4bvtSnKT1peFEFtwpvPEizsOZbOGhkyg28Q>
 <xmx:-KhJYO1eU9ewUgVUbXPMwNde9hNkgxXXGot4z9mvYxhUznIuf98jFw>
 <xmx:-KhJYEEdiNqwdGZV0LEPlIWUEsTxu2Kp36V2grMb5NPRxZb6QYRBbg>
 <xmx:-KhJYPN83GvMXRq1gIZ400YHqu_nrHr52fvbXU2dm8tNY5x519AWQg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id B734C240057;
 Thu, 11 Mar 2021 00:21:59 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-utils][PATCH 07/14] autotools: preparation to use
 memfd_create(2)
Date: Thu, 11 Mar 2021 14:21:38 +0900
Message-Id: <20210311052146.404003-8-o-takashi@sakamocchi.jp>
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

This is a preparation to use memfd_create(2) system call for test programs
of axfer. The system call was introduced at Linux kernel v3.17 and
relatively new.

For safe, this commit adds detection of memfd_create() in autotools side
so that application can handle the case not to detect.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 configure.ac | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/configure.ac b/configure.ac
index 7005ccc..ff3e1f6 100644
--- a/configure.ac
+++ b/configure.ac
@@ -62,6 +62,11 @@ AC_CHECK_LIB([ffado], [ffado_streaming_init], [have_ffado="yes"], [have_ffado="n
 AS_IF([test x"$have_ffado" = xyes],
       [AC_DEFINE([WITH_FFADO], [1], [Define if FFADO library is available])])
 
+# Test programs for axfer use shm by memfd_create(2). If not supported, open(2) is used alternatively.
+AC_CHECK_FUNC([memfd_create], [have_memfd_create="yes"], [have_memfd_create="no"])
+AS_IF([test x$have_memfd_create = xyes],
+      [AC_DEFINE([HAVE_MEMFD_CREATE], [1], [Define if Linux kernel supports memfd_create system call])])
+
 AM_CONDITIONAL(HAVE_PCM, test "$have_pcm" = "yes")
 AM_CONDITIONAL(HAVE_MIXER, test "$have_mixer" = "yes")
 AM_CONDITIONAL(HAVE_RAWMIDI, test "$have_rawmidi" = "yes")
-- 
2.27.0

