Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FEF387971
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 15:02:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14DC716F5;
	Tue, 18 May 2021 15:02:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14DC716F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621342971;
	bh=lKVKzjwGhMBl9qfsHW6Qp4jZjlHmFR9KFh9CFePBfM8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RS8v1ENhqMNQ0f56hImN5f0lOwfXxulK0MYYAoEruTEWiZtGHWev47Gc4exvzFvHu
	 NzFPiGCZS/9gmSjQO2LPCFmvZcJF2jRcw9WMNFoLAVQA/gNJwLmFnqJlSQSev7nEvL
	 4y5FRggp5xfbohyfn0yTflZctDLBPhv5KecUwxzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A0AEF8012C;
	Tue, 18 May 2021 15:01:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 639EEF80430; Tue, 18 May 2021 15:01:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58CF5F80217
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 15:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58CF5F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="IzZgnLgu"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="O6haf/rC"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 47B4E5C0036;
 Tue, 18 May 2021 09:00:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 18 May 2021 09:00:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=c3/WTsm5zzIZr
 KhzTUn6Q5t4wrHodywOq9IdX4OwGDI=; b=IzZgnLgujf1H5x0f9LBZ53TZwo3VN
 PdRpkD15MqipOcbCutG85OucjHhyP3p/fyr218tg15NSdLkRYxzLDdE3/bRgnSM9
 Hf2cn2CKW/vLhaLLBQ9tMNPARRCJCg6eq5doTJyCwRSnh4D6QNiYvf7Rx/jKyodO
 aOdwN4JhduI/okf+expIjNmKG3pRA1mMZ23G7z8VoBqqxpnHew3FIRicRWG9QWch
 px/2iXFHv2sr9WE69+FeEYAAx5mhkihe1HJLCrn4GR2qeWwonGYSGyvCalzeHx/W
 80L0jaLDZDHCXXsO7qP4MbhoXMSuIyR7Yg53xD1cFAzJq43Q7QNSx2Dgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=c3/WTsm5zzIZrKhzTUn6Q5t4wrHodywOq9IdX4OwGDI=; b=O6haf/rC
 ceLF0wJTHmH1lm74Estl4+fs0TzJGJ1vqu+NpHZSj7g1sG//I0fjhNebNlNzL/FM
 YMH43IldRg/JYb1V9WKUe7Xz1vzoSTJkybXXVepJpqTz3A0Ny+rrtNNtAwhlr8au
 Jzypvrny7YYzzb1Ow9vuWDPdQOaqEKUEFNptQSQWU90ziUiL8Wb2gjrwPYaaeICK
 cYQ+HWNqigyieFKkeEQC16X/rCO0t9+vJ+JPYzF0WbS9LngdQ+9VWxL5nFVBCR0H
 obYq1rgLz0p3CYIqgSoQRA7dtLCguhbMbGIir4pxMcioIT1Aa3JZHpjySI3jh1cV
 Aqc8giDjBcZ++Q==
X-ME-Sender: <xms:hrqjYCJ0DAc5lcmp4JhhjbOqEDuHpo12b5J8ICGSsA1owbRmm0sl7A>
 <xme:hrqjYKIa8gMyMD_xBkELA0qJ9uHwj2x67cupEmYs3fdnmbIfHLG541mgcK5IQDAX4
 HbJ55c4Fv_MD6FvSuk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepieevffdvhe
 eutdelffefgeeiudettddvjeefudetveeuleehuedvteevjeettdegnecuffhomhgrihhn
 pehrgidrvghvvghnthhsnecukfhppedugedrfedrieehrddujeehnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgr
 khgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:hrqjYCs7uzIWF9YYcSzk7WhgSu1y9WgA0qc3obP44NEkeujmR3Qaug>
 <xmx:hrqjYHY_aOuLEQRTwFZd3-FHUBXbKXfkCBGSD2gA6QmDWNimR6ieeA>
 <xmx:hrqjYJbNcvVPh3Y1lsB9CTWqGkEiula5u18TTkwMbq0pwlzb2j9kMQ>
 <xmx:h7qjYKByZj58YeOkiQuusGXJDCPwP8QdPclWE5FJPbBSUhmlxbmU7w>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 09:00:53 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/8] ALSA: firewire-lib: code refactoring to refer the same
 frame count per period in domain structure
Date: Tue, 18 May 2021 22:00:40 +0900
Message-Id: <20210518130048.146596-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210518130048.146596-1-o-takashi@sakamocchi.jp>
References: <20210518130048.146596-1-o-takashi@sakamocchi.jp>
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

The number of PCM frame per period is common between PCM substreams
handled in AMDTP stream in AMDTP domain.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 3 +--
 sound/firewire/amdtp-stream.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 409274a532ed..ac37cd4c2b33 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -834,7 +834,7 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	struct amdtp_stream *s = private_data;
 	const struct amdtp_domain *d = s->domain;
 	const __be32 *ctx_header = header;
-	unsigned int events_per_period = s->ctx_data.rx.events_per_period;
+	unsigned int events_per_period = d->events_per_period;
 	unsigned int event_count = s->ctx_data.rx.event_count;
 	unsigned int packets;
 	int i;
@@ -1490,7 +1490,6 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 	}
 
 	s = d->irq_target;
-	s->ctx_data.rx.events_per_period = events_per_period;
 	s->ctx_data.rx.event_count = 0;
 	s->ctx_data.rx.seq_index = 0;
 
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 0628b6e52fc1..c69042013245 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -147,7 +147,6 @@ struct amdtp_stream {
 
 			// To generate constant hardware IRQ.
 			unsigned int event_count;
-			unsigned int events_per_period;
 		} rx;
 	} ctx_data;
 
-- 
2.27.0

