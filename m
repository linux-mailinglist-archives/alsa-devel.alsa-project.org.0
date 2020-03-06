Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F39917BF9E
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 14:54:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11E7182E;
	Fri,  6 Mar 2020 14:53:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11E7182E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583502870;
	bh=m3KpWPXFTfWpdWU+l0MN2adMrKMLUMebIh4I6QvhGVM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k53Ir5kgdpqZ1JiDBb97tTD9Tse8BRIhkUW50Cb1tnT6ljNB7oOfUlDdNaTaDE6wy
	 l4STVNhWQa3miltmrkrVnQDgKro5mKDmbiPrJfSlJIQS2SrbsoQYu6e5/K6wQpvP3t
	 Znx+3q/8uRzf7ww5zAaCeRqc9OSNfPgV0D1GO0kU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32049F801F5;
	Fri,  6 Mar 2020 14:52:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E41F0F801ED; Fri,  6 Mar 2020 14:52:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D01FBF80126
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 14:52:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D01FBF80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="bw8vDrt3"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tZWwhUzb"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 0CADF22308;
 Fri,  6 Mar 2020 08:52:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 06 Mar 2020 08:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=XfQMnnoevH6TTgCg1YWUap9SxZ
 iVasgzxkb4l/tr/0g=; b=bw8vDrt36/RCawM5yx8ucWv+dLvECKcrtFCc36wtGV
 LLfIGV9mrH1eA+ldfRq4w2lLkVPYtcKuJI5z+yBJZ6Z4tn2rvTeH+Qz8YJD4+2Il
 f768pBbP215BWQKcCHQEDFPRZaGq5xm3nXdmvXS4zyPe97dD/kVu3LRBWPyfW4f2
 NT4GtfABDgTf98MH5WEHS89JBWC9CR098OxlXZ3x2kDGD202iY/UVJ52d5QceUcn
 9Hujc3uLRNLIpfWCKQXzgR3znAWV7G9ui4HZad/YUsvPb88cuLMmCTcGuE3gWkfU
 btf3v5IHO3tmYSCamDdf6vQcfs1oy8KIh4PvKEqCNQgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=XfQMnnoevH6TTgCg1
 YWUap9SxZiVasgzxkb4l/tr/0g=; b=tZWwhUzb1uyj2Wj6Gysnival9G4RJt7Yg
 OUrP+inz8BW1PKYpyKpfIJlEIbSgpbbqUdmmPF1Mfpsg/x8M4P4mamVn1xN/mXsj
 c7WvkLwiDr+DMrAwPSy8qbH0tjWtMYjuoBcgy4u7U5SKK1onOI8RR0iV0dHSHZlB
 OkUB75RR6qsDWeLj3wZq3dUTe7bRverdyNlmS1u43xcTg/xUhg6YelVuCillwTPv
 XSpdEp80UE8A517YDm1x2RF0DQocnPKuRf36R5kquBmIt0/81JJX+1SEsLLhXvGn
 qfE/Yd+HmHwWhv9OaRh8WSAEJvNV1YNfwJXEWOlMmwVKU7YkPIZPQ==
X-ME-Sender: <xms:oFViXowSUehIx7D5w5PbCS3opHqfvMPMoMCGPh1f51NFO3mNVVHrTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudduvddgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeegrdduieeknecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:oFViXiuwplFIisThU5O7-j-3HDj5qUO_Xulrn8DFbZ03R7H52B8Z1w>
 <xmx:oFViXjLbEgb3siokGFF-zJW9grjdcC-pSNo3upvpzjF7ZAkLPbuaJw>
 <xmx:oFViXlw0vmV1T2hfquOQco8IZLimRToV8BE1AbAk_vPlkSrCav0lgg>
 <xmx:olViXv986OP0S_xhLHapRTUVOruYr1Wen_yr2Gf8nlYGwpq-tb5C1Q>
Received: from workstation.flets-east.jp (ae074168.dynamic.ppp.asahi-net.or.jp
 [14.3.74.168])
 by mail.messagingengine.com (Postfix) with ESMTPA id D33EF3280065;
 Fri,  6 Mar 2020 08:52:31 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH] ALSA: firewire: use KBUILD_MODNAME for struct driver.name
 instead of string
Date: Fri,  6 Mar 2020 22:52:29 +0900
Message-Id: <20200306135229.11659-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
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

KBUILD_MODNAME is available to name kernel modules according to its object
name. This commit uses the macro instead of string for name field of
struct driver since drivers in ALSA firewire stack have the same name of
each object name.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob.c         | 2 +-
 sound/firewire/digi00x/digi00x.c     | 2 +-
 sound/firewire/fireface/ff.c         | 2 +-
 sound/firewire/fireworks/fireworks.c | 2 +-
 sound/firewire/tascam/tascam.c       | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index 976d8cb9a34f..2c8e3392a490 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -509,7 +509,7 @@ MODULE_DEVICE_TABLE(ieee1394, bebob_id_table);
 static struct fw_driver bebob_driver = {
 	.driver = {
 		.owner	= THIS_MODULE,
-		.name	= "snd-bebob",
+		.name	= KBUILD_MODNAME,
 		.bus	= &fw_bus_type,
 	},
 	.probe    = bebob_probe,
diff --git a/sound/firewire/digi00x/digi00x.c b/sound/firewire/digi00x/digi00x.c
index 1f5fc0e7c024..c84b913a9fe0 100644
--- a/sound/firewire/digi00x/digi00x.c
+++ b/sound/firewire/digi00x/digi00x.c
@@ -192,7 +192,7 @@ MODULE_DEVICE_TABLE(ieee1394, snd_dg00x_id_table);
 static struct fw_driver dg00x_driver = {
 	.driver = {
 		.owner = THIS_MODULE,
-		.name = "snd-firewire-digi00x",
+		.name = KBUILD_MODNAME,
 		.bus = &fw_bus_type,
 	},
 	.probe    = snd_dg00x_probe,
diff --git a/sound/firewire/fireface/ff.c b/sound/firewire/fireface/ff.c
index f5a016560eb8..b62a4fd22407 100644
--- a/sound/firewire/fireface/ff.c
+++ b/sound/firewire/fireface/ff.c
@@ -224,7 +224,7 @@ MODULE_DEVICE_TABLE(ieee1394, snd_ff_id_table);
 static struct fw_driver ff_driver = {
 	.driver = {
 		.owner	= THIS_MODULE,
-		.name	= "snd-fireface",
+		.name	= KBUILD_MODNAME,
 		.bus	= &fw_bus_type,
 	},
 	.probe    = snd_ff_probe,
diff --git a/sound/firewire/fireworks/fireworks.c b/sound/firewire/fireworks/fireworks.c
index 134fc9ee26b9..b1cc013a3540 100644
--- a/sound/firewire/fireworks/fireworks.c
+++ b/sound/firewire/fireworks/fireworks.c
@@ -362,7 +362,7 @@ MODULE_DEVICE_TABLE(ieee1394, efw_id_table);
 static struct fw_driver efw_driver = {
 	.driver = {
 		.owner = THIS_MODULE,
-		.name = "snd-fireworks",
+		.name = KBUILD_MODNAME,
 		.bus = &fw_bus_type,
 	},
 	.probe    = efw_probe,
diff --git a/sound/firewire/tascam/tascam.c b/sound/firewire/tascam/tascam.c
index addc464503bc..5dac0d9fc58e 100644
--- a/sound/firewire/tascam/tascam.c
+++ b/sound/firewire/tascam/tascam.c
@@ -224,7 +224,7 @@ MODULE_DEVICE_TABLE(ieee1394, snd_tscm_id_table);
 static struct fw_driver tscm_driver = {
 	.driver = {
 		.owner = THIS_MODULE,
-		.name = "snd-firewire-tascam",
+		.name = KBUILD_MODNAME,
 		.bus = &fw_bus_type,
 	},
 	.probe    = snd_tscm_probe,
-- 
2.20.1

