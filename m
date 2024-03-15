Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD3F87DCB6
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 10:04:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70FE3279F;
	Sun, 17 Mar 2024 10:04:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70FE3279F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710666273;
	bh=XVrqaYGWmJTFebdeWf0nePt+KDZv5ZIE/BRC4hiKX1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pndKIlcchYWTX8Mu2OTztS5GZn3DMrSvyWYbEUApPxsKNFFg82u3hFqYQwGe0EBL8
	 3rhvsnyX9N6uBceTcKLZYFFs8CsBfquuLZYcyibuV+CZ5s0Fmf5zbpETlujBfN1Wi0
	 cz56vh7Tsp73ZVX3iDw58fwMNrMDa3H+Iybi7Mv4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FE49F8068C; Sun, 17 Mar 2024 10:02:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 818F5F8068E;
	Sun, 17 Mar 2024 10:02:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15889F8028D; Fri, 15 Mar 2024 12:29:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09A4AF804B0
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 12:28:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09A4AF804B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nQloQW+L
Received: by mail.gandi.net (Postfix) with ESMTPA id 4FE46E0004;
	Fri, 15 Mar 2024 11:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710502083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rIIVeMMbsAWvQSYg8CaxSM8SnaSJIx8VolCRbQElsx8=;
	b=nQloQW+LiV7NH+lAEDVXoJbNi3po1hk/8VSb3nnFfLqg3YhAzmXIS4BV63HKESHUBS5PHw
	mjTogem3ct8QXJ1rglzYWWCcYDokmAJ/uUh+JsBeaxZukIHK1SGmDMfY+etmN8yZyKv4qZ
	UGRb0H1QDD7DOryGFKFJvp/poc87G+J6gxXSOjTS2Qmhvtora+DGRn77j2oGcWu96rHvqT
	kDa17wCDAtXpEqAID8cGXcc9A2HZea0sGM4y0BVeTXrwMzDP+7OZs4zuqF4qSW7+30a4tZ
	6FcQDGWNJNUgwmVTivFucl+QrfUXMmzKMea3RRfEFhG0a13uGNtGIohaP9fIqg==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca
Subject: [PATCH 06/13] ASoC: ti: davinci-i2s: Delete unnecessary assignment
Date: Fri, 15 Mar 2024 12:27:38 +0100
Message-ID: <20240315112745.63230-7-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CQM5BT4HIYTDWDWVM5NJCJB56AVPUGSE
X-Message-ID-Hash: CQM5BT4HIYTDWDWVM5NJCJB56AVPUGSE
X-Mailman-Approved-At: Sun, 17 Mar 2024 08:56:28 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In davinci_i2s_hw_params(), mcbsp_word_length is set twice to
asp_word_length[fmt].

Remove second unnecessary assignment.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 sound/soc/ti/davinci-i2s.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 8ee22d79b0f4..f4514d4dff07 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -479,7 +479,6 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 			return -EINVAL;
 		}
 	}
-	mcbsp_word_length = asp_word_length[fmt];
 
 	switch (master) {
 	case SND_SOC_DAIFMT_BP_FP:
-- 
2.43.2

