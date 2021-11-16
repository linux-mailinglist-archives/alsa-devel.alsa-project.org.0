Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26913453149
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 12:51:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9290416C2;
	Tue, 16 Nov 2021 12:50:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9290416C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637063460;
	bh=zRrnkzueUnPdxk3LzAFnqz/oKkg4l/uAaFqo+kiUkWE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aN1aSm7e14BHNifXJ1kos0ydVnWH+q+Ep7Grjnt0yg4E0jd0IZ8s5JJPLWKwqpKM6
	 +nF3HpHLhS6FS5ofzazk8CRYp14r0SZlrjAGy9JXM3BqmwKfuAM5hvGaa1zAFWGMkv
	 EGFiVdamg7Tr88Ql+j6Lqsq4gkvCS1JdWShloQMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 544D9F8051F;
	Tue, 16 Nov 2021 12:48:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1515F80518; Tue, 16 Nov 2021 12:47:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9188F804FA
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 12:47:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9188F804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GBEllUfe"
Received: by mail-wm1-x330.google.com with SMTP id i12so15807678wmq.4
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 03:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=biB/sXM9QU4j7AYqjNTVI0o7ubAWrta294zCKzowIlM=;
 b=GBEllUfeXSKGvgLZgtvEpFW1lCj20RF86OaUyZ2G0yaFv9ShRS4UZxTU49tN/Ys2w0
 mdZ2f73mVaPgsntZ//EVSf49hT73zym0SHbrq96HcyAC/3YV9WT5XGQP5K///oNL/ucn
 hmSE8ZA57FH6T3cf3XVlyxUyRGJnRk5tIF5Z8UnN3zOqco7VHQDQdTA15V/iwJWHGMxq
 PeMl/+ZJ5yNE4XcHVlObZFL3KACW6c1WOtSbXzLAoAOgUknL5qGR806ITeD/RNjxg/WF
 E+f29CsNOnBAaL7ZPGVtkvj4utI5JehG6TgyIQW7f6FTbese7LD4G2b+W3gSO5TleA6D
 Phng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=biB/sXM9QU4j7AYqjNTVI0o7ubAWrta294zCKzowIlM=;
 b=WPxuRjgxybHXHzAu/pN/7nBuwtCOYvJwIJTmhQwtnk/1K4UCKDUwxmW3hm/tt8NjN7
 qwsZx9NH10k+6H5FEXVPLmWC1L3DRq0m/Fon0k5uy0idyP1wNxMDN/kibHYeow5PASLL
 3CVq9pzhTPgd2Ac6DbuX65MMHITUwPCTbNGZSfz0eTUB3IRzWK907+5iKQd4s9KDfx70
 S9cmLnMPo3uf889Jd9jzgT5GM9AccE7DF69goiMGb7KlQhvEbNiteZ4jkh8WsCgdosL5
 YbS0zFpnLiXj1mEMQndwf5XVvaBhKJs3XZWq7rKrdQJGOUZCUkDoU0yThGIrxOFqGWv7
 BOiA==
X-Gm-Message-State: AOAM5329G9nnfsL6L84YHbf5TKMzOnBfn+J1CMUbFJ4vF00sZ7aCaqb1
 XyVu78jte6OmzUhyzFgvN7roCg==
X-Google-Smtp-Source: ABdhPJy+JE/sEtbYpvECM1A9bpdg0aE/Oqp6bfw9L7PwgG9xUoNMJJperol2eb5BiLci2wEnEEsJ6g==
X-Received: by 2002:a05:600c:4ed2:: with SMTP id
 g18mr70566688wmq.122.1637063261572; 
 Tue, 16 Nov 2021 03:47:41 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id l8sm2260523wmc.40.2021.11.16.03.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:47:41 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/5] ASoC: qdsp6: q6routing: Conditionally reset FrontEnd Mixer
Date: Tue, 16 Nov 2021 11:47:18 +0000
Message-Id: <20211116114721.12517-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211116114721.12517-1-srinivas.kandagatla@linaro.org>
References: <20211116114721.12517-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

Stream IDs are reused across multiple BackEnd mixers, do not reset the
stream mixers if they are not already set for that particular FrontEnd.

Ex:
amixer cset iface=MIXER,name='SLIMBUS_0_RX Audio Mixer MultiMedia1' 1

would set the MultiMedia1 steam for SLIMBUS_0_RX, however doing below
command will reset previously setup MultiMedia1 stream, because both of them
are using MultiMedia1 PCM stream.

amixer cset iface=MIXER,name='SLIMBUS_2_RX Audio Mixer MultiMedia1' 0

reset the FrontEnd Mixers conditionally to fix this issue.

This is more noticeable in desktop setup, where in alsactl tries to restore
the alsa state and overwriting the previous mixer settings.

Fixes: e3a33673e845 ("ASoC: qdsp6: q6routing: Add q6routing driver")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6routing.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 3390ebef9549..243b8179e59d 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -495,7 +495,11 @@ static int msm_routing_put_audio_mixer(struct snd_kcontrol *kcontrol,
 		session->port_id = be_id;
 		snd_soc_dapm_mixer_update_power(dapm, kcontrol, 1, update);
 	} else {
-		session->port_id = -1;
+		if (session->port_id == be_id) {
+			session->port_id = -1;
+			return 0;
+		}
+
 		snd_soc_dapm_mixer_update_power(dapm, kcontrol, 0, update);
 	}
 
-- 
2.21.0

