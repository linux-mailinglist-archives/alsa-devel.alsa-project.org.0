Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D0B398571
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 11:44:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16FF516E3;
	Wed,  2 Jun 2021 11:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16FF516E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622627044;
	bh=y0umslI2ZlNP63yYPNoI40Vm0ckhKnC6cXIKLavO2zs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qvp+aoESpuaUhiJKgwCa5813AYvq64QdbrrjT6yiY0EqnJ4zBbi7tR0tYQcBXpxxW
	 UrrMV8i2hyoSgIJpsPFpsjwFQhE4YgCtX3gk0Cwql4uOdjA1fuaC4NqX2vXqI8NmCq
	 xiWD1NgtdX3k76Xg5XyOz61Q2sia4E3EwQolwocw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EB5EF80425;
	Wed,  2 Jun 2021 11:42:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BD14F80424; Wed,  2 Jun 2021 11:42:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7E0AF80141
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 11:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7E0AF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="h9/S1lbE"
Received: by mail-wr1-x430.google.com with SMTP id c5so1583189wrq.9
 for <alsa-devel@alsa-project.org>; Wed, 02 Jun 2021 02:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1bwvnBt46b5Md91UtcUGWL/AlFfTVV7qxAksQIq9DBA=;
 b=h9/S1lbEio3I0k1sJsuUnAl5NZ+gKun1O9ELFxpqHub3f3exMh1Uj2Q4mTJJ2VMmE3
 0+LpXNLdH7wDf47ouPCSBVNePxbIOqrEFiOL4EtsSt2ogKUZVT6oS2ECqgSA6YvOu0s3
 p5C9SI6LpxXCzPHSVwvO0eEMeu/fwiHDTFwXhfHB5jBfsclLy0zsOMo/bz8WbvqWlmSg
 +r8OOi+4QLTLZ9O4Rq6+8YAU4NIDxRIbHFfgaDxll3M9TtNsqdXid2GJnYI+Nkoz6Brx
 aOb4rdL1voEE2aveKYeo0jezHEYS7ORAK8pzaAiLskQ0UjAStuNICXYhy9/2hxCnsuzK
 bBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1bwvnBt46b5Md91UtcUGWL/AlFfTVV7qxAksQIq9DBA=;
 b=BcKNK2LZAJj76FtPt2LMwWkam/8FQRzuZCSudU1D3/VJwI1GpftAoPAcTK80/vTa5I
 QKtuD6Io63mGOjjUu+PPrQ2n9s8RuPo9V2/qcjO3zTb8opPfQyKpYn9grKHLU2km+15C
 THnLjd598+UYpaGFsiXfh+Gu+0oowDivgRPP8M8NccnyI9rRUPSePHjDzZcqyM1MlrxB
 SHmBWCQqVvbcZgU053wbF4FKFqA6KNxJJGTb07TGVRSVhfvK1xz896/r6T1GesAiPg/k
 P3dJ8mQ70RBTvDE+z29/+mQApqujWP/QhBB/sMXLY6mfdFXp09MjZZZGKPWpe1s4xY7W
 Gxhg==
X-Gm-Message-State: AOAM530/BdllsqEEYv8XwQBUws3YGzKONDG+wM0BHO4vO7GuP/8kIvln
 Gzf/gN8bVqZrmqar/MYInJv8qg==
X-Google-Smtp-Source: ABdhPJx10PafmAQ/VY0pzK8DIrLGFxB4haVNs3NLBwzgdx69yethsNuxYQSzr9BSWt4jSReAeofErw==
X-Received: by 2002:adf:a401:: with SMTP id d1mr20952564wra.55.1622626944677; 
 Wed, 02 Jun 2021 02:42:24 -0700 (PDT)
Received: from dell ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id z12sm2515907wmc.5.2021.06.02.02.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 02:42:24 -0700 (PDT)
Date: Wed, 2 Jun 2021 10:42:22 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: [GIT PULL v2] Immutable branch between MFD and ASoC due for the
 v5.14 merge window
Message-ID: <20210602094222.GF2173308@dell>
References: <20210519203754.27184-1-macroalpha82@gmail.com>
 <20210601140145.GH543307@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210601140145.GH543307@dell>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, lgirdwood@gmail.com, linux-rockchip@lists.infradead.org,
 broonie@kernel.org, Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 maccraft123mc@gmail.com
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

Enjoy!

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/tb-mfd-asoc-v5.14-1

for you to fetch changes up to ef7570b67541d8b938df1e45f56e54be70bf1360:

  ASoC: rk817: fix a warning in rk817_probe() (2021-06-02 08:05:23 +0100)

----------------------------------------------------------------
Immutable branch between MFD and ASoC due for the v5.14 merge window

----------------------------------------------------------------
Chris Morgan (4):
      mfd: Add Rockchip rk817 audio CODEC support
      ASoC: Add Rockchip rk817 audio CODEC support
      dt-bindings: Add Rockchip rk817 audio CODEC support
      ASoC: rk817: fix a warning in rk817_probe()

 Documentation/devicetree/bindings/mfd/rk808.txt | 188 +++++++++
 drivers/mfd/rk808.c                             |  81 ++++
 include/linux/mfd/rk808.h                       |  81 ++++
 sound/soc/codecs/Kconfig                        |   6 +
 sound/soc/codecs/Makefile                       |   2 +
 sound/soc/codecs/rk817_codec.c                  | 538 ++++++++++++++++++++++++
 6 files changed, 896 insertions(+)
 create mode 100644 sound/soc/codecs/rk817_codec.c

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
