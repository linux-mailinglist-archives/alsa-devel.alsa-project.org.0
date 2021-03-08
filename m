Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A7C331FAD
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 08:06:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 733ED17B3;
	Tue,  9 Mar 2021 08:05:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 733ED17B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615273580;
	bh=dBZexBk+BPzjKHR6AWK2Ttu+7hY38FxsMZdfEkenGSs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aS/oILogIYRGioOcSRuvTkI4EPXMquFbK5063/QcdpU62RYBp1LsSoBXXRagRDRNA
	 r8y8b8zEYkVH9cPKAO70XuFLafIrkUUZLtoPmSma12f97yeskHVa92w4vDBswNWLNK
	 UhtWhwKaXKEPYLYkrsE+Oof86QXzgWKHzcCgn+KU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50A9CF804B2;
	Tue,  9 Mar 2021 08:02:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56445F801D8; Mon,  8 Mar 2021 23:30:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 110D3F80139
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 23:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 110D3F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="daMTkMxE"
Received: by mail-lj1-x22f.google.com with SMTP id m11so18115543lji.10
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 14:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WoLvoqCPKCkOsmIcg5MKSJ6KfR4gV0s8s1BqSsMK/PE=;
 b=daMTkMxExpOEyDR71hH3bgm71wkysgZF1gUWDs4oS5yLiTZ/SgUH0p9F9VO1etuK+t
 CcT3NH1o6zxHROADi/kPoX80BwyN/cUZf67nV6XlxgbM1uL0rBdhdHHt1wykDGWvBJGi
 GEHJu2CrvF2GcAFPZNsEmxuHoliQ/C+yDF/39SCnb+lt86punjGBxOfiVQdfSVKu/iU1
 atR/FKBDJ42ebSD+DafVi2SrbIfJgD2p2RWDjSjtfoXfjNphnJy3MJcYJdvFYmXA77Oc
 GyuvpLLWEZIrJRuAe3c07Pxzztq0HZghrBvweNaiY3M9K1Bl0dXmxa4RJo1ClL5xsRrJ
 7lYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WoLvoqCPKCkOsmIcg5MKSJ6KfR4gV0s8s1BqSsMK/PE=;
 b=D52amFXT6o2qTgUJrG69y0A5r2bXdj7YD3ku2QQKJ0yukEVwRNiLjmgjbIMSQ9f8DU
 37Bs2+/8/FSFCb0ja+kRiY8c0asTzUCVZaEeKixpKzDoLcZx3hglm1nl6NpzsGGPKuat
 2JrCNQ3jyLIL5MCQIczFKPcI4T6/w0ifceB82FJM4gpazzsAXfHxXBea/+T6il//zSd8
 /DR/jlm9jEaTqCJILcnPkBR+SSZHJUDrFwZ99z2exHmm5E2WYo3rtXVGq6d+zNzqdTdC
 9VUM64GCRb1NEsSBf5wVdkQ+Gp4VT4vZfaWtodWEeOEzx2D70qRaDdg8rAlQ4OKuwNz5
 Hx0A==
X-Gm-Message-State: AOAM531DvTHe3qW1yFQJQkDri6YhLZxVn6jq3sUADbsV720d41n5CJ3F
 i4GiPVzna+mp9bEZcHs36zo=
X-Google-Smtp-Source: ABdhPJwRpxdqXdwbqZtWvsCHEeA5CN5U4vXKh3BSiYs9hryGoNTmpcO9cz0CDXI7OxvZmobC4pCTtg==
X-Received: by 2002:a2e:8895:: with SMTP id k21mr15112594lji.510.1615242632284; 
 Mon, 08 Mar 2021 14:30:32 -0800 (PST)
Received: from localhost.localdomain ([94.103.235.167])
 by smtp.gmail.com with ESMTPSA id u10sm1501707lfl.111.2021.03.08.14.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 14:30:31 -0800 (PST)
From: Pavel Skripkin <paskripkin@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kai.heng.feng@canonical.com
Subject: [PATCH next 0/2] fixes for sound: usb:
Date: Tue,  9 Mar 2021 01:29:26 +0300
Message-Id: <cover.1615242183.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Mar 2021 08:02:00 +0100
Cc: Pavel Skripkin <paskripkin@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

This small patch series fixes 2 errors from commit 9799110825db
("ALSA: usb-audio: Disable USB autosuspend properly in setup_disable_autosuspend()").
One of them was reported by syzbot, but second one appeared while testing fixes for the first one.

Pavel Skripkin (2):
  sound: usb: fix NULL ptr dereference in usb_audio_probe
  sound: usb: fix use after free in usb_audio_disconnect

 sound/usb/card.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.25.1

