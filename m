Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CD43A3F34
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 11:39:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 139BC1918;
	Fri, 11 Jun 2021 11:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 139BC1918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623404370;
	bh=AHWrocUWpbLKW2AzSG6TsnAId+jh+az6VTpssUqJOxE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sZK1WPtLR76TlUTJjLFnZx2AnqENRbMrdpd0g5013veIxt7zRzUzoeV2XyoNuddQ5
	 UoRdX80EyJt23Qm2VBOxnhwa5UWU2oqDsH6Q7MyjdkbGfT6tq0Al1jYV2k6iMETfel
	 ER9svPU00eJsrq4rHisKIiUaq0GMMSzjZF7Afq7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AACCF804C1;
	Fri, 11 Jun 2021 11:37:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7ED0F804BD; Fri, 11 Jun 2021 11:37:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A471F80212
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 11:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A471F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="qdaPtfX0"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Jrup4YXS"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id C412C1B00;
 Fri, 11 Jun 2021 05:37:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 11 Jun 2021 05:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=1qxI25uU7EIAp
 GdsMS/7IjnByhQ+OPEqq2kaypsy3Jc=; b=qdaPtfX0+8+dmRFZoCUe+ghFSjFLv
 YxP2jA4l+ENZKvsL8v73jgbbzkJptk0d+w2szAoX//pSs3f3Gi9E7ZZXlRmGdqET
 adW6bxovKBBdvB+5LrpDKwmVVHX612g4Wd+OcEsMOa5qywuBW+dqhIk3SrTw0PCa
 U7c44Ncs3nwikSLWtcYElF/ViflPk+hNvQzwHh/NmkT3u2mSqj07FmIUE1E9xurY
 Oe7fdVX0BGzt6JJmQWE5+tZRxriK5f/clVwVoWxESeS+nLLBU4KkdXjr3wCczSwp
 WlwbTGnDJMEWxb9wbKRjCEDPFje7ufun1HWP6z+bnKXBB4Rog15mflqHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=1qxI25uU7EIApGdsMS/7IjnByhQ+OPEqq2kaypsy3Jc=; b=Jrup4YXS
 uBOxJNG6/N+xCmCBldVkdZJzaujShsNEzVZAeitaUm1HWEy0EFtTD3Vfv1wWlkkL
 fZVwMAJettqf77oza8viERm8SzSGy2vP5AP65HljyJloZkY4JlJbgB6oJQB2TnfQ
 wMYvm//Fs5a+UKhtICUJicphcwC2S25drnaiJmqgSPVUd65ZYNNeIXsVjt4kVSUb
 UlZOpY6r/MPo9iAFK9IEkb3H3Ddx6XAoXn3l0/DMCPLHUHKOu7QBomVz/DIuJHeA
 rx/nql97VYnPI3lHfDbi9yxAUOYYyUbeomTXf0f1HBmuapaOUFSX4uyinFm+ZNni
 tWMymNcoD3Bd+A==
X-ME-Sender: <xms:4y7DYECOMxtTcHIi76rnLIwHXy9-2UYLm2Kx_bbs2aw7pioQG7EFjQ>
 <xme:4y7DYGgtt9H_ncuf9NPZJVRNm-caIg_klHYnj9FUqoZDWwk59_EgiK2wMy8hgJNvj
 8DPv3_wTyEa4wgJl2c>
X-ME-Received: <xmr:4y7DYHkdCuHR0CAhfs7iy47KLsKe8K2KtRU-YXHLSWT6cQL6mE6VkaUv-1oiaw37RmD-TzEs8aSAm1k4os7B9uHi16zPjkvTgXFbYSEvYnMSWiguwWp4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedujedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:4y7DYKyuOEbEHVnzpN_G0EhJ_GGd77Y3f18MSium_REbuXp0wwormg>
 <xmx:4y7DYJSr5D0kwmmMgcisi2x5z1v6IloaBXev62jI57vxmiprmjGucg>
 <xmx:4y7DYFai2tH1c48FD_7MSVxouky3CvYFvXOnJ19aID4olmgIBNbnbQ>
 <xmx:4y7DYIJj_m_xuxD4TFpDCg4yNE0wsYhHJXCRF62PU5quR0T-fyJFYg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jun 2021 05:37:38 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/6] ALSA: fireworks: fulfil device entries
Date: Fri, 11 Jun 2021 18:37:26 +0900
Message-Id: <20210611093730.78254-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210611093730.78254-1-o-takashi@sakamocchi.jp>
References: <20210611093730.78254-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

All of devices with Echo Audio Fireworks board module has the same
combination of specifier_id (0x00a02d) and version (0x010000) in
unit directory.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks.c | 15 +++++++++++++++
 sound/firewire/fireworks/fireworks.h |  8 --------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks.c b/sound/firewire/fireworks/fireworks.c
index 865dac3b37e6..ffb6dd796243 100644
--- a/sound/firewire/fireworks/fireworks.c
+++ b/sound/firewire/fireworks/fireworks.c
@@ -300,6 +300,21 @@ static void efw_remove(struct fw_unit *unit)
 	snd_card_free(efw->card);
 }
 
+#define SPECIFIER_1394TA	0x00a02d
+#define VERSION_EFW		0x010000
+
+#define SND_EFW_DEV_ENTRY(vendor, model) \
+{ \
+	.match_flags	= IEEE1394_MATCH_VENDOR_ID | \
+			  IEEE1394_MATCH_MODEL_ID | \
+			  IEEE1394_MATCH_SPECIFIER_ID | \
+			  IEEE1394_MATCH_VERSION, \
+	.vendor_id	= vendor,\
+	.model_id	= model, \
+	.specifier_id	= SPECIFIER_1394TA, \
+	.version	= VERSION_EFW, \
+}
+
 static const struct ieee1394_device_id efw_id_table[] = {
 	SND_EFW_DEV_ENTRY(VENDOR_LOUD, MODEL_MACKIE_400F),
 	SND_EFW_DEV_ENTRY(VENDOR_LOUD, MODEL_MACKIE_1200F),
diff --git a/sound/firewire/fireworks/fireworks.h b/sound/firewire/fireworks/fireworks.h
index 2c0c7de8b824..c8d5879efe28 100644
--- a/sound/firewire/fireworks/fireworks.h
+++ b/sound/firewire/fireworks/fireworks.h
@@ -224,12 +224,4 @@ int snd_efw_get_multiplier_mode(unsigned int sampling_rate, unsigned int *mode);
 
 int snd_efw_create_hwdep_device(struct snd_efw *efw);
 
-#define SND_EFW_DEV_ENTRY(vendor, model) \
-{ \
-	.match_flags	= IEEE1394_MATCH_VENDOR_ID | \
-			  IEEE1394_MATCH_MODEL_ID, \
-	.vendor_id	= vendor,\
-	.model_id	= model \
-}
-
 #endif
-- 
2.30.2

