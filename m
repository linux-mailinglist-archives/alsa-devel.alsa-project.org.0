Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B40521EE8
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 17:34:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A58BB1715;
	Tue, 10 May 2022 17:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A58BB1715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652196858;
	bh=ekcuWWiMhiyfLC0XDIFsVuQuKtSahX5Ih3CWtk7E64A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VSeOxasL6AjZBRMfNRHWWUeGNsNwujg1pHcryjRSVFxf2HXxQ4hC0jvuCZMvsVG+H
	 fGZgvH5vRqzWCTo2qxsrFVYt1nZswIY+o9G5A/5eRuW92eiLyrd3mFzASPxkOlONfV
	 LtUcG79wwHhbUOZMb24Uj7apzVQe33wmHDMz9FX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 194C2F80116;
	Tue, 10 May 2022 17:33:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 180E1F8019D; Tue, 10 May 2022 17:33:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DEABF8011C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 17:33:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DEABF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PTDPu+0K"
Received: by mail-pj1-x1030.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so2327587pju.2
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 08:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xJ1k9EA/+UNXzelEfz5rFqh3v1klZbFy5zSffXSzp80=;
 b=PTDPu+0KKykd2FPVJTIXDso5T7TGfhUaukX+OcOvJ19CTh2naLi+X2R1Xy/i/zzQ7H
 Tj1//nuXPdiYjbU8j496ocJuWP0aQOEr0L0c3Z81Zwr8UGIOwh/Os/uQ1uxYGGn763Hi
 bAREukfFWUH4RYbRdHU8MBxTyzXq1GwDG1h3swrDRU+ZTCC2E4sdljBBYICAQ+8S4WO9
 86yYv0seNUKXFZNRngJnL0GW9MJiQGUv8BZHdf5mXcjuaT8zW/iPavwfWI4xrAklxN3b
 i/mrBVpV6cX5i1EWr7rkx8peC2PqD8l4A/X2JqPxONICetxdx0mAnPHREYqsA+2fCit3
 Jn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xJ1k9EA/+UNXzelEfz5rFqh3v1klZbFy5zSffXSzp80=;
 b=kdsBzOm3jRs0nxONHccxnSU50Kf71UWDsqWXCkhH+ZQl2DxgeXSCJZVSrWEDSRkyaS
 kG50VU6TZOc3lNJr9KPKSIpeFVYbyYqQLm1SAT2IJed/nu/r6OmqSfK7o00wJflZAXKX
 xhYGPcZFKde5SZ2c1ySsBaFI4uHrkDRcMYGO4HKUARCwEuNzSusKvbR7AKwmS4C2MRNQ
 Ck4uwMfdZPWqgGDLe0ZuHBTptFVRmNiC1Xg8omNylwAZgv+ZgxJQhv5Q1U556hy/+h/I
 YjElPmi6zWgYXRhYlVwCLpZ/wWrw/zxLXXQD42wbwo82HzPv9SjD1E1wK4mbpPGgdFUf
 6LoQ==
X-Gm-Message-State: AOAM532Xx8b7TtxqYvIiscEQ7jnwxzt0H/P5T8+leabskzJ3o7Usr2UB
 HQs5TLuTj+IygsBVGB9iPA==
X-Google-Smtp-Source: ABdhPJz4gMh3dWEt+3+7fdc6o8dDMll05DHzp4cZDTjY7RzE3YMoSXSmSUc7p8a58rKvteYkM3EeLg==
X-Received: by 2002:a17:902:7594:b0:15e:bbac:8d49 with SMTP id
 j20-20020a170902759400b0015ebbac8d49mr20928350pll.124.1652196790823; 
 Tue, 10 May 2022 08:33:10 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 cd10-20020a056a00420a00b0050dc76281d0sm11104248pfb.170.2022.05.10.08.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 08:33:10 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 oder_chiou@realtek.com
Subject: [PATCH 0/6] ASOC: Fix the error handling code of the probe
Date: Tue, 10 May 2022 23:32:45 +0800
Message-Id: <20220510153251.1741210-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Zheyu Ma <zheyuma97@gmail.com>, linux-kernel@vger.kernel.org
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

These drivers mishandle the regulator resource in the probe function,
failing to disable the regulator for probing failure.

Zheyu Ma (6):
  ASoC: cs42l52: Fix the error handling of cs42l56_i2c_probe()
  ASoC: cs35l36: Fix the error handling of cs35l36_i2c_probe()
  ASoC: rt5645: Fix the error handling of rt5645_i2c_probe()
  ASoC: tas571x: Fix the error handling of tas571x_i2c_probe()
  ASoC: tas6424: Fix the error handling of tas6424_i2c_probe()
  ASoC: wm8903: Fix the error handling of wm8903_i2c_probe()

 sound/soc/codecs/cs35l36.c | 2 +-
 sound/soc/codecs/cs42l56.c | 2 +-
 sound/soc/codecs/rt5645.c  | 4 ++--
 sound/soc/codecs/tas571x.c | 6 ++++--
 sound/soc/codecs/tas6424.c | 8 ++++++--
 sound/soc/codecs/wm8903.c  | 2 +-
 6 files changed, 15 insertions(+), 9 deletions(-)

-- 
2.25.1

