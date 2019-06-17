Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D54F247BFE
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 10:19:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B2DB1772;
	Mon, 17 Jun 2019 10:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B2DB1772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560759587;
	bh=8J85jK8JTj++sWVRZPXkrIcOJpOyZnOEd2UTdeK7BmU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ap9PWxqu97pzsBp916bRKr+bCtRIx4A2Do74ZmqRGxP0uqUUC1d64eNRsfIwbf4S3
	 d8snE3KPZTdrOj6VIgmSFhDGekzyayvzfieXzf212yDno6ixr0zs9s03b6dQBCYeOw
	 O+mFYdeRdy1jRE62pIiX1VP5yuvEp84xFzbhvuIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52B96F89739;
	Mon, 17 Jun 2019 10:15:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC312F89717; Mon, 17 Jun 2019 10:15:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69644F8075C
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 10:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69644F8075C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="vlFS7LTE"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Lb7Tn/OZ"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 7FBDF739;
 Mon, 17 Jun 2019 04:15:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 Jun 2019 04:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=1CJUjR1BL5jys
 ezE31dA1k61vTLzH5cO59Q7otywyPQ=; b=vlFS7LTEFBres/Vr9DifGj8Zr3tjT
 aVQDkiOq/i1NC+1z8uNrdNgo2wcF7vrTaYl3HkH65DeWHOBoSZmQrLk2imYELSOv
 B8r2b7Vu5YcXfhxJp2Q7CAcXg7/bQHwbKAq+7y12kkhMSmNOByomgYHiJQSPPfHS
 f+ZBDDk6r/0X9HVmIelmtshQn23MuPlx+1JEJhuuu6cp7njCecRP1vvNzvdvGeZj
 ovPochA+qkXdvq1N5Tg07YPytEscYncgx07x/iXPHW4C0viIcfvMwc9+hFZZDX+X
 Idj+TfOOSf6UaAITqbF3OYl5FfnqtREnSY7Pi4Xldpw7oYAPJaZ6UDNtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=1CJUjR1BL5jysezE31dA1k61vTLzH5cO59Q7otywyPQ=; b=Lb7Tn/OZ
 6J3VnZGvGLBwQnOxGEzFAuYBzZLSXRh2ghyOzAIDAdbCUFZgb6H0dhB6MQ2Lbuwk
 /mA3BBX99hWt/lE+uiBgU//Bu8uo8vfAkUeoVzdED4am/qonFiohm/OoEkZudxdO
 e8iNNKEq5S6+u7gu0nNCsqv+V9jUGpUA8B+ObIidDFL+0axPrvmrTbGe+tu6nWkc
 JiCZ0rIcRPyMBNWW//xVJPJb4poToIyE6ndYwrYdVtboU8byxrPbKuyrW1/kH/+q
 EO0fUWZ20H2I8/tEus6bK9oxg7/pByP/0CN6SRL3GU5rxEg0pnnnPGmq5C+UWKWC
 qC+J+IZ4DtC5qw==
X-ME-Sender: <xms:F0wHXaVzW-J2baz6T1nTd8w5GvXiEMnzaKdsl4TnEIbpE3ZXKluYzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeijedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:GEwHXag6qdjDfbAnmJAIyM9QuQNWPgaLe1_R6R8syG4WL-mLxZr3tw>
 <xmx:GEwHXS-glxG1hFHOlMuEG-LjuGVNeS0eHm6m8qNESMVaKmyvEYVA2g>
 <xmx:GEwHXZR3czqQWmlJQVMlA6cwdV-1WqRcSdWMJIbWrgkCvbCo9NYvUw>
 <xmx:GEwHXbZuI3EnwXkns5nUQd95wxMPnX8BMQ8vEmCNrfrnCao0YdeRFA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id BA14F80062;
 Mon, 17 Jun 2019 04:15:18 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 17 Jun 2019 17:15:03 +0900
Message-Id: <20190617081510.11025-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
References: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 03/10] ALSA: firewire-motu: add helper function
	to keep isochronous resources
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

This commit is a part of preparation to perform allocation/release
of isochronous resources in pcm.hw_params/hw_free callbacks.

This commit adds a helper function to allocate isochronous resources.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-stream.c | 57 +++++++++++++++++--------------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index c136d7f8c49c..35b4e0f72fe2 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -26,48 +26,55 @@
 #define  RX_PACKET_EXCLUDE_DIFFERED_DATA_CHUNKS	0x00000040
 #define  TX_PACKET_TRANSMISSION_SPEED_MASK	0x0000000f
 
-static int start_both_streams(struct snd_motu *motu, unsigned int rate)
+static int keep_resources(struct snd_motu *motu, unsigned int rate,
+			  struct amdtp_stream *stream)
 {
+	struct fw_iso_resources *resources;
+	struct snd_motu_packet_format *packet_format;
 	unsigned int midi_ports = 0;
-	__be32 reg;
-	u32 data;
 	int err;
 
-	if ((motu->spec->flags & SND_MOTU_SPEC_RX_MIDI_2ND_Q) ||
-	    (motu->spec->flags & SND_MOTU_SPEC_RX_MIDI_3RD_Q))
-		midi_ports = 1;
+	if (stream == &motu->rx_stream) {
+		resources = &motu->rx_resources;
+		packet_format = &motu->rx_packet_formats;
 
-	/* Set packet formation to our packet streaming engine. */
-	err = amdtp_motu_set_parameters(&motu->rx_stream, rate, midi_ports,
-					&motu->rx_packet_formats);
-	if (err < 0)
-		return err;
+		if ((motu->spec->flags & SND_MOTU_SPEC_RX_MIDI_2ND_Q) ||
+		    (motu->spec->flags & SND_MOTU_SPEC_RX_MIDI_3RD_Q))
+			midi_ports = 1;
+	} else {
+		resources = &motu->tx_resources;
+		packet_format = &motu->tx_packet_formats;
 
-	if ((motu->spec->flags & SND_MOTU_SPEC_TX_MIDI_2ND_Q) ||
-	    (motu->spec->flags & SND_MOTU_SPEC_TX_MIDI_3RD_Q))
-		midi_ports = 1;
-	else
-		midi_ports = 0;
+		if ((motu->spec->flags & SND_MOTU_SPEC_TX_MIDI_2ND_Q) ||
+		    (motu->spec->flags & SND_MOTU_SPEC_TX_MIDI_3RD_Q))
+			midi_ports = 1;
+	}
 
-	err = amdtp_motu_set_parameters(&motu->tx_stream, rate, midi_ports,
-					&motu->tx_packet_formats);
+	err = amdtp_motu_set_parameters(stream, rate, midi_ports,
+					packet_format);
 	if (err < 0)
 		return err;
 
-	/* Get isochronous resources on the bus. */
-	err = fw_iso_resources_allocate(&motu->rx_resources,
-				amdtp_stream_get_max_payload(&motu->rx_stream),
+	return fw_iso_resources_allocate(resources,
+				amdtp_stream_get_max_payload(stream),
 				fw_parent_device(motu->unit)->max_speed);
+}
+
+static int start_both_streams(struct snd_motu *motu, unsigned int rate)
+{
+	__be32 reg;
+	u32 data;
+	int err;
+
+	err = keep_resources(motu, rate, &motu->tx_stream);
 	if (err < 0)
 		return err;
 
-	err = fw_iso_resources_allocate(&motu->tx_resources,
-				amdtp_stream_get_max_payload(&motu->tx_stream),
-				fw_parent_device(motu->unit)->max_speed);
+	err = keep_resources(motu, rate, &motu->rx_stream);
 	if (err < 0)
 		return err;
 
-	/* Configure the unit to start isochronous communication. */
+	// Configure the unit to start isochronous communication.
 	err = snd_motu_transaction_read(motu, ISOC_COMM_CONTROL_OFFSET, &reg,
 					sizeof(reg));
 	if (err < 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
