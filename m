Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7732C13AAE8
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:26:21 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E5AB2EB6;
	Tue, 14 Jan 2020 12:23:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E5AB2EB6
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24092F80271;
	Tue, 14 Jan 2020 12:23:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 313ECF8026F; Tue, 14 Jan 2020 12:23:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3CC8F80121;
 Tue, 14 Jan 2020 12:22:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3CC8F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="M/g8E33y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579000975;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=X+OWkKL+QIgQaAWCoXnWN108mmrFk+pANvEAC/RGGmI=;
 b=M/g8E33yR9spmYHy3Y1OF8AXE5VL/SI3xxSdLdPvFexS2Hw3FJ1yNAV+tUfFbHBzNx
 fgIJZciv+NpG8pAELLv9nbrT240z8YUk43pmxnQ8ciy8hwG1/W4N0xYqdz+EjXl4SrPu
 5U8tINyqbasvukVTR0evUPFwfRqc6ewnVONKVPbIMY3WjYi5FVl/B08f8MXmtPH4duS7
 EXGYfkvT9euKe911GAl8EmOkmW2B64jR5MqcN0O0cdLOiTybxy8NRgsejt+JbdL8rFnh
 251u0Sl6O22HKRbA5InzWpW+PLXHUaG/OjyoVaZs5kFLasChbdfLToiKWslnPtA449es
 EYfw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7IOGU5qzCB3a93viaVr"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.1.4 AUTH)
 with ESMTPSA id h048a6w0EBMsULA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 14 Jan 2020 12:22:54 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Jaroslav Kysela <perex@perex.cz>
Date: Tue, 14 Jan 2020 12:21:04 +0100
Message-Id: <20200114112110.51983-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114112110.51983-1-stephan@gerhold.net>
References: <20200114112110.51983-1-stephan@gerhold.net>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, patch@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>
Subject: [alsa-devel] [PATCH alsa-ucm-conf 1/7] DB410c: Rename Handset to
	HeadsetMic
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

The "Handset" device actually configures the headset microphone,
as indicated in the comment.

The actual "Handset" microphone used for voice calls is usually
internal and connected to PrimaryMic.

Rename the current "Handset" device to "HeadsetMic" for clarity.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 ucm2/DB410c/HiFi.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ucm2/DB410c/HiFi.conf b/ucm2/DB410c/HiFi.conf
index 848d02f..a0ef42c 100644
--- a/ucm2/DB410c/HiFi.conf
+++ b/ucm2/DB410c/HiFi.conf
@@ -75,7 +75,7 @@ SectionDevice."Earpiece" {
 	]
 }
 
-SectionDevice."Handset" {
+SectionDevice."HeadsetMic" {
 	Comment "Headset Microphone"
 
 	EnableSequence [
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
