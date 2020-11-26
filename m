Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E142C5D06
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Nov 2020 21:31:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D45841825;
	Thu, 26 Nov 2020 21:30:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D45841825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606422708;
	bh=JdjRRP83vUTON3OwZR0E2PJHRjkYoVWgMMvl+UbXe+I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VcNYB8Ove1Ex11jePrFQxdmxoFsGja/jV2OTLUHGPT+09QyDcHp+eG240WsjvQlqw
	 akLeRCQrKKshgZDy9xUBvy8c/NDOPMhmprUC8RgKmVo/4pXsx9I4j52KTpGWlpRq7O
	 mok5PAJr8pDXqUeW2Qq/aqtnnHbbxn5rjEf1YPkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6C60F8016A;
	Thu, 26 Nov 2020 21:30:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0C8FF8026F; Thu, 26 Nov 2020 21:30:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by alsa1.perex.cz (Postfix) with ESMTP id C1AABF80166
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 21:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1AABF80166
Received: from localhost (118.130.77.188.dynamic.jazztel.es [188.77.130.118])
 by iodev.co.uk (Postfix) with ESMTPSA id 92B6A154FC;
 Thu, 26 Nov 2020 21:30:32 +0100 (CET)
From: Ismael Luceno <ismael@iodev.co.uk>
To: alsa-devel@alsa-project.org
Subject: [PATCH] configure: Replace PKG_CONFIG calls with PKG_CHECK_VAR
Date: Thu, 26 Nov 2020 21:30:53 +0100
Message-Id: <20201126203053.12028-1-ismael@iodev.co.uk>
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

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 configure.ac | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/configure.ac b/configure.ac
index 29d043f18950..8e130b3f0775 100644
--- a/configure.ac
+++ b/configure.ac
@@ -204,12 +204,8 @@ AC_ARG_WITH(
         [udev-rules-dir],
         AS_HELP_STRING([--with-udev-rules-dir=DIR],[Directory where to install udev rules to (default=auto)]),
         [udevrulesdir="$withval"],
-        [udevdir=$($PKG_CONFIG udev --variable=udevdir)
-        if test "x$udevdir" = "x"; then
-            udevrulesdir="/lib/udev/rules.d"
-        else
-            udevrulesdir="$udevdir/rules.d"
-        fi])
+        [PKG_CHECK_VAR([udevdir], [udev], [udevdir])
+	 udevrulesdir="${udevdir:-/lib/udev}/rules.d"])
 AC_SUBST(udevrulesdir)
 
 dnl Checks for header files.
@@ -404,10 +400,10 @@ PKG_CHECK_MODULES(SYSTEMD, [systemd >= 18],
         [have_min_systemd="no"])
 AC_ARG_WITH([systemdsystemunitdir],
         AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [Directory for systemd service files]),
-        [], [with_systemdsystemunitdir=$($PKG_CONFIG --variable=systemdsystemunitdir systemd)])
-if test "x$with_systemdsystemunitdir" != xno; then
-        AC_SUBST([systemdsystemunitdir], [$with_systemdsystemunitdir])
-fi
+        [], [PKG_CHECK_VAR([with_systemdsystemunitdir], [systemd], [systemdsystemunitdir])])
+AS_IF([test "x$with_systemdsystemunitdir" != xno],
+	[AC_SUBST([systemdsystemunitdir], ["$with_systemdsystemunitdir"])])
+
 AM_CONDITIONAL(HAVE_SYSTEMD, [test "$have_min_systemd" = "yes" \
         -a -n "$with_systemdsystemunitdir" -a "x$with_systemdsystemunitdir" != xno ])
 
-- 
2.28.0

