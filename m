Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D16202D353A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 22:28:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A7D416E3;
	Tue,  8 Dec 2020 22:27:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A7D416E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607462882;
	bh=dDAPYMBOyHUIM0f1x057DMGonuyjj8b1HdYskg2WC4I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ecWYUAOPjRtI0sTMghKxi41fTVLumiLu3NWxAFkulXyPMIcC4TTtbHqpLRtKPiBUZ
	 m1q1NaEO/tIK2E+GCuS2xelXtOQBJDUSCNEfT9PzzuqzRmVF4TzkScxFktlamjE1XA
	 FeusE3O0r26k76g2fhLKcZtikDbIgiS3K4MxaL3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CED0F80130;
	Tue,  8 Dec 2020 22:26:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07FCAF8019D; Tue,  8 Dec 2020 22:26:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F493F800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 22:26:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F493F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VE+oO/mW"
Received: by mail-qk1-x72d.google.com with SMTP id 1so115672qka.0
 for <alsa-devel@alsa-project.org>; Tue, 08 Dec 2020 13:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B7bksUnXGm2SRwxtGt7t4Adwh+RQG8TGIYIzlogr6KQ=;
 b=VE+oO/mW1kZeC63M0fcA/fQ9J/rYwFwBCnjW/EOJ+mjRrFjh+VOWWnLRrVB90de2/H
 9yJonsDzaZXELVUBTrf8uefJ8ZXZCCJbcaACmRwXF3/J7rPeWIRVT8nNe/OUXkgBJOc1
 9TGbIjDzraC0JBqAacQJSo/4lbZaldHIwf7D5gcrtM3bIw1t0gfAwIIJzrRTs7QvSaUo
 +v3WsILM7x2Grzf1PtoeVECkYfSGYNcgz21bmyitALShC3h16aVfqFjxz3gxp3HAtytp
 8EmGl1ZXvG/lMjNkgIibXwMAGG5c0FA8P4fApBmoOCL1mpEjMcm+wXolPZBCuNB91Zby
 XS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B7bksUnXGm2SRwxtGt7t4Adwh+RQG8TGIYIzlogr6KQ=;
 b=GkJQJCmUwPamtFUZdNZDQYmD8hK3WoiI6BYBQmKcl1PJAM+7t8HzjTiw4pHk2SWKiQ
 EMXFh87WAOdHLuOgTWNkOkWM4YhxHZP1kTzIE6/dVYs/JU2XvkLrCxCEjMhNY5Kb7uVr
 LWB9F98WJ5DrUahJmytc/nw2xTptaf9956IgfNtxLnwKT1G9aat/gBbMFNGuRcgRYzvG
 nnSv1PSzF1RpPLEsv6rqfD010ZSRfIL+TWHkwDNUqMnTYD5GMjxSDWXgZ/s+5VvtgkoY
 hnrDL6+YyNecWjhiRGhl8/XukzZ3Z5kAjeINuEAbTKRIsaDZ2pyVCqTCq9gZVY2yvns2
 q2yg==
X-Gm-Message-State: AOAM5301qDy9zJV2/DpuHOMqYR97J2A5jHJAy2X3UHC8TN1LZS+NkFV/
 njf970c+X/KhZjHhBJ3rNCw=
X-Google-Smtp-Source: ABdhPJzYqd4nyTEXCSHNT2uAtJH8FaTn0IkgekF1EZ+gCKlaKSDQpRxcq0/C6lJmS0n7iLvifX51Hw==
X-Received: by 2002:a37:6717:: with SMTP id b23mr2711910qkc.100.1607462779271; 
 Tue, 08 Dec 2020 13:26:19 -0800 (PST)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id l1sm16018572qkj.101.2020.12.08.13.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 13:26:18 -0800 (PST)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 0/5] ALSA: hda/ca0132 - Fix no-audio issues and add
 documentation.
Date: Tue,  8 Dec 2020 16:25:40 -0500
Message-Id: <20201208212546.428392-1-conmanx360@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, conmanx360@gmail.com,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
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

This patch series attempts to fix the no audio at startup issues that
have been occurring for some users, using information gained through
reverse engineering the ca0132's onboard 8051 processor.

The issue of no audio on startup seemed to be caused by two separate
problems: not resetting the codec upon initialization, and not making
sure the DSP allocates it's DMA channels correctly.

Tested and working on all cards, except for the AE-7. The AE-7 shouldn't
have any issues, however, I don't have one on hand to test.

As an aside, I'm not sure how to classify which commits this necessarily
'fixes', as it's covering multiple areas. Please let me know if this is
necessary.

Connor McAdams (5):
  ALSA: hda/ca0132 - Reset codec upon initialization.
  ALSA: hda/ca0132 - Add stream port remapping function.
  ALSA: hda/ca0132 - Add 8051 exram helper functions.
  ALSA: hda/ca0132 - Ensure DSP is properly setup post-firmware
    download.
  ALSA: hda/ca0132 - Remove now unnecessary DSP setup functions.

 sound/pci/hda/patch_ca0132.c | 567 ++++++++++++++++++++++-------------
 1 file changed, 363 insertions(+), 204 deletions(-)

-- 
2.25.1

