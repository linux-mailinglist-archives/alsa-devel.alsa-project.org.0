Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD6E13AA98
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:20:27 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B0872F38;
	Tue, 14 Jan 2020 12:26:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B0872F38
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3C12F8028F;
	Tue, 14 Jan 2020 12:23:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1025BF80276; Tue, 14 Jan 2020 12:23:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59F91F8016F;
 Tue, 14 Jan 2020 12:22:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59F91F8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="aRf6Qgc9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579000975;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=L+8ky1yIDg/H2S1NbVCrXsVVmbdReTNhzWO7np4SWfY=;
 b=aRf6Qgc9ndbIwJmKQ9o8ZtF6SE5fZArEvvWoTE29Gr01ydGn0bokt55GFBjxFP+pw8
 oo511aSDyfbTxecGB/epByI020OGN5ZLOScvNPwYPrVVfcomyTKPVKXI72Z/ffC1mbsP
 /mAgCPZ9ik4r1okv351u+pbgBctx/GshdmKc2eo2vUs+ilslZhpKROg14VoKrizvmW/J
 DtajcRVUtKvHlR2O+D7TMtgDzQrhxtrpW9HaGa9rdS261fAuKUQJY9ANAjQ1FExJHu7s
 tat7SQoLIliolaMEo01poAuiWO6Fkz55hJwEE+COqxmDiIgh3rOGI26dQm3oyNAG/Zlr
 MQmg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7IOGU5qzCB3a93viaVr"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.1.4 AUTH)
 with ESMTPSA id h048a6w0EBMsULD
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 14 Jan 2020 12:22:54 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Jaroslav Kysela <perex@perex.cz>
Date: Tue, 14 Jan 2020 12:21:06 +0100
Message-Id: <20200114112110.51983-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114112110.51983-1-stephan@gerhold.net>
References: <20200114112110.51983-1-stephan@gerhold.net>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, patch@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>
Subject: [alsa-devel] [PATCH alsa-ucm-conf 3/7] codecs/msm8916-wcd: Speaker:
	Reset volume on disable
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

For Headphones we reset the Digital Volume back to 0 when disabling
the device; do the same for the Speaker.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 ucm2/codecs/msm8916-wcd/Speaker.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ucm2/codecs/msm8916-wcd/Speaker.conf b/ucm2/codecs/msm8916-wcd/Speaker.conf
index 2b1dd8a..1e0dfa6 100644
--- a/ucm2/codecs/msm8916-wcd/Speaker.conf
+++ b/ucm2/codecs/msm8916-wcd/Speaker.conf
@@ -14,6 +14,7 @@ SectionDevice."Speaker" {
 	]
 
 	DisableSequence [
+		cset "name='RX3 Digital Volume' 0"
 		cset "name='SPK DAC Switch' 0"
 		cset "name='RX3 MIX1 INP1' ZERO"
 	]
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
