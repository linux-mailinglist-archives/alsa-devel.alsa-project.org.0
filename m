Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C420E7BE3
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:58:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27A1521AB;
	Mon, 28 Oct 2019 22:58:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27A1521AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299938;
	bh=cxI4KU8pVkf7bDMMgMLCOJWJD2f9nkAwRVxfGON54XE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fYmJaZvatRh/QWkeAzXrITvVKUNl9kGFd2KRoE/cMfutneSjDplNJnZEd/dvoOoVB
	 DS9Vc0LsSMfhRJ6h+tbXhFo79U7aH3RjZf5y4/8bIZYrtZIxK2ALdgzKVynFpXfQEl
	 T6Yb+J6J6mW6E8ylg6g3wNweunlB8TdUelMfBVVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98970F807B6;
	Mon, 28 Oct 2019 22:44:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5577CF8079B; Mon, 28 Oct 2019 22:44:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44BCAF80797
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:44:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44BCAF80797
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nbdVwfZD"
Received: by mail-yw1-xc43.google.com with SMTP id p187so4370041ywg.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/i/0HlGKA9pW8fyicPfA2pdugAJIJiOP9Q1QrtgaENE=;
 b=nbdVwfZDFPHykkNFSt2WZ5wQLGbZ6iM+RG/vCRRBVkRbAn5BuBSA2/sSJvYm+YWzZS
 hfzQYZMGWAkwVf19lmJITXiFh0wJeaOyXMMNPVikkb94JZWzNhbN3Mu5QKGqkVj20Um9
 iEx5xLfbOIwVeBpVs+k1nOP3uiGKZmmpX8wUv8bNBk1NWnlbGboYjQqW7s8Fys6yxnwV
 Qsl7TEqDJlLdnzn2rOTZFx+E+ZeFLe7JYhJTy4vcbHa8XL6699qcagV36cJCj4Qmblfq
 fHEZ8gOqvnC5mhrg4XYctZ5zpB9Psibi/mWZ6Il58pHRuLFS5gjlQO6rGkQOP0PCWAw5
 8JUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/i/0HlGKA9pW8fyicPfA2pdugAJIJiOP9Q1QrtgaENE=;
 b=n9q4OxE7ZPVCY3EesDbXty9a4kvigEtZQWMlFOSWNOVZbcrt0H4YDYqib3O+Lkj7ov
 otZyvMB4wu1Flip7ipuTKMCr0OcQn7/8pquVWIUNyUF2bp7Uwr6s71Y/dTwvl9b9F4ZS
 u22PXZLAe8h2YTcrypt59cS9JzOJ8AZ2BCbJWB6H+2UDNi271qrTepaJifu+8LyHMhol
 y8+Oikb7AZcBbcPmh7a+eF4eNxC0n3lU1+qNSRkaqDJ8tBMXvfvdmL7Pb8/9acA/nXfr
 lauY8kav1P8pa66OCpzZvZETxhhngTA+NL+4xLdXdTjHae/f9DNVR63alRvBLSvcCbBw
 XP7g==
X-Gm-Message-State: APjAAAVJ5ogdMmNinBBR7wtgV6/jDlIX8UJ/7Bp7LbUtGWOiTa44xqGN
 GxZcn3H+YloNigJDa98cIRs=
X-Google-Smtp-Source: APXvYqxAoGwunIMqA+SPqNDdF3oLZEdsPsqNY7nnbibhFUwRdkaEG9KikiHvIkySGq9ly2xzHIU3Hg==
X-Received: by 2002:a81:8282:: with SMTP id
 s124mr14629255ywf.498.1572299047051; 
 Mon, 28 Oct 2019 14:44:07 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:44:06 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:42:16 -0400
Message-Id: <20191028214216.1508370-22-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 21/21] ALSA: hda/hdmi - enable automatic
	runtime pm for AMD HDMI codecs by default
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

So that we can power down the GPU and audio to save power.

Acked-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index bea7b0961080..26613733f109 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -3779,6 +3779,7 @@ static int atihdmi_init(struct hda_codec *codec)
 					    ATI_VERB_SET_MULTICHANNEL_MODE,
 					    ATI_MULTICHANNEL_MODE_SINGLE);
 	}
+	codec->auto_runtime_pm = 1;
 
 	return 0;
 }
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
