Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6E8396EC4
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 10:20:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6983169C;
	Tue,  1 Jun 2021 10:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6983169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622535645;
	bh=H+hriWOjpKMNazqAzNXyTKqcq44zjubwlGetOC98tm0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lc0Hl+QIe8l+Eyhc+mPm4RWWZGAWqauDgeWUeVOz/UHA0V7stY7Tn5DPV6HyE/NvI
	 wxa9HU9UQUzKbOBNbf1r6zmyXztKI4m/qmRxtOn2Bd4gY5o8QvSshNT5f4cG6vNO5B
	 T9Vn/EVQ+xTHKoYpFjEvxNW3JSZl8T2e2+CiJXDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04724F804D1;
	Tue,  1 Jun 2021 10:18:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58544F804D0; Tue,  1 Jun 2021 10:18:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C85D6F8025B
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 10:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C85D6F8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="zph6L+Yz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="HrPl0DWq"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2F9B510D0;
 Tue,  1 Jun 2021 04:18:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 01 Jun 2021 04:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=wAEpGdiN0DkMP
 6/aRyf7uFm4jBRaKKhEtqTKDmDeHks=; b=zph6L+Yzo9TzXeQCF7zsYRZPQS4e6
 MrHEK8teCFIpUadatVLoc6KZrF3kKU+MkZjt5ApyHL3uDOZB97yPo5eXKo0S93Gp
 eiBCi2EBtRsGFe+5FBOtkQwGgrVgRMYzDpxewibGsQaQKIBA2OfQRDjTFom+KnJQ
 RMDqsKgaiqKQdW+yvj2A+BHSJaE0Vh2qGYrsRyriU9LsJRczN9wADfFAsTYnxSua
 yDZxSCDD8xeLc8Kiv+r9xQf0a9sll78/YKmZ06BepMMMySGqgSSp8A87y6UeUmzB
 KXBeuGOd9mmkzGeXMhoktBGdXRI6mpeQ0JA1qlezYf7gZibvChgzdPe2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=wAEpGdiN0DkMP6/aRyf7uFm4jBRaKKhEtqTKDmDeHks=; b=HrPl0DWq
 6xm/m8UAnVcDfgSpqYGPxJbNJGGjX5DVSgoMqm2tr1E+4VPYjiETRipHv0T3qacD
 QMuLPixT5eVx5yRUCpsLXPfMPvOqtjMWBxGmQGF+Ed28Xmp1SqJz++J8SM69EK2w
 OsxPEhHb3HOhsrbRdbY7Tc4hef5Q0Tt7KB0cjjwtsQEGLiCve3X9pBaIbIMN4iGt
 fg2ceoNoyg/XmXFl0d4NC//fJ3toCSbYotZfZ5RG7OUG7V0bZW1inN1VdfTVZx+T
 JBxCo7bnh/gIjz6K70/4akhlVgWLct1HPvQG9czyFm5UXIBjgm7gqpy4uLZDm9h1
 cmE1YZ9Vaxr0fg==
X-ME-Sender: <xms:Pe21YBuqbUSkHYyK2QGeHHYQOOjMjUylkbmqqh32QOEkvTJ2HqePlg>
 <xme:Pe21YKfLXyyVpyaoZ5sjYkP28AnO6jb7MrfCn-ZEnZGR__sVEACpBMgTRrSczbbyn
 _fjpgd6pM9s4__CAF8>
X-ME-Received: <xmr:Pe21YEwYFn0zt3kUQc9nIWbkk74YbvvTrpv5GwZVHyUE1E21HMeEQICR_E8Nhg-gC_eFLwZBxUlvM7WZ6x797H0juQ6a2TIc0u6o2Pl25BD-S1hFsuIf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelhedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Pe21YIMMMK-Ox1hltTA8Q3mqVmLUDgJgkgeLmDumbNd71pITmjOnDA>
 <xmx:Pe21YB_KuiHQ-anOtJbK9FNUNMRwtB9i79KojnkNpCYraFGtGWSYUg>
 <xmx:Pe21YIWFmuWnLxcWl35hBY55HdI6sr_umaBP5sErmkEASFm2AE1GTw>
 <xmx:Pe21YDkFPbSw5MEn0XQ7YIGKfPiw6kor8Q0_CstgSVep8bciSsAgag>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jun 2021 04:18:04 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 3/3] ALSA: bebob: perform sequence replay for media clock
 recovery
Date: Tue,  1 Jun 2021 17:17:53 +0900
Message-Id: <20210601081753.9191-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210601081753.9191-1-o-takashi@sakamocchi.jp>
References: <20210601081753.9191-1-o-takashi@sakamocchi.jp>
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

This commit takes ALSA bebob driver to perform sequence replay for media
clock recovery.

Many users have reported discontinuity of data block counter field of CIP
header in tx packet from the devices based on BeBoB ASICs. In the worst
case, the device corrupts not to respond to any transaction, then generate
bus-reset voluntarily for recovery. The sequence replay for media clock
recovery is expected to suppress most of the problems.

In the beginning of packet streaming, the device transfers NODATA packets
for a while, then multiplexes any event and syt information. ALSA
IEC 61883-1/6 packet streaming engine has implementation for it to drop
the initial NODATA packets. It starts sequence replay when detecting any
event multiplexed to tx packets.

The sequence replay is tested with below models:

 * Focusrite Saffire
 * Focusrite Saffire LE
 * Focusrite Saffire Pro 10 I/O
 * Focusrite Saffire Pro 26 I/O
 * M-Audio FireWire Solo
 * M-Audio FireWire Audiophile
 * M-Audio Ozonic
 * M-Audio FireWire 410
 * M-Audio FireWire 1814
 * Edirol FA-66
 * ESI Quatafire 610
 * Apogee Ensemble
 * Phonic Firefly 202
 * Behringer F-Control Audio 610

Unfortunately, below models doesn't generate sound. This seems regression
introduced recent few years:

 * Stanton Final Scratch ScratchAmp at middle sampling transfer frequency
 * Yamaha GO44
 * Yamaha GO46
 * Terratec Phase x24

As I reported, below model has quirk of discontinuity:

 * M-Audio ProFire Lightbridge

DM1000/DM1100 ASICs in BeBoB solution are known to have bugs at switch of
sampling transfer frequency between low/middle/high rates. The switch
generates the similar problems about which I mention in the above. Some
vendors customizes firmware so that the switch of frequency is done in
vendor-specific registers, then restrict users to switch the frequency.

For example of Focusrite Saffire Pro 10 i/o and 26 i/o, users allows to
switch the frequency within the three steps; e.g. 44.1/48.0 kHz are
available at low step. Between the steps, extra operation is required and
it always generates bus-reset.

Another example of Edirol FA-66, users are prohibited to switch the
frequency by software. It's done by hardware switch and power-off.

I note that the sequence replay is not a solution for the ASIC bugs. Users
need to disconnect the device corrupted by the bug, then reconnect it to
refresh state machine inner the ASIC.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob_stream.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 47773ca97e46..470c2b70cbfa 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -649,10 +649,15 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 		else
 			tx_init_skip_cycles = 16000;
 
-		// MEMO: In the early stage of packet streaming, the device transfers NODATA packets.
-		// After several hundred cycles, it begins to multiplex event into the packet with
-		// syt information.
-		err = amdtp_domain_start(&bebob->domain, tx_init_skip_cycles, false, false);
+		// MEMO: Some devices start packet transmission long enough after establishment of
+		// CMP connection. In the early stage of packet streaming, any device transfers
+		// NODATA packets. After several hundred cycles, it begins to multiplex event into
+		// the packet with adequate value of syt field in CIP header. Some devices are
+		// strictly to generate any discontinuity in the sequence of tx packet when they
+		// receives inadequate sequence of value in syt field of CIP header. In the case,
+		// the request to break CMP connection is often corrupted, then any transaction
+		// results in unrecoverable error, sometimes generate bus-reset.
+		err = amdtp_domain_start(&bebob->domain, tx_init_skip_cycles, true, false);
 		if (err < 0)
 			goto error;
 
-- 
2.27.0

