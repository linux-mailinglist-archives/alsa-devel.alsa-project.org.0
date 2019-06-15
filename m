Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFEF46F3F
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jun 2019 11:16:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E049189B;
	Sat, 15 Jun 2019 11:15:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E049189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560590182;
	bh=Vd80hOSVRCsf4V1Mkk8741hVCbwBH367NS/wPQLcJ2I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NNSzF/LaFc/Px8+Z2C8lmNgvisiH7zK7Hnc9IrdaRZyCuXKAw3WrC/jIQepFuTzUp
	 RRJ7AAANrsS2z4TbMzIYvyJCZ2IwadAwuAfPRZL7Olu0EyzjlOoJiPbYAf53GzQr6P
	 4XcvzBZRfI4RK0l1KBUG+c+Y+OzFUaanCKPOzXLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6383F89743;
	Sat, 15 Jun 2019 11:11:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBF8EF89734; Sat, 15 Jun 2019 11:11:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43675F89731
 for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2019 11:11:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43675F89731
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="nhVJuCMB"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="0kcxARqs"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id A007F46A;
 Sat, 15 Jun 2019 05:11:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 15 Jun 2019 05:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=/81eNqMiRUtz5
 0ppyzO9NsO6fuyB/SBws34Szbj79t0=; b=nhVJuCMBuY2sj5XhDyw51FsbxsW8+
 PRTajmS1nuW3TNqUq2mEPQz4GE27oVYkcXRoVZHN/E7rqiIPWXg1ic5TG6a4ZX3j
 FCS5qaYexs++ZZhdj6BavCZArr+gaadXUMafS6HUDBiYLPMHXQbte0xgXGmu3Ofe
 pFUjfHQqZZhYk1GTLggmexMy4+/e2fMnNy+7YgxFkF+9tKqJD/6OJaFTGp6tvmna
 e3n/+3hDWkN923+DoSwSTJdBFlXlMWbXbSE4YcjwRFmsP5rOopLDz4gpOnHRjxrd
 8oXWCyHwHQXFwZYFdxPLzdAwfDa9L+irTxReLeMWH5jpgtb0CDr4Ruaaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=/81eNqMiRUtz50ppyzO9NsO6fuyB/SBws34Szbj79t0=; b=0kcxARqs
 /aHolQ0t5xQH7R0VkOpx7t2Dx7nz4YNGg0guC4fo07WhstciEV0ReUb3A0e4t+dY
 QsikVyE+l/TT+WIynvZSXVfgkxKptvBi1XuWz1BZfo/TnoA11IzJoVATlIzi5cVT
 ROLuTSTo8BnoV7wudFKSqv3TweeAMN2Hr/Jn31O6u4siaDt99KUEAtDFOoNTFZCq
 1wqsxwv6yQaqVh+4A3JinQmINLSqEs/6BjnWph2gughi/OH/EbQH/JY721yJ/zDX
 7dGnK46I9ddltEuc0ckNEm8eJajHURZek1I2VwB/SxPRoHpgw1tICN43clwNT01w
 iGSiNix4QBE1ZA==
X-ME-Sender: <xms:NrYEXflC3cC3gWljKN6sGQxciNZUSH_enuXbHVh9e7ArrpgKajed4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeifedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepge
X-ME-Proxy: <xmx:NrYEXbd9O4uRyQakRcOhptPW1BG97W5m3QxYlX5w-CxvEtcITdyxBg>
 <xmx:NrYEXdHD30iyr1Ifde3hvBgrx3D91HMXbBkRQHqavKWn7CsQXBChGw>
 <xmx:NrYEXRhBq6OFkPjgGMRlR55tUpUbRu0au-AOJx79wTinKwS27oNBcw>
 <xmx:NrYEXd2vtcAOtMDeZgxexK0H_UbnzaMg4y39Lf-vnW7wxmVabIp3nA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 847CA8005A;
 Sat, 15 Jun 2019 05:11:16 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sat, 15 Jun 2019 18:11:01 +0900
Message-Id: <20190615091101.7515-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190615091101.7515-1-o-takashi@sakamocchi.jp>
References: <20190615091101.7515-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 6/6] ALSA: firewire-lib: split allocation of
	isochronous resources from establishment of connection
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

In current implementation, establishment connection corresponds to
allocation of isochronous resources. Although this is an ideal
implementation of CMP described in IEC 61883-1, it's not enough
efficient to recover PCM substream multiplexed in packet streaming.
The packet streaming can always restart on the same allocated
isochronous resources even if the previous packet streaming
corrupted.

This commit splits allocation of isochronous resources from
establishment of connection so that CMP runs with allocated
isochronous resources.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob_stream.c         | 30 ++++++---
 sound/firewire/cmp.c                        | 74 ++++++++++++---------
 sound/firewire/cmp.h                        |  7 +-
 sound/firewire/fireworks/fireworks_stream.c | 22 ++++--
 sound/firewire/oxfw/oxfw-stream.c           | 18 +++--
 5 files changed, 100 insertions(+), 51 deletions(-)

diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 9ef4663d13e5..1070a675179d 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -404,13 +404,11 @@ static int make_both_connections(struct snd_bebob *bebob)
 {
 	int err = 0;
 
-	err = cmp_connection_establish(&bebob->out_conn,
-			amdtp_stream_get_max_payload(&bebob->tx_stream));
+	err = cmp_connection_establish(&bebob->out_conn);
 	if (err < 0)
 		return err;
 
-	err = cmp_connection_establish(&bebob->in_conn,
-			amdtp_stream_get_max_payload(&bebob->rx_stream));
+	err = cmp_connection_establish(&bebob->in_conn);
 	if (err < 0) {
 		cmp_connection_break(&bebob->out_conn);
 		return err;
@@ -533,14 +531,23 @@ static int keep_resources(struct snd_bebob *bebob, struct amdtp_stream *stream,
 			  unsigned int rate, unsigned int index)
 {
 	struct snd_bebob_stream_formation *formation;
+	struct cmp_connection *conn;
+	int err;
 
-	if (stream == &bebob->tx_stream)
+	if (stream == &bebob->tx_stream) {
 		formation = bebob->tx_stream_formations + index;
-	else
+		conn = &bebob->out_conn;
+	} else {
 		formation = bebob->rx_stream_formations + index;
+		conn = &bebob->in_conn;
+	}
+
+	err = amdtp_am824_set_parameters(stream, rate, formation->pcm,
+					 formation->midi, false);
+	if (err < 0)
+		return err;
 
-	return amdtp_am824_set_parameters(stream, rate, formation->pcm,
-					  formation->midi, false);
+	return cmp_connection_reserve(conn, amdtp_stream_get_max_payload(stream));
 }
 
 int snd_bebob_stream_reserve_duplex(struct snd_bebob *bebob, unsigned int rate)
@@ -591,8 +598,10 @@ int snd_bebob_stream_reserve_duplex(struct snd_bebob *bebob, unsigned int rate)
 			return err;
 
 		err = keep_resources(bebob, &bebob->rx_stream, rate, index);
-		if (err < 0)
+		if (err < 0) {
+			cmp_connection_release(&bebob->out_conn);
 			return err;
+		}
 	}
 
 	return 0;
@@ -685,6 +694,9 @@ void snd_bebob_stream_stop_duplex(struct snd_bebob *bebob)
 		amdtp_stream_stop(&bebob->tx_stream);
 
 		break_both_connections(bebob);
+
+		cmp_connection_release(&bebob->out_conn);
+		cmp_connection_release(&bebob->in_conn);
 	}
 }
 
diff --git a/sound/firewire/cmp.c b/sound/firewire/cmp.c
index ae3bc1940efa..5dedc4f31842 100644
--- a/sound/firewire/cmp.c
+++ b/sound/firewire/cmp.c
@@ -185,6 +185,37 @@ void cmp_connection_destroy(struct cmp_connection *c)
 }
 EXPORT_SYMBOL(cmp_connection_destroy);
 
+int cmp_connection_reserve(struct cmp_connection *c,
+			   unsigned int max_payload_bytes)
+{
+	int err;
+
+	mutex_lock(&c->mutex);
+
+	if (WARN_ON(c->resources.allocated)) {
+		err = -EBUSY;
+		goto end;
+	}
+
+	c->speed = min(c->max_speed,
+		       fw_parent_device(c->resources.unit)->max_speed);
+
+	err = fw_iso_resources_allocate(&c->resources, max_payload_bytes,
+					c->speed);
+end:
+	mutex_unlock(&c->mutex);
+
+	return err;
+}
+EXPORT_SYMBOL(cmp_connection_reserve);
+
+void cmp_connection_release(struct cmp_connection *c)
+{
+	mutex_lock(&c->mutex);
+	fw_iso_resources_free(&c->resources);
+	mutex_unlock(&c->mutex);
+}
+EXPORT_SYMBOL(cmp_connection_release);
 
 static __be32 ipcr_set_modify(struct cmp_connection *c, __be32 ipcr)
 {
@@ -270,25 +301,18 @@ static int pcr_set_check(struct cmp_connection *c, __be32 pcr)
  * When this function succeeds, the caller is responsible for starting
  * transmitting packets.
  */
-int cmp_connection_establish(struct cmp_connection *c,
-			     unsigned int max_payload_bytes)
+int cmp_connection_establish(struct cmp_connection *c)
 {
 	int err;
 
-	if (WARN_ON(c->connected))
-		return -EISCONN;
-
-	c->speed = min(c->max_speed,
-		       fw_parent_device(c->resources.unit)->max_speed);
-
 	mutex_lock(&c->mutex);
 
-retry_after_bus_reset:
-	err = fw_iso_resources_allocate(&c->resources,
-					max_payload_bytes, c->speed);
-	if (err < 0)
-		goto err_mutex;
+	if (WARN_ON(c->connected)) {
+		mutex_unlock(&c->mutex);
+		return -EISCONN;
+	}
 
+retry_after_bus_reset:
 	if (c->direction == CMP_OUTPUT)
 		err = pcr_modify(c, opcr_set_modify, pcr_set_check,
 				 ABORT_ON_BUS_RESET);
@@ -297,21 +321,13 @@ int cmp_connection_establish(struct cmp_connection *c,
 				 ABORT_ON_BUS_RESET);
 
 	if (err == -EAGAIN) {
-		fw_iso_resources_free(&c->resources);
-		goto retry_after_bus_reset;
+		err = fw_iso_resources_update(&c->resources);
+		if (err >= 0)
+			goto retry_after_bus_reset;
 	}
-	if (err < 0)
-		goto err_resources;
-
-	c->connected = true;
-
-	mutex_unlock(&c->mutex);
-
-	return 0;
+	if (err >= 0)
+		c->connected = true;
 
-err_resources:
-	fw_iso_resources_free(&c->resources);
-err_mutex:
 	mutex_unlock(&c->mutex);
 
 	return err;
@@ -351,14 +367,12 @@ int cmp_connection_update(struct cmp_connection *c)
 				 SUCCEED_ON_BUS_RESET);
 
 	if (err < 0)
-		goto err_resources;
+		goto err_unconnect;
 
 	mutex_unlock(&c->mutex);
 
 	return 0;
 
-err_resources:
-	fw_iso_resources_free(&c->resources);
 err_unconnect:
 	c->connected = false;
 	mutex_unlock(&c->mutex);
@@ -395,8 +409,6 @@ void cmp_connection_break(struct cmp_connection *c)
 	if (err < 0)
 		cmp_error(c, "plug is still connected\n");
 
-	fw_iso_resources_free(&c->resources);
-
 	c->connected = false;
 
 	mutex_unlock(&c->mutex);
diff --git a/sound/firewire/cmp.h b/sound/firewire/cmp.h
index b60b415caa8f..26ab88000e34 100644
--- a/sound/firewire/cmp.h
+++ b/sound/firewire/cmp.h
@@ -42,8 +42,11 @@ int cmp_connection_init(struct cmp_connection *connection,
 int cmp_connection_check_used(struct cmp_connection *connection, bool *used);
 void cmp_connection_destroy(struct cmp_connection *connection);
 
-int cmp_connection_establish(struct cmp_connection *connection,
-			     unsigned int max_payload);
+int cmp_connection_reserve(struct cmp_connection *connection,
+			   unsigned int max_payload);
+void cmp_connection_release(struct cmp_connection *connection);
+
+int cmp_connection_establish(struct cmp_connection *connection);
 int cmp_connection_update(struct cmp_connection *connection);
 void cmp_connection_break(struct cmp_connection *connection);
 
diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index 61342c49dc38..81c1bb209a89 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -63,8 +63,7 @@ static int start_stream(struct snd_efw *efw, struct amdtp_stream *stream,
 		conn = &efw->in_conn;
 
 	// Establish connection via CMP.
-	err = cmp_connection_establish(conn,
-				       amdtp_stream_get_max_payload(stream));
+	err = cmp_connection_establish(conn);
 	if (err < 0)
 		return err;
 
@@ -177,17 +176,25 @@ static int keep_resources(struct snd_efw *efw, struct amdtp_stream *stream,
 {
 	unsigned int pcm_channels;
 	unsigned int midi_ports;
+	struct cmp_connection *conn;
+	int err;
 
 	if (stream == &efw->tx_stream) {
 		pcm_channels = efw->pcm_capture_channels[mode];
 		midi_ports = efw->midi_out_ports;
+		conn = &efw->out_conn;
 	} else {
 		pcm_channels = efw->pcm_playback_channels[mode];
 		midi_ports = efw->midi_in_ports;
+		conn = &efw->in_conn;
 	}
 
-	return amdtp_am824_set_parameters(stream, rate, pcm_channels,
-					  midi_ports, false);
+	err = amdtp_am824_set_parameters(stream, rate, pcm_channels,
+					 midi_ports, false);
+	if (err < 0)
+		return err;
+
+	return cmp_connection_reserve(conn, amdtp_stream_get_max_payload(stream));
 }
 
 int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate)
@@ -228,8 +235,10 @@ int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate)
 			return err;
 
 		err = keep_resources(efw, &efw->rx_stream, rate, mode);
-		if (err < 0)
+		if (err < 0) {
+			cmp_connection_release(&efw->in_conn);
 			return err;
+		}
 	}
 
 	return 0;
@@ -285,6 +294,9 @@ void snd_efw_stream_stop_duplex(struct snd_efw *efw)
 	if (efw->substreams_counter == 0) {
 		stop_stream(efw, &efw->tx_stream);
 		stop_stream(efw, &efw->rx_stream);
+
+		cmp_connection_release(&efw->out_conn);
+		cmp_connection_release(&efw->in_conn);
 	}
 }
 
diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 837733f10736..a8bc798731ff 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -111,8 +111,7 @@ static int start_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 	else
 		conn = &oxfw->out_conn;
 
-	err = cmp_connection_establish(conn,
-				       amdtp_stream_get_max_payload(stream));
+	err = cmp_connection_establish(conn);
 	if (err < 0)
 		return err;
 
@@ -203,15 +202,18 @@ static int keep_resources(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 	enum avc_general_plug_dir dir;
 	u8 **formats;
 	struct snd_oxfw_stream_formation formation;
+	struct cmp_connection *conn;
 	int i;
 	int err;
 
 	if (stream == &oxfw->rx_stream) {
 		dir = AVC_GENERAL_PLUG_DIR_IN;
 		formats = oxfw->rx_stream_formats;
+		conn = &oxfw->in_conn;
 	} else {
 		dir = AVC_GENERAL_PLUG_DIR_OUT;
 		formats = oxfw->tx_stream_formats;
+		conn = &oxfw->out_conn;
 	}
 
 	err = snd_oxfw_stream_get_current_formation(oxfw, dir, &formation);
@@ -239,8 +241,12 @@ static int keep_resources(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 	if (formation.pcm == 0)
 		return -EINVAL;
 
-	return amdtp_am824_set_parameters(stream, formation.rate, formation.pcm,
+	err = amdtp_am824_set_parameters(stream, formation.rate, formation.pcm,
 					 formation.midi * 8, false);
+	if (err < 0)
+		return err;
+
+	return cmp_connection_reserve(conn, amdtp_stream_get_max_payload(stream));
 }
 
 int snd_oxfw_stream_reserve_duplex(struct snd_oxfw *oxfw,
@@ -299,8 +305,10 @@ int snd_oxfw_stream_reserve_duplex(struct snd_oxfw *oxfw,
 
 		if (oxfw->has_output) {
 			err = keep_resources(oxfw, &oxfw->tx_stream);
-			if (err < 0)
+			if (err < 0) {
+				cmp_connection_release(&oxfw->in_conn);
 				return err;
+			}
 		}
 	}
 
@@ -361,10 +369,12 @@ void snd_oxfw_stream_stop_duplex(struct snd_oxfw *oxfw)
 	if (oxfw->substreams_count == 0) {
 		amdtp_stream_stop(&oxfw->rx_stream);
 		cmp_connection_break(&oxfw->in_conn);
+		cmp_connection_release(&oxfw->in_conn);
 
 		if (oxfw->has_output) {
 			amdtp_stream_stop(&oxfw->tx_stream);
 			cmp_connection_break(&oxfw->out_conn);
+			cmp_connection_release(&oxfw->out_conn);
 		}
 	}
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
