Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA3050D125
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Apr 2022 12:25:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E04916EF;
	Sun, 24 Apr 2022 12:24:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E04916EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650795944;
	bh=BFSnh3my9XMHi5kR7PthGNJ9P1fndoXDzUOVRxaUEuY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ai/gAAKOQRwTVKE2mopsH7OupTrdmxxszWmJSVeK3MAVJkQczgW4F5/2dzfYnl4HS
	 NhzpVSkGpmIKb7ppsLSfv5/+Im8zvRTZiTU9NLxrxkL9ZuE/wJZPRZrvRjP/hZXe4b
	 NIox61y+nNyIytYiEoXhGEizzfFaQIgLaZa+qzfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E6D1F80166;
	Sun, 24 Apr 2022 12:24:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41AA0F80163; Sun, 24 Apr 2022 12:24:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E1D5F80109
 for <alsa-devel@alsa-project.org>; Sun, 24 Apr 2022 12:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E1D5F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="kF1hshVj"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="UF37VAZo"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6571C5C00D8;
 Sun, 24 Apr 2022 06:24:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 24 Apr 2022 06:24:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1650795873; x=1650882273; bh=o2NRR3qRrC
 8yOSNDXCsVvkqHb0WKo+3WKhgufdfUuVA=; b=kF1hshVju822dVk8B9C92H2JZH
 U/GMCXnQWVuSe8pOCFX+DC3V9qF+sLvWUcLEJwj/6s1LdZkWVZ9wuwarD8kA7rpW
 eNkhl540nJl3wwHhJcN1tW7K+VA/B7TVV/L6Vx2MAflJMk9ufW16faMSjbJsuyrF
 3O51pYWi0SCFNKRvlb/1SIrskLjVTmLhuye+zvo/bopveseZH8u7yCx8rhVa3B0F
 wu4IPyIclmhPPTpmSsCjFWPv56Y6qZM3pbtrsRAEHb4IfpQSyz0MGfUTXz6/r5U3
 S0hH7yn307TZbv7nohXVpN9xiQp0iayW5GnUt2S3dUmZhArxBXddotIDRIvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1650795873; x=1650882273; bh=o
 2NRR3qRrC8yOSNDXCsVvkqHb0WKo+3WKhgufdfUuVA=; b=UF37VAZowsGD2yiG+
 CQ0U/hyNSIIY06nv9gWn79+Wt3YDrtd1q/QC93C7teLzH2rjUuV9BCBogsnjKBNU
 xvJrHb9rz2g7y3XxH7UM9K9By/XAcrgk8YaTRZnHkACiBVZWp0NC75PfRpl8kRuD
 847B4iICu6UaEWm4H4Z8uWZusU4dUPh2rYs2MSd9WZPQjXEVMFTQ6iuYX1FAZGVL
 4BmnT3Pva6pSeui765e0eUgtqIafxADDYAZkxd2jUmCYCwNgjhoNL1LVjraLOQ1S
 HSD9et2+SUdlg0Rs1UzGG+3GP3kMhW1x0LBkLEgHspsEApQhWL+/qXhoe3zkqMTd
 ji6JA==
X-ME-Sender: <xms:YCVlYhKWcNXdO91ZgTltz84Kg2o90_-JLd9mj3Iq1V2ZWrz8QCCgkQ>
 <xme:YCVlYtItUkTTzeBGwijh_A10PViY9jUU08EYprHBq-TEIEMZ3mCmarFVTOCfOShjL
 fs5f1A9sb3rI-KACV8>
X-ME-Received: <xmr:YCVlYpuGID2DK_Bwv2QmfhmyxfraYlNEAQsyNcvvXIY64SHQ5KV0lD9oZBQ80Om31MpBhFTZHU9hc062V9_Sya_hmvJeoEv9ntXhpxWMeBOqtlT_mXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdelgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepffdvueelffevke
 duhfetjeduffeghfettdfguedtgfdvgfeufeduheevheevkeeknecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:YCVlYib-jwVD3MinIsa4BKt_2tifXxbJjqy1BHKot-SFRb-P8vkKxQ>
 <xmx:YCVlYoYe8TdgaZcvbyUn6G8ixBhzIzBWOLBSIk3Bh6onY4pm4d6O3A>
 <xmx:YCVlYmD_hEtOkIzQw9LR65yy2v3yhLCWvwoDRp3DdFAPuSA7krdbdA>
 <xmx:YSVlYnk2M1izunN96-VJY7zVjk0OIy1fRIN_F9VJf9vqpZnSojUeRQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Apr 2022 06:24:31 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: fireworks: fix wrong return count shorter than expected
 by 4 bytes
Date: Sun, 24 Apr 2022 19:24:28 +0900
Message-Id: <20220424102428.21109-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de, stable@vger.kernel.org
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

ALSA fireworks driver has a bug in its initial state to return count
shorter than expected by 4 bytes to userspace applications when handling
response frame for Echo Audio Fireworks transaction. It's due to missing
addition of the size for the type of event in ALSA firewire stack.

Fixes: 555e8a8f7f14 ("ALSA: fireworks: Add command/response functionality into hwdep interface")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks_hwdep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/firewire/fireworks/fireworks_hwdep.c b/sound/firewire/fireworks/fireworks_hwdep.c
index 626c0c34b0b6..3a53914277d3 100644
--- a/sound/firewire/fireworks/fireworks_hwdep.c
+++ b/sound/firewire/fireworks/fireworks_hwdep.c
@@ -34,6 +34,7 @@ hwdep_read_resp_buf(struct snd_efw *efw, char __user *buf, long remained,
 	type = SNDRV_FIREWIRE_EVENT_EFW_RESPONSE;
 	if (copy_to_user(buf, &type, sizeof(type)))
 		return -EFAULT;
+	count += sizeof(type);
 	remained -= sizeof(type);
 	buf += sizeof(type);
 
-- 
2.34.1

