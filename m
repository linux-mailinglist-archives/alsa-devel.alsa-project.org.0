Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 270EB2F131D
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 14:04:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A244B16C2;
	Mon, 11 Jan 2021 14:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A244B16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610370280;
	bh=Q7/NT5QACk5oSg2TvTmZeJJFOtmc0RYEEhI3LMHfiZM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HYPlkOYb8T1mj6wcWhiogSyg7F4554H2HhgpWQPYRNNSgEs/fMewdkjy6PCYYJkPB
	 UYC9XnaB6OOAIcBsJfFX6Qm3f1wY88nhWOWUNwD+8FAu1ydHbZhfdwk1myNtFHEPmL
	 ycg/RBbJgfF8Z2BvTB5O/tYoLdopLOOI2AcJ4ZC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD4CCF8025F;
	Mon, 11 Jan 2021 14:03:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BCECF8026B; Mon, 11 Jan 2021 14:03:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94520F8016C
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 14:02:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94520F8016C
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id FR2u2400j4C55Sk06R2uHp; Mon, 11 Jan 2021 14:02:55 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kywqU-002pvS-A9; Mon, 11 Jan 2021 14:02:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kywqT-001W0u-RF; Mon, 11 Jan 2021 14:02:53 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Clemens Ladisch <clemens@ladisch.de>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH/RFC 2/2] ALSA: firewire-tascam: Fix integer overflow in
 midi_port_work()
Date: Mon, 11 Jan 2021 14:02:51 +0100
Message-Id: <20210111130251.361335-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111130251.361335-1-geert+renesas@glider.be>
References: <20210111130251.361335-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
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

As snd_fw_async_midi_port.consume_bytes is unsigned int, and
NSEC_PER_SEC is 1000000000L, the second multiplication in

    port->consume_bytes * 8 * NSEC_PER_SEC / 31250

always overflows on 32-bit platforms, truncating the result.  Fix this
by precalculating "NSEC_PER_SEC / 31250", which is an integer constant.

Note that this assumes port->consume_bytes <= 16777.

Fixes: 531f471834227d03 ("ALSA: firewire-lib/firewire-tascam: localize async midi port")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.

I don't know the maximum transfer length of MIDI, but given it's an old
standard, I guess it's rather small.  If it is larger than 16777, the
constant "8" should be replaced by "8ULL", to force 64-bit arithmetic.
---
 sound/firewire/tascam/tascam-transaction.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/tascam/tascam-transaction.c b/sound/firewire/tascam/tascam-transaction.c
index 90288b4b46379526..a073cece4a7d5e3a 100644
--- a/sound/firewire/tascam/tascam-transaction.c
+++ b/sound/firewire/tascam/tascam-transaction.c
@@ -209,7 +209,7 @@ static void midi_port_work(struct work_struct *work)
 
 	/* Set interval to next transaction. */
 	port->next_ktime = ktime_add_ns(ktime_get(),
-				port->consume_bytes * 8 * NSEC_PER_SEC / 31250);
+			port->consume_bytes * 8 * (NSEC_PER_SEC / 31250));
 
 	/* Start this transaction. */
 	port->idling = false;
-- 
2.25.1

