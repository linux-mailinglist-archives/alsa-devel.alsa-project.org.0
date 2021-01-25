Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FDA302215
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 07:21:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3502185C;
	Mon, 25 Jan 2021 07:21:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3502185C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611555714;
	bh=CqOQqQWRlKqX43F7+TcOBDgIR8Andqz+KugqmQn13kU=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mf36oHIBeqK3ZV9nhopqbm25jK0lYIEqzuF/+pDnMZEFzCTLJ+esAIExoaXFs+n5T
	 5XxRdCRXdYtf5tgB2zptFfiopTeFktB6Z28usxymIDT5zPysKEbbXPy7GdBcEpu+H+
	 F/vy0LdydWsDZGr4lm0V81hdonSFz6kZa4Muu9hI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43D5BF8025F;
	Mon, 25 Jan 2021 07:20:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 591F3F80259; Mon, 25 Jan 2021 07:20:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83AFEF80130
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 07:20:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83AFEF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="GKchXKqt"
Received: by mail-qk1-x74a.google.com with SMTP id 185so4363074qkl.6
 for <alsa-devel@alsa-project.org>; Sun, 24 Jan 2021 22:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=3aj/PkXwRh0WiTXw9KNGNNlgW3DNpORdGlte2svtDMY=;
 b=GKchXKqtqTNP/NEVSZp4WmKg0eaxwC2VNiOng3uba3FrGLM371a9lNKavojkULH7MV
 JtwPajb0CXnqF8jWbVgVLzxsAHneVjPGA+oJD4tP0UKZyQQsOeFchwjD8RyvqRVNSsTG
 MIDd1Be+PN95Xg28EUmVAyxVrH7Xaf8gx9HR1POY0X/10fqn8yKdxRppbDBUw+rinyJg
 ibkSnzE9ZzCRvyPkhrtiaYCOoA+df9/ahIQw6S+4pQfM+la64VzFrRdhXwG9QJ0v/IAl
 up+93yKZOa9QJ2cr9UYkJ0uhT1Qda0QKs+5FrufmgZgJWbe//gs3YpJBMb//SwtV7sV3
 LqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=3aj/PkXwRh0WiTXw9KNGNNlgW3DNpORdGlte2svtDMY=;
 b=XTphkMd+neZitggtCsspveVPsRpGkJhezzET35KS+1ziQST1ofYZpQo06XDGW1NRKx
 DJP3bXWeNlr9AQBtOOLBSln45lOaP63Ra7ekZljFi68gpdVJ/NxFqwG1G+fKLEzc/fyz
 UpbOzpIjWqBQCrvAEKbp5ptTfrz7KnxlKWatwINnPmYhbz5QVITvombf9Se7gvYHOQKl
 bTuN+aXfh3h2s3YeBscPi9eknVDpnJYrDj4x3fJfZ5S5A/yB0vYcSekj6ruBFxJu0qHr
 UnEtRzdw2XPY3Hs09LpiQuPFTipFLL0n57NudKyEIry2zKrMrdvpMf+8z1Bk1cgLZRDm
 woZg==
X-Gm-Message-State: AOAM5322kGoZUqGFY3Zpf/DRTspekEk1Ve4QDwfuON7JKE0ubgbUWBNP
 NioFuRThxExtzutVyfDvAalfa9cat4M4
X-Google-Smtp-Source: ABdhPJyGlyTDOdCm9HI4KDrHCml/3KxnRlwBc3VKkJuTcF2vcmV29b2XvWALYW15GrPrIA+PZzuhd019+w8r
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:b870:8946:4704:f6a0])
 (user=tzungbi job=sendgmr) by 2002:a0c:a8c7:: with SMTP id
 h7mr121763qvc.23.1611555612436; Sun, 24 Jan 2021 22:20:12 -0800 (PST)
Date: Mon, 25 Jan 2021 14:20:00 +0800
Message-Id: <20210125062003.1221810-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v2 0/3] ASoC: mediatek: mt8192: apply some cleanup
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

The series applies after [1].

The 1st and 2nd patch refactor to use asoc_substream_to_rtd().  Just
realized there is such a helper for the purpose.

The 3rd patch simplies ops of Capture1 DAI link.

Changes from previous version:
- Separated from the series [2].

[1]: https://patchwork.kernel.org/project/alsa-devel/patch/20210125061453.1056535-1-tzungbi@google.com/
[2]: https://patchwork.kernel.org/project/alsa-devel/list/?series=419769

Tzung-Bi Shih (3):
  ASoC: mediatek: mt8192-mt6359: use asoc_substream_to_rtd()
  ASoC: mediatek: mt8192: use asoc_substream_to_rtd()
  ASoC: mediatek: mt8192-mt6359: simply ops for Capture1 DAI link

 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |  4 ++--
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 24 ++++++++-----------
 2 files changed, 12 insertions(+), 16 deletions(-)

-- 
2.30.0.280.ga3ce27912f-goog

