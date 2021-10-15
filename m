Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B2142FD3B
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 23:09:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F7FC188A;
	Fri, 15 Oct 2021 23:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F7FC188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634332147;
	bh=3PItBST+wRhs6VIWpKDIPxs6pcHFO4VUA/P3BYQ+Mzo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oQWKnxveM3FspVlAvie1K4YQOu5iJUQeMXtpIvMI3V3b5fryfRuPEcfbrOVmV2gio
	 rvQ0E+JRkRjTIp2adeCIShKyBWyQLM80RlBR9PJaZho0/pZjRDPGwdwuvDSWcva5O+
	 dj10fCOdfHadJ09+t35hm4yP4NStt93ajww3G0Qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6968F8028D;
	Fri, 15 Oct 2021 23:07:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86326F80269; Fri, 15 Oct 2021 23:07:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14CA7F8016C
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 23:07:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14CA7F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eYZpMby4"
Received: by mail-lf1-x12c.google.com with SMTP id t9so46020160lfd.1
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 14:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bC5/do6YaE4lPDo0l97sBVrMnwWkBfvui2f3ar33Hc4=;
 b=eYZpMby4iGA+yh0NGF+8l+PJgizeDoLcmjeHyV4wtpwUUMvIQ3AXzmd7sgsMKFaAEZ
 HGwEWFsnA97BC5nK+vWjNWmsqMZ1Im1rXEY1pB+nOsZ6WjOO8J5sIu6bld0z5TfTDJp4
 nW8LdiaYhaDDgRW3w1oYL3q+CgM6oBiybdB+JAvQLP5CDM1kzoLNiqOdZ5+q9aUqW5Fh
 LjA+irP2bBP9CUjvT5nVex/k8Ng3w7CGm6lIea3dkjWeVYyIajfpVaz4erDghnSWB9QH
 1MWXfqPPPWTdbi+W92psmMlulWP2oV2+G6KaHPsRCyKzXxGhzPE7WaF0VB4CIkc9zhv7
 9yUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bC5/do6YaE4lPDo0l97sBVrMnwWkBfvui2f3ar33Hc4=;
 b=qeYzGjPiqbnvpNEIK9NriVK3oVBg2qT9sY4/QkD8eiCvUgJd1oBSHRGKeMzN0jnpN7
 f+MVZEbqKfXvbEcJ108m4+SIro53htgCq+Kj06duemMQLJkMnWfNNk6s9fzsXTUffyYd
 ba5Q9jRsvzyOSeq7LjHCv0JeDg5KwvSC523SEg+dzuGannANrw1Us3vsUmSaK6ZGCiEh
 cmJ6WBJD69G8O+OGiVBN9ZlJ5EjAl5IuYT6SQ+tHczw/bHSCFqPe3mOpXka60Do19sWT
 8DF+JDiaZNZiljHkjcghNY4Cv+6ApCNLeGwFZApC/8awEtnFFGy5bOh3sRQ+dW0KhJXJ
 sk0w==
X-Gm-Message-State: AOAM530Z3tPiK5vFdG1xDkPy7U24CKV1B1rwk5wXjzFx0YNNsn0WiNjH
 31A48Wb5nbpUjqkMgYyb9x0=
X-Google-Smtp-Source: ABdhPJwkecQzQcx4sJp1365mMubW5NhJvbb3QNHQkc1WY9qZz7N2viBUYDjQts57NocZZ1Q8Ya36dg==
X-Received: by 2002:a2e:bc03:: with SMTP id b3mr15169664ljf.54.1634332063982; 
 Fri, 15 Oct 2021 14:07:43 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id a29sm125876ljq.37.2021.10.15.14.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 14:07:43 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] ASoC: rockchip: i2s-tdm: Fix refcount test
Date: Fri, 15 Oct 2021 23:07:29 +0200
Message-Id: <20211015210730.308946-1-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

During development of V5 of the i2s-tdm patch series, I replaced
the atomic refcount with a regular integer, as it was only ever
accessed within a spinlock.

Foolishly, I got the semantics of atomic_dec_and_test wrong, which
resulted in a test for 0 actually becoming a test for >0.

The result was that setting the audio frequency broke; switching
from 44100 Hz audio playback to 96000 Hz audio playback would
garble the sound most unpleasantly.

Fix this by checking for --refcount == 0, which is what it should
have been all along.

Fixes: 081068fd6414 ("ASoC: rockchip: add support for i2s-tdm controller")
Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 396277eaa417..5d3abbada72a 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -408,7 +408,7 @@ static void rockchip_snd_txrxctrl(struct snd_pcm_substream *substream,
 		else
 			rockchip_disable_rde(i2s_tdm->regmap);
 
-		if (--i2s_tdm->refcount) {
+		if (--i2s_tdm->refcount == 0) {
 			rockchip_snd_xfer_clear(i2s_tdm,
 						I2S_CLR_TXC | I2S_CLR_RXC);
 		}
-- 
2.33.1

