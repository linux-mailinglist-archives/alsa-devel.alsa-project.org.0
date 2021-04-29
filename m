Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EC836EF08
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Apr 2021 19:38:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCCBC1692;
	Thu, 29 Apr 2021 19:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCCBC1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619717905;
	bh=nBwsq3apG413iAaOSVXHlBCmNxrkNFW4dfKpmTSH6z0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rgKlqocsnZweBiERJzOk3xYXQtXyLlIR/rgr1CPk1nmWlRe7p0+JDx616nus2jpwC
	 I7opj0xhCr5mdmBRxhTO4+BGsoMpYwi53TWS3N+4bxbUti1bLzGvRm+d5VnQx78KJs
	 9C9t6KzOgegjw4mNGwK3lCENcAmqisTKbtV7SK1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52CAEF80117;
	Thu, 29 Apr 2021 19:36:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C705F801EC; Thu, 29 Apr 2021 19:36:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90B0CF800E4
 for <alsa-devel@alsa-project.org>; Thu, 29 Apr 2021 19:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90B0CF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="cWyKOu3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619717810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K4rNwoUrsBxVZzoadAn6uvb1lrOSv00d53aEi1UZj3U=;
 b=cWyKOu3VHmHe1mi7MbvQXUunSN5nRHT9U+7kA6SAwDLHTojq26FvoJG4R6ekI13Or0kXVt
 ASWno2gxxUEttRfyuO7YeJ6/jBXgVWbjCQGB1aQMN6NUOR8/iIVoG0ojYdzbSb6u7FYMF3
 8wDWj7+BwKtpub4OEMU0OASPzddkPXo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-pUEbcRxLMcqQ4L0QHyxn0g-1; Thu, 29 Apr 2021 13:36:47 -0400
X-MC-Unique: pUEbcRxLMcqQ4L0QHyxn0g-1
Received: by mail-qk1-f200.google.com with SMTP id
 m1-20020a05620a2201b02902e5493ba894so4297218qkh.17
 for <alsa-devel@alsa-project.org>; Thu, 29 Apr 2021 10:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K4rNwoUrsBxVZzoadAn6uvb1lrOSv00d53aEi1UZj3U=;
 b=EPHwFfA83GnqSprSjIvP+54iGFkHrRo1m28DOuDEKSQsYry8RFsO0T8JSNNtK8ohDk
 vW4ZIRmcw5lSi4UsU3OGnNSKIviwYHglelLIEph/XFUFBuxy5X2K9rJHiWtB4ML/UqXB
 uk2alMFXWZ1dZ0Cjuwu4qBtvbstRm53LcBvnPmnC6CKGpPlI1MZou9wdmh7bWbWfR4eJ
 6Jf/yl+pavUEaKyaUHlqz40/SS7k2niK5FtSYj3R6wwHl3w10+lXIK6uF6tBKLpaaD20
 1m1mlPunyGq5Ex62hSEgzXPEzJuGqZcRd/hHBUtOVcryEwXSlJrPtW6QLQt6d8Flw0IN
 g0Iw==
X-Gm-Message-State: AOAM5327Kxrc4Gd2cY9mF++LCk3ipLuiTUNbo4Fg4W7Z12h07Hsp4/OG
 FL1a58vsbJYzWsawYSEy8eYanIbHZXi3NarETC6FDLXkIDCK94mijilp0XRFPIrDndIu7DKm+VA
 XuP9QBfOEodVrBXfekPjIvQI=
X-Received: by 2002:ad4:55ab:: with SMTP id f11mr621376qvx.49.1619717807123;
 Thu, 29 Apr 2021 10:36:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm+KAbmVoVRhpdIdwacN/+bTi3+qtiMBy4JkP5iV66UBMlTFgUYy5K73549+vcQxt8ZOEYFg==
X-Received: by 2002:ad4:55ab:: with SMTP id f11mr621331qvx.49.1619717806749;
 Thu, 29 Apr 2021 10:36:46 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id 144sm2725453qkn.108.2021.04.29.10.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 10:36:46 -0700 (PDT)
From: trix@redhat.com
To: srinivas.kandagatla@linaro.org, bgoswami@codeaurora.org,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: codecs: lpass-wsa-macro: make sure array index is set
Date: Thu, 29 Apr 2021 10:36:42 -0700
Message-Id: <20210429173642.3230615-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Tom Rix <trix@redhat.com>, alsa-devel@alsa-project.org,
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

From: Tom Rix <trix@redhat.com>

Static analysis reports this problem

lpass-wsa-macro.c:1732:6: warning: Array subscript is undefined
        if (wsa->ec_hq[ec_tx]) {
            ^~~~~~~~~~~~~~~~~

The happens because 'ec_tx' is never initialized and there is
no default in the switch statement that sets ec_tx.  Because there
are only two cases for the switch, convert it to an if-else.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 1a7fa5492f28..c11ae72f2148 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1718,15 +1718,13 @@ static int wsa_macro_enable_echo(struct snd_soc_dapm_widget *w,
 
 	val = snd_soc_component_read(component, CDC_WSA_RX_INP_MUX_RX_MIX_CFG0);
 
-	switch (w->shift) {
-	case WSA_MACRO_EC0_MUX:
+	if (w->shift == WSA_MACRO_EC0_MUX) {
 		val = val & CDC_WSA_RX_MIX_TX0_SEL_MASK;
 		ec_tx = val - 1;
-		break;
-	case WSA_MACRO_EC1_MUX:
+	} else {
+		/* WSA_MACRO_EC1_MUX */
 		val = val & CDC_WSA_RX_MIX_TX1_SEL_MASK;
 		ec_tx = (val >> CDC_WSA_RX_MIX_TX1_SEL_SHFT) - 1;
-		break;
 	}
 
 	if (wsa->ec_hq[ec_tx]) {
-- 
2.26.3

