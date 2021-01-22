Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 043672FFFCB
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 11:09:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9008F1927;
	Fri, 22 Jan 2021 11:08:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9008F1927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611310174;
	bh=WDKE70TvgCkzoBlZ0PujjPTvuU1ZVI7xmIbBOU1+EMA=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WsISDBXxdHqbLbvawGA5G19++srUv31Tmj6fGdcRjCKVOJGFOcpz6GqGXDOqJ/eSP
	 sfp6MBH6d/nR0oZimT8cK5aHubevUyP87Ft+GIzSrOeA/cA0IItB+V5gM8kQrrngXD
	 onuZVRUXLCKzqYVTHT4IE8MYf52pZt11HVH86Yk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B477F8019D;
	Fri, 22 Jan 2021 11:08:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B39F8F8016E; Fri, 22 Jan 2021 11:07:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAF5EF8015B
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 11:07:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAF5EF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="MSmCEXcD"
Received: by mail-pg1-x549.google.com with SMTP id 18so3180796pgf.19
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 02:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=6d9ypr4vZOOLny0Ksn+v0E77eS+9BrNVhsBmyLpCA+s=;
 b=MSmCEXcDVog7GORqu9t+ZdQC+5Y8YPLd7mZhdJAPdr8ficynQCjFftWmzxM2eKV6x6
 SQ5katv+Oskv8U+id291SnF5NuZzTdnfCrFuI8zQKVw8eFfFx4cYQvIhlO5pnJUIkVgk
 du861cfr3X6/wx9pVii7nxEbQbigdrhQU1v1lZATF2fJ9KiE9tqF9umoXqW4ecdlZlUa
 x4wrRGbJk5QwG+ShDL1S2eH39rat44PDTYmQ/Xj1Q91Fq04cPuO8u70mMpI6GVo2wI6b
 wIkhLPIBo2mDVbR7Yt+QgNcA2QC5IokgjHaP90ldyIyZlUrEPC82Sc+FbTrFQnv0zH8c
 DOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=6d9ypr4vZOOLny0Ksn+v0E77eS+9BrNVhsBmyLpCA+s=;
 b=DE7v0dAP619gfWMNTrcI2B4YAgElyaP6VrvDT+4loLHfzBqzK0TmkQsW0xZZyIut02
 MitOPdPhu2nTHStkeNDoCD4KTuGSn6mf3HK2qPFGx2zJGzqxYseEuXDKhu70MliV3iGj
 SjBIFoksGPl2/McRMPx9ZOIoeOAyHbtMn4lE6PwgRu0qR2kAMsdZ3PMYh0pd9tG7fu8E
 7nu8wMd3MgrBSbhm3rhCulL7U4YSyOjt6A7a/Y/nsiC7CTpOD22t9n8MvtNSHO931C2o
 gc6WAteVVcFp3winc5j+YVyCrq6PgsLjs+RlVtH5d3/mlIbw7psHkSZN8QEI88OsKPXN
 WKXA==
X-Gm-Message-State: AOAM5333tRjHdE1tbee6qgj5btxxmghBWOuM8pmKBNNG2azau3nF78H4
 pdLfJ+YO94wVfX7klxtGGmRpvKr/EAvc
X-Google-Smtp-Source: ABdhPJx8fmWQwmpAH530kAg03H8OUSJzQ8Rm7o1439hOyXtRmCRQ2kgRwSVOuDqOo/tBnM9WUgnRlv/5QLE2
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:4552:5bc1:d50a:b3ff])
 (user=tzungbi job=sendgmr) by 2002:a17:902:ea0c:b029:de:6578:b9fc with SMTP
 id s12-20020a170902ea0cb02900de6578b9fcmr4223872plg.58.1611310070668; Fri, 22
 Jan 2021 02:07:50 -0800 (PST)
Date: Fri, 22 Jan 2021 18:07:38 +0800
Message-Id: <20210122100742.3699128-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH 0/4] ASoC: mediatek: mt8192-mt6359: fix I2S corrupted for
 RT5682
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

The series fixes the I2S corrupted when mt8192-mt6359 is playing and
capturing via RT5682 in different formats.

The 1st and 2nd patch refactor to use asoc_substream_to_rtd().  Just
realized there is such a helper for the purpose.

The 3rd patch simplies ops of Capture1 DAI link.

The 4th patch adds format constriants to the I2S to make sure the
settings are symmetric.

Tzung-Bi Shih (4):
  ASoC: mediatek: mt8192-mt6359: use asoc_substream_to_rtd()
  ASoC: mediatek: mt8192: use asoc_substream_to_rtd()
  ASoC: mediatek: mt8192-mt6359: simply ops for Capture1 DAI link
  ASoC: mediatek: mt8192-mt6359: add format constraints for RT5682

 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |  4 +-
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 73 +++++++++++++++----
 2 files changed, 61 insertions(+), 16 deletions(-)

-- 
2.30.0.280.ga3ce27912f-goog

