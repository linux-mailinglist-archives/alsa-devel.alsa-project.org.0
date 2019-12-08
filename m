Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAAD11641D
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 00:24:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C76B165F;
	Mon,  9 Dec 2019 00:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C76B165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575847466;
	bh=jv1B2sc1V0BWfKU8YalBuS8Tc1LBSmoHZBkn43cHxkI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bnT8AM8E/PNAfRxegZuiUa+5rwxx5TR/hJ+hu3on4dj4Fp7wU/zttD012W6LxnaVX
	 /JK7nkHQB1dMyARubycx6yJOcf+hk31gPHEqrg0LseGYB+/bVs/He/ILgGUFeaao/8
	 e5X/AmOjKJGAI2OFGC8BePJi3CbbtqfVl5J1YKkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FFDFF80248;
	Mon,  9 Dec 2019 00:22:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA228F80217; Mon,  9 Dec 2019 00:22:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77928F8011E
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 00:22:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77928F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="iESCpvbj"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="X75/v8RZ"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2CACD22772;
 Sun,  8 Dec 2019 18:22:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 08 Dec 2019 18:22:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=G5sMpdK5+2fLCfIu+Be9/VxiiU
 QFoi5D1Ml/JiYhmd4=; b=iESCpvbjUZJMLMdoG1AUGZ/L9PSTpRsmxr5rju1gOt
 NxzcSdUj7zw4cvfQqRFNoAVDuR+rAGpCrGJmL3VI7ccdIRqVVdVHD2sIIJ0WW3al
 +rqITfYXVKGW5y57q2jFP5+N1VVk+iMqLPgqyFo6PNn8zd3Qy0+36pvVVFemo2jt
 H/5Vs70VYvr0uYU3Rl83aQv5svR4vbOs5wgnTfoROdduAguNjMiq/CgJb1PLKSaf
 eBFQjmHlLs20RaYwsxM79Dbwq3fTFxnwj3RuWXIKLr4tXTodxlklZsxCU2S27DAG
 EvBu/TXXJmdZuBHfgtfwrUaUPpvZQzw4RwWNhmrH8SGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=G5sMpdK5+2fLCfIu+
 Be9/VxiiUQFoi5D1Ml/JiYhmd4=; b=X75/v8RZak5PXHD0Hr+H2AxK6HcatTton
 Zv6M7gH3XaxHaJX4VsFjXveqlxUdR2U/UGt88mfYkSta0F0GZ+XE2OiV00/Hsajz
 +Ka0N9EKYWP6u7Fl1FfOwkdxWKXuPJSr39lq1o4QxAwj5bntC6aATkj2Km51+Ybg
 FktgU//J3xpH4odgg9iw/jUexkDfgo40+WVdDBQwmt5ZiRsKSGj2O8YyRIL7uAVu
 /8oyPxjTF7dylOrH6bF9M8CjFL5VWhD3xr8cF1DSCE3/48WlkSCuYs7oYZKBv0KY
 V8gphn7+u/Fb+78OL2bNZZuRp1zEtwkkBNbCBDVzdRYN/uRCeUxMg==
X-ME-Sender: <xms:t4XtXU1z8_gcPR8YB6WooYaL6PE-U-xxxjK0Ps-PjkhkIZ90mYzzQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudekledgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghshhhi
 ucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqe
 enucfkphepudegrdefrdejhedrudekudenucfrrghrrghmpehmrghilhhfrhhomhepohdq
 thgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvghrufhiiigvpe
 dt
X-ME-Proxy: <xmx:t4XtXXtEDW3fsmcD_zwyHgKUCuoodNRrNoQxBhFbmDc5F-qEuX3ZAA>
 <xmx:t4XtXRWA0j-R6exAyQMcMPSdJRuHkXNWHwA3AQDVk5uHEUyGtuElXA>
 <xmx:t4XtXRWS3illddSQsVI1qva22iNGZZiNzbLutreJqsuN0d4ee2Endw>
 <xmx:uYXtXbAWHEAeMaaIzoak4WY1xSJ0E2Ly3VSUH-fgf57lI4T0ABv2pQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 591B030600AB;
 Sun,  8 Dec 2019 18:22:30 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  9 Dec 2019 08:22:26 +0900
Message-Id: <20191208232226.6685-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, kbuild test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH] firewire-motu: fix double unlocked
	'motu->mutex'
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

Mutex is doubly unlocked in some error path of pcm.open. This commit fixes
ALSA firewire-motu driver in Linux kernel v5.5.

Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: 3fd80b200388 ("ALSA: firewire-motu: use the same size of period for PCM substream in AMDTP streams")
Fixes: 0f5482e7875b ("ALSA: firewire-motu: share PCM buffer size for both direction")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index 349b4d09e84f..005970931030 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -177,18 +177,14 @@ static int pcm_open(struct snd_pcm_substream *substream)
 			err = snd_pcm_hw_constraint_minmax(substream->runtime,
 					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 					frames_per_period, frames_per_period);
-			if (err < 0) {
-				mutex_unlock(&motu->mutex);
+			if (err < 0)
 				goto err_locked;
-			}
 
 			err = snd_pcm_hw_constraint_minmax(substream->runtime,
 					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 					frames_per_buffer, frames_per_buffer);
-			if (err < 0) {
-				mutex_unlock(&motu->mutex);
+			if (err < 0)
 				goto err_locked;
-			}
 		}
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
