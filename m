Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE373DBDA4
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 08:25:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 741361654;
	Fri, 18 Oct 2019 08:24:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 741361654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571379920;
	bh=KLfqvZfQRL0jIFNh47DrYc/G52dKDlSOm3jBpsHFdH0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hK/Zb5r8d/6klKTnveJRle9PV5i3c2kQVGmSilcDV5JuAAj/dxG9kREihc8Gv/UGd
	 6DAATFecQRl3gvLC2VIJSXkxkUsKlvf6byyRxo/ZEPDCBNuWiFs2vHtzQHW6Yujpnk
	 bxPDWA+2RuGaY0MAPdj0jUxgFEqaw3owvGyEiM9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E41FF8065D;
	Fri, 18 Oct 2019 08:19:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F795F805FD; Fri, 18 Oct 2019 08:19:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 142EBF80534
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 08:19:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 142EBF80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="UEPnb2ZZ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ZLGD/kVl"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 4983E3C2;
 Fri, 18 Oct 2019 02:19:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 18 Oct 2019 02:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=M+tdzcwzo4gAH
 cWljbgFSZaKlKtUyhaHZtzBBvLzfMo=; b=UEPnb2ZZon1xyvIu8wtJNyaobf3C3
 YmxStFLySfgK0NjdK0kv5zNZkLT4I9ZvKjYuG/x5zOM6LWRFyoJnwVsfhpLalGex
 DqRCO+4v9wBC7bdZHpnZU5eGHQaA58c2ajVpNLyZ+olFuWcAZkNbAT5N/YOq2rDD
 Hs0RoOBDHAcLkqQOu3dCgsjQiRCoyUCbxoCvQ1ycC23m8p0q5VORA6o2OjrZ7pAC
 N6Z1oiIEu9bywfKRRS2R1WsZ2G6HpM3NRyax0vRVRUaZ+snBNITU410dGqraIuLi
 Tv6B6UVQKfVR0Kmw99h7u4y2dDuRXL2u4rLCLkRjW+GrKZigCpbLk5TZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=M+tdzcwzo4gAHcWljbgFSZaKlKtUyhaHZtzBBvLzfMo=; b=ZLGD/kVl
 rVQoW79mzjResS5enfCQ+W0EWDn2ZdZJc+H3A9RAmbPBvDbPx+40ISWjSQBGzqJ2
 7Z1F0VFrqRCoGah84aTG6JIIu/9iWSeVjV22p1woEzZcIyPEpsG6yyu3wm4sZlQh
 K9tawzBZ4FJZdSexMjsWfPiq5f7XzT+LEJIi/g/PALO/IQKNelVTh5Ex6zWDf6aD
 qZmOcszKJkxEmv0B9g+ccIF8OHmRtG0wdhspinkId121GAUJMUaGgXQdbCkTI+kh
 FwcQYclP0VY0+sY0YNH/SG1VwvfPecegDCloIv3izmIZtyfIWKN1pRwBLa22Og8z
 y5dabkbIUtUqRQ==
X-ME-Sender: <xms:bVmpXVuOBnVuBu7SO8uX_f4Jwsf9iclPJ4TTExsaKoy0LihaBq6fXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeekgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepge
X-ME-Proxy: <xmx:bVmpXT9-Myjgiida1GIJkt7WSkS7-q9eqljIEzvvJYMosgbynLW9uQ>
 <xmx:bVmpXRHyh8ewZSHpFLMkLjTXYjk8taMnr4T91_k08iCYueyhZrIUhA>
 <xmx:bVmpXaQWwJnDGq3RCTitKzsdg5ewkFpkLn2UfuWzkp6w6P1ZZjtCRQ>
 <xmx:bVmpXfAykJN7JZ3RYpCUmFwEoayTxnuSG31zr_dNUrPra9gKNmtc0A>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7311380065;
 Fri, 18 Oct 2019 02:19:24 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 15:19:11 +0900
Message-Id: <20191018061911.24909-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018061911.24909-1-o-takashi@sakamocchi.jp>
References: <20191018061911.24909-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 6/6] ALSA: firewire-lib: postpone to start IR
	context
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

Some devices have a quirk to postpone transmission of isoc packet for
several dozen or hundred isoc cycles since configured to transmit.
Furthermore, some devices have a quirk to transmit isoc packet with
discontinued data of its header.

In 1394 OHCI specification, software allows to start isoc context with
certain isoc cycle. Linux firewire subsystem has kernel API to use it
as well.

This commit uses the functionality of 1394 OHCI controller to handle
the quirks. At present, this feature is convenient to ALSA bebob and
fireface driver. As a result, some devices can be safely handled, as
long as I know:
 - MAudio FireWire solo
 - MAudio ProFire Lightbridge
 - MAudio FireWire 410
 - Roland FA-66

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c               | 79 +++++++++++++++++++--
 sound/firewire/amdtp-stream.h               |  2 +-
 sound/firewire/bebob/bebob_stream.c         | 10 ++-
 sound/firewire/dice/dice-stream.c           |  2 +-
 sound/firewire/digi00x/digi00x-stream.c     |  2 +-
 sound/firewire/fireface/ff-stream.c         | 10 ++-
 sound/firewire/fireworks/fireworks_stream.c |  2 +-
 sound/firewire/motu/motu-stream.c           |  2 +-
 sound/firewire/oxfw/oxfw-stream.c           |  2 +-
 sound/firewire/tascam/tascam-stream.c       |  2 +-
 10 files changed, 98 insertions(+), 15 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 48be31eae9a5..37d38efb4c87 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/firewire.h>
+#include <linux/firewire-constants.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <sound/pcm.h>
@@ -983,13 +984,16 @@ static void amdtp_stream_master_first_callback(struct fw_iso_context *context,
  * @d: the AMDTP domain to which the AMDTP stream belongs
  * @is_irq_target: whether isoc context for the AMDTP stream is used to generate
  *		   hardware IRQ.
+ * @start_cycle: the isochronous cycle to start the context. Start immediately
+ *		 if negative value is given.
  *
  * The stream cannot be started until it has been configured with
  * amdtp_stream_set_parameters() and it must be started before any PCM or MIDI
  * device can be started.
  */
 static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
-			      struct amdtp_domain *d, bool is_irq_target)
+			      struct amdtp_domain *d, bool is_irq_target,
+			      int start_cycle)
 {
 	static const struct {
 		unsigned int data_block;
@@ -1146,7 +1150,7 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 		tag |= FW_ISO_CONTEXT_MATCH_TAG0;
 
 	s->callbacked = false;
-	err = fw_iso_context_start(s->context, -1, 0, tag);
+	err = fw_iso_context_start(s->context, start_cycle, 0, tag);
 	if (err < 0)
 		goto err_pkt_descs;
 
@@ -1339,14 +1343,40 @@ int amdtp_domain_add_stream(struct amdtp_domain *d, struct amdtp_stream *s,
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_add_stream);
 
+static int get_current_cycle_time(struct fw_card *fw_card, int *cur_cycle)
+{
+	int generation;
+	int rcode;
+	__be32 reg;
+	u32 data;
+
+	// This is a request to local 1394 OHCI controller and expected to
+	// complete without any event waiting.
+	generation = fw_card->generation;
+	smp_rmb();	// node_id vs. generation.
+	rcode = fw_run_transaction(fw_card, TCODE_READ_QUADLET_REQUEST,
+				   fw_card->node_id, generation, SCODE_100,
+				   CSR_REGISTER_BASE + CSR_CYCLE_TIME,
+				   &reg, sizeof(reg));
+	if (rcode != RCODE_COMPLETE)
+		return -EIO;
+
+	data = be32_to_cpu(reg);
+	*cur_cycle = data >> 12;
+
+	return 0;
+}
+
 /**
  * amdtp_domain_start - start sending packets for isoc context in the domain.
  * @d: the AMDTP domain.
+ * @ir_delay_cycle: the cycle delay to start all IR contexts.
  */
-int amdtp_domain_start(struct amdtp_domain *d)
+int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 {
 	struct amdtp_stream *s;
-	int err = 0;
+	int cycle;
+	int err;
 
 	// Select an IT context as IRQ target.
 	list_for_each_entry(s, &d->streams, list) {
@@ -1357,17 +1387,54 @@ int amdtp_domain_start(struct amdtp_domain *d)
 		return -ENXIO;
 	d->irq_target = s;
 
+	if (ir_delay_cycle > 0) {
+		struct fw_card *fw_card = fw_parent_device(s->unit)->card;
+
+		err = get_current_cycle_time(fw_card, &cycle);
+		if (err < 0)
+			return err;
+
+		// No need to care overflow in cycle field because of enough
+		// width.
+		cycle += ir_delay_cycle;
+
+		// Round up to sec field.
+		if ((cycle & 0x00001fff) >= CYCLES_PER_SECOND) {
+			unsigned int sec;
+
+			// The sec field can overflow.
+			sec = (cycle & 0xffffe000) >> 13;
+			cycle = (++sec << 13) |
+				((cycle & 0x00001fff) / CYCLES_PER_SECOND);
+		}
+
+		// In OHCI 1394 specification, lower 2 bits are available for
+		// sec field.
+		cycle &= 0x00007fff;
+	} else {
+		cycle = -1;
+	}
+
 	list_for_each_entry(s, &d->streams, list) {
+		int cycle_match;
+
+		if (s->direction == AMDTP_IN_STREAM) {
+			cycle_match = cycle;
+		} else {
+			// IT context starts immediately.
+			cycle_match = -1;
+		}
+
 		if (s != d->irq_target) {
 			err = amdtp_stream_start(s, s->channel, s->speed, d,
-						 false);
+						 false, cycle_match);
 			if (err < 0)
 				goto error;
 		}
 	}
 
 	s = d->irq_target;
-	err = amdtp_stream_start(s, s->channel, s->speed, d, true);
+	err = amdtp_stream_start(s, s->channel, s->speed, d, true, -1);
 	if (err < 0)
 		goto error;
 
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index c4bde69c2d4f..f2d44e2dc3c8 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -288,7 +288,7 @@ void amdtp_domain_destroy(struct amdtp_domain *d);
 int amdtp_domain_add_stream(struct amdtp_domain *d, struct amdtp_stream *s,
 			    int channel, int speed);
 
-int amdtp_domain_start(struct amdtp_domain *d);
+int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle);
 void amdtp_domain_stop(struct amdtp_domain *d);
 
 static inline int amdtp_domain_set_events_per_period(struct amdtp_domain *d,
diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 5e4a61458be2..7ac0d9f495c4 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -658,7 +658,15 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_domain_start(&bebob->domain);
+		// The device postpones start of transmission mostly for 1 sec
+		// after receives packets firstly. For safe, IR context starts
+		// 1.5 sec (=12000 cycles) later. This is within 2.0 sec
+		// (=CALLBACK_TIMEOUT).
+		// Furthermore, some devices transfer isoc packets with
+		// discontinuous counter in the beginning of packet streaming.
+		// The delay has an effect to avoid detection of this
+		// discontinuity.
+		err = amdtp_domain_start(&bebob->domain, 12000);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index 0cff346e8052..6a3d60913e10 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -462,7 +462,7 @@ int snd_dice_stream_start_duplex(struct snd_dice *dice)
 			goto error;
 		}
 
-		err = amdtp_domain_start(&dice->domain);
+		err = amdtp_domain_start(&dice->domain, 0);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index 0c539188ba18..405d6903bfbc 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -375,7 +375,7 @@ int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_domain_start(&dg00x->domain);
+		err = amdtp_domain_start(&dg00x->domain, 0);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/fireface/ff-stream.c b/sound/firewire/fireface/ff-stream.c
index a13754f914e8..63b79c4a5405 100644
--- a/sound/firewire/fireface/ff-stream.c
+++ b/sound/firewire/fireface/ff-stream.c
@@ -184,6 +184,7 @@ int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
 	 */
 	if (!amdtp_stream_running(&ff->rx_stream)) {
 		int spd = fw_parent_device(ff->unit)->max_speed;
+		unsigned int ir_delay_cycle;
 
 		err = ff->spec->protocol->begin_session(ff, rate);
 		if (err < 0)
@@ -199,7 +200,14 @@ int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_domain_start(&ff->domain);
+		// The device postpones start of transmission mostly for several
+		// cycles after receiving packets firstly.
+		if (ff->spec->protocol == &snd_ff_protocol_ff800)
+			ir_delay_cycle = 800;	// = 100 msec
+		else
+			ir_delay_cycle = 16;	// = 2 msec
+
+		err = amdtp_domain_start(&ff->domain, ir_delay_cycle);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index f35a33d4d4e6..2206af0fef42 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -272,7 +272,7 @@ int snd_efw_stream_start_duplex(struct snd_efw *efw)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_domain_start(&efw->domain);
+		err = amdtp_domain_start(&efw->domain, 0);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 9975770c9b1f..a17ddceb1bec 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -260,7 +260,7 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu)
 		if (err < 0)
 			goto stop_streams;
 
-		err = amdtp_domain_start(&motu->domain);
+		err = amdtp_domain_start(&motu->domain, 0);
 		if (err < 0)
 			goto stop_streams;
 
diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 995e9c5bd84b..501a80094bf7 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -355,7 +355,7 @@ int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw)
 			}
 		}
 
-		err = amdtp_domain_start(&oxfw->domain);
+		err = amdtp_domain_start(&oxfw->domain, 0);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index a9b3b7eb6d21..eb07e1decf9b 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -473,7 +473,7 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_domain_start(&tscm->domain);
+		err = amdtp_domain_start(&tscm->domain, 0);
 		if (err < 0)
 			return err;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
