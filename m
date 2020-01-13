Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4728138D55
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2020 09:59:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6631B86F;
	Mon, 13 Jan 2020 09:58:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6631B86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578905954;
	bh=iMeXOWKMDvz54F7W7Q1VlMvDXX/NiPs+pDdNtsd3HwQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=em7H/E+mRBbOjttvZKbqBxddE0OLSJKPpubzgsQsvShVt5fcbg9HVD3+SerXa16pQ
	 5pBwjfO+CoZV7qIevaTnJbhRofTE/WemU1P5wXeFbFsHh9UsJ/Sp5hIRyBNpJWemRV
	 GWQbfCbA7eSL2m9QuEdfcAnc8SHVquP7LeKNM2Fo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60346F8014B;
	Mon, 13 Jan 2020 09:57:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1C43F801EB; Mon, 13 Jan 2020 09:57:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4937F800B9
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 09:57:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4937F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="o4qduLEu"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jArVN7Q0"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C8A3621D28;
 Mon, 13 Jan 2020 03:57:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 13 Jan 2020 03:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=TDCPsxrYqs//WyL2k7ckPOpBjU
 qhsO9I3Xy7BwtRXHU=; b=o4qduLEuWCxaqPOdqosajxkG2qqiJDQYn/VGVPpQ6I
 NwAskyR0BANAdScDv5H4pRjQ8lRNt0a0FjWnsuEeqyTBY/OBYiPIV+BTPUOlQDEw
 dKBR/G8Ov+LN6K8AKbx2iPGPa6hcfG//A07Z5ViaVRjgnWQeGZeVs+GGrKLqqBek
 iZ5bjHVMnjn0hmDBZ/AE+YsRtO1bI3aEscLNzkDHyszTmE+22n0SUQldjec2BIw9
 a1jXNu7FtRhs9Hjq24CvPNZ6PKRJJqBwvOvtK2pJhau1+zixrk63kl3j1Tw3uTdZ
 1qE9UrEPwYaJ2m3bAdAnqlzQ/Eg0+mkDOfq5SSCfx5Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TDCPsxrYqs//WyL2k
 7ckPOpBjUqhsO9I3Xy7BwtRXHU=; b=jArVN7Q0KfoLbRxKl05WuTyenawNBcHQ4
 Fe3HgHVAyvBquXocFYwlT7YoVH5OHVzJFK/j2I/M6BMpdO8ICEJqZv4KYLzQRh0N
 1AqWK4f7WkXDRiSWbWdAUKPjA9JcjlRwmntr9kATTBb7OteiJh68CVd0xP5IIv9I
 IVIzPaQqnsa+O2A+lAo5ysqplaBgtEl24DrT5KMQiYhsqR8ObRhDAAvUvwDljkLy
 u2pn6gdgMU4IHIVPRPeYA7x8LsmT/jf4O++GqMlvnRkIOAfL96BxBgiju3blIqMl
 Z8PE1AY2AY5eoVbo6/Zuk8/jfU6gQIfghO97k2hHqZGb0GNcbw1fQ==
X-ME-Sender: <xms:8jAcXkfhShS44yOfLYxlMoqG4MAe095fgSTQLETPBJkY4on2u1MueA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiledguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecukfhppedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhrohhmpeho
 qdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfuihiivg
 eptd
X-ME-Proxy: <xmx:8jAcXrNS4W_PffB0M-sXDg_cl0bU8fSpjw7HdQeJpTNQQSkq-hcPbQ>
 <xmx:8jAcXmbPraWpH6HcbRnGAb1CWDUE3tq77xLQyD1AK6OHXb1DOg-xjQ>
 <xmx:8jAcXvs1HS66U-CFkKCWEJB3OGXKqVsmpv8DNOGI6I9R40VLBEH-Iw>
 <xmx:8zAcXqH04VTojGRs39UIqMm2yRbNhqcfkaPFxXY5UHmOiJHpV_3TnA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9967D8005C;
 Mon, 13 Jan 2020 03:57:21 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Date: Mon, 13 Jan 2020 17:57:19 +0900
Message-Id: <20200113085719.26788-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Scott Bahling <sbahling@suse.com>,
 stable@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: firewire-tascam: fix corruption due to
	spin lock without restoration in SoftIRQ context
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

ALSA firewire-tascam driver can bring corruption due to spin lock without
restoration of IRQ flag in SoftIRQ context. This commit fixes the bug.

Cc: Scott Bahling <sbahling@suse.com>
Cc: <stable@vger.kernel.org> # v4.21
Fixes: d7167422433c ("ALSA: firewire-tascam: queue events for change of control surface")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/amdtp-tascam.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/tascam/amdtp-tascam.c b/sound/firewire/tascam/amdtp-tascam.c
index e80bb84c43f6..f823a2ab3544 100644
--- a/sound/firewire/tascam/amdtp-tascam.c
+++ b/sound/firewire/tascam/amdtp-tascam.c
@@ -157,14 +157,15 @@ static void read_status_messages(struct amdtp_stream *s,
 			if ((before ^ after) & mask) {
 				struct snd_firewire_tascam_change *entry =
 						&tscm->queue[tscm->push_pos];
+				unsigned long flag;
 
-				spin_lock_irq(&tscm->lock);
+				spin_lock_irqsave(&tscm->lock, flag);
 				entry->index = index;
 				entry->before = before;
 				entry->after = after;
 				if (++tscm->push_pos >= SND_TSCM_QUEUE_COUNT)
 					tscm->push_pos = 0;
-				spin_unlock_irq(&tscm->lock);
+				spin_unlock_irqrestore(&tscm->lock, flag);
 
 				wake_up(&tscm->hwdep_wait);
 			}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
