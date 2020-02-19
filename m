Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DB516408C
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 10:40:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D18F1697;
	Wed, 19 Feb 2020 10:39:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D18F1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582105234;
	bh=VLmwpV5tpkvlHE6Sw+cauFthmC2AW802ltloeLddhGE=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sXJgFVjIzqTEcdHD/mdfBT7bPsOoqKBpTvH3uRAMRZd2W7HJvQFfFFcmSHc/oV567
	 iT/1Do5UsSajdzSOF2v4eFPPUmT9uNkr9Vpn4Rdx90LHEjQkZXNZUfaI9RKkOSeOjO
	 2dMvD5ihuntAnLVwB9gh92XdeTHKRk4U+2RS63o8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AB94F801F5;
	Wed, 19 Feb 2020 10:38:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8004FF80172; Wed, 19 Feb 2020 10:38:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 370CBF80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 10:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 370CBF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="XzeUQSD9"
Received: by mail-pl1-x64a.google.com with SMTP id d20so11806328pls.15
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=89YIg0h2ZkhbFzJoBn22XaYKclfRvptQY13fnAt8VIY=;
 b=XzeUQSD9NuDGXC9zl85pKCOYwHpWghWSXSeReSrHwcTJ0al5Uzt7RAifLM3G8DpVla
 CbJ7X6lwbegFw4wIyNvk2fCLHtyCXwOWAAEKS5yFTyth4oQ4K86BVSE49ZPzt+hWyxJQ
 RCuWGCPumMKh2Y5YT+2BEA7ZUudYjGJhwIwvHohskQOmhHmOxmPdPfjAy0ysA5ZnKZRM
 JXD83RdOBT/fKjy/gjIPLeZ9zxiJE+5aBsZ9NkSOO53wCjzv/JIzTI/w5PLkuXapf/zv
 jvWVrgxkaGQSI9DvnaivgAxW0u9/3GaGnKjEgMBKGoLS/S8kAP6/2PDvRKyPCLwr4ZGK
 MABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=89YIg0h2ZkhbFzJoBn22XaYKclfRvptQY13fnAt8VIY=;
 b=iQnjGgCEaOIcL38qnf/51RWBbrI/CSMZsxV2IU/f+2a3sepoEniArieHJZ/7o0Fd4F
 LMuHel0tXv05P46UB4xyE8A79FbInCAOubuUVytbvXXcgiKPsjooYzTPFmDLsKctiSdS
 8jSLjzpfUEAgiuFi3NyvwT0ldq6zKvWFk0oVhj0OVWT2S0X9MCueG3ybiR+Cn8kKBjgb
 DVzbF1sIl+GfF0Y6vB28yTR76MDLHn4d4pGRy8MqiAtDg8rr7OjZw6s1XxSXV2SRB4zt
 3cMO3Rs6yxO40Ier4r8Qkq2wjBLppcj4aMNwBOVW1lnYmvE2JhJWsy+5Cbdlb0EpqTFS
 80og==
X-Gm-Message-State: APjAAAXm9j1ZRD4ArICvnPldBVl540Qo+dFmhldrdNKLXQfk3QdEjVuu
 t3xwTwc2dxJfHXNvM6nPIdZYIQvDGn7F
X-Google-Smtp-Source: APXvYqz8NcglE9PVo77P6bbUAIyLmIzJ/IbeYxKCjrYdLSIug+yTVnKBpNnwnijnW8ug6Q4zygXjIuZ5Qp0c
X-Received: by 2002:a63:aa07:: with SMTP id e7mr27182669pgf.90.1582105124718; 
 Wed, 19 Feb 2020 01:38:44 -0800 (PST)
Date: Wed, 19 Feb 2020 17:38:37 +0800
Message-Id: <20200219093839.6212-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [RFC PATCH 0/2] ASoC: mediatek: mt8183-da7219: use
 SND_SOC_DAPM_PINCTRL
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com, jiaxin.yu@mediatek.com
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

In previous discussion[1], Mark thinks we should have something general
pinctrl integration with DAPM.  SND_SOC_DAPM_PINCTRL is exactly what we
want but I failed to find existing usage (maybe in topology files?).

To be equivalent to mt8183-da7219's original implementation, the 1st
patch selects sleep-state at the beginning.  The 2nd patch attaches the
DAPM widget to playback stream.  When the stream is about to start, the
power on sequence selects the active-state.  When the stream is about
to stop, the power off sequence selects the sleep-state.

Note: the DAI links will connect to hdmi-codec, that's why the playback
      stream name is "I2S Playback".
Note: this is a RFC series.  If it makes sense, will also apply to
      mt8183-mt6358.

[1]: https://patchwork.kernel.org/patch/11379735/

Tzung-Bi Shih (2):
  ASoC: dapm: select sleep_state when initializing PINCTRL widget
  ASoC: mediatek: mt8183-da7219: use SND_SOC_DAPM_PINCTRL in TDM out

 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 98 ++-----------------
 sound/soc/soc-dapm.c                          |  3 +
 2 files changed, 13 insertions(+), 88 deletions(-)

-- 
2.25.0.265.gbab2e86ba0-goog

