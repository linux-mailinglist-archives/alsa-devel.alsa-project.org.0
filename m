Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C30D7331FA9
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 08:05:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F1DD17D6;
	Tue,  9 Mar 2021 08:04:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F1DD17D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615273509;
	bh=3wm0X9YEiv5wROvrtoZwvTJ9gvEw7p1fPlFA8kkHQo4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jqiCVaQuMMxLXDTwt9Ma3Toqwk1qgmQyHL4pzRKNks6I3cWcnAfhzHyi0S2Zwlp/6
	 bkmed/gZDBuwilW2KTZ1xgtkgVXL6QzwhqHfQH7la5/hbNUgWxzmyoMCW6mZRWlc5z
	 EhCW7FiyT2GhrJpqkYzKb5ku7DTMRSpz4wL64cPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89330F80431;
	Tue,  9 Mar 2021 08:02:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3875DF80217; Mon,  8 Mar 2021 23:20:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB0E4F800D0
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 23:20:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB0E4F800D0
Received: by mail-qt1-f174.google.com with SMTP id w6so8824652qti.6
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 14:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XmlLBPGDhN0+7RIF/2Sq8jmCe3/Wk10rCYPYFc/sdbc=;
 b=guCzVNW6PUDM8tMbcuXUATKAQcDFfrJI97sr/ajnWcos0b43p+8o2X+Uxzd4b3VIW8
 GSYforiuTBN7gUFmHM/U0I9owfTFJFCnRl5Ff5m0oFZqL998XWzV/tCm9Ak24ERyNwuZ
 jovVBpWIFrhprNpcPhF9t76E1g3drwYPuu7j+LpS/a/43ayrJCPqdrqbvszR4NzQxPpZ
 NMmhWj2EggAzg6nWhPR8sV53uX0vyt2J7zCDOmbB59VyxYPXsxjUb2XNwjoz2U4nGmhq
 r9BOcvpWi8BE0Rf0MB6RQ1HF96WV7ta5oiaJSqh8B8jqTwZpmbsJ9h8FlDTqd9HmeHj9
 H5IQ==
X-Gm-Message-State: AOAM5338+eqXqNeDjvkrSqmPATlGqAqa2IPYeXs3xBUyYtC/8dnKTrCc
 XU2zTW/wIQ5+FiIK6jrvG0s=
X-Google-Smtp-Source: ABdhPJzdAZ53EFLl0v5nMzZDt69IABpLFTF+mIgzeMeukmiyK1N/Ls/Ac1oCKVDgql5QMwm1tMd8ow==
X-Received: by 2002:ac8:6ede:: with SMTP id f30mr2004433qtv.275.1615242016960; 
 Mon, 08 Mar 2021 14:20:16 -0800 (PST)
Received: from dpward-laptop.. ([2601:184:417f:5914::53e7:ddc3])
 by smtp.gmail.com with ESMTPSA id y1sm8676722qki.9.2021.03.08.14.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 14:20:16 -0800 (PST)
From: David Ward <david.ward@gatech.edu>
To: Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoc: rt286: Fix combojack detection for ALC3263 (Dell
 XPS 13 9343)
Date: Mon,  8 Mar 2021 17:18:14 -0500
Message-Id: <20210308221817.12908-1-david.ward@gatech.edu>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Mar 2021 08:01:59 +0100
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 David Ward <david.ward@gatech.edu>
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

This fixes a longstanding issue that prevented jack detection from working
on systems with the ALC3263 codec, such as the Dell XPS 13 9343, when using
I2S mode for audio (instead of HDA mode).

There is currently an ACPI quirk for the Dell XPS 13 9343 that forces it to
use HDA mode instead of I2S mode, because jack detection did not work. See:

https://lore.kernel.org/alsa-devel/CAPeXnHv07HkvcHrYFmZMr8OTp7U7F=k_k=LPYnUtp89iPn2d2Q@mail.gmail.com/

There are very likely codec fixups for the HDA driver which should be added
to the I2S codec driver, to attempt to achieve parity. Commit 394c97f824fa
("ALSA: hda/realtek - Change EAPD to verb control") describes an issue that
still seems to be present in the I2S codec driver, for example. In any case
this change should move closer to allowing the Dell XPS 13 9343 to default
to I2S mode; and it resolves this issue for systems which use I2S mode now,
including the Dell Latitude 7350 and the Dell Venue 11 Pro 7140.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=114171
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=150601
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=205961
Signed-off-by: David Ward <david.ward@gatech.edu>

David Ward (3):
  ASoC: rt286: Make RT286_SET_GPIO_* readable and writable
  ASoC: rt286: Handle all devices with ALC3263 codec
  ASoc: rt286: Handle headphones in combo jack correctly

 sound/soc/codecs/rt286.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

-- 
2.30.1

