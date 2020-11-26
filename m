Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D19862C5D05
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Nov 2020 21:31:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61B9A1818;
	Thu, 26 Nov 2020 21:30:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61B9A1818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606422700;
	bh=FZDjzFlewa4Y22amdkR3/EA2GrbazqN5CQSYfokcpII=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WALg9E04ov1fkmDHC/fvXzxCs/l1gRmvOjW+NLkKuiBAQIl+I/r1IyYlig5jlT537
	 ObeqnDcaU7o9RXEt+G83cQx5dly7NpOe45HWB7NUAjNtMAKDd4TJs4fctHO/1gjRoM
	 IDYOQmsrHuYWToJyRMQfZ2im/JFuTTjRr6K4k8kA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D06B9F80164;
	Thu, 26 Nov 2020 21:30:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F687F80165; Thu, 26 Nov 2020 21:30:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by alsa1.perex.cz (Postfix) with ESMTP id 3B394F800EA
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 21:29:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B394F800EA
Received: from localhost (118.130.77.188.dynamic.jazztel.es [188.77.130.118])
 by iodev.co.uk (Postfix) with ESMTPSA id 330E6154FB;
 Thu, 26 Nov 2020 21:29:54 +0100 (CET)
From: Ismael Luceno <ismael@iodev.co.uk>
To: alsa-devel@alsa-project.org
Subject: [PATCH] configure: Improve failures due to missing pkg-config
Date: Thu, 26 Nov 2020 21:30:17 +0100
Message-Id: <20201126203017.11936-1-ismael@iodev.co.uk>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ismael Luceno <ismael@iodev.co.uk>
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

Output a warning at the beginning, and fill PKG_CONFIG with "false" so
that any auto-configuration attempts fail without bogus messages.

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 configure.ac | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure.ac b/configure.ac
index 1f119c5baeeb..29d043f18950 100644
--- a/configure.ac
+++ b/configure.ac
@@ -19,6 +19,9 @@ AC_PROG_MKDIR_P
 AC_PROG_LN_S
 AC_PROG_SED
 PKG_PROG_PKG_CONFIG
+AS_IF([test -z "$PKG_CONFIG"],
+  [AC_MSG_WARN([pkg-config is needed for auto-configuration of dependencies])
+   PKG_CONFIG=false])
 AM_PATH_ALSA(1.0.27)
 if test "x$enable_alsatest" = "xyes"; then
 AC_CHECK_FUNC([snd_ctl_elem_add_enumerated],
-- 
2.28.0

