Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C24193A3A8B
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 05:53:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A173185F;
	Fri, 11 Jun 2021 05:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A173185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623383582;
	bh=Qf9KsPw5Y8bMNh9OIVuZptwJv8Z3tSkY/P4uHNb/HxE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PFNDHOQPGC0moonCBLTjNP3jTxlsjfIP1NfX3uEr+sgUMItuocmPLH4i3QVwBt9Ch
	 dufvX+h+/DFB6AueoXKT8x6Xl1z9UBu1QPFOMFsoLsWQ/nlgNZXm8mNOv7xFOqEqR/
	 dQQ6izof4kKucgchyPxgSjw2M4E7k5VAn1eTZnGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EC01F804D1;
	Fri, 11 Jun 2021 05:50:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1C54F804D0; Fri, 11 Jun 2021 05:50:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD4FAF802DF
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 05:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD4FAF802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="sWjV5In0"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="swrPaBX8"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EB7771BA0;
 Thu, 10 Jun 2021 23:50:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 10 Jun 2021 23:50:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=bfl/ukndIIF39
 wCaiM/5LDPHoETJgNAUOMCfbxMlT70=; b=sWjV5In0mxOXZxNaLhUX6DJgQRZi2
 UmQyZSXlshChzUReMMVHWllnFPjfKm9GH/hHK9qqRTEz//9G0x+YQpTwyZg/fGuW
 OcwTyEp+ZECLScfdzwK8PTqZrfgKdz+m6O1mM7MGaDVZmKDKUtlqc1JIKb2Ol6lr
 VRxoAesTBToaAgcQI7r9tP1qhiVaELIRlP1VUuKvf7QB72ZYwn20Vt2vMLXfnWDX
 qoe9usj93LK3vMR0pg/FDUVAsMNzM7rgcjkv4nYHZAPmoeTW/AdW98VIepYJVzim
 WgWC160ZdCtn8ulaN3uKRHjSpM64pv89dUwkqJvT9+3uUU8W9rmEQdZhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=bfl/ukndIIF39wCaiM/5LDPHoETJgNAUOMCfbxMlT70=; b=swrPaBX8
 4FCrCN67yOt8f1jNAruBVbe8S0k/hCaqIXqO+AuY0w25ArEbT9PAalYu1MA2aSWY
 iW+wAciZTKWwJ/nSV1br0s9cDYuyQtWk2YXNHj9r0oeNYJT74eJSYAKyzkUV0Uvg
 3zYBLMmmw8VqMMVnvn8/HjfoBOAjwKWgjxaB8pPg9uW4i+1e56c/PUTuDsJzraPC
 UEnxRLs7uI69rU9T2xmKVzp2I8eSNqhew7Xln+kZU3eWzPJ4M5wwWgXiJb60KJZA
 Cs3gVvYvxveMgivUa5yuaLQG0UF5GdEKG6HekY05PTMQUSWDKMLKg9Yahb2G2+Wb
 kk+4kqpaT14LAg==
X-ME-Sender: <xms:d93CYFsXIT55rJ59vZTmAkzzQhvwKpYFzx2gkVeK7_N5FPWbzV2Q8g>
 <xme:d93CYOfP7OgAvr2LYWBCGPlTsm7K5X5DzZP9qxs3olfUaP2F0sh5rLuVjsDXZL0aO
 gmnPAvDbW_hPX9D-0A>
X-ME-Received: <xmr:d93CYIxn8uH_pT5dbF98dBxDCpkhyz29peWhthj9ZNK_C0wTJuYMjG8c_1R5Gpw9Nl-5Xhj0W_WZgLaDe4TDcGiRZkRLcxyv7tjDgZyOdayIKzTfYzOp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduiedgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:d93CYMNKMR8AmgKn09FoIW_qSGJUa9b_LotXT_RP_BK7t9lpCXk-wg>
 <xmx:d93CYF_LL9Ny7CExa8YvKCWzvcj9WnKfSjS-P-ZkLNUSTgdceU8C5g>
 <xmx:d93CYMWNizqy4Sr-_JJun4qrkwBwGq4COvMT44EZmoG3Koc6r6lg5Q>
 <xmx:d93CYHnLT6mQPZ_Lkzb0t3DGCzTqCo3CGgZqqCcON6aVSpDwEChtXg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jun 2021 23:50:14 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 3/3] ALSA: bebob: code refactoring for model-dependent quirks
Date: Fri, 11 Jun 2021 12:50:03 +0900
Message-Id: <20210611035003.26852-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210611035003.26852-1-o-takashi@sakamocchi.jp>
References: <20210611035003.26852-1-o-takashi@sakamocchi.jp>
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

This commit adds enumeration and structure member as code refactoring
regarding to model-dependent quirks.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob.c        | 34 ++++++++++++++++++++++++-----
 sound/firewire/bebob/bebob.h        |  8 +++++--
 sound/firewire/bebob/bebob_stream.c | 18 +++++++--------
 3 files changed, 42 insertions(+), 18 deletions(-)

diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index 25222cc27e43..452317e53565 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -159,6 +159,30 @@ check_audiophile_booted(struct fw_unit *unit)
 	return strncmp(name, "FW Audiophile Bootloader", 24) != 0;
 }
 
+static int detect_quirks(struct snd_bebob *bebob, const struct ieee1394_device_id *entry)
+{
+	if (entry->vendor_id == VEN_MAUDIO1) {
+		switch (entry->model_id) {
+		case MODEL_MAUDIO_PROFIRELIGHTBRIDGE:
+			// M-Audio ProFire Lightbridge has a quirk to transfer packets with
+			// discontinuous cycle or data block counter in early stage of packet
+			// streaming. The cycle span from the first packet with event is variable.
+			bebob->quirks |= SND_BEBOB_QUIRK_INITIAL_DISCONTINUOUS_DBC;
+			break;
+		case MODEL_MAUDIO_FW1814:
+		case MODEL_MAUDIO_PROJECTMIX:
+			// At high sampling rate, M-Audio special firmware transmits empty packet
+			// with the value of dbc incremented by 8.
+			bebob->quirks |= SND_BEBOB_QUIRK_WRONG_DBC;
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static int bebob_probe(struct fw_unit *unit, const struct ieee1394_device_id *entry)
 {
 	unsigned int card_index;
@@ -219,6 +243,10 @@ static int bebob_probe(struct fw_unit *unit, const struct ieee1394_device_id *en
 	if (err < 0)
 		goto error;
 
+	err = detect_quirks(bebob, entry);
+	if (err < 0)
+		goto error;
+
 	if (bebob->spec == &maudio_special_spec) {
 		if (entry->model_id == MODEL_MAUDIO_FW1814)
 			err = snd_bebob_maudio_special_discover(bebob, true);
@@ -230,12 +258,6 @@ static int bebob_probe(struct fw_unit *unit, const struct ieee1394_device_id *en
 	if (err < 0)
 		goto error;
 
-	// M-Audio ProFire Lightbridge has a quirk to transfer packets with discontinuous cycle or
-	// data block counter in early stage of packet streaming. The cycle span from the first
-	// packet with event is variable.
-	if (entry->vendor_id == VEN_MAUDIO1 && entry->model_id == MODEL_MAUDIO_PROFIRELIGHTBRIDGE)
-		bebob->discontinuity_quirk = true;
-
 	err = snd_bebob_stream_init_duplex(bebob);
 	if (err < 0)
 		goto error;
diff --git a/sound/firewire/bebob/bebob.h b/sound/firewire/bebob/bebob.h
index fc2b9b36159c..dff8e25c6ca3 100644
--- a/sound/firewire/bebob/bebob.h
+++ b/sound/firewire/bebob/bebob.h
@@ -75,6 +75,11 @@ struct snd_bebob_spec {
 	const struct snd_bebob_meter_spec *meter;
 };
 
+enum snd_bebob_quirk {
+	SND_BEBOB_QUIRK_INITIAL_DISCONTINUOUS_DBC,
+	SND_BEBOB_QUIRK_WRONG_DBC,
+};
+
 struct snd_bebob {
 	struct snd_card *card;
 	struct fw_unit *unit;
@@ -84,6 +89,7 @@ struct snd_bebob {
 	spinlock_t lock;
 
 	const struct snd_bebob_spec *spec;
+	unsigned int quirks;	// Combination of snd_bebob_quirk enumerations.
 
 	unsigned int midi_input_ports;
 	unsigned int midi_output_ports;
@@ -109,8 +115,6 @@ struct snd_bebob {
 	/* for M-Audio special devices */
 	void *maudio_special_quirk;
 
-	bool discontinuity_quirk;
-
 	struct amdtp_domain domain;
 };
 
diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 02972b32e170..e3e23e42add3 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -430,6 +430,7 @@ static int start_stream(struct snd_bebob *bebob, struct amdtp_stream *stream)
 
 static int init_stream(struct snd_bebob *bebob, struct amdtp_stream *stream)
 {
+	unsigned int flags = CIP_BLOCKING;
 	enum amdtp_stream_direction dir_stream;
 	struct cmp_connection *conn;
 	enum cmp_direction dir_conn;
@@ -445,24 +446,21 @@ static int init_stream(struct snd_bebob *bebob, struct amdtp_stream *stream)
 		dir_conn = CMP_INPUT;
 	}
 
+	if (stream == &bebob->tx_stream) {
+		if (bebob->quirks & SND_BEBOB_QUIRK_WRONG_DBC)
+			flags |= CIP_EMPTY_HAS_WRONG_DBC;
+	}
+
 	err = cmp_connection_init(conn, bebob->unit, dir_conn, 0);
 	if (err < 0)
 		return err;
 
-	err = amdtp_am824_init(stream, bebob->unit, dir_stream, CIP_BLOCKING);
+	err = amdtp_am824_init(stream, bebob->unit, dir_stream, flags);
 	if (err < 0) {
 		cmp_connection_destroy(conn);
 		return err;
 	}
 
-	if (stream == &bebob->tx_stream) {
-		// At high sampling rate, M-Audio special firmware transmits
-		// empty packet with the value of dbc incremented by 8 but the
-		// others are valid to IEC 61883-1.
-		if (bebob->maudio_special_quirk)
-			bebob->tx_stream.flags |= CIP_EMPTY_HAS_WRONG_DBC;
-	}
-
 	return 0;
 }
 
@@ -630,7 +628,7 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 		if (err < 0)
 			goto error;
 
-		if (!bebob->discontinuity_quirk)
+		if (!(bebob->quirks & SND_BEBOB_QUIRK_INITIAL_DISCONTINUOUS_DBC))
 			tx_init_skip_cycles = 0;
 		else
 			tx_init_skip_cycles = 16000;
-- 
2.27.0

