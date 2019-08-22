Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 874DD9978F
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 17:01:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E52E41672;
	Thu, 22 Aug 2019 17:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E52E41672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566486065;
	bh=SHAyWfcuRAET/sSX+Dd1yXOYJG7acdKBM9r/5ch6Wgk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s1LrcEuKUu4dgmgo+RYG4Ozc3kZaVSOomLj4bxp/9tQsO85PcCoUeU41caXWPRYHn
	 h7T2J90LzCAJtZRGVisp7JHdHzzHJj2JikLD2h8eygCPJy+91gRTMAtZM2Im9RaMhB
	 XltSoepe03pqT2zzV3//JP+bXqDj46Hu2I3Lu9aA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6922F8036E;
	Thu, 22 Aug 2019 16:59:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4926FF800BF; Thu, 22 Aug 2019 16:59:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC360F800BF
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 16:59:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC360F800BF
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7D38731106B5519A65DA;
 Thu, 22 Aug 2019 22:58:32 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Thu, 22 Aug 2019
 22:58:25 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <gregkh@linuxfoundation.org>,
 <pavel@denx.de>, <allison@lohutok.net>, <tglx@linutronix.de>,
 <yuehaibing@huawei.com>, <pakki001@umn.edu>
Date: Thu, 22 Aug 2019 22:57:41 +0800
Message-ID: <20190822145741.9592-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH -next] ALSA: line6: Fix -Wunused-const-variable
	warnings
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

sound/usb/line6/driver.h:69:18: warning:
 SYSEX_DATA_OFS defined but not used [-Wunused-const-variable=]
sound/usb/line6/driver.h:70:18: warning:
 SYSEX_EXTRA_SIZE defined but not used [-Wunused-const-variable=]

SYSEX_EXTRA_SIZE is only used in driver.c and
SYSEX_DATA_OFS in pod.c, so move them to .c fix
this warning.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/usb/line6/driver.c | 2 ++
 sound/usb/line6/driver.h | 3 ---
 sound/usb/line6/pod.c    | 2 ++
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index b5a3f75..8027da8 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -31,6 +31,8 @@ const unsigned char line6_midi_id[3] = {
 };
 EXPORT_SYMBOL_GPL(line6_midi_id);
 
+static const int SYSEX_EXTRA_SIZE = sizeof(line6_midi_id) + 4;
+
 /*
 	Code to request version of POD, Variax interface
 	(and maybe other devices).
diff --git a/sound/usb/line6/driver.h b/sound/usb/line6/driver.h
index e5e572e..c57633a 100644
--- a/sound/usb/line6/driver.h
+++ b/sound/usb/line6/driver.h
@@ -66,9 +66,6 @@
 
 extern const unsigned char line6_midi_id[3];
 
-static const int SYSEX_DATA_OFS = sizeof(line6_midi_id) + 3;
-static const int SYSEX_EXTRA_SIZE = sizeof(line6_midi_id) + 4;
-
 /*
 	 Common properties of Line 6 devices.
 */
diff --git a/sound/usb/line6/pod.c b/sound/usb/line6/pod.c
index ee4c9d2..24ad337 100644
--- a/sound/usb/line6/pod.c
+++ b/sound/usb/line6/pod.c
@@ -110,6 +110,8 @@ enum {
 	POD_BUSY_MIDISEND
 };
 
+static const int SYSEX_DATA_OFS = sizeof(line6_midi_id) + 3;
+
 static struct snd_ratden pod_ratden = {
 	.num_min = 78125,
 	.num_max = 78125,
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
