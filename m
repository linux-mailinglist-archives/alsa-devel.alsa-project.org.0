Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8210021771D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 20:51:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 201D89F6;
	Tue,  7 Jul 2020 20:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 201D89F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594147888;
	bh=Vl41X9sRebde4O5Nys2uteIbCyq2iWaLHWRfeBkPcdQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nnidEPbxo51rxRAJYd3+t6c/bfocMv0x0W03j6rwrmsDPZygTBAnHINUsWY2uEZg1
	 Le+2r/6fS6IBLJ1YwdumOjGEA86nuqIv3kx6G0FljFtHZjNxTW9emLIFYPxWncTpQ8
	 J2Woqi6yqD0YUgpgmNOZItE9Lwt5TymbuaIYhlgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 571B1F80257;
	Tue,  7 Jul 2020 20:49:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DA5CF80216; Tue,  7 Jul 2020 20:49:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7802F800D0
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 20:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7802F800D0
IronPort-SDR: p0jT+UhgDUgpD2zVD6DUSZ4wm/wM5c+d887AHlUHi/uvaE4of2j3ixdvuRWtpoITDR8FPXHUR1
 /4i7N4lk8Sgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="135921778"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="135921778"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 11:49:35 -0700
IronPort-SDR: YvbEHyinpUJYhI/E/QWUHljEhNPVKQZUpe9KXfZugJnN5UOrOF8/vDBmSb42y0XAgH+g4nQZhD
 R+2V19ETvNIQ==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="388594405"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 11:49:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: usb/line6: remove 'defined but not used' warning
Date: Tue,  7 Jul 2020 13:49:24 -0500
Message-Id: <20200707184924.96291-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warning. Variables are declared in a header file included from
multiple C files, replace by #defines as suggested by Takashi

sound/usb/line6/driver.h:70:18: warning: ‘SYSEX_EXTRA_SIZE’ defined
but not used [-Wunused-const-variable=]
   70 | static const int SYSEX_EXTRA_SIZE = sizeof(line6_midi_id) + 4;
      |                  ^~~~~~~~~~~~~~~~
sound/usb/line6/driver.h:69:18: warning: ‘SYSEX_DATA_OFS’ defined but
   not used [-Wunused-const-variable=]
   69 | static const int SYSEX_DATA_OFS = sizeof(line6_midi_id) + 3;
      |                  ^~~~~~~~~~~~~~

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/usb/line6/driver.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/line6/driver.h b/sound/usb/line6/driver.h
index 1a4e3700c80c..ec20fbec6475 100644
--- a/sound/usb/line6/driver.h
+++ b/sound/usb/line6/driver.h
@@ -66,8 +66,8 @@
 
 extern const unsigned char line6_midi_id[3];
 
-static const int SYSEX_DATA_OFS = sizeof(line6_midi_id) + 3;
-static const int SYSEX_EXTRA_SIZE = sizeof(line6_midi_id) + 4;
+#define SYSEX_DATA_OFS (sizeof(line6_midi_id) + 3)
+#define SYSEX_EXTRA_SIZE (sizeof(line6_midi_id) + 4)
 
 /*
 	 Common properties of Line 6 devices.
-- 
2.25.1

