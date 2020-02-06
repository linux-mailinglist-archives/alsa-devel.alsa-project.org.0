Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20023153D87
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 04:20:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D2E3168A;
	Thu,  6 Feb 2020 04:19:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D2E3168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580959200;
	bh=ukBqRbJiT3XXkH6PjOmlG9340cwkDNC9bs+jE15hoAc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UXYbIl6s9CxNd5tVnKpbsEUAaIHwH/Hh/s2lZav9bji8scUEUNbBxfxLHlqH7Z+7r
	 xvwXXgXTbNOFmDM8ZWlRxGFgYacDdzYsgCtvC8IP7ubh4/y61Bfpx2TzTjMDbgRNaD
	 SvlI+BLJ6KB8H6ZEsEXOJ5kW+WK1mH5I0raP1EfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B7A2F800AB;
	Thu,  6 Feb 2020 04:18:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 593A3F80162; Thu,  6 Feb 2020 04:18:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18A35F800AB
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 04:18:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18A35F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="kQipj1HO"
Received: by mail-pj1-x1049.google.com with SMTP id x16so2423713pjq.7
 for <alsa-devel@alsa-project.org>; Wed, 05 Feb 2020 19:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=uzNslwih52mut38yu2zPYARWSPgX7/Fj9tEkbUQiLCY=;
 b=kQipj1HOw6H9RjfqtABkLQr6XZs45QySHOuXfNbVYLTKTbVR6lJvlWXrJJqmXEvNHv
 7KYy3ZYtw0T7EMWkG267WNwwf4j5dBwiBhQN/aWL6NT+/nrNvt+BqaLm69DMvYP1KeMz
 533QlILj02oeM4k42xqA5qS3IicNO2AP9Y6p0MiBG1SswCLxhpani/zASYBossTXapj7
 xCOIY45RzAA3+a98PuK+kRfWpAFwI10l/MgT8hrB85mslJA+g8whCZVdw4+dXVcmGT90
 G6nhcNyzFXY1D15PmKFR/A1K2wIyT/Vaz5RxYW4oxehV7MFgH2WlXGb26+pAoO8+LBRG
 Lrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=uzNslwih52mut38yu2zPYARWSPgX7/Fj9tEkbUQiLCY=;
 b=jUnusRh5yT5OsQcv0kyWnupt8HAqDL9QRwteNCWrMV0pROvoHq/fSnaDCX1w0R8QN5
 cjxE09wDWZWyXzs4sB9Uw9G85LWbyMBeP0T7Fk8l/JfNdB4ciwYUYtEr1llVVuz3QESw
 l0kMAAX8+jTu2vkDxkPBPKxzpWKb9r0wWzqT0vLCDojAgkWqZsqVbb0MPYbq/PR18v9C
 +1hLG1j9kb0ch/0hEjSNOHy8wh/a5rqWI+gX4fb6ZMGXLEXjPFmY3PUH3UnNty7RHvIx
 qoeTYV2lGtylbLxsu7ghbgGAwwYg5dPzV+uPdGZDgP/QMqxiuy7eT57N0jEi92x6mLoy
 yh4A==
X-Gm-Message-State: APjAAAWYl2r9vpsqaT1CdLaB/hJXf9tC3FbzbYFUBJ3JumZyiEripwbZ
 TMJgn92Gy2Ef0oZvOlIvQNzbuxXuobKT
X-Google-Smtp-Source: APXvYqxvANnV5oSf4Bvv4neQ0kGoZkwLa+xHXPicON44dm/8skMS0QJiNuOflobRRu27n/GdR45z8/gaqNb5
X-Received: by 2002:a63:2bc3:: with SMTP id r186mr1296081pgr.294.1580959090963; 
 Wed, 05 Feb 2020 19:18:10 -0800 (PST)
Date: Thu,  6 Feb 2020 11:17:49 +0800
Message-Id: <20200206031752.193298-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 dri-devel@lists.freedesktop.org, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v2 0/3] ASoC: mediatek: mt8173-rt5650: HDMI
	jack reporting
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The series supports HDMI jack reporting to mt8173-rt5650.

The 1st patch is less related.  It stops running in probe() if failed
to register audio driver.

The 2nd patch supports jack reporting in DRM driver.

The 3rd patch supports jack reporting in mt8173-rt5650 ASoC machine
driver.

Changes from v1:
- refactor the 2nd patch to simplify the code

Tzung-Bi Shih (3):
  drm/mediatek: exit earlier if failed to register audio driver
  drm/mediatek: support HDMI jack status reporting
  ASoC: mediatek: mt8173-rt5650: support HDMI jack reporting

 drivers/gpu/drm/mediatek/mtk_hdmi.c       | 45 ++++++++++++++++++++---
 sound/soc/mediatek/mt8173/mt8173-rt5650.c | 17 ++++++++-
 2 files changed, 55 insertions(+), 7 deletions(-)

-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
