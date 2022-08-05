Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A81058AA7A
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Aug 2022 14:05:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C231162F;
	Fri,  5 Aug 2022 14:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C231162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659701145;
	bh=OrLbiZZ/Lr6fsfqvy735K17g9/zxXoPzqcHBR/JjAyI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o+raNTbYU1N+9PpQUgkDFjYzCfIgODt1tIDOCGNYSjXkrxL71kHbLqpIe2AZJ27cJ
	 XXXycJ6Wp9Cg9oXlqooqQHG8iCO8WsEH4hKuFRkzSQctrJD+ukMT8RDrZv93EfUVlE
	 BtaygwMBPMcIja9H8XjD7G/kqcElOmXinc0j9Rng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 029A2F80271;
	Fri,  5 Aug 2022 14:04:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB831F8025A; Fri,  5 Aug 2022 14:04:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE63DF80121
 for <alsa-devel@alsa-project.org>; Fri,  5 Aug 2022 14:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE63DF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="b8qEIFbx"
Received: by mail-wm1-x32e.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso3878852wma.2
 for <alsa-devel@alsa-project.org>; Fri, 05 Aug 2022 05:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=jmupmgL/y2HrrDUu//62/jqyRcBAlD1KYeBUZ5VB29Q=;
 b=b8qEIFbxhE6kPRN0WZdb4m+PaZL+4KC/1yg4Gz1Jce1OEuy99CmL5Vr5idAf9saHWg
 VsETqlLVqRi/tNA2+I79MkFR7H8+WG4DPKeJqZ0FnRNpctc1ZauGLyXzwmscDeA6mtyh
 txBplgaDJZoVpBgskaKuoCBKug8rJHmh9nv/tE/XH+PnT+6kQ/hIyHQ19uiwK5fKrEEK
 OkKgBZYACjruR0Wpg/U72t4BJz6Im4q0NOfWhzThXI/R+UHMj5Rw2AI8xGdMoYOWf+XP
 /6gi4lnAE9eAjE+g6+cas3xASUIIckjfF42pCqLuXb5W4Il+vhXHG4E7ngQcwXC15c2l
 SRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=jmupmgL/y2HrrDUu//62/jqyRcBAlD1KYeBUZ5VB29Q=;
 b=hRHZg2U8vAbVHZPDsXI88du2acitAwUji9obec/LK7BjVSqaxjDceV0GLh+b8z1JvK
 LC0Ax+VN5ZL6epNH0bjABPFDs/DKGJlolnYW/U1QDsakWbwLfjQav1nnq6cNejkgrX2a
 +c4Ss/uvSpwn154eyTOLlx4UYVdk3mVEdkRJCr83PbQKzDb8nJ0/BTUpfJGYVMV00INn
 fpldSVk3NJTDTqTZmjoqCnRT+jZGBWRJaaxLx/6ceNu0AQj0iHbM0qDHw0ZzdmO6BFQO
 laVds+lS3/DapkndeVby+8bx0v0unqZh/ZZeSC7D3H9lwDKm7eVi9ac1nOKdBH325N+y
 /IjQ==
X-Gm-Message-State: ACgBeo1adLufSfvCCl4+6H3/VYsWH6t1iiTnNRTzOhoTsdU9zuveg/mA
 NPMGT3vWkaDqu38nq9uNLUo=
X-Google-Smtp-Source: AA6agR6u9Puh26OFXNYNA2fGhuTHgRV6hSXWlKH1p0IlWaXaoWvPpuNub8BzWmlWTKsp2X5M9NTADw==
X-Received: by 2002:a7b:c7cd:0:b0:3a3:8f1:8aeb with SMTP id
 z13-20020a7bc7cd000000b003a308f18aebmr9227015wmk.90.1659701080818; 
 Fri, 05 Aug 2022 05:04:40 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 m8-20020a7bca48000000b003a3442f1229sm8977412wml.29.2022.08.05.05.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 05:04:40 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ice1712: remove redundant assignment to new
Date: Fri,  5 Aug 2022 13:04:39 +0100
Message-Id: <20220805120439.2341600-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
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

The variable new is initialized with a value but it is never read. It is
being re-assigned a new value in every case path in the following switch
statement. The assignment is redundant and can be removed.

Cleans up clang scan build warning:
sound/pci/ice1712/quartet.c:569:8: warning: Although the value stored
to 'new' is used in the enclosing expression, the value is never actually
read from 'new' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/pci/ice1712/quartet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ice1712/quartet.c b/sound/pci/ice1712/quartet.c
index 0dfa093f7dca..20b3e8f94719 100644
--- a/sound/pci/ice1712/quartet.c
+++ b/sound/pci/ice1712/quartet.c
@@ -566,7 +566,7 @@ static int qtet_ain12_sw_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_ice1712 *ice = snd_kcontrol_chip(kcontrol);
 	unsigned int old, new, tmp, masked_old;
-	old = new = get_scr(ice);
+	old = get_scr(ice);
 	masked_old = old & (SCR_AIN12_SEL1 | SCR_AIN12_SEL0);
 	tmp = ucontrol->value.integer.value[0];
 	if (tmp == 2)
-- 
2.35.3

