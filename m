Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 696B624EC09
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Aug 2020 09:58:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E39FA1689;
	Sun, 23 Aug 2020 09:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E39FA1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598169502;
	bh=FKouIGp7h8M42dS4izildZZaOibRUlRs0wGCwfsAcng=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RwW0PYAw+5WNE+W/P4GgGJayZakyPiCbLLpqmocxGQi2LXN+gCQuxdIiAenGgfRn+
	 3oFWX5M8wdoWHrppkVeozpnKc1xx9NYf3qABw72Hsep1d5Scg1pfidYJBQ+YmxtSIO
	 h/EW0iVpFmxWi+QMla/tZUrEM/KnPdg+x9mNBrj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A28A1F8028A;
	Sun, 23 Aug 2020 09:56:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 755A8F80269; Sun, 23 Aug 2020 09:55:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A682F80245
 for <alsa-devel@alsa-project.org>; Sun, 23 Aug 2020 09:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A682F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="aBN92Efd"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="guV4SBDq"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 4EF9DA53;
 Sun, 23 Aug 2020 03:55:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 23 Aug 2020 03:55:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=EA40zx6RBV16MKKgEbqmJbniCx
 UVG6iebRrFErn1WXk=; b=aBN92EfdulBYc/G6Ik9jOrW7DEMo8quqOChzdDeFto
 9COCNeVXOj/OKkyoUhCmEmAm1+IXTkijHMyLiUoDfamNPEV40ppeenk5Nz2PstwW
 UHO2K0p52zXalvY0DmoSLuvHPFICU+rrKh4dSV80nPChgudS+6j2vCJKv8fxJPQ/
 HZ5d47Agc0nA7RdEdjYlbBBBQVFX4mFaYv4HVtM/WW35Psyp7gxNmaOMuzSZpVfN
 tsBHOJ8wPFd2IpiJR9GX+KIq33vZZzUSP8jrLTWvGah3KC6Ls7G5wZODzUbanCi7
 5xWc7Ev7Xi7jMrAJTV3R1u357uJMORuc0xshzgUdTDTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=EA40zx6RBV16MKKgE
 bqmJbniCxUVG6iebRrFErn1WXk=; b=guV4SBDqoUhNCiyiR6mlTr8VhOobiFsHB
 gwTO68WJXtoHvAGiP8tIz7fH04Ivznx3xi7snAq8ZPCUuL/EfELvvdTy7ZpfAFrm
 qmSlVxDMSrwTV0bDYLofuVKSJmyTbj8yjwzJ11oz4ALlrvTpEfFhNjOy8KUitkvD
 p5rfPiGpLinUAGnDWyHYfuUI/dPwQ6UWv7Rd4jum1oCFE8n2r89YIpGpPDeC43nJ
 4OQV+P2iPiqSacFx1W11Mej64JNQybLGnQYoAF81T4YeV9Y3a+nk4bA2xnlW4Pvp
 ptMbilGTtbtRJB/UAa17QDPDBKiVTZAuvSAtGWbQz3pBqg5sNcKUA==
X-ME-Sender: <xms:BCFCXx7FC6IoBJDXNlYupJm61Z96VkOrSRG8IHb3xBD8pJ5WfuivXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduhedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnhepudejteelhfdttdekgfdtueeilefhgfetjeejheekgeev
 uddvveegieehueeukeejnecukfhppedukedtrddvfeehrdefrdehgeenucevlhhushhtvg
 hrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:BCFCX-79uZXurSxLWGpcWALPFvtpgpcwekIFxbJZ1Q-cEOMqK2Yf0A>
 <xmx:BCFCX4dKHU13h-P0fxtylolNU1i_Mfjzna0AVaghuF3ZpGOpiXP37w>
 <xmx:BCFCX6JxxTExm86PdIimV5ucSrDoWmK72CLAE0PRrca43trokhnKUg>
 <xmx:BCFCXzhPyDGB6nmVkIr8WSmrL3hc5yJv37KjRQGcEoWhp21e9MO81Q>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 902B1328005A;
 Sun, 23 Aug 2020 03:55:47 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/2] ALSA: firewire-digi00x: exclude Avid Adrenaline from
 detection
Date: Sun, 23 Aug 2020 16:55:45 +0900
Message-Id: <20200823075545.56305-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Simon Wood <simon@mungewell.org>, alsa-devel@alsa-project.org,
 clemens@ladisch.de, stable@vger.kernel.org
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

Avid Adrenaline is reported that ALSA firewire-digi00x driver is bound to.
However, as long as he investigated, the design of this model is hardly
similar to the one of Digi 00x family. It's better to exclude the model
from modalias of ALSA firewire-digi00x driver.

This commit changes device entries so that the model is excluded.

$ python3 crpp < ~/git/am-config-rom/misc/avid-adrenaline.img
               ROM header and bus information block
               -----------------------------------------------------------------
400  04203a9c  bus_info_length 4, crc_length 32, crc 15004
404  31333934  bus_name "1394"
408  e064a002  irmc 1, cmc 1, isc 1, bmc 0, cyc_clk_acc 100, max_rec 10 (2048)
40c  00a07e01  company_id 00a07e     |
410  00085257  device_id 0100085257  | EUI-64 00a07e0100085257

               root directory
               -----------------------------------------------------------------
414  0005d08c  directory_length 5, crc 53388
418  0300a07e  vendor
41c  8100000c  --> descriptor leaf at 44c
420  0c008380  node capabilities
424  8d000002  --> eui-64 leaf at 42c
428  d1000004  --> unit directory at 438

               eui-64 leaf at 42c
               -----------------------------------------------------------------
42c  0002410f  leaf_length 2, crc 16655
430  00a07e01  company_id 00a07e     |
434  00085257  device_id 0100085257  | EUI-64 00a07e0100085257

               unit directory at 438
               -----------------------------------------------------------------
438  0004d6c9  directory_length 4, crc 54985
43c  1200a02d  specifier id: 1394 TA
440  13014001  version: Vender Unique and AV/C
444  17000001  model
448  81000009  --> descriptor leaf at 46c

               descriptor leaf at 44c
               -----------------------------------------------------------------
44c  00077205  leaf_length 7, crc 29189
450  00000000  textual descriptor
454  00000000  minimal ASCII
458  41766964  "Avid"
45c  20546563  " Tec"
460  686e6f6c  "hnol"
464  6f677900  "ogy"
468  00000000

               descriptor leaf at 46c
               -----------------------------------------------------------------
46c  000599a5  leaf_length 5, crc 39333
470  00000000  textual descriptor
474  00000000  minimal ASCII
478  41647265  "Adre"
47c  6e616c69  "nali"
480  6e650000  "ne"

Reported-by: Simon Wood <simon@mungewell.org>
Fixes: 9edf723fd858 ("ALSA: firewire-digi00x: add skeleton for Digi 002/003 family")
Cc: <stable@vger.kernel.org> # 4.4+
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/digi00x/digi00x.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/firewire/digi00x/digi00x.c b/sound/firewire/digi00x/digi00x.c
index c84b913a9fe0..ab8408966ec3 100644
--- a/sound/firewire/digi00x/digi00x.c
+++ b/sound/firewire/digi00x/digi00x.c
@@ -14,6 +14,7 @@ MODULE_LICENSE("GPL v2");
 #define VENDOR_DIGIDESIGN	0x00a07e
 #define MODEL_CONSOLE		0x000001
 #define MODEL_RACK		0x000002
+#define SPEC_VERSION		0x000001
 
 static int name_card(struct snd_dg00x *dg00x)
 {
@@ -175,14 +176,18 @@ static const struct ieee1394_device_id snd_dg00x_id_table[] = {
 	/* Both of 002/003 use the same ID. */
 	{
 		.match_flags = IEEE1394_MATCH_VENDOR_ID |
+			       IEEE1394_MATCH_VERSION |
 			       IEEE1394_MATCH_MODEL_ID,
 		.vendor_id = VENDOR_DIGIDESIGN,
+		.version = SPEC_VERSION,
 		.model_id = MODEL_CONSOLE,
 	},
 	{
 		.match_flags = IEEE1394_MATCH_VENDOR_ID |
+			       IEEE1394_MATCH_VERSION |
 			       IEEE1394_MATCH_MODEL_ID,
 		.vendor_id = VENDOR_DIGIDESIGN,
+		.version = SPEC_VERSION,
 		.model_id = MODEL_RACK,
 	},
 	{}
-- 
2.25.1

