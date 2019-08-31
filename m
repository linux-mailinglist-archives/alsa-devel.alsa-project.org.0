Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 349C0A44DB
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Aug 2019 17:01:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFBB8857;
	Sat, 31 Aug 2019 17:00:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFBB8857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567263690;
	bh=oV2xkcxZ9MMTqN05wG7NIgtGZuzsYqe+wnelwAunVrg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dPumJahczWB3jfyjLz/2u8zxCc8LQRt3hVQcGhw/u3p7j6qLCbqQXHNAvB1Bsd/cI
	 v7Mq487F6dNzJrtfIuthGEuJHEWRpRUwPOn8vH2JH5qhnO0B1fioNgB7bXV8GWOnyS
	 xMxF1Gk7gs6SneyfIrYn4qwaad+c7AoYB5NhPSzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B62EF800AA;
	Sat, 31 Aug 2019 16:59:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFA47F80268; Sat, 31 Aug 2019 16:58:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48C64F800EA
 for <alsa-devel@alsa-project.org>; Sat, 31 Aug 2019 16:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48C64F800EA
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1B0495AFE3;
 Sat, 31 Aug 2019 14:58:47 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-39.ams2.redhat.com
 [10.36.116.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22CF25D9D5;
 Sat, 31 Aug 2019 14:58:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: alsa-devel@alsa-project.org
Date: Sat, 31 Aug 2019 16:58:42 +0200
Message-Id: <20190831145842.32990-2-hdegoede@redhat.com>
In-Reply-To: <20190831145842.32990-1-hdegoede@redhat.com>
References: <20190831145842.32990-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Sat, 31 Aug 2019 14:58:47 +0000 (UTC)
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/2] conf/ucm: cht-bsw-rt5672: Add board
	specific profile for Lenovo Thinkpad 8 tablet
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

The Lenovo Thinkpad 8 tablet has stereo speakers and its internal DMIC
on DMIC1, at a device specific profile for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 configure.ac                                  |  1 +
 .../HiFi.conf                                 | 23 +++++++++++++++++++
 ...ENOVO-20BN002QGE-ThinkPad8-20BN002QGE.conf |  4 ++++
 .../Makefile.am                               |  4 ++++
 src/conf/ucm/Makefile.am                      |  1 +
 5 files changed, 33 insertions(+)
 create mode 100644 src/conf/ucm/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE/HiFi.conf
 create mode 100644 src/conf/ucm/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE.conf
 create mode 100644 src/conf/ucm/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE/Makefile.am

diff --git a/configure.ac b/configure.ac
index 9ccca7aa..778bc64e 100644
--- a/configure.ac
+++ b/configure.ac
@@ -756,6 +756,7 @@ AC_OUTPUT(Makefile doc/Makefile doc/pictures/Makefile doc/doxygen.cfg \
 	  src/conf/ucm/HDAudio-Gigabyte-ALC1220DualCodecs/Makefile \
 	  src/conf/ucm/HDAudio-Lenovo-DualCodecs/Makefile \
 	  src/conf/ucm/kblrt5660/Makefile \
+	  src/conf/ucm/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE/Makefile \
 	  src/conf/ucm/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216/Makefile \
 	  src/conf/ucm/PandaBoard/Makefile \
 	  src/conf/ucm/PandaBoardES/Makefile \
diff --git a/src/conf/ucm/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE/HiFi.conf b/src/conf/ucm/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE/HiFi.conf
new file mode 100644
index 00000000..43c3c0dd
--- /dev/null
+++ b/src/conf/ucm/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE/HiFi.conf
@@ -0,0 +1,23 @@
+SectionVerb {
+	EnableSequence [
+		cdev "hw:chtbswrt5672"
+		<platforms/bytcr/PlatformEnableSeq.conf>
+		<codecs/rt5672/EnableSeq.conf>
+	]
+
+	DisableSequence [
+		cdev "hw:chtbswrt5672"
+		<platforms/bytcr/PlatformDisableSeq.conf>
+	]
+
+	Value {
+		PlaybackPCM "hw:chtbswrt5672"
+		CapturePCM "hw:chtbswrt5672"
+	}
+}
+
+<codecs/rt5672/Speaker.conf>
+<codecs/rt5672/HeadPhones.conf>
+
+<codecs/rt5672/DMIC2.conf>
+<codecs/rt5672/HeadsetMic.conf>
diff --git a/src/conf/ucm/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE.conf b/src/conf/ucm/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE.conf
new file mode 100644
index 00000000..1c3a766b
--- /dev/null
+++ b/src/conf/ucm/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE.conf
@@ -0,0 +1,4 @@
+SectionUseCase."HiFi" {
+	File "../LENOVO-20BN002QGE-ThinkPad8-20BN002QGE/HiFi.conf"
+	Comment "Play HiFi quality Music"
+}
diff --git a/src/conf/ucm/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE/Makefile.am b/src/conf/ucm/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE/Makefile.am
new file mode 100644
index 00000000..842409e8
--- /dev/null
+++ b/src/conf/ucm/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE/Makefile.am
@@ -0,0 +1,4 @@
+alsaconfigdir = @ALSA_CONFIG_DIR@
+ucmdir = $(alsaconfigdir)/ucm/LENOVO-20BN002QGE-ThinkPad8-20BN002QGE
+ucm_DATA = LENOVO-20BN002QGE-ThinkPad8-20BN002QGE.conf HiFi.conf
+EXTRA_DIST = $(ucm_DATA)
diff --git a/src/conf/ucm/Makefile.am b/src/conf/ucm/Makefile.am
index 2ed4e1a3..7bb8eb1d 100644
--- a/src/conf/ucm/Makefile.am
+++ b/src/conf/ucm/Makefile.am
@@ -40,6 +40,7 @@ gpd-win-pocket-rt5645 \
 HDAudio-Gigabyte-ALC1220DualCodecs \
 HDAudio-Lenovo-DualCodecs \
 kblrt5660 \
+LENOVO-20BN002QGE-ThinkPad8-20BN002QGE \
 LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216 \
 PandaBoard \
 PandaBoardES \
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
