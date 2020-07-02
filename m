Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47677212D40
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:43:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCB7C16EF;
	Thu,  2 Jul 2020 21:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCB7C16EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593718995;
	bh=g866lUugfAcplBotKJdIM83EjFXiYXwHnzPbDr/Xa28=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a0j1HMVEsGHIk8OVXe6YsMvzZ1tt7WYkfZZjqvGR7JK62lG9bR8oU7K/999v9MfHH
	 4F3ykCwAuikTF+/2cPsQoPWS9/ygS1J7ysS1kVxwm510iCTIRmNBKNK0W7cU2prdeG
	 SD7C1uotqpEed0TuNCA1+STAETBg9yH+G74M+kM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D34EF80322;
	Thu,  2 Jul 2020 21:37:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2B9BF802E9; Thu,  2 Jul 2020 21:36:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AECBF802BE
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AECBF802BE
IronPort-SDR: 9EBUBj7uXRyUu2aLliTnwYV3wPZRQS8/D77hc6cb2YOx1KG3iqVKt5K/HkqscmOSGFL/G+h++X
 FY7OM9EOeCgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549351"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549351"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:24 -0700
IronPort-SDR: t6lU7VDp1uTwOj+VkSYQtAfp/AzA69Osp6/Wh9w7U/oIi3NCMSDdp97NTf1oZfiNL8IqXHzBMQ
 SAH0TwU+zWRA==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116376"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 10/23] ALSA: usb/line6: remove 'defined but not used'
 warning
Date: Thu,  2 Jul 2020 14:35:51 -0500
Message-Id: <20200702193604.169059-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
References: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
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
multiple C files. Mark as __maybe_unused.

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
index 1a4e3700c80c..3f75855f142a 100644
--- a/sound/usb/line6/driver.h
+++ b/sound/usb/line6/driver.h
@@ -66,8 +66,8 @@
 
 extern const unsigned char line6_midi_id[3];
 
-static const int SYSEX_DATA_OFS = sizeof(line6_midi_id) + 3;
-static const int SYSEX_EXTRA_SIZE = sizeof(line6_midi_id) + 4;
+static __maybe_unused const int SYSEX_DATA_OFS = sizeof(line6_midi_id) + 3;
+static __maybe_unused const int SYSEX_EXTRA_SIZE = sizeof(line6_midi_id) + 4;
 
 /*
 	 Common properties of Line 6 devices.
-- 
2.25.1

