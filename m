Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ACA15BDA4
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 12:27:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09050165D;
	Thu, 13 Feb 2020 12:26:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09050165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581593252;
	bh=lYcKheza7Te3avO9AZcj0seAve/+qDWHi/CAYJqgwuI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V7wiyiZ9uCS1LrsnRt2KqqABeU2b/UA6zSaoW4z1wgVpZewwbFMLHzPNwAbZiIxch
	 +gTHut9xeSoyF0m0Xl+xYTEIexOH86OLxGCQSiEgmgRaVh1hzs66YEYO8b3fuyDot9
	 eHiPgNlkJWMntT9Z6coYRKX17CCY5Bj9UOsq4AZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1455DF80145;
	Thu, 13 Feb 2020 12:25:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C023F80145; Thu, 13 Feb 2020 11:37:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_13, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpo.poczta.interia.pl (smtpo.poczta.interia.pl
 [217.74.65.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98AB6F80138
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 11:37:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98AB6F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=interia.pl header.i=@interia.pl
 header.b="Kuxf4Ium"
X-Interia-R: Interia
X-Interia-R-IP: 185.15.80.246
X-Interia-R-Helo: <photon.emea.nsn-net.net>
Received: from photon.emea.nsn-net.net (185-15-80-246.ksi-system.net
 [185.15.80.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
 Thu, 13 Feb 2020 11:37:20 +0100 (CET)
From: Radoslaw Smigielski <radoslaw.smigielski@interia.pl>
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org, corbet@lwn.net, tiwai@suse.com,
 perex@perex.cz, radoslaw.smigielski@interia.pl
Date: Thu, 13 Feb 2020 11:36:37 +0100
Message-Id: <20200213103636.733463-1-radoslaw.smigielski@interia.pl>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
 s=biztos; t=1581590241;
 bh=gVqMAKSIPkY8OiAd077JlbnTBYo5wVcLt3iZ6loGT8Y=;
 h=X-Interia-R:X-Interia-R-IP:X-Interia-R-Helo:From:To:Subject:Date:
 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Interia-Antivirus;
 b=Kuxf4Ium3/75vWo/SUnB0MPiRIZaAhRwFeR3fVI2USNtD0mDfNojDrYcVc7jj4236
 ja6CwFGQc5CIwIKyNFO2xuKqU4nu06YQ2FuYAffUqfmwzXsA6sJXQg7nf1P37FJcc6
 XlS8uu5sIaKwuV0GVLrPR6YLjYqX2fFsdBEbuRUs=
X-Mailman-Approved-At: Thu, 13 Feb 2020 12:25:47 +0100
Subject: [alsa-devel]  [PATCH] ALSA: doc: fix snd_hda_intel driver name
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

Update driver name snd-hda-intel to proper, existing driver
name snd_hda_intel in Documentation/sound/hd-audio/notes.rst.

Signed-off-by: Radoslaw Smigielski <radoslaw.smigielski@interia.pl>
---
 Documentation/sound/hd-audio/notes.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/sound/hd-audio/notes.rst b/Documentation/sound/hd-audio/notes.rst
index 0f3109d9abc8..56ccc15f4d26 100644
--- a/Documentation/sound/hd-audio/notes.rst
+++ b/Documentation/sound/hd-audio/notes.rst
@@ -17,12 +17,12 @@ methods for the	HD-audio hardware.
 
 The HD-audio component consists of two parts: the controller chip and 
 the codec chips on the HD-audio bus.  Linux provides a single driver
-for all controllers, snd-hda-intel.  Although the driver name contains
+for all controllers, snd_hda_intel.  Although the driver name contains
 a word of a well-known hardware vendor, it's not specific to it but for
 all controller chips by other companies.  Since the HD-audio
 controllers are supposed to be compatible, the single snd-hda-driver
 should work in most cases.  But, not surprisingly, there are known
-bugs and issues specific to each controller type.  The snd-hda-intel
+bugs and issues specific to each controller type.  The snd_hda_intel
 driver has a bunch of workarounds for these as described below.
 
 A controller may have multiple codecs.  Usually you have one audio
@@ -31,7 +31,7 @@ multiple audio codecs, e.g. for analog and digital outputs, and the
 driver might not work properly because of conflict of mixer elements.
 This should be fixed in future if such hardware really exists.
 
-The snd-hda-intel driver has several different codec parsers depending
+The snd_hda_intel driver has several different codec parsers depending
 on the codec.  It has a generic parser as a fallback, but this
 functionality is fairly limited until now.  Instead of the generic
 parser, usually the codec-specific parser (coded in patch_*.c) is used
@@ -226,7 +226,7 @@ the external amplifier bits.  Thus a headphone output has a slightly
 better chance.
 
 Before making a bug report, double-check whether the mixer is set up
-correctly.  The recent version of snd-hda-intel driver provides mostly
+correctly.  The recent version of snd_hda_intel driver provides mostly
 "Master" volume control as well as "Front" volume (where Front
 indicates the front-channels).  In addition, there can be individual
 "Headphone" and "Speaker" controls.
@@ -596,7 +596,7 @@ For example, if you have two cards, one for an on-board analog and one
 for an HDMI video board, you may pass patch option like below:
 ::
 
-    options snd-hda-intel patch=on-board-patch,hdmi-patch
+    options snd_hda_intel patch=on-board-patch,hdmi-patch
 
 
 Power-Saving
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
