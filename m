Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA681CC7BC
	for <lists+alsa-devel@lfdr.de>; Sun, 10 May 2020 09:48:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E705315F2;
	Sun, 10 May 2020 09:47:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E705315F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589096884;
	bh=tifCb5FYnFqQgdtgItfMbTQl269oFvKE9+s64YxRmGM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j8grZdTsq7s6en3Gm8DIw15iuz6jcDBqYsZ019Ni3icXCpf0UVflu8c6gfTjbyPkJ
	 5gQIU6fDHxVFS2YjFk21+h8HHF88PpJvv0hpWgj7bYCGpW3sk1DRUrdrbizErYOhQm
	 bsaQ2mpu4QzVtwNdfAciiiurCmpUflShQszjvvoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6306F802C4;
	Sun, 10 May 2020 09:43:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7004F802C2; Sun, 10 May 2020 09:43:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE227F8021D
 for <alsa-devel@alsa-project.org>; Sun, 10 May 2020 09:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE227F8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="aJ85auD1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="w4Ik+ZWP"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 0CA8C5C00E5;
 Sun, 10 May 2020 03:43:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 10 May 2020 03:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=5zW9USb7YyWkq
 Rkg/IvsAkba5Mq+2knZqmTJOPBA4KI=; b=aJ85auD1lnzOCgC4/WLa9ZtIWbjTt
 jiR0bSXV7sEgBpHR2OUYAFIHBRj/aVOgArun9569XvWBa/IldXwhxdS+payvu1Pq
 WSIsJIALWkK94JZT5dSkPd35xZAMqsNNx/eWANCfsFyFwb3SOIFMQRw6c8Gav5de
 xmt8vgQQe9v5chSUhJvCQU1GRec6EeWy+/IuCsjROrmWaqV1aElGNtrxi+VDIuss
 gUjDFAcZXdufcz3En5Ej9mXZtUdFry9zWFtjnp9FUrK1pP2QcTkJIUVdDMB7xPhT
 YCDCdvTCBNHpim084l2TauUAfDQn7rfrmms1Rjq0bsibHFl/T8xc873/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=5zW9USb7YyWkqRkg/IvsAkba5Mq+2knZqmTJOPBA4KI=; b=w4Ik+ZWP
 VsYM0xc/sReasiEgFtx4o3/ezdssm6rhILT2PonhouVegoug0iA8xDMD7H6cvFS1
 MU29mCTgAVo2i8UJiqqbTyKHo2qJjwzXJuFHZD/YogRWBxASJRGnYrNQZqv78lcr
 2V0D10Tk9SGXClF8HuLjsQNdGvSqSSHgcSUYAPvFuo+fCTez9hFPclGhUvTcATpV
 6HnCrSZ5tQqavT/lPDHoIp2SMQibshOeefiYpmHGEf9wQ9LurnA6Mcxykny3h91O
 AvbjK0/t0HO49Qs0h6SLsZwDOy5rLrmEimp8irPMj/SOB7O8Jaf7Oeh5qLrgN5CG
 OCW+qZJgg6d/6Q==
X-ME-Sender: <xms:kbC3XpsitlvKXP6X2YkQs7qOomhw7goHfXqcgpMLr23OOV5FEkHLew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkeejgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeekte
 fgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudektddr
 vdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:kbC3XoFnJy1vB98Cx_84wrXOoUUR5uANipc9oFVd29lT8UwZxQyCpg>
 <xmx:kbC3Xk2tiB9KvFMosSgS6pfCr3cCo2WZPIMTXTl6reqWp-uB6saiEg>
 <xmx:kbC3Xo7SMBARns020KkKUc4qDJov8TKXjFKAbxTE-nzRddCul9dyYw>
 <xmx:krC3Xm0jrrJK2hqUrsE1V_OIrzTBHfO-p3WtoLsmO4qo64r1uoHg2Q>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id C53EC3066258;
 Sun, 10 May 2020 03:43:12 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 6/6] ALSA: fireface: add support for RME Fireface UFX
 (untested)
Date: Sun, 10 May 2020 16:43:01 +0900
Message-Id: <20200510074301.116224-7-o-takashi@sakamocchi.jp>
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

Fireface UFX was shipped by RME GmbH in 2010, and now discontinued.
Although this model has some enhanced feature which Fireface 802
doesn't have (e.g. on-board USB mass storage device class, configuration
interface with color display), the functionality relevant to
packet communication on IEEE 1394 bus seems to be the same as
Fireface 802 (e.g. available number of channels for PCM frame in
each sampling transfer frequency).

With the assumption, this commit adds support for Fireface UFX. In ALSA
fireface driver, these two models are handled as the same one.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/Kconfig                       |  1 +
 sound/firewire/fireface/ff-protocol-latter.c |  2 +-
 sound/firewire/fireface/ff.c                 | 17 +++++++++++++++--
 sound/firewire/fireface/ff.h                 |  1 +
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/Kconfig b/sound/firewire/Kconfig
index 4f39ef924a1a..f7ed69d60310 100644
--- a/sound/firewire/Kconfig
+++ b/sound/firewire/Kconfig
@@ -164,6 +164,7 @@ config SND_FIREFACE
 	 Say Y here to include support for RME fireface series.
 	  * Fireface 400
 	  * Fireface 800
+	  * Fireface UFX
 	  * Fireface UCX
 	  * Fireface 802
 
diff --git a/sound/firewire/fireface/ff-protocol-latter.c b/sound/firewire/fireface/ff-protocol-latter.c
index ea885e725950..8d3b23778eb2 100644
--- a/sound/firewire/fireface/ff-protocol-latter.c
+++ b/sound/firewire/fireface/ff-protocol-latter.c
@@ -199,7 +199,7 @@ static int latter_begin_session(struct snd_ff *ff, unsigned int rate)
 		else
 			return -EINVAL;
 	} else {
-		// For Fireface 802. Due to bandwidth limitation on
+		// For Fireface UFX and 802. Due to bandwidth limitation on
 		// IEEE 1394a (400 Mbps), Analog 1-12 and AES are available
 		// without any ADAT at quadruple speed.
 		if (rate >= 32000 && rate <= 48000)
diff --git a/sound/firewire/fireface/ff.c b/sound/firewire/fireface/ff.c
index e4140116f3cc..bc39269415d2 100644
--- a/sound/firewire/fireface/ff.c
+++ b/sound/firewire/fireface/ff.c
@@ -19,6 +19,7 @@ static void name_card(struct snd_ff *ff)
 	const char *const names[] = {
 		[SND_FF_UNIT_VERSION_FF800]	= "Fireface800",
 		[SND_FF_UNIT_VERSION_FF400]	= "Fireface400",
+		[SND_FF_UNIT_VERSION_UFX]	= "FirefaceUFX",
 		[SND_FF_UNIT_VERSION_UCX]	= "FirefaceUCX",
 		[SND_FF_UNIT_VERSION_802]	= "Fireface802",
 	};
@@ -187,7 +188,7 @@ static const struct snd_ff_spec spec_ucx = {
 	.midi_rx_addrs = {0xffff00000030ull, 0xffff00000030ull},
 };
 
-static const struct snd_ff_spec spec_802 = {
+static const struct snd_ff_spec spec_ufx_802 = {
 	.pcm_capture_channels = {30, 22, 14},
 	.pcm_playback_channels = {30, 22, 14},
 	.midi_in_ports = 1,
@@ -223,6 +224,18 @@ static const struct ieee1394_device_id snd_ff_id_table[] = {
 		.model_id	= 0x101800,
 		.driver_data	= (kernel_ulong_t)&spec_ff400,
 	},
+	// Fireface UFX.
+	{
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
+				  IEEE1394_MATCH_SPECIFIER_ID |
+				  IEEE1394_MATCH_VERSION |
+				  IEEE1394_MATCH_MODEL_ID,
+		.vendor_id	= OUI_RME,
+		.specifier_id	= OUI_RME,
+		.version	= SND_FF_UNIT_VERSION_UFX,
+		.model_id	= 0x101800,
+		.driver_data	= (kernel_ulong_t)&spec_ufx_802,
+	},
 	// Fireface UCX.
 	{
 		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
@@ -245,7 +258,7 @@ static const struct ieee1394_device_id snd_ff_id_table[] = {
 		.specifier_id	= OUI_RME,
 		.version	= SND_FF_UNIT_VERSION_802,
 		.model_id	= 0x101800,
-		.driver_data	= (kernel_ulong_t)&spec_802,
+		.driver_data	= (kernel_ulong_t)&spec_ufx_802,
 	},
 	{}
 };
diff --git a/sound/firewire/fireface/ff.h b/sound/firewire/fireface/ff.h
index 1282a57c009f..705e7df4f929 100644
--- a/sound/firewire/fireface/ff.h
+++ b/sound/firewire/fireface/ff.h
@@ -37,6 +37,7 @@
 enum snd_ff_unit_version {
 	SND_FF_UNIT_VERSION_FF800	= 0x000001,
 	SND_FF_UNIT_VERSION_FF400	= 0x000002,
+	SND_FF_UNIT_VERSION_UFX		= 0x000003,
 	SND_FF_UNIT_VERSION_UCX		= 0x000004,
 	SND_FF_UNIT_VERSION_802		= 0x000005,
 };
-- 
2.25.1

