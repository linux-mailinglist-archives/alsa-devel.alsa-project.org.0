Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C336B47EC3C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 07:48:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BF4E185F;
	Fri, 24 Dec 2021 07:48:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BF4E185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640328534;
	bh=GuwpEwY+5tV/dj8co8oP7AOdWttZ7e4IvE9gggneAwY=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ct+6ljGut3Jez4LY0OOGo1RG2iuBnbP+B0deolWXK96gevsjzwSF0UHA8cf64F+/j
	 FI0nntoJmF9ptCKCYsaYYIw6ip/0dy4s4S8l9KM4Jf4PZak0EjmL7MMEXyYqECF3J1
	 9M8O8z3ASwbqaewLMKuuIDePM81/lPeHrzHEQ7dk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0489F8013F;
	Fri, 24 Dec 2021 07:47:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A358F800FF; Fri, 24 Dec 2021 07:47:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 810DBF80084
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 07:47:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 810DBF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Ztl7moX4"
Received: by mail-yb1-xb49.google.com with SMTP id
 e131-20020a25d389000000b005fb5e6eb757so13912180ybf.22
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 22:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=DVf6MLkdcSq4iqu1SV/P4EE991u5x/GQu5gFRqufygY=;
 b=Ztl7moX4N+359VfOeMJsgNn2mMXf2P6klg4TvGEt0BVKl2SIQrggsFE5cqou0oWis8
 LwtNOk5XSKZRo18Yt3mm3v7sIgYXn5hgZCuj3WxEt2VB0X7m9a+oWdK0B9vYrofy4xmP
 mcNQ21EMPD3wF493v+Qm6Bu7SM4PLajRPAWfi3joNrdLhYbp/+PuBwgTQxDzUGdPo5Vy
 akYYbHie6ixQl+qjLQWt1B4qdnEatn6nvFccVGJ6btQoO6jLmbVkx84wRveuJFBhHjhi
 9AeiKyYRQIAK6ELwpaZfz20sTv9YJhi4zacIgQJx4x/B9blSKD6AGyJuzD0uxZ3ouvAa
 TnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=DVf6MLkdcSq4iqu1SV/P4EE991u5x/GQu5gFRqufygY=;
 b=5kuv2FqJnTKztXoEW/3iuEGBQ3NaL1ndFKENLU9a36b8o3hPE528BYCkDMM8oMd9A6
 s8GQv/LebckMloLDzKg+tu7vxuCF8zU8wmWO0Ldho5Kn8L0R3ORVhe/nq1PAV+eaNZ//
 0+p1/dm3DODmBCKDemkRzsS4gGsgifQ6RN2LOcXSsDa7k5xgsLFEjepr5zfgh6ZyXF6w
 8bcS4/zVGktwwXMeZzAaDjHqPnlLrM2AGyD9Rrng+KW/I6D8AjBXPu9YWeIS96YuD+vs
 G2vPUUFZs0XQyGfvPs6ni9tasbX08JUN3JOlEYBITTEpux+jlEQ8MZExQasmFHflBnfg
 azjw==
X-Gm-Message-State: AOAM531b6pjQCgkGcGcgIc2oPkyvpflbrkL7C1T0ZFpqMrsiMdnlvvqE
 b/40c6+Tfov1JPtwqc2N5qRT6d9pruHA
X-Google-Smtp-Source: ABdhPJzYzeopiTKSuDeC8N2BXguIb54XSFGQtAry7KNcl/oW5SnxVnEMnP9jpaSsGT+nx7TkLdpOHtJzhGb1
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:af4e:fb49:1227:527b])
 (user=tzungbi job=sendgmr) by 2002:a25:7189:: with SMTP id
 m131mr8062235ybc.284.1640328456843; Thu, 23 Dec 2021 22:47:36 -0800 (PST)
Date: Fri, 24 Dec 2021 14:47:15 +0800
Message-Id: <20211224064719.2031210-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 0/4] ASoC: mediatek: fix device_node leak
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, trevor.wu@mediatek.com,
 jiaxin.yu@mediatek.com
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

The series is a follow up series.

The 1st and 2nd patch follow [1] to fix the device_node leak.

The 3rd patch follows [2] to reduce the log verbosity.

The 4th patch cleans the device_node related code on MT8195.
In order to align to previous platforms.

[1]: https://patchwork.kernel.org/project/alsa-devel/patch/20211214040028.2992627-1-tzungbi@google.com/
[2]: https://patchwork.kernel.org/project/alsa-devel/patch/20211220093408.207206-1-tzungbi@google.com/

Tzung-Bi Shih (4):
  ASoC: mediatek: mt8173: fix device_node leak
  ASoC: mediatek: mt8183: fix device_node leak
  ASoC: mediatek: mt8173: reduce log verbosity in probe()
  ASoC: mediatek: mt8195: release device_node after
    snd_soc_register_card

 sound/soc/mediatek/mt8173/mt8173-max98090.c   |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  5 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    |  5 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     |  5 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  |  6 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |  7 +-
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      | 53 +++++----------
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 64 ++++++-------------
 8 files changed, 56 insertions(+), 95 deletions(-)

-- 
2.34.1.448.ga2b2bfdf31-goog

