Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD0D381682
	for <lists+alsa-devel@lfdr.de>; Sat, 15 May 2021 09:15:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EE4B175B;
	Sat, 15 May 2021 09:14:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EE4B175B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621062943;
	bh=1k050SArE3HpDMU4I0RXgZ6bYOVUpksWZ3u8zo/z5vI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bl1WoDWjaiP0PnNU9bZh6YfaRKefrsaFdaOQllExoOZmm0BcKZcb2cls1Ms3ZjyNe
	 aaXMEewJDwRZ2ZGbpGzkgcnmc4YZnZMvWiXoOtR/WmWtV+tnU2JFCqmOY+j2NRflv3
	 en6A10FqtruHjF2UprxcvY75sLAGgGh9Rp9qE3CI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A0B8F804E1;
	Sat, 15 May 2021 09:11:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BE4FF804AC; Sat, 15 May 2021 09:11:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A81BF80245
 for <alsa-devel@alsa-project.org>; Sat, 15 May 2021 09:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A81BF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="xa2BqfkP"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="sJICWsDp"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 5B5185C011D;
 Sat, 15 May 2021 03:11:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 15 May 2021 03:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=jRCoOb7jqNC9D
 B/4iRz0d8ChZgRMM1bzmEhLDJw2alI=; b=xa2BqfkP7H0nk6uKOUh0z2+JMs6jK
 f+f2nZChQxCdp9AvFHZL4rsicUN1alPIYpFlwE2osmyBSODwey3srrWxs6jkGbjz
 YkglyfocnKV0aOQfTIzcYMpZl21jx26Q+KEGuOHaxhw6ozJ8wHZQTB8LomoOGaPQ
 w1aq2XUtEaBXNmYExbMMcHD4V8wVQxOMy7utoRWdl7vN7RY+cu8JOKC5YwMfDTez
 M1yqlrWHWio5/EgB+MA4nkaJl4/fbl79m9xgpSew5YjY8qj4gaQbJj+X+6Aah8KM
 t1gt9Gw4oU/sNZVpmhvnXcun8QquUAkPPAVDam4MCKNMyqlDFFJb2fEkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=jRCoOb7jqNC9DB/4iRz0d8ChZgRMM1bzmEhLDJw2alI=; b=sJICWsDp
 dwFA4WOPJetfn8upNtdABvpOGQIAcRv9OC4r3WblIPhdAIXqTZzX1+/wgJ+9nF4y
 mxCccFq9tw4cfckOUK1SQiH2Ks3YeJGL1nC8B69m61ZGE3yiI+Q36z9z5ywWqO/g
 +0d2bp0r31uxrDkxeaka1YqO5RlyG/l2J0wTzZGSqO2HPBgVgCMTHDd4pFw0L+cr
 J6BatOQw/TR7kKbKxi7QTndg1hrCtVSCaitHdq8Lg2/T+PY4KTyetFrW0Tov/O5e
 EIuMQpwfjYybkvxHqCmHNxnGDRKq+4Rm5/lN27mZ+fsoFshzwNSiaidi03Q8lcGQ
 qRAfHq9HO1q+Ug==
X-ME-Sender: <xms:IXSfYIT3euPkmw1TCOKUOS42UGRmdwHui5nE0f78Pmcz1b9cQHtb3Q>
 <xme:IXSfYFwXYkOMcPVOiyaZZ1kaMZd-dXs_mSeuI4f1eAoybiGGMgsNMfjyIC9gTNOr7
 K7p75EkPNMnSOhB898>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehledguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:IXSfYF3y8Bkij0WMTfzxUinbZ0LWbrvw-_iEgRZXFCutpAjmJ5-Aow>
 <xmx:IXSfYMAr9t3JUb_NwMAJ_EqZVv2pkOT4YmC_JZn0GKiqn4ugBJSS0g>
 <xmx:IXSfYBjlYr4Gwn9GDfX1vTZgkG4hN-CmGiMY79xmBYVFRzsJ-vKBGg>
 <xmx:IXSfYBIeVfH_HVOH9_jvUO8blXNn8xgay5OfP4TQy3zYvk0V2Zy__A>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sat, 15 May 2021 03:11:28 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 09/10] ALSA: oxfw; code refactoring for wrong_dbs quirk
Date: Sat, 15 May 2021 16:11:11 +0900
Message-Id: <20210515071112.101535-10-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210515071112.101535-1-o-takashi@sakamocchi.jp>
References: <20210515071112.101535-1-o-takashi@sakamocchi.jp>
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

A new entry is added to the quirk enumeration for wrong_dbs quirk to
obsolete structure member.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 2 +-
 sound/firewire/oxfw/oxfw.c        | 2 +-
 sound/firewire/oxfw/oxfw.h        | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 33a7d0f308f1..9edd8515f586 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -163,7 +163,7 @@ static int init_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 
 		if (oxfw->quirks & SND_OXFW_QUIRK_JUMBO_PAYLOAD)
 			flags |= CIP_JUMBO_PAYLOAD;
-		if (oxfw->wrong_dbs)
+		if (oxfw->quirks & SND_OXFW_QUIRK_WRONG_DBS)
 			flags |= CIP_WRONG_DBS;
 	} else {
 		conn = &oxfw->in_conn;
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 90a66e1312fe..966697dace47 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -176,7 +176,7 @@ static int detect_quirks(struct snd_oxfw *oxfw)
 	 * value in 'dbs' field of CIP header against its format information.
 	 */
 	if (vendor == VENDOR_LOUD && model == MODEL_SATELLITE)
-		oxfw->wrong_dbs = true;
+		oxfw->quirks |= SND_OXFW_QUIRK_WRONG_DBS;
 
 	return 0;
 }
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index 9e1c12546ab5..1b0c53802569 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -36,6 +36,8 @@ enum snd_oxfw_quirk {
 	// Postpone transferring packets during handling asynchronous transaction. As a result,
 	// next isochronous packet includes more events than one packet can include.
 	SND_OXFW_QUIRK_JUMBO_PAYLOAD = 0x01,
+	// The dbs field of CIP header in tx packet is wrong.
+	SND_OXFW_QUIRK_WRONG_DBS = 0x02,
 };
 
 /* This is an arbitrary number for convinience. */
@@ -50,7 +52,6 @@ struct snd_oxfw {
 	struct delayed_work dwork;
 
 	enum snd_oxfw_quirk quirks;
-	bool wrong_dbs;
 	bool has_output;
 	bool has_input;
 	u8 *tx_stream_formats[SND_OXFW_STREAM_FORMAT_ENTRIES];
-- 
2.27.0

