Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C13B336B65
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:24:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E87A0170B;
	Thu, 11 Mar 2021 06:23:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E87A0170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440272;
	bh=IgEhd8gaWjpcjoO0iH9sBrM2odmhhyld8wg3/H9tW8o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lYOMH35KPh2VoHBusnNx3YTRvyUVrKscBOJbNphF0jkwGpMIBYi02dYoBr6G9jSDw
	 CxHuMZM6WbOtOnt6BZtGqh0h1iGaJoUrNeutYm/yh47OJeOPc2BurxvEwhXri8ny+N
	 Ch/lwHEJhW1MhcPCZIgsqbd7WxRAtPTVnNGValXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16994F804AE;
	Thu, 11 Mar 2021 06:22:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA9A8F804AC; Thu, 11 Mar 2021 06:22:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6E2AF8015B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:21:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6E2AF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="gxJiz9bB"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="rg6mQtUT"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1945A2FA0;
 Thu, 11 Mar 2021 00:21:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:21:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=4/hffh3FPz/3y
 LeRfHga+JBwUjSKdCrIAe+KpMYAOMs=; b=gxJiz9bBMoHCP5AW64nWC1bsEDJOG
 hT6b/8TIBp0GqIZjrvya4yj024pm0wH2Y3kIpOvLxaj0WPjK+ZxlWVLnbeGYWP3D
 D4B4qVfMVMTRBRzD3WWWFxQstyq+fZnr+cAgKgOx0zZpM90MzQ4xX/nuHLBMOBH3
 1KUnaQGkyr8z43k2LgXz+tvzdY2Y4DdWW1u13qxEzi70p2fttPw+qf+J7fwW2Fwq
 nqEo6xw5gtt9hWTyltnGmwnegYaqvrOJ/b5HGCKb1EhzJQD5FTTQOWpGMQZX4sav
 tyVITPEJrRO6coiMyPbyYmPS55cryDPJzX0Q8BMHIVE9C8ZfYdshN5M7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=4/hffh3FPz/3yLeRfHga+JBwUjSKdCrIAe+KpMYAOMs=; b=rg6mQtUT
 E6J0aobkqtfS6NT4oQC5qfi8Ir4DEHzWWBzsdlLTlGk9OtHb+ZWagXh4uqMRJiNI
 mUcKlDsHJZi+a0ESFGGQkH5LSbVOi064fQ1VAkY+xesMvZSXNtwdLihN5eGYjFRZ
 pTa0et6WEJzhDNTXrYSvsa6sD+g8AjPMzUd5oIE+iXMDIxod8Zt3KmswKfTGqDjS
 lkWjiF0DivpqnbK0xhSUbUD/3d+xi2i0Ktc5jHnZ+wlBf9nNI6Jh8+fXMXYYJtti
 eO2RZC23wMqUpdlkR0nfFcfzGGdJK69jAQQ6nTyod7E/vX8hyVTfyTmba/Bvf3io
 +cfW/6Io/UL7FA==
X-ME-Sender: <xms:8KhJYFk5DKXejE5LdKxZOL3W4Yt973hPoL16NmOLbQrm2AOsK7wASg>
 <xme:8KhJYA19vJVIuMQCQDbBpdupbgHaGqdFbUV3HtECfzDKnF51U-Y5Q4AgouB4DAkH_
 -PS4uJoHmOG7ZqcD0M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:8KhJYLpE954yrqQQijuNJYnQrtC-R5CUYcIuqeTQ7KYELimXhffIGQ>
 <xmx:8KhJYFnLYsNOVsIRX2p6UcNKx7KCHhSA7VePrD-mWynCtS791yZZcA>
 <xmx:8KhJYD1PEtT-zs_I1lJ_hTEVzPXBEeZV6ABdp_JWmN7m1W2aty1Sag>
 <xmx:8KhJYA9_vq7EpVNXgVNotlzNtIUaWqoDKfOOJv10jyT9BhFAWgoL-A>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id AE5A224005A;
 Thu, 11 Mar 2021 00:21:51 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-utils][PATCH 01/14] axfer: minor code arrangement for container
 module in a point of nonblocking flag
Date: Thu, 11 Mar 2021 14:21:32 +0900
Message-Id: <20210311052146.404003-2-o-takashi@sakamocchi.jp>
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

In internal container module, any file descriptor is expected as
non-blocking mode. Current implementation distinguish the case of
standard input and output from the case to open actual file since
O_NONBLOCK is used for the latter case. However, in both cases,
fcntl(2) is available to set non-blocking mode to the file descriptor.

This commit arranges to use fcntl(2) for both cases.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 axfer/container.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/axfer/container.c b/axfer/container.c
index 566acd0..8733ff7 100644
--- a/axfer/container.c
+++ b/axfer/container.c
@@ -176,16 +176,17 @@ int container_parser_init(struct container_context *cntr,
 				"should be referred instead.\n");
 			return -EIO;
 		}
-		err = set_nonblock_flag(cntr->fd);
-		if (err < 0)
-			return err;
 		cntr->stdio = true;
 	} else {
-		cntr->fd = open(path, O_RDONLY | O_NONBLOCK);
+		cntr->fd = open(path, O_RDONLY);
 		if (cntr->fd < 0)
 			return -errno;
 	}
 
+	err = set_nonblock_flag(cntr->fd);
+	if (err < 0)
+		return err;
+
 	// 4 bytes are enough to detect supported containers.
 	err = container_recursive_read(cntr, cntr->magic, sizeof(cntr->magic));
 	if (err < 0)
@@ -260,17 +261,17 @@ int container_builder_init(struct container_context *cntr,
 				"should be referred instead.\n");
 			return -EIO;
 		}
-		err = set_nonblock_flag(cntr->fd);
-		if (err < 0)
-			return err;
 		cntr->stdio = true;
 	} else {
-		cntr->fd = open(path, O_RDWR | O_NONBLOCK | O_CREAT | O_TRUNC,
-				0644);
+		cntr->fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
 		if (cntr->fd < 0)
 			return -errno;
 	}
 
+	err = set_nonblock_flag(cntr->fd);
+	if (err < 0)
+		return err;
+
 	builder = builders[format];
 
 	// Allocate private data for the builder.
-- 
2.27.0

