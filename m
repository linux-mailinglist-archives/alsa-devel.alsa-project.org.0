Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 651C24F35EE
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 15:55:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 119571801;
	Tue,  5 Apr 2022 15:54:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 119571801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649166924;
	bh=9SGnmA54MQR0zqHRHapma+5XMyzxo1UD90+WzhXkXdI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PDGgn3DMSBZG6LQGjZewIaRuaEDzIn6pScttV94mVK4e9DtRwiFFedUVLDORBaYil
	 RTicr4wLHj9jINR1EU7q+ibZwL4XKjldwFP27QFFYHUIQznegAwL3Css205lewzBTY
	 wEoxT+faDWw3uJ2keKq5w9jBH5X2zaQuOlpwZy8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3C16F80519;
	Tue,  5 Apr 2022 15:54:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABFB0F8016A; Tue,  5 Apr 2022 15:54:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9496F8016E
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 15:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9496F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KRuBEqee"
Received: by mail-wr1-x42a.google.com with SMTP id b19so19417604wrh.11
 for <alsa-devel@alsa-project.org>; Tue, 05 Apr 2022 06:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DtW73tEE2+XFkT3bPsX/7iGbHd2vWpPYT/i50JAUgmI=;
 b=KRuBEqeehUWFQiE6Qb6pz2CZtRUAXww/24GIyCnvwpdbtfIKvDXbMg/G7g3DnY42x6
 /iZbgKc5kKf24N8Ac4Mpu156t4HMYzU7Nm+RM3S3BnmbpSHNkHbZn/OOn478oWoEpF8E
 De5/l0DXrm9uA/jpBI0/y5L4nLSqe4IWXKqb4B9WfjbhMRIsV28Dz8F/Eb2URXYcNzQM
 AtiZNEnvnfUmIdfza2vc32Mep19NqVFUKjYP78+D97mljq2ztcdx3TyvTolE+C9Klo0g
 A++9eTEGSW/RNdTwnTzk/7OBaYYwNf3nClqpPAgFLubykoDzWaSzpo9QnkjU9VSqUVjI
 FKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DtW73tEE2+XFkT3bPsX/7iGbHd2vWpPYT/i50JAUgmI=;
 b=x5gZ1I8DomwmHyam3aDVRWb4gMWGNhKgpCssiH/PGF5FoowN5eji8Fqb8MVnnEX5Ol
 fEonSWAeS7XJOEInRhpbvA88wOGoqufPjDxkvVyyOk1SkhgOdcAu1saJtrVuVNjmXbYp
 zCxjqISMDlM8DIdpAdXm5SSuuLDV3Ok4XwRXZv95pIvMmLXlydlUD/m1UG40mOuWhi+a
 /Zq49nWF8l2ZB/OR11Jg4ed5KKYCj7tzOBwaiLGBdrRef1/bvVnCDRuc1CBU4UZiiTfX
 4gpDqX7740j3xa+8+a8yPhXrroXDCcsCe455IFojUe9UG2UfUItTwBvZzj9Y/tr0zpql
 BAhw==
X-Gm-Message-State: AOAM5308ISIxG0L8H1aVWZT6/g8brYB+DvvU2314HN9cp/RO3V39Ty0l
 /rCt4pE1KgEw+uEvZbCiYMQ=
X-Google-Smtp-Source: ABdhPJx7uWLB6seAta51fiSK0+njz9yI+4yOg/CEwF3nvoU2EuPI0t4kkYbH392xPZ7JN2jShsBA+w==
X-Received: by 2002:a05:6000:156d:b0:204:c24:895f with SMTP id
 13-20020a056000156d00b002040c24895fmr3015212wrz.339.1649166854425; 
 Tue, 05 Apr 2022 06:54:14 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 k12-20020a5d628c000000b00203e2fbb2absm12132822wru.113.2022.04.05.06.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 06:54:13 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: echoaudio: remove redundant assignment to variable i
Date: Tue,  5 Apr 2022 14:54:12 +0100
Message-Id: <20220405135412.199251-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

The variable i is being assigned a value that is never read, it
is being re-assigned in the following for-loop. The assignment is
redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/pci/echoaudio/midi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/pci/echoaudio/midi.c b/sound/pci/echoaudio/midi.c
index 7be5c3327b16..47b2c023ee3d 100644
--- a/sound/pci/echoaudio/midi.c
+++ b/sound/pci/echoaudio/midi.c
@@ -124,7 +124,6 @@ static int midi_service_irq(struct echoaudio *chip)
 		return 0;
 
 	/* Get the MIDI data from the comm page */
-	i = 1;
 	received = 0;
 	for (i = 1; i <= count; i++) {
 		/* Get the MIDI byte */
-- 
2.35.1

