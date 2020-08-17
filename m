Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5D72462E9
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 11:19:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F31F31686;
	Mon, 17 Aug 2020 11:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F31F31686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597655989;
	bh=+eHGU3/wQiuYy3yP5+sfzBiXryxSLEjtkITgov9TObo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MBbTQbhyGL9Mexbow0BI2Qsklp/DHmPbj53uUWt5x3XnrSYiDHjMXS3sD9q6hsEkp
	 yiFLIXXEQidD5mng1vNxEBPxFeqvFd03u4nj8y6mkfkRoMmZEOVsNCD0vp76s7NQEN
	 V8j4E5r4phjTJDQtSPtElxGnmNJThP0yNaUhbmjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F836F80264;
	Mon, 17 Aug 2020 11:17:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A30CF80218; Mon, 17 Aug 2020 10:57:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05201F800EF
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 10:57:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05201F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="snlOuFkt"
Received: by mail-pj1-x1042.google.com with SMTP id c10so7669888pjn.1
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 01:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0b4hDbgubBeeHXRlursdhBMl3jFnpB2aLYnsOHqVEyc=;
 b=snlOuFktVD1cP5N09r0AccPqkRSPMz+cvjfUmySoCBbHAg5IqrIz//oiUEskZWFBpr
 WvYMGv0nxUz2prgAdW1W2WCUBYbwjEuXFvOXqQvQDemb2bOQVRke86WivzHQrMQZRB1f
 n7zXV4FZMYRZ3YylXm4t6JHV6yeOVf8lytGEkjdQNn+nRI+VzqOpkEC06NO0isZclWUl
 TlfDxFLlZW1kkEteoruH6rrJ0NqOreFPKS9Q2aSyxdg3xzCMqIJh7JyBHfTBR3mrN1ZA
 NFiQzrS0OC19GCaekoNy7ZIqNpa3wLP3s3orkMWFKreQcAQ5fYdVgB6u8Rrf8bajgR/q
 ndag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0b4hDbgubBeeHXRlursdhBMl3jFnpB2aLYnsOHqVEyc=;
 b=Rta/qVCgls+OvCgWFFZroUvMXkTDi8yBomufJ5WuszCsy8nZfEmtV5rxErswFdUOee
 MAXLNx75MGqVT/Yd37v1GXOu0kcw8IqXc+rpMda4el21aYnC1MVqY+dXC2wYC/ev0NXT
 JXE4Q8hWIqlQtmM+l4iaenoybdS+1rOlnp/+EYzDqODuJEpVcshFT3PWBV8TVpws26OQ
 Xot201+Q/hS+8BZEExv8NRArHFpF5Ox6OC/N3hluq9BHOIro9UIj7MlcnoXdKK6lizYc
 tWtHu5JPgR6ohhxZvAN7ZQZjQT2p1NVOQvi/ttb5Yupng0EXfZydDxj0pKZMA6i5dyV4
 pEVQ==
X-Gm-Message-State: AOAM530h7dfHuzYS373jWlwEnsiP9razgYzXECHK7b0ldeH/59iYOKeP
 +kCHIqBA/+wnBWxoFOL1Fdk=
X-Google-Smtp-Source: ABdhPJw7HRAC6poe+UqqVsK7dgB/sMPd8DjS9fktdGxdcAkuA1yd4TGrqN3B3HxZjnefmHY9/tBTCQ==
X-Received: by 2002:a17:90a:c28d:: with SMTP id
 f13mr8355288pjt.124.1597654637867; 
 Mon, 17 Aug 2020 01:57:17 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id j5sm19057245pfg.80.2020.08.17.01.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:57:17 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de,
 o-takashi@sakamocchi.jp, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com
Subject: [PATCH 00/10] sound: convert tasklets to use new tasklet_setup()
Date: Mon, 17 Aug 2020 14:26:53 +0530
Message-Id: <20200817085703.25732-1-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 17 Aug 2020 11:17:21 +0200
Cc: alsa-devel@alsa-project.org, Allen Pais <allen.lkml@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, keescook@chromium.org,
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

From: Allen Pais <allen.lkml@gmail.com>

Commit 12cc923f1ccc ("tasklet: Introduce new initialization API")'
introduced a new tasklet initialization API. This series converts 
all the sound drivers to use the new tasklet_setup() API

Allen Pais (10):
  sound: core: convert tasklets to use new tasklet_setup() API
  sound: firewire: convert tasklets to use new tasklet_setup() API
  sound: asihpi: convert tasklets to use new tasklet_setup() API
  sound: riptide: convert tasklets to use new tasklet_setup() API
  sound: rm9652: convert tasklets to use new tasklet_setup() API
  sound/soc: fsl_esai: convert tasklets to use new tasklet_setup() API
  sound/soc: sh: convert tasklets to use new tasklet_setup() API
  sound/soc: txx9: convert tasklets to use new tasklet_setup() API
  sound: midi: convert tasklets to use new tasklet_setup() API
  sound: ua101: convert tasklets to use new tasklet_setup() API

 sound/core/timer.c            |  7 +++----
 sound/firewire/amdtp-stream.c |  8 ++++----
 sound/pci/asihpi/asihpi.c     |  9 ++++-----
 sound/pci/riptide/riptide.c   |  6 +++---
 sound/pci/rme9652/hdsp.c      |  6 +++---
 sound/pci/rme9652/hdspm.c     |  7 +++----
 sound/soc/fsl/fsl_esai.c      |  7 +++----
 sound/soc/sh/siu_pcm.c        | 10 ++++------
 sound/soc/txx9/txx9aclc.c     |  7 +++----
 sound/usb/midi.c              |  7 +++----
 sound/usb/misc/ua101.c        |  7 +++----
 11 files changed, 36 insertions(+), 45 deletions(-)

-- 
2.17.1

