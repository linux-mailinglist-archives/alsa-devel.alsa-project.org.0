Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C92A3AD8A8
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Jun 2021 10:41:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2DD4171A;
	Sat, 19 Jun 2021 10:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2DD4171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624092068;
	bh=FZlkVqyh3hEQ1ueawBoetkk+DXTKis/ipsBbqNwyDY0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bh2zMaG+iiP2nBLlS2G0YR1FuY3nf9Ueny0vZv7ygvhp99MBW2y/LDnIhbjHOeWbu
	 o6I6FtL5rN6qcDCkknR4HoIw2aAQUx28VXkyolSMMpZQvSxx6cgYpESi5ZXwUhuXbx
	 PCI4j5gjxJ6Pi4Np+ABAaG4OEdUo7ovwlZLs/SCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D165F8025E;
	Sat, 19 Jun 2021 10:39:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2999AF8025A; Sat, 19 Jun 2021 10:39:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2AA0F80084
 for <alsa-devel@alsa-project.org>; Sat, 19 Jun 2021 10:39:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2AA0F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="K1cDasYb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="pXXTN9o0"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 319385C00A8;
 Sat, 19 Jun 2021 04:39:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sat, 19 Jun 2021 04:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=Pv51wQYb8Iv+14WuKYtlBdcpO9
 ksJBp+LqlyRwYtSjg=; b=K1cDasYbr2qFK9z++dhq3RSY1X7HirUqDTwoyMXwsD
 yLX9oVBdQBx9pETuiJDxJzqjpcW2eXuMgWRntiUs7fx4JHs8HoT6sY+mHGTN/qzB
 6RGXky99YnrWODWpL2HSQWMhvL/3/OWGCSvi6yZXsRTodoLoahjE1vVe1NxrTkTD
 BEz2gph8ovo/UuSM3N4u2yQoo6dJDmPZCbaoILcMCWvCyBesnZqfTdxCKWStTC2G
 541Is2P8/JoVSpeBujaNp/5zaqylAtui0XwqLtYvDp4QQyjWCr3fwyX6nHOAYr0o
 tvIfri/M5bXzZzvm7lAaBkcJXgn6cNNlYpbAqdNdGYDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Pv51wQYb8Iv+14WuK
 YtlBdcpO9ksJBp+LqlyRwYtSjg=; b=pXXTN9o0X441n7jbGvlgXlESZCEMGBpst
 STHDIVYyd21mgulk6kXPb9Fyn0WrHKODyK0NtyzmXCALbvczjyxW2nyxgc95C48B
 p06TECqnPiq+UQHNBcF+HI3k6rO+nKs0p54HwzJoSDluMxieztdd3TXRg5PSZxke
 uPqV8q3n8JUBIJmeVdk3eg6MSb3lLd7XZO0pd+LZ49MsodlIIAS85HviURvQyWbL
 T/RGzv6inbVIuif4oTRdXIW4K95CDNLyAfNZ/5nwMNXj+uVlDyeTjJsi/OMC8vLR
 WifeoM7MQiPgJvdRA0BCT0BltfuIECPaKr+D/zwqJVWa9p58aOHIw==
X-ME-Sender: <xms:P63NYOIURSfUEe321ONazAeSCdrzZi0MB99_CZALT7O9p5q7mxL6Yw>
 <xme:P63NYGIMe02ZFq00kYSrstR21wWzw94s1QQOG1zMCF7ZNKJjqChvH-RyKXUtt0koT
 7E71mKC6quo_xhzWMc>
X-ME-Received: <xmr:P63NYOupPOimSvvPAioRm93jGsBZvFK6J7ZfHx1qIcEYFX8go4mHtkCi0e7LYoiCUBn7ZTgRuuc_6Pwsv0JhAWAuTXvuP6nGHWGjejFXbKT246i2Lcqf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefhedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghshhhi
 ucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqe
 enucggtffrrghtthgvrhhnpeetieeuhfejkeekfeehteeikedvgeefhffggfdvieehhefh
 heeivdfhgfejjeduudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihes
 shgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:P63NYDbnBBZqFbHOvllDIE77m5X1c9sr1cu3Ec-vcdOP4CDKjSSBLw>
 <xmx:P63NYFa63P1Kw7b-GGR7cBwdFlU_1azx8w_TI4csxSzfbjD0PAX77A>
 <xmx:P63NYPA2k0KcEwE97byC3Nf2j9pOQfr3KBox2En3uRhtWlbORJ3PVg>
 <xmx:QK3NYEl8aOYrgtylhEutE6X7fr1_tlgPqsf6ZDJmYDeK-vcIFDBNSg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 19 Jun 2021 04:39:26 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: bebob: add support for ToneWeal FW66
Date: Sat, 19 Jun 2021 17:39:22 +0900
Message-Id: <20210619083922.16060-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Daniel Jozsef <daniel.jozsef@gmail.com>, alsa-devel@alsa-project.org,
 clemens@ladisch.de
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

A user of FFADO project reported the issue of ToneWeal FW66. As a result,
the device is identified as one of applications of BeBoB solution.

I note that in the report the device returns contradictory result in plug
discovery process for audio subunit. Fortunately ALSA BeBoB driver doesn't
perform it thus it's likely to handle the device without issues.

I receive no reaction to test request for this patch yet, however it would
be worth to add support for it.

daniel@gibbonmoon:/sys/bus/firewire/devices/fw1$ grep -r . *
Binary file config_rom matches
dev:244:1
guid:0x0023270002000000
hardware_version:0x000002
is_local:0
model:0x020002
model_name:FW66
power/runtime_active_time:0
power/runtime_active_kids:0
power/runtime_usage:0
power/runtime_status:unsupported
power/async:disabled
power/runtime_suspended_time:0
power/runtime_enabled:disabled
power/control:auto
subsystem/drivers_autoprobe:1
uevent:MAJOR=244
uevent:MINOR=1
uevent:DEVNAME=fw1
units:0x00a02d:0x010001
vendor:0x002327
vendor_name:ToneWeal
fw1.0/uevent:MODALIAS=ieee1394:ven00002327mo00020002sp0000A02Dver00010001
fw1.0/power/runtime_active_time:0
fw1.0/power/runtime_active_kids:0
fw1.0/power/runtime_usage:0
fw1.0/power/runtime_status:unsupported
fw1.0/power/async:disabled
fw1.0/power/runtime_suspended_time:0
fw1.0/power/runtime_enabled:disabled
fw1.0/power/control:auto
fw1.0/model:0x020002
fw1.0/rom_index:15
fw1.0/specifier_id:0x00a02d
fw1.0/model_name:FW66
fw1.0/version:0x010001
fw1.0/modalias:ieee1394:ven00002327mo00020002sp0000A02Dver00010001

Cc: Daniel Jozsef <daniel.jozsef@gmail.com>
Reference: https://lore.kernel.org/alsa-devel/20200119164335.GA11974@workstation/
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/Kconfig       | 1 +
 sound/firewire/bebob/bebob.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/sound/firewire/Kconfig b/sound/firewire/Kconfig
index 62658e2b111a..fd109bea4c53 100644
--- a/sound/firewire/Kconfig
+++ b/sound/firewire/Kconfig
@@ -127,6 +127,7 @@ config SND_BEBOB
 	  * M-Audio Ozonic/NRV10/ProfireLightBridge
 	  * M-Audio FireWire 1814/ProjectMix IO
 	  * Digidesign Mbox 2 Pro
+	  * ToneWeal FW66
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-bebob.
diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index 7ca452efb133..42980da45fbf 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -56,6 +56,7 @@ static DECLARE_BITMAP(devices_used, SNDRV_CARDS);
 #define VEN_FOCUSRITE	0x0000130e
 #define VEN_MAUDIO	0x00000d6c
 #define VEN_DIGIDESIGN	0x00a07e
+#define OUI_SHOUYO	0x002327
 
 #define MODEL_FOCUSRITE_SAFFIRE_BOTH	0x00000000
 #define MODEL_MAUDIO_AUDIOPHILE_BOTH	0x00010060
@@ -469,6 +470,8 @@ static const struct ieee1394_device_id bebob_id_table[] = {
 			    &maudio_special_spec),
 	/* Digidesign Mbox 2 Pro */
 	SND_BEBOB_DEV_ENTRY(VEN_DIGIDESIGN, 0x0000a9, &spec_normal),
+	// Toneweal FW66.
+	SND_BEBOB_DEV_ENTRY(OUI_SHOUYO, 0x020002, &spec_normal),
 	/* IDs are unknown but able to be supported */
 	/*  Apogee, Mini-ME Firewire */
 	/*  Apogee, Mini-DAC Firewire */
-- 
2.30.2

