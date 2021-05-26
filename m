Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2BB39230F
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 01:12:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E7761724;
	Thu, 27 May 2021 01:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E7761724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622070731;
	bh=kDaDVc9Xt1O/bRqr3nnD85mzZX1bkKy8Bs6Zh45UR9Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LD311/4zpdBuHVwYUGcA82sxI+8ZQ5+D6pl7RnbpVARFEdKjci0OShytE0JBvCnK8
	 Qh4IYkRZtTXhhfqEleyFEzP77REnagVkGDfIQYHjwuM9BA8ZPVi6Tpnn+JvbFnpZ1j
	 OMtPPzzu9JAwOISvCy4FY6Cv8Lemc5Z9YpduI5TQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70A2DF80300;
	Thu, 27 May 2021 01:10:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14AC3F802E8; Thu, 27 May 2021 01:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03843F80212
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 01:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03843F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NpYz1s8S"
Received: by mail-lf1-x12b.google.com with SMTP id i9so5019011lfe.13
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 16:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0DwJ6464lblgiJlofD5GM02fvqVVflTlv4Zsog+he+Q=;
 b=NpYz1s8S7yxF1eqtPR6VkJLmv68CCWaRwk2PECxnZO+Y3ztcKaXwkGfGYNqIXLCAe6
 6yANl5CG9Il18wP4WNoNQVEzUFSgDLxavq1D6IxmL+Z6xoXrg2Z0cpXnJwns8J0b4G8y
 8TUnzI6jTQSmmlWgkEpNB8knZ/JRoxyHS3/QGZYuMErowraWvgmNh4E+PDSc/6YZayzC
 OnviQkz0Pd7xqh64cftvKK9MpwYwG4c/vXhkMJcs6e5fKJBmX0zhRpS8znhKlsehhwza
 2pLmZL+dMf5PW/nBxnIutbve9bRnxX9WKRDjHCx+jpEjYy2qtkb6Dt/1HCm6sZO6X0WD
 Zz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0DwJ6464lblgiJlofD5GM02fvqVVflTlv4Zsog+he+Q=;
 b=KlhqJjypSc76jUEXZcXFxkZsdX2yOQF2AOxLk4z922Qc4uqp3Ha/Tpb/oMYCNJ3edH
 nE0I92PkmKhYx9vzylVM7Ewfqabx6CnGP35YK+gBIpsVYrSgT2o9WWUyTHvSmFId1Jdg
 13OxNfq1qvokfPAknvmRGDILb2nsPOxUXneIJb/QgpE4H1WZ/IA8Bazuc93o0y23c5Pf
 zUySkMGxsI7lqnWKa5/dmlePnd1sYtyd5jguRY8Xf2S+pnuhP1EnUdWbUqv9yZEN73tQ
 0MyRzOWwFINDnmitr3rekf04iMaIzauqNelxhA8XEqrPHfRGjveax3Kx+icqxY23Q6r8
 KtZg==
X-Gm-Message-State: AOAM531tDYc8ecSFCE/uDLWdTG0OIsyYd1dsuEV9EYZUlovMt4O9K3/I
 kt9tXA8CqAgdKqkiY50YM6E=
X-Google-Smtp-Source: ABdhPJx3wJMUqA3I0HnKdDRalpJxqKd7JaTCDIbE0v4w2KBZxtwFsGjC3mcsc82mGmi2onNu031V5Q==
X-Received: by 2002:a19:dc4e:: with SMTP id f14mr314076lfj.176.1622070623116; 
 Wed, 26 May 2021 16:10:23 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se.
 [98.128.228.193])
 by smtp.gmail.com with ESMTPSA id d5sm35802lfi.144.2021.05.26.16.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:10:22 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/5] ASoC: cs47125: Constify static struct snd_compress_ops
Date: Thu, 27 May 2021 01:10:09 +0200
Message-Id: <20210526231013.46530-2-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526231013.46530-1-rikard.falkeborn@gmail.com>
References: <20210526231013.46530-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>
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

The snd_compress_ops structs are only stored in the compress_ops field
of a snd_soc_component_driver struct, so make it const to allow the
compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/codecs/cs47l24.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index eaabbb56a173..6b6d08816024 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -1178,7 +1178,7 @@ static unsigned int cs47l24_digital_vu[] = {
 	ARIZONA_DAC_DIGITAL_VOLUME_4L,
 };
 
-static struct snd_compress_ops cs47l24_compress_ops = {
+static const struct snd_compress_ops cs47l24_compress_ops = {
 	.open		= cs47l24_open,
 	.free		= wm_adsp_compr_free,
 	.set_params	= wm_adsp_compr_set_params,
-- 
2.31.1

