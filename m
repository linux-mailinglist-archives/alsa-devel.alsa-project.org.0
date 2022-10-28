Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3DB610E9A
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 12:35:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BE1A2451;
	Fri, 28 Oct 2022 12:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BE1A2451
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666953325;
	bh=byNQxt41zUD3eyLSFp+W1YER/BQKT5sEs94gm3+tY+E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tkuvH2dpC89h9qUeZQTUsVLLhGc5nUX6ZvnZTVMUTp+KqijJhES30FW0t41NRIN3Y
	 AtXToZZFaddXYwfXqPB+haAWOQB2hAcx5/HMSP+Du3Y95c2SxPkrJpzvdNeyqe0SME
	 4e6+mUw4JczU1n6eKhgSfmCq2Y5rIAnfV1OTpbf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F1CBF804BD;
	Fri, 28 Oct 2022 12:34:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A590CF804BD; Fri, 28 Oct 2022 12:34:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42820F8016A
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 12:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42820F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TBXDBLlQ"
Received: by mail-wr1-x42a.google.com with SMTP id y16so6004696wrt.12
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 03:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8NzwqSpckoNP17it2+mRAD4Pbxq1xir6QmYGwW3Pwv8=;
 b=TBXDBLlQfNn38PkI94DTl4TOhBkjDateSFX08TuNwp5WHEFIN3YhBS+CJiShn3Ir30
 sa/ND6BR8DwYh6gA4lKJ+R/FOSpO7FS/vcfK3X5gk3Wvehz714/KwqrJ2I+UlfKJueqK
 mmgc5AABHvuRzpuku00latfv7Nn7HQKxRSXZ5/s3PN+yYJlK1OiB/W1/KzGemluzNNhP
 jz30k4M6myvuCThPD7OyXvIMS4dxVHdsDGPCyLcTFPyiK7e7G3fHEfVm0YeX8EIElkIb
 NCHqUjdsSX6tCQnwdR8tMbCeh0Jux2dBoqb/um4YnR5UuwovJDRjuqHPD72ttyPHFZGl
 3e8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8NzwqSpckoNP17it2+mRAD4Pbxq1xir6QmYGwW3Pwv8=;
 b=clKjtSeAHmA5s65Wr++fAAlP2HvpMgSx09zHB1/ZzehB5AT0X5qZHShflxAW+CExQr
 Za1iuAbzzPL5n4qbbyblkZ8h4YYqjPbxbN8MO1qEyFpwpC1CPLvAxuDLgPjR2IYp93Am
 gttNPwb4yITg9VtHJqoLo8RIAl7HCUvL9EVf4HEVE7A7J9y5AWPwGFrNt9GlcyBxfIjD
 r7c18HHCamnNdNDkI/uEQtgAhg7Xgf8VyeOMSVQ4pI+y6s2+BvdiHDa70Syot6QS3Ecq
 HsMruUIf08egBJKe2e5ZBANR4XD+I9oTerwMGhnQY5BKj8pn/Jizs4e+5jE3Z134Mqdd
 jT1w==
X-Gm-Message-State: ACrzQf0CvR/9DSO9Ma4iqMgMEVa4oSzYU8T2O3Ma2cxe5tLQguzmS4tv
 4vM9EcI8ghzatADnXrx+cMs=
X-Google-Smtp-Source: AMsMyM5XHpNkQ+aqqZC8OjhAUpjzirc3Qe7lT1TlMRE+R0iEbBLi8U3FiHekJFB70tvRg+XqMKDMOA==
X-Received: by 2002:adf:e64e:0:b0:236:76a9:446 with SMTP id
 b14-20020adfe64e000000b0023676a90446mr15760555wrn.696.1666953265347; 
 Fri, 28 Oct 2022 03:34:25 -0700 (PDT)
Received: from localhost (94.197.40.204.threembb.co.uk. [94.197.40.204])
 by smtp.gmail.com with ESMTPSA id
 8-20020a05600c024800b003c6bd12ac27sm3841551wmj.37.2022.10.28.03.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 03:34:24 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 tsbogend@alpha.franken.de, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v1 0/3] ASoC: jz4740-i2s: Remove .set_sysclk() & friends
Date: Fri, 28 Oct 2022 11:34:15 +0100
Message-Id: <20221028103418.17578-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
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

A quick series to get rid of .set_sysclk() from jz4740-i2s.
It wasn't used in practice so this shouldn't be troublesome for anyone,
and fortunately there aren't any backward compatibility concerns.

The actual rationale for removing it, as opposed to fixing the
issues of the current DT bindings and implementation, is provided
in the dt-bindings patch.

Note the last patch only applies cleanly on top of my earlier
jz4740-i2s cleanup series, but doesn't strictly depend on it.

Link: https://lore.kernel.org/alsa-devel/20221023143328.160866-1-aidanmacdonald.0x0@gmail.com/

Aidan MacDonald (3):
  dt-bindings: ingenic,aic: Remove unnecessary clocks from schema
  mips: dts: ingenic: Remove unnecessary AIC clocks
  ASoC: jz4740-i2s: Remove .set_sysclk()

 .../bindings/sound/ingenic,aic.yaml           | 10 ++----
 arch/mips/boot/dts/ingenic/jz4725b.dtsi       |  7 ++--
 arch/mips/boot/dts/ingenic/jz4740.dtsi        |  7 ++--
 arch/mips/boot/dts/ingenic/jz4770.dtsi        |  5 ++-
 sound/soc/jz4740/jz4740-i2s.c                 | 32 -------------------
 sound/soc/jz4740/jz4740-i2s.h                 | 10 ------
 6 files changed, 8 insertions(+), 63 deletions(-)
 delete mode 100644 sound/soc/jz4740/jz4740-i2s.h

-- 
2.38.1

