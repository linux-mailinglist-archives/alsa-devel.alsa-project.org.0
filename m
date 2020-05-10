Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D41B1CC7BA
	for <lists+alsa-devel@lfdr.de>; Sun, 10 May 2020 09:46:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEE84166B;
	Sun, 10 May 2020 09:45:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEE84166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589096803;
	bh=OzHrAYxeWqcimv03EqlB6sLQFLa+Tf2ewcd3xmLkMMY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r71wIQPEeMbR2yabreXNbHS6rR/2CsWbnQwC7uE/TNhjdenY1Pg6j3jG/OySP35Os
	 YrV/74f6e9Zq6/byXzrzO4bL2V1cDrla9zgpYeQ3sFiFFxj4bQAKB7/4q64AX7jI0D
	 Vmn3KaLRddWbb0vJK5+na9wb1iq8PId8cC1yg86s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68E1AF802A0;
	Sun, 10 May 2020 09:43:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94BC9F8027D; Sun, 10 May 2020 09:43:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3B20F80158
 for <alsa-devel@alsa-project.org>; Sun, 10 May 2020 09:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3B20F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="J2KxumKm"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="0xXLKg2m"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id A98475C0090;
 Sun, 10 May 2020 03:43:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 10 May 2020 03:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=T0pGWYEClGeyY
 ISJYddvzFRck3Y4t7wQf5OrcBbXPHQ=; b=J2KxumKmj83HAYIKKhYoDdqi4De3L
 2XTyt1unFiBYil7NmoyoxNyxYHKbWXAJi1OpVK2cXLLzFHEFD3W5f4iMNUd5x/DD
 rve8vjynwhPd94puOhHaHf7Eswxos80grdtakYJac+pfX5W2PyTALoIfwJKsPQBj
 QqbDOeOF5m68JXHgQwZHG/URI2ibM2XTC52wSO6g/ezRGiMifWyb9o2/JUEWbUoy
 JRt5nCHnvI2+vrl2a3mmCp2Gl/8KAD7uoIx+u25tbfmfTFX8IvKCtRFePEcY2I0D
 3mKxPWtDeEFxkqGIBv0qN7/PaCamG5wMqupMuv5CRdx/vJ9yK58YVgr3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=T0pGWYEClGeyYISJYddvzFRck3Y4t7wQf5OrcBbXPHQ=; b=0xXLKg2m
 ZYvEuyn99Bo3/tS4YFEUYm7p+k5LTPVu8P5UR7A91VRnlEU5ZYCOUGMCd70Vjkrc
 Ru4ZulGzGa58NSC1WL6FPCfk1QyytokCFPt+7OtkzDTzfNg5cfZxHuKjql9UMGGR
 uGuifEqwScWcNHeQ0RchW7bbrYnSYj3wNTpk0w33E1mtoRImRI2QcmHij6wZVjJQ
 cTuzzt+VhQiHxQR/53HzWoKRxJwj1gVB/K8jPJKOjqrLays82vAPBRlxy7kUJiTo
 cryur47c0/BYGesSB9kcJm/MN852RSh73gc8LGU9Fs/5U5COtyKtyyv9yzO5quV+
 WiAdk6D0migc7A==
X-ME-Sender: <xms:jbC3XtcTtIMqi2ABRqRviorDrcpdTjCpan9zAoxhvyWE-DSFJ_j9Rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkeejgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeekte
 fgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudektddr
 vdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:jbC3XniJXlvQu6oc0z-GAfvViV940ikRpyUaxOfzTyZW0PtUAYDWNQ>
 <xmx:jbC3XpRhYbAR7MUjFf8vQqhrcST9Bw0i9ugqmGj1ldQKVv3sVSwPnA>
 <xmx:jbC3XowjJbzRQXZsne5lYyArXA_Gf9f-RaBQWWD_U_ZmnG7vo1sLkA>
 <xmx:jbC3XhN6CZxpd-0rnM7ZKmibcCJFcviB8ljcFfNRs97nlsUw9TOstQ>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 76C463066258;
 Sun, 10 May 2020 03:43:08 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 3/6] ALSA: fireface: code refactoring to add enumeration
 constants for model identification
Date: Sun, 10 May 2020 16:42:58 +0900
Message-Id: <20200510074301.116224-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200510074301.116224-1-o-takashi@sakamocchi.jp>
References: <20200510074301.116224-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ffado-devel@lists.sourceforge.net
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

In RME fireface series, version field of unit directory in configuration
ROM is used to distinguish each model. The value of field is known and
it's better to use enumeration constants for code representation.

This commit adds enumeration constants for model identification.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff.c | 6 +++---
 sound/firewire/fireface/ff.h | 6 ++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/fireface/ff.c b/sound/firewire/fireface/ff.c
index b62a4fd22407..b295e40a425d 100644
--- a/sound/firewire/fireface/ff.c
+++ b/sound/firewire/fireface/ff.c
@@ -189,7 +189,7 @@ static const struct ieee1394_device_id snd_ff_id_table[] = {
 				  IEEE1394_MATCH_MODEL_ID,
 		.vendor_id	= OUI_RME,
 		.specifier_id	= OUI_RME,
-		.version	= 0x000001,
+		.version	= SND_FF_UNIT_VERSION_FF800,
 		.model_id	= 0x101800,
 		.driver_data	= (kernel_ulong_t)&spec_ff800,
 	},
@@ -201,7 +201,7 @@ static const struct ieee1394_device_id snd_ff_id_table[] = {
 				  IEEE1394_MATCH_MODEL_ID,
 		.vendor_id	= OUI_RME,
 		.specifier_id	= OUI_RME,
-		.version	= 0x000002,
+		.version	= SND_FF_UNIT_VERSION_FF400,
 		.model_id	= 0x101800,
 		.driver_data	= (kernel_ulong_t)&spec_ff400,
 	},
@@ -213,7 +213,7 @@ static const struct ieee1394_device_id snd_ff_id_table[] = {
 				  IEEE1394_MATCH_MODEL_ID,
 		.vendor_id	= OUI_RME,
 		.specifier_id	= OUI_RME,
-		.version	= 0x000004,
+		.version	= SND_FF_UNIT_VERSION_UCX,
 		.model_id	= 0x101800,
 		.driver_data	= (kernel_ulong_t)&spec_ucx,
 	},
diff --git a/sound/firewire/fireface/ff.h b/sound/firewire/fireface/ff.h
index dc7a20f75983..62ad921c3706 100644
--- a/sound/firewire/fireface/ff.h
+++ b/sound/firewire/fireface/ff.h
@@ -34,6 +34,12 @@
 #define SND_FF_IN_MIDI_PORTS		2
 #define SND_FF_OUT_MIDI_PORTS		2
 
+enum snd_ff_unit_version {
+	SND_FF_UNIT_VERSION_FF800	= 0x000001,
+	SND_FF_UNIT_VERSION_FF400	= 0x000002,
+	SND_FF_UNIT_VERSION_UCX		= 0x000004,
+};
+
 enum snd_ff_stream_mode {
 	SND_FF_STREAM_MODE_LOW = 0,
 	SND_FF_STREAM_MODE_MID,
-- 
2.25.1

