Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB294CAB27
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 18:08:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A0A71B3E;
	Wed,  2 Mar 2022 18:07:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A0A71B3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646240922;
	bh=QDKA6RrsLaVuvxcm74QDUNrY6jyiLZPiUjMLBNmHh5Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aEj6Wgwrlq6QvjoOtGh9gKIIVSawlMJmYGZMk7KbXeucOuDokMk9kYW128eR/YQAS
	 98wSVDuvaRBdpSxELV7bbQBrMbFJihFAu/VS51Nr0ya8dK73W6lRuMT1x7vuRMpgr4
	 ez/Uhwxrv7ri8DhGIpwDGA3w2HKSwxIEiZKXDa2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A36AF8027D;
	Wed,  2 Mar 2022 18:07:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08106F801D5; Wed,  2 Mar 2022 18:07:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C26E7F80154
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 18:07:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C26E7F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hOrlpj9w"
Received: by mail-wr1-x435.google.com with SMTP id u10so2188115wra.9
 for <alsa-devel@alsa-project.org>; Wed, 02 Mar 2022 09:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+FBEODWlEwE4ZBpRu4pszv+L75J4ftu6Yw0by+ZcvnE=;
 b=hOrlpj9wIqQtiZ2iI5gabtXozHts++6EWfoyBCd9XE7smYEqH0D0OVdiWv1pcyWOmv
 drF40iR0EnF9vCeXmIYqfPop33M7aHpNtmCzSt5le3/11zOqSeexGyBz8MgQ4WEPa5oI
 IAkV+2cfB3IjRsBMxueIpgamXDtArN4GOSuNjFxfLz7eFSSMx7HDIJrnb/ZruGVPRQqm
 JuXSGImYl/NJQlq9JmPQ6uAcc6mnjQS0l7Y1oTTVRL9RQWBTmnnBopCO4aH4quRq43/G
 dc2kmxA0iGAwtQmMN6z3smEFOwKvl/1qLFFuPzojfYWvmcG8HPgoK2q2CCBdNQ2VmTBc
 0fUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+FBEODWlEwE4ZBpRu4pszv+L75J4ftu6Yw0by+ZcvnE=;
 b=JNXmHIS1Z3yquejnMQlbVlYzmm/J8YLSyHGFNX0/mSpBZUao2/xpDlqWL4o0x/4qKQ
 Y54h/qPhaFmAB+fvAU7Bj51CA3SY7AEYmAiycDs3fC4P6JpEK8EDzAi/gbN6qWsoR5CB
 knkt2+ooDc0ZYUgCw/6kS1NjEjWsMtxErjwhCVf0bkdFc7/26kxRuaFJVhdKgYAKr32v
 ahJt4cjjM8H45+xYf1K1fOIEMa3MSXJQIBsW55FvH1cnym/045xBrYp61LvY9bnjsfp8
 Ao4krCInPzU+25mc+3iJXG1NpJY5nQKZjEgWVC5AXtHPq/EjS5nWtAQPmoFY1ZVCRGQn
 6s2w==
X-Gm-Message-State: AOAM531KILPyZlc2+BGXsb9hLFbDx6RWlQ4cIfpL2PF2k5PF9By8hrMr
 PI5RXxacL5w6nxIjKqeYJmk=
X-Google-Smtp-Source: ABdhPJyDPnbwGRm/gHFADgHnG9mY1P7DvsXiSdJn8zqflakPBj5aWX46fD1EGCCM5wnDqY8YQSkV6A==
X-Received: by 2002:adf:f201:0:b0:1ed:c254:c1a2 with SMTP id
 p1-20020adff201000000b001edc254c1a2mr23485713wro.106.1646240849938; 
 Wed, 02 Mar 2022 09:07:29 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c4f0f00b0037d62a899b1sm6651200wmq.6.2022.03.02.09.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 09:07:29 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: echoaudio: remove redundant assignment to variable bytes
Date: Wed,  2 Mar 2022 17:07:28 +0000
Message-Id: <20220302170728.1094633-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: llvm@lists.linux.dev, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

The variable bytes is being assigned a value that is never read, it
is being re-assigned inside a following if block. The assignment is
redundant and can be removed.

Cleans up clang scan build warning:
sound/pci/echoaudio/midi.c:211:9: warning: Although the value stored
to 'bytes' is used in the enclosing expression, the value is never
actually read from 'bytes' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/pci/echoaudio/midi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/echoaudio/midi.c b/sound/pci/echoaudio/midi.c
index cb72d27e809e..7be5c3327b16 100644
--- a/sound/pci/echoaudio/midi.c
+++ b/sound/pci/echoaudio/midi.c
@@ -208,7 +208,7 @@ static void snd_echo_midi_output_write(struct timer_list *t)
 
 	/* No interrupts are involved: we have to check at regular intervals
 	if the card's output buffer has room for new data. */
-	sent = bytes = 0;
+	sent = 0;
 	spin_lock_irqsave(&chip->lock, flags);
 	chip->midi_full = 0;
 	if (!snd_rawmidi_transmit_empty(chip->midi_out)) {
-- 
2.34.1

