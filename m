Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB5B8F20A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:22:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1BB11663;
	Thu, 15 Aug 2019 19:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1BB11663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889743;
	bh=jqX4E9fDFyEG39IOK4RAPDq4XhnvfZEMxf1HbfoEBqE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ULdbox7faQVErqC+KwSSeWjAOkc5MD9mh/Yua+R/kGBvGbsnuFE6MUEk6LzZMMh4h
	 2eeXhsDf8SpkhWfhabDJ4xj1e91/qWLrbcPGwdLREmrpJj7i6v9N0GdVHG4MqiaSAY
	 w2ETIbYl0BLAftPTkJ5fbQXQGfPjCCV8B/TjJFII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8E94F805F9;
	Thu, 15 Aug 2019 19:15:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6D8CF80675; Thu, 15 Aug 2019 19:14:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f99.google.com (mail-wr1-f99.google.com
 [209.85.221.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25F22F805AA
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25F22F805AA
Received: by mail-wr1-f99.google.com with SMTP id j16so2854155wrr.8
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=8OKTosr+JapOEyKfTFu5/cIoWSDJg3p0VdlQDgNuNVQ=;
 b=Q7LxXVHj4I0eo1VL+8Lzy7yyCpYCV+sMCJV+qrFxzbfFmMEILsGIW2ukCnfnXAdvYe
 XjsxEHbYVagr2xDjTYYwaS0rK2B/rmiexgN4XsCYaPdqQM9SU0wHNrtUJ0/3zRLGj8fm
 UeAPlCvVr18QMugcTx+zOb5+m4x3lwx53zCr0cvTBSdLazfdzsna3T9XewczrwPkq6eH
 jwtBYb3XieBvlv/jTmrp6S+gJPS31LURkLrZ+goo2rE9buzAppJXtklAUSbGwQivJoqt
 Uv9m8L1JCwn1M7e9d2rZHBQ3ONyMakH5dGiXSboVfYXg2NqoChoTi1B4DrKcKRXVIM26
 FryA==
X-Gm-Message-State: APjAAAUUs49pA0lb9YGBemWJ1p105Ijz2JA356DQk8+WJ04xKPMHNaXd
 WY/Io6DIbNLfGGhTRjrPJTI7PS19GSWoQXTIBjsQc5GQ/OXb72zLl9AvOFYPBMXhbg==
X-Google-Smtp-Source: APXvYqyFff08HZqpINQezwtCcVwX7DUZ5s6kk7CY/pdV4LdEuXHc8dJVbAquvNC4Dzb1jfopyWtKL7V3K3UB
X-Received: by 2002:a05:6000:1c8:: with SMTP id
 t8mr6337203wrx.296.1565889263829; 
 Thu, 15 Aug 2019 10:14:23 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id d26sm57082wrb.30.2019.08.15.10.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:23 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKR-00051M-IF; Thu, 15 Aug 2019 17:14:23 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id EA7D62742BC7; Thu, 15 Aug 2019 18:14:22 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190815092300.68712-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171422.EA7D62742BC7@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:22 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>, info@metux.net
Subject: [alsa-devel] Applied "ASoC: es8328: Fix copy-paste error in
	es8328_right_line_controls" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: es8328: Fix copy-paste error in es8328_right_line_controls

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From d63887bc4f50fede7013bda7c733d58ecc43efc1 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 15 Aug 2019 17:23:00 +0800
Subject: [PATCH] ASoC: es8328: Fix copy-paste error in
 es8328_right_line_controls

It seems 'es8328_rline_enum' should be used
in es8328_right_line_controls

Fixes: 567e4f98922c ("ASoC: add es8328 codec driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190815092300.68712-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/es8328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 4a3d303fedfb..fdf64c29f563 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -227,7 +227,7 @@ static const struct soc_enum es8328_rline_enum =
 			      ARRAY_SIZE(es8328_line_texts),
 			      es8328_line_texts);
 static const struct snd_kcontrol_new es8328_right_line_controls =
-	SOC_DAPM_ENUM("Route", es8328_lline_enum);
+	SOC_DAPM_ENUM("Route", es8328_rline_enum);
 
 /* Left Mixer */
 static const struct snd_kcontrol_new es8328_left_mixer_controls[] = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
