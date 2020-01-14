Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FF513AA5E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:13:06 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39B512FB6;
	Tue, 14 Jan 2020 12:28:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39B512FB6
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9CFAF802E0;
	Tue, 14 Jan 2020 12:23:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C64BF8023E; Tue, 14 Jan 2020 12:23:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58CEDF8022B;
 Tue, 14 Jan 2020 12:22:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58CEDF8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="pB4K8EQp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579000976;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=U++9evuYwcWoU5YFoQziAJqHtLy5yjtkXx0498uVvPc=;
 b=pB4K8EQpR6mDJ2zmWQoPyD3GpVjQFhrk3R15xdQkp5kiXdWqMUrgFjKX4Al0kIq3pz
 1DNW8ShA+9ddkLztWlmwLZvsxd6PgulWRn2LwYEb9rImbnGlsg0KmaQ/oGnifxrexC9j
 Yhb/sxhhL4w3Rd20XDeuQluwCHDGVkIcbyKxxAy6+r/HmY0mL3Qx1UrlHETt7nmx5SyS
 hKPn8JKtSSgBuepGpkD6FLe/agS20GByn2lZQdMniTpTFZUuxlh6KTV3Fs0Xcw5dirm6
 jEkB7zXb93xlUtFTJbUHttCsvScAMhKeOgJsJ4L4z5UNZ3CVWKsw+8PvFhZ4AooIep5y
 rXTA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7IOGU5qzCB3a93viaVr"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.1.4 AUTH)
 with ESMTPSA id h048a6w0EBMtULG
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 14 Jan 2020 12:22:55 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Jaroslav Kysela <perex@perex.cz>
Date: Tue, 14 Jan 2020 12:21:09 +0100
Message-Id: <20200114112110.51983-7-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114112110.51983-1-stephan@gerhold.net>
References: <20200114112110.51983-1-stephan@gerhold.net>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, patch@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>
Subject: [alsa-devel] [PATCH alsa-ucm-conf 6/7] codecs/msm8916-wcd:
	SecondaryMic: Select correct input
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

At the moment, enabling "SecondaryMic" actually results in enabling
the HeadsetMic. The enable sequence for the secondary microphone
is similar, but ADC2 MUX must be set to INP3 and the volume set
through ADC3 Volume.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 ucm2/codecs/msm8916-wcd/SecondaryMic.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ucm2/codecs/msm8916-wcd/SecondaryMic.conf b/ucm2/codecs/msm8916-wcd/SecondaryMic.conf
index 7811509..fdc5df8 100644
--- a/ucm2/codecs/msm8916-wcd/SecondaryMic.conf
+++ b/ucm2/codecs/msm8916-wcd/SecondaryMic.conf
@@ -4,13 +4,13 @@ SectionDevice."SecondaryMic" {
 	EnableSequence [
 		cset "name='DEC1 MUX' ADC2"
 		cset "name='CIC1 MUX' AMIC"
-		cset "name='ADC2 Volume' 8"
-		cset "name='ADC2 MUX' INP2"
+		cset "name='ADC3 Volume' 8"
+		cset "name='ADC2 MUX' INP3"
 	]
 
 	DisableSequence [
 		cset "name='DEC1 MUX' ZERO"
-		cset "name='ADC2 Volume' 0"
+		cset "name='ADC3 Volume' 0"
 		cset "name='ADC2 MUX' ZERO"
 	]
 }
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
