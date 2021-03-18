Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B78E934036B
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 11:34:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5274F16C2;
	Thu, 18 Mar 2021 11:33:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5274F16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616063670;
	bh=l7n+8hfAB/JYeYFL5oFJlNo5w6gQ8m3lBYP8Ij19vrg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TtrOlTKrwxX+bmUfhLCOZJSE2IaI0xddaMRWkgBte15jTrQKJkeMG0pLeUjlXPJa6
	 nLN676x9MXVSQgrUFXJpUFjh+0v2UP4d5ZPpiSTiP0vN5DogUqBzVsNLt4878FFyZ6
	 y+V+aBoGuCnCI/ki3x0QxPOuu3ablW7sslLkVH0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5D73F804B4;
	Thu, 18 Mar 2021 11:30:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9F69F8032D; Thu, 18 Mar 2021 11:30:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C04C0F80171
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 11:30:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C04C0F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="rJkKlJ6c"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="LbsLUohU"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D0A191AD5;
 Thu, 18 Mar 2021 06:30:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 18 Mar 2021 06:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=OvphCkYMlzC+s
 TR4NuN56kjC2Ei6zNmNLQaDc58oywg=; b=rJkKlJ6cI43cip9iW8C/IVc2S/+h5
 c4rVPHU7XrE6TwGP/qLwwbzvFDgHe5dPJnU5vjdJrMWx4Y0E+8eNZQRtkPvweUN/
 1y+G+nNFUml34cMKIHm4aimOvBAaXfAyJEnjrpL3XkxW1/0mWEiUQApujJUeqfXe
 bA9KYeCaUVbNcHe92KS5GJIQXr+aw0ZPuNcbMwbw+wYCHDPNRJyFoGXTREFbjlYv
 40hBYzYs7An3lGrNbiLQEplENC281NEYyXgLjZ1z0njA3Oo+FRfVzRLhxvTMsESe
 nHvh8WRfIvay61Ppa46M4EqVUEyiML6/NdXABEWii6u4Elz0jRVH6iEBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=OvphCkYMlzC+sTR4NuN56kjC2Ei6zNmNLQaDc58oywg=; b=LbsLUohU
 1rY78fKG7VQEyQ9UpUUdQzDQrbK8rwNIULEA6+SQyiPYqTFo+51ha8Bfwzfap3/i
 wVaFmrRtZJ/ZJFDH0RtwsrpT71KNwVA5OqLOytRWOESfwcVhzGA7q1dKKV7Lct2R
 O3ayaYn7tlxindW1KatF+ScD9EKas7EJjvoiI3AaInaz48V9rooQU12hynb0Zu3h
 B45zq0VSsfZaY+jojPTT+lBTR0jwW1dbZC8mEsFIyIITu6uXi5K6V8CMI7GrmCOF
 QsGQUknRbAOUV6cJiUafuRona85Wu3JnPmxEnm3/SqxSsJGgCo328t/735mwV2xd
 jut6fUTELins2A==
X-ME-Sender: <xms:uytTYOplVv2jtTzJM3AGXuUSpH3Y8kvAokW3GPcwSLsFwP63d0S82g>
 <xme:uytTYMq8B6V8kceTKuX_JMk507c-TmpsWzcpUFvDDx8CVkjngH2D-qxSgcqh1fubt
 SbR-wTmvIXOstU9Wrk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:uytTYDM2gWW6dLoxhOcjY148JzlE1nRw6PrUsNWXpGxN7DgL0PZomg>
 <xmx:uytTYN5RncQbrR7RCUMTfkc3HT2Ynshr5bkjQ2JSUxj5wAii0YpMMA>
 <xmx:uytTYN4TdUdJyD8pG_8S1yfyRjEDlvzyQL3eFsHKqIcJikHDj0QjlA>
 <xmx:vCtTYPR6jeBBP8VN6fo80OiLvg8RZOM7LeUSw2tEO96h0YJ5GMCVJg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6FF371080057;
 Thu, 18 Mar 2021 06:30:18 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-lib][PATCH 1/6] test: ctl-elem-id: add test program for future
 APIs relevant to control element ID
Date: Thu, 18 Mar 2021 19:30:08 +0900
Message-Id: <20210318103013.265264-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210318103013.265264-1-o-takashi@sakamocchi.jp>
References: <20210318103013.265264-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tanjeff@cccmz.de
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

Some APIs are planned to add for equality check and comparison of a pair
of control element IDs. The equality check and comparison are quite
basic methods to operate data, thus it's preferable not to include any
bug.

This commit adds skeleton of test program for the APIs.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 test/lsb/Makefile.am   |  6 +++--
 test/lsb/ctl-elem-id.c | 61 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+), 2 deletions(-)
 create mode 100644 test/lsb/ctl-elem-id.c

diff --git a/test/lsb/Makefile.am b/test/lsb/Makefile.am
index ceb4d715..7d5f754d 100644
--- a/test/lsb/Makefile.am
+++ b/test/lsb/Makefile.am
@@ -1,5 +1,7 @@
-TESTS  = config
-TESTS += midi_event
+TESTS = \
+	config \
+	midi_event \
+	ctl-elem-id
 check_PROGRAMS = $(TESTS)
 noinst_HEADERS = test.h
 
diff --git a/test/lsb/ctl-elem-id.c b/test/lsb/ctl-elem-id.c
new file mode 100644
index 00000000..ae416698
--- /dev/null
+++ b/test/lsb/ctl-elem-id.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-3.0-or-later
+//
+// ctl-elem-id.c - a test program for equality and some comparison algorithms
+// for control element ID structure.
+//
+// Copyright (c) 2021 Takashi Sakamoto
+//
+// Licensed under the terms of the GNU General Public License, version 2.
+
+#include <stdlib.h>
+#include <stdint.h>
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+
+#include <unistd.h>
+
+#include "../include/asoundlib.h"
+
+int main()
+{
+	void (*entries[])(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r) = {
+	};
+	int count = sizeof(entries) / sizeof(*entries);
+	int fd;
+	uint8_t *buf;
+	int i;
+
+	fd = open("/dev/urandom", O_RDONLY);
+	if (fd < 0)
+		return EXIT_FAILURE;
+
+	buf = calloc(snd_ctl_elem_id_sizeof(), 2);
+	if (buf == NULL)
+		goto error_urandom;
+
+	for (i = 0; i < count; ++i) {
+		snd_ctl_elem_id_t *l, *r;
+		ssize_t len;
+randomize:
+		len = read(fd, buf, snd_ctl_elem_id_sizeof() * 2);
+		if (len < 0)
+			goto error_memory;
+		l = (snd_ctl_elem_id_t *)buf;
+		r = (snd_ctl_elem_id_t *)(buf + snd_ctl_elem_id_sizeof());
+		if (!memcmp(l, r, snd_ctl_elem_id_sizeof()))
+			goto randomize;
+
+		entries[i](l, r);
+	}
+
+	free(buf);
+
+	return EXIT_SUCCESS;
+error_memory:
+	free(buf);
+error_urandom:
+	close(fd);
+	return EXIT_FAILURE;
+}
-- 
2.27.0

