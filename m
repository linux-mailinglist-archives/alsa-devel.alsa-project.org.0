Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C482D8ACC
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Dec 2020 02:22:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D528174D;
	Sun, 13 Dec 2020 02:21:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D528174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607822529;
	bh=6f4VsdvOkAMtjFT/HOc33bAtEGeGgKHqPgS2vWTyRDM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=faEMrgBsENtRLy9sIgsAVeqByo8TSAHfcf9UFjC/fj8U3A50wttdQkUU3NsyAXBGU
	 nXSUncrNBa2JRfv+8CrT0CQ7NvUJ4Rfn59PjxlJN0Tcl1tRAeoaHtv3y5ExO289OGb
	 fTXPdEE74ig/Vy2iSsQSSotEIBsFrvOjtRZmAhAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC7E8F8019D;
	Sun, 13 Dec 2020 02:20:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EA9FF8016E; Sun, 13 Dec 2020 02:20:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EC0FF80129
 for <alsa-devel@alsa-project.org>; Sun, 13 Dec 2020 02:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EC0FF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PD/47T/z"
Received: by mail-pj1-x1044.google.com with SMTP id lj6so2881303pjb.0
 for <alsa-devel@alsa-project.org>; Sat, 12 Dec 2020 17:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5w7+jTgC8hBJiHtcsnmrY7j8FYxZ7rdBNlmPCyHcgzw=;
 b=PD/47T/zAPbDNd2ZPt8k9Mv+Mn1VXpQeAhkbcM7VQMohbhTNvjyEtL4VFn1CvygL91
 gqVBG/pL2SrfuMPfoVhZoZ/q27AuuyInxdJlSspeOgmUKlWMm0RoedXJTaL9jC3Blqxm
 G/1OIT1XPqiem/SagfHaMK28261VXClzwspLymV+pq+9jXcZBUSTpgSODIM0OURxvdFv
 VhTmvcHX7d5/nWBbFZoGuV4DCfZNf4jYOdAqJmQndy9lrcuL5WaZ67zXclw5SBokGary
 iih14x1dGf2m8ftOA6y7oBY8mhDPZLnp58jYO5Elck51q3Y3BbVKO66ZUwqddLLVCy8N
 yCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5w7+jTgC8hBJiHtcsnmrY7j8FYxZ7rdBNlmPCyHcgzw=;
 b=H/KozutIVCljM3zQDPPYF4Ne3s0jXN8B8HQxmdhEMfydePagcg6fkeZe7eQSj5Crne
 sc9QNpIKlhfP/GtJepIxE5/ffqt5JUjQykbccoIa3U+79PoRad9dsZEh5DhqdQA/zKU3
 TNaHDGKCUNS+NWKiCyfHWLjJzCxYZU+yGkzBYr/OrAuZbuPaelJ8ulUYwetMMXGe5dKf
 vVFufgHSrDgjHUAbW2i5EoxKmnUx4fAXJQWP2nmdqVc7vf9ORyPAWhPWVTmS4i/4x+lP
 WCJbLQ241JsW+YVhYozFCYppdkvAceYIC2KXH/GbaZ0h4GMzqWdWV+EBDFOUgBKl3H3h
 6ZRw==
X-Gm-Message-State: AOAM5304GaGHo9tbhpVFAj+8irTlqVN3uSa0VchwenxAKSD6IVd2zIe3
 eoOOW4uqUS247KanQkTPEl4=
X-Google-Smtp-Source: ABdhPJxD7QxA9VZj9NvzLnEEK1zxJxuFW5VGThfbPVXjzDJ61BgCpHdj6MGvjGe97ihVxDShLrIOog==
X-Received: by 2002:a17:902:9b97:b029:da:4299:2214 with SMTP id
 y23-20020a1709029b97b02900da42992214mr17124758plp.37.1607822424413; 
 Sat, 12 Dec 2020 17:20:24 -0800 (PST)
Received: from glados.. ([2601:647:6000:3e5b::a27])
 by smtp.gmail.com with ESMTPSA id u189sm1642670pfb.51.2020.12.12.17.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Dec 2020 17:20:24 -0800 (PST)
From: Thomas Hebb <tommyhebb@gmail.com>
To: linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: dapm: remove widget from dirty list on free
Date: Sat, 12 Dec 2020 17:20:12 -0800
Message-Id: <f8b5f031d50122bf1a9bfc9cae046badf4a7a31a.1607822410.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 stable@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Thomas Hebb <tommyhebb@gmail.com>
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

A widget's "dirty" list_head, much like its "list" list_head, eventually
chains back to a list_head on the snd_soc_card itself. This means that
the list can stick around even after the widget (or all widgets) have
been freed. Currently, however, widgets that are in the dirty list when
freed remain there, corrupting the entire list and leading to memory
errors and undefined behavior when the list is next accessed or
modified.

I encountered this issue when a component failed to probe relatively
late in snd_soc_bind_card(), causing it to bail out and call
soc_cleanup_card_resources(), which eventually called
snd_soc_dapm_free() with widgets that were still dirty from when they'd
been added.

Fixes: db432b414e20 ("ASoC: Do DAPM power checks only for widgets changed since last run")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---

 sound/soc/soc-dapm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 7f87b449f950..148c095df27b 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2486,6 +2486,7 @@ void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
 	enum snd_soc_dapm_direction dir;
 
 	list_del(&w->list);
+	list_del(&w->dirty);
 	/*
 	 * remove source and sink paths associated to this widget.
 	 * While removing the path, remove reference to it from both
-- 
2.29.2

