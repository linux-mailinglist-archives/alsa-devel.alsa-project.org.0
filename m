Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F13D324F40
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 12:31:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD38A16A6;
	Thu, 25 Feb 2021 12:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD38A16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614252685;
	bh=pRGPxa6uJnsylOqYX8vFwhXfA7xc6RP6yx6yt2A5tsI=;
	h=Resent-From:Resent-Date:Resent-To:Date:From:To:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f8x2046YkdkV2D0hS/j5ThQATdBjiT4Q6ogeqiaXv7o1FwVYiZMnHYHsCucOu7Ntj
	 GLRH/sorNb5tAh1m9ApRscgHrMLBLR5IP14ghUzvG7oCKM4+ybNWZNyUGotgYL+12e
	 u4f1Ny7WmVIXjLDKHRzlxtRrlTBXBgusrebdShXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E939F804E4;
	Thu, 25 Feb 2021 12:25:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53BF4F8016A; Tue, 23 Feb 2021 14:38:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74746F800B4
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 14:38:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74746F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ektf93CV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BF0964E3F
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 13:38:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ektf93CV"
Resent-From: Mark Brown <broonie@sirena.org.uk>
Resent-Date: Tue, 23 Feb 2021 13:37:46 +0000
Resent-Message-ID: <20210223133746.GE5116@sirena.org.uk>
Resent-To: alsa-devel@alsa-project.org
Envelope-to: broonie@sirena.co.uk
Delivery-date: Fri, 19 Feb 2021 18:33:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by cassiel.sirena.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92)
 (envelope-from <SRS0=h+af=HV=gmail.com=benjaminjrood@kernel.org>)
 id 1lDAaa-0002dN-Kt
 for broonie@sirena.co.uk; Fri, 19 Feb 2021 18:33:18 +0000
Received: by mail.kernel.org (Postfix)
 id B689864DA8; Fri, 19 Feb 2021 18:33:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7C9AE64E77
 for <broonie@kernel.org>; Fri, 19 Feb 2021 18:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C9AE64E77
Authentication-Results: mail.kernel.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org;
 spf=pass smtp.mailfrom=benjaminjrood@gmail.com
Received: by mail-ot1-f51.google.com with SMTP id s6so5965654otk.4
 for <broonie@kernel.org>; Fri, 19 Feb 2021 10:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=gVv/M4Oq8e2QfT2eQdy440bb814x4Sa5+QSDh3bEVno=;
 b=Ektf93CVsiWT+xjniWY+UZyLF5lwTJBITYvEHkBMWktvpsp+LnX31ou6n8U10bVro4
 fOhUlL2xgxTXdkd4ojgyEjm7/GoDVRqPRyXXUQdLpw+TR4gkMCx3HVOpmNRhvcGBf+sq
 IOZzlKZ6Nk8bhDNV8YGuYxf5uFGf0uJ+Dtf4CcIc77cR7l0Q/qX7dStjZp1QDhL1QoeL
 8DDotPwQfahcqLqmk+iirJEbQvZgcXbEgHhEkF6hWCNmrS1Sg90lwAIjBEZWdmAjNSra
 aA/rN0C1W3z4PHAoRqtCTd4phiFcbwTmxH+OYD14sjUM7LL/wRX9Dau4DQw1wWQeKccL
 +4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=gVv/M4Oq8e2QfT2eQdy440bb814x4Sa5+QSDh3bEVno=;
 b=TgS/C9Y/XO3ZJ1xrmV5VOSnDuVIawh0MxyqSnjuFyPV5TKR/tjguG2il5ZpN5lLKfN
 I+7JoQVxxiReJs+cCbQ2W0D2hqz/7ygPfeyVHO8TxG1/pEVnaozqapfeAo9uust0twRw
 94s8uz/zVG0Z90iuMmjyApryqLs+y6ZR7288trxs01WTar3EUUg0rY/zQHrvrkHElN1Q
 eL7gUqW9yCPWSLJARna3UYJoJJa13tacTdq4W19Ydm8C9rURrzw/CkI7rOInL+jDTVCZ
 H9IScu8tk6DoKCYwKiybiwejxlwr16J4X1ARrv6cF/e0ZIi5vxvpUE6dTfC1u20JSVQT
 2fSQ==
X-Gm-Message-State: AOAM5314MlNeVoOXcOXCCOd9chwTOS00MBmnabIR6oFPNC36yEsPolSI
 v8AnFXpH9/mTVmdFKgJj+8oY8Wu6sSx0Bw==
X-Google-Smtp-Source: ABdhPJybj/7eHosX5Gekj2qgFzPoZfrotYtPyVCuEVE62QMl+kW/nuRnl7gLZOwGt7Qt8cQFONIJEA==
X-Received: by 2002:a9d:369:: with SMTP id 96mr7780581otv.137.1613759593772;
 Fri, 19 Feb 2021 10:33:13 -0800 (PST)
Received: from ubuntu-dev (rrcs-72-45-242-2.nys.biz.rr.com. [72.45.242.2])
 by smtp.gmail.com with ESMTPSA id w10sm1869214ote.29.2021.02.19.10.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 10:33:13 -0800 (PST)
Date: Fri, 19 Feb 2021 13:33:08 -0500
From: Benjamin Rood <benjaminjrood@gmail.com>
To: Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Message-ID: <20210219183308.GA2117@ubuntu-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-SA-Exim-Connect-IP: 198.145.29.99
X-SA-Exim-Mail-From: SRS0=h+af=HV=gmail.com=benjaminjrood@kernel.org
Subject: [PATCH] ASoC: sgtl5000: set DAP_AVC_CTRL register to correct default
 value on probe
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: No (on cassiel.sirena.org.uk); Unknown failure
X-TUID: cW9SUew4e6Ck
X-Mailman-Approved-At: Thu, 25 Feb 2021 12:25:30 +0100
Cc: alsa-devel@alsa-project.org, dmacdonald@curbellmedical.com
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

According to the SGTL5000 datasheet [1], the DAP_AVC_CTRL register has
the following bit field definitions:

| BITS  | FIELD       | RW | RESET | DEFINITION                        |
| 15    | RSVD        | RO | 0x0   | Reserved                          |
| 14    | RSVD        | RW | 0x1   | Reserved                          |
| 13:12 | MAX_GAIN    | RW | 0x1   | Max Gain of AVC in expander mode  |
| 11:10 | RSVD        | RO | 0x0   | Reserved                          |
| 9:8   | LBI_RESP    | RW | 0x1   | Integrator Response               |
| 7:6   | RSVD        | RO | 0x0   | Reserved                          |
| 5     | HARD_LMT_EN | RW | 0x0   | Enable hard limiter mode          |
| 4:1   | RSVD        | RO | 0x0   | Reserved                          |
| 0     | EN          | RW | 0x0   | Enable/Disable AVC                |

The original default value written to the DAP_AVC_CTRL register during
sgtl5000_i2c_probe() was 0x0510.  This would incorrectly write values to
bits 4 and 10, which are defined as RESERVED.  It would also not set
bits 12 and 14 to their correct RESET values of 0x1, and instead set
them to 0x0.  While the DAP_AVC module is effectively disabled because
the EN bit is 0, this default value is still writing invalid values to
registers that are marked as read-only and RESERVED as well as not
setting bits 12 and 14 to their correct default values as defined by the
datasheet.

The correct value that should be written to the DAP_AVC_CTRL register is
0x5100, which configures the register bits to the default values defined
by the datasheet, and prevents any writes to bits defined as
'read-only'.  Generally speaking, it is best practice to NOT attempt to
write values to registers/bits defined as RESERVED, as it generally
produces unwanted/undefined behavior, or errors.

Also, all credit for this patch should go to my colleague Dan MacDonald
<dmacdonald@curbellmedical.com> for finding this error in the first
place.

[1] https://www.nxp.com/docs/en/data-sheet/SGTL5000.pdf

Signed-off-by: Benjamin Rood <benjaminjrood@gmail.com>
---
 sound/soc/codecs/sgtl5000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 4d6ff8114622..4c0e87e22b97 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -71,7 +71,7 @@ static const struct reg_default sgtl5000_reg_defaults[] = {
 	{ SGTL5000_DAP_EQ_BASS_BAND4,		0x002f },
 	{ SGTL5000_DAP_MAIN_CHAN,		0x8000 },
 	{ SGTL5000_DAP_MIX_CHAN,		0x0000 },
-	{ SGTL5000_DAP_AVC_CTRL,		0x0510 },
+	{ SGTL5000_DAP_AVC_CTRL,		0x5100 },
 	{ SGTL5000_DAP_AVC_THRESHOLD,		0x1473 },
 	{ SGTL5000_DAP_AVC_ATTACK,		0x0028 },
 	{ SGTL5000_DAP_AVC_DECAY,		0x0050 },
-- 
2.25.1

