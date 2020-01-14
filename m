Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD87E13AAE6
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:26:12 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78E292C61;
	Tue, 14 Jan 2020 12:25:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78E292C61
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC35BF8023E;
	Tue, 14 Jan 2020 12:23:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9B82F80277; Tue, 14 Jan 2020 12:23:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 466F6F80171;
 Tue, 14 Jan 2020 12:22:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 466F6F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="ITpgSGCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579000976;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=wHoJ/wPFOHNOLp15KZ+GLTWKe4KtsJJ+wXC+HluvpnE=;
 b=ITpgSGCJXE3CgzLZ7FhvdDTbQy4Q3biZeEelX7a4DEfQBZz3TOIfK0Ww15yN2maB4/
 uidck2D4BYuVCUPD4Wmly9eGNohEPUctyntxeRiUGcfneQ99ENPE/iaNfTmy5wZXhAGL
 PQ0h0OYBxS5GVteckioKVcaRdPqMoukc8VDaQedpeh2Nk0IJuXfmEMytFMDKiX58c6cu
 1r6EwshMWJUmmNpgUHHDDLp0C3UzATKtgNCvuOmdrsyXNyO1NUyWpdl8SJt5WCmoMy5r
 Eg0vcZ33+9uCWBGZWgM5w1UhdMbQOj7+mF2uCDZcqWiNInv4ODNkA3vjWocBYkOk4iRg
 QE7g==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7IOGU5qzCB3a93viaVr"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.1.4 AUTH)
 with ESMTPSA id h048a6w0EBMtULF
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 14 Jan 2020 12:22:55 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Jaroslav Kysela <perex@perex.cz>
Date: Tue, 14 Jan 2020 12:21:08 +0100
Message-Id: <20200114112110.51983-6-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114112110.51983-1-stephan@gerhold.net>
References: <20200114112110.51983-1-stephan@gerhold.net>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, patch@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>
Subject: [alsa-devel] [PATCH alsa-ucm-conf 5/7] codecs/msm8916-wcd:
	Earpiece: Add missing Enable/DisableSequence
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

Since commit 7d2f70f248ab ("ASoC: msm8916-wcd-analog: Add earpiece")
in the Linux kernel, the Earpiece in msm8916-wcd is now supported.
Add the necessary Enable/DisableSequence for it.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 ucm2/codecs/msm8916-wcd/Earpiece.conf | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/ucm2/codecs/msm8916-wcd/Earpiece.conf b/ucm2/codecs/msm8916-wcd/Earpiece.conf
index e9f8b9d..726b436 100644
--- a/ucm2/codecs/msm8916-wcd/Earpiece.conf
+++ b/ucm2/codecs/msm8916-wcd/Earpiece.conf
@@ -5,4 +5,18 @@ SectionDevice."Earpiece" {
 		"Speaker"
 		"Headphones"
 	]
+
+	EnableSequence [
+		cset "name='RX1 MIX1 INP1' RX1"
+		cset "name='RDAC2 MUX' RX1"
+		cset "name='EAR_S' 1"
+		## gain to  0dB
+		cset "name='RX1 Digital Volume' 128"
+	]
+
+	DisableSequence [
+		cset "name='RX1 Digital Volume' 0"
+		cset "name='EAR_S' 0"
+		cset "name='RX1 MIX1 INP1' ZERO"
+	]
 }
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
