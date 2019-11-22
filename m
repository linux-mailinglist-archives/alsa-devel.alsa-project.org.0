Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB11107A24
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 22:45:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DDAB184A;
	Fri, 22 Nov 2019 22:45:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DDAB184A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574459153;
	bh=VZc0ifTtev83KGX9g4jNPNl+3Zj3ghUntqEEZD/WQug=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bkKE3O+o+s9M56CNgPcYFNrNYy2XP7nuLxYBG6g5E0OklF3I0YPkjo2DUm3UwmiUW
	 Pk2okymFIUfr4HbJLmhnWKkHXbhpsGuLbYrqwwBcilNEdu8FrjWtzbRISS4h9DdLSB
	 3QrGbPhieXXz8V2ZfcKxcFmpL5D8eKNT9jLK5UrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91B05F8013F;
	Fri, 22 Nov 2019 22:44:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8747F800EF; Fri, 22 Nov 2019 22:44:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 474E0F800EF
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 22:44:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 474E0F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sGuw9zYe"
Received: by mail-yw1-xc43.google.com with SMTP id y64so2951124ywe.3
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 13:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VU7dGd7/QMxnEjRz5vA1JHVUSYPPl6NYcTFynVeTePY=;
 b=sGuw9zYeIheEF2FpKFUgO+dP994QbPwKNstDTZbc+rEpZl1y0iPHspQlAZdofZ+TxF
 Rl8gcH0d0WE9tLycMx29ImklUEPEec5MoRcasWLI2I9ugWX0NO/gmCBqVHcTWw+0XjJw
 GocFY2AhypepJyK5qxkTpomzZKVysXp0B04pce/w4v1VzM/XpjMF4UNAlEFz1BBdvuJ0
 g8xYBDlxSiKrw4woa8PTsnjAJ1aWgt/dlhgsCU5zfLrL46LKKV3H8SJuJUjYpJxQ7wwT
 h9ZLSiyjIRhz952UyqQieIwkcHiAxafI4eGkTBHnohNlWd3lSruY1o49mf5Dy6o+rdVE
 aH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VU7dGd7/QMxnEjRz5vA1JHVUSYPPl6NYcTFynVeTePY=;
 b=o6T3FAx54aLARzvLJkIoa43PzHXFjT0nTkYXcul7U4ShjC7FSZmFdV2z54WFqhgvfI
 t3PzdkHsO4BUPxXHWl88Huv49Rg99ZI3KSoJ8+WtcjNV6/p4ZV7zk9CggKNhe2XVPf+p
 fLvJU3ygjRbdeppj9eQQIuPv8JGTwinZgw+vP0IW/xqcpeSDyVeLSGMQyNOTOUHJ940a
 c3F79Sq0uzRqZz76NJH0ZWVnoH+8hHhO8l4jqJ+ZZqDKVsY9y1Nh+Ntf5xDuJLJGe8Yc
 raLfK8d47Gf6d/cWuKAOhN3vKprtYhGoQtRXUirLXZ0JRcbxj3W8xOq64Tna3TTsS+hy
 5qOg==
X-Gm-Message-State: APjAAAXsaPC++TeHw5wSDcKwnZL05By1bd77jDtz5VUKFZioWqI6CWKG
 FuuHPt6VATLjbC+jfUmNyEk=
X-Google-Smtp-Source: APXvYqyScrfOHi5mb4qNfZIQwA2GZ8ZpQp1lrjo3JlUQYFYfS8W6Nfy13tGTSUDQWpe/3/4lOP80rw==
X-Received: by 2002:a81:47c3:: with SMTP id u186mr11218034ywa.91.1574459041409; 
 Fri, 22 Nov 2019 13:44:01 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id t15sm2111522ywh.70.2019.11.22.13.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 13:44:00 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de
Date: Fri, 22 Nov 2019 16:43:49 -0500
Message-Id: <20191122214353.582899-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [alsa-devel] [PATCH 0/4] add runtime pm support for AMD display
	audio
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

These patches were originally part of a larger set of patches
to enabled runtime pm support on the GPU side[1].  However, the
patches are useful on their own there are really no dependencies,
other than the fact that you need both for runtime pm to kick in
on the GPU side.  The GPU side will be landing for 5.6; I'd like
to land the audio side as well.

Thanks,

Alex

[1]: https://patchwork.freedesktop.org/series/67885/

Alex Deucher (4):
  ALSA: hda/hdmi - fix vgaswitcheroo detection for AMD
  ALSA: hda/hdmi - Add new pci ids for AMD GPU display audio
  ALSA: hda/hdmi - enable runtime pm for newer AMD display audio
  ALSA: hda/hdmi - enable automatic runtime pm for AMD HDMI codecs by
    default

 sound/pci/hda/hda_intel.c  | 80 +++++++++++++++++++++++++++++++++++---
 sound/pci/hda/patch_hdmi.c |  1 +
 2 files changed, 76 insertions(+), 5 deletions(-)

-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
