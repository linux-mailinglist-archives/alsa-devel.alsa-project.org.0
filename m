Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 392921975C0
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 09:32:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8DA31655;
	Mon, 30 Mar 2020 09:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8DA31655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585553563;
	bh=ujJgj16Euh517R6aWGyBUzrpK5bKsNHHiLNbcxOnVWU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rTQqldjDIAK7vAzcVxZpXhiSvVnBTq+440600vFVsDhU6cQEWtX//R8ayt5gYPKK+
	 vFkFulynoCtnsle8z71p2lVh7B19YzQKH23/00d6lVqzrOOtms9yNF38PmzuMnla7G
	 tEaQ6vYIMF6vNBsrzwhGCTN/9ajIxqu/TDmkMKBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E01D6F8028D;
	Mon, 30 Mar 2020 09:30:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47103F80290; Mon, 30 Mar 2020 09:30:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF390F8028C
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 09:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF390F8028C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="L/okOLdH"
Received: by mail-qk1-x729.google.com with SMTP id b62so17974766qkf.6
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 00:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KgOVarC5Gb1tAd5I3fGYDa2zpN7MJ6Uuz52KOLYGanQ=;
 b=L/okOLdH86baVZyZ0NOr+A4oqr/SPdXBmtulKV97oshRvL1hxv4SP7BtkYpmFWi5T9
 pytvP+qG2XqPxzyXXhRmbb0IjvZwy8vdBAHJ0Udb7vGbkCb+R40R18sJepqSElxnMw0W
 daoMppxVRNM84Ngj/sljn4j/IIMjWw6WNdA+0jiByGexLvcEqpAitq98Sf0oP+KjI2/f
 usySMgc6wYvubeQpoAuRgAV0Jkdl7/nPnofoZuEGP+5cVIFDg8f4PnNLppe0oKTIGhlX
 DlDfWfecVsmSjBgDR12yQxwBkA+9KJ/JFG2gPR6lvUra1l4Gyf6C8vt/Pyn3PI5pU41f
 0HwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KgOVarC5Gb1tAd5I3fGYDa2zpN7MJ6Uuz52KOLYGanQ=;
 b=TddUuyVsG6t+qEqbHaG/zRA9uSpJtEs/vhQLngj59dKr00ZWZMryQfqm3evGfzaqL5
 2e25amEjJEDIvmm5FuyqhfkpABSvT3j0E8n/ULzkhGA4x2kIG7GeGIA42W0h36nx47hq
 WkpoxRB4dMkFa6YXBJ2gCLsL2NPjmUB5shvPNqPkIrpMCCi9pOa77B8ks+e8M18j/6yY
 qBDq9X+pMCZ5kck6D63EHLjWnAG4P1XRB4bfsrE1JcPSHLgTlwC9kfe078qTuVOdFMPy
 JctLeO84TVYABDc2qzLLb6U5GxHLC6ceAY1+3vXxcto81+Ot7j2FNg46/2YMAwIHttpS
 JAKA==
X-Gm-Message-State: ANhLgQ3n3a2RgOaeafyEZGmVWVJoF1Blb01N8sI4pWhnnZpJfwNlsXNN
 uc6u59/Zz7wjfVI/zvnQbykLQZ6KQJj3rQ==
X-Google-Smtp-Source: ADFU+vssqFPLcGdnO2Q89jK3dr/TohKRvbQBzjgTN5nI6NDUSGI7SDZRmc1O+sT+H7rwonU+43a19A==
X-Received: by 2002:a37:79c6:: with SMTP id u189mr10225793qkc.96.1585553438353; 
 Mon, 30 Mar 2020 00:30:38 -0700 (PDT)
Received: from stingray.lan (pool-173-76-255-234.bstnma.fios.verizon.net.
 [173.76.255.234])
 by smtp.gmail.com with ESMTPSA id n63sm10078499qka.80.2020.03.30.00.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 00:30:37 -0700 (PDT)
From: Thomas Hebb <tommyhebb@gmail.com>
To: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.or
Subject: [PATCH 0/3] Properly fix headphone noise on the XPS 13 and other
 ALC256 devices
Date: Mon, 30 Mar 2020 03:30:29 -0400
Message-Id: <cover.1585553414.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Kailang Yang <kailang@realtek.com>, Tomas Espeleta <tomas.espeleta@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergey Bostandzhyan <jin@mediatomb.cc>, linux-doc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Hui Wang <hui.wang@canonical.com>,
 Thomas Hebb <tommyhebb@gmail.com>, Jian-Hong Pan <jian-hong@endlessm.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
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


The root cause of various pervasive audio problems on the XPS 13
9350/9360, mostly relating to the headphone jack, turns out to be an
undocumented feature of the ALC256 and similar codecs that routes audio
along paths not exposed in the HDA node graph. The best we've had so far
to configure this feature is magic numbers provided by Realtek, none of
which have fully fixed all issues.

This series documents the "PC Beep Hidden Register", which controls the
feature and which I've reverse engineered using black box techniques,
and uses my findings to hopefully fix the headphone issues on my XPS 13
once and for all.


Thomas Hebb (3):
  ALSA: doc: Document PC Beep Hidden Register on Realtek ALC256
  ALSA: hda/realtek - Set principled PC Beep configuration for ALC256
  ALSA: hda/realtek - Remove now-unnecessary XPS 13 headphone noise
    fixups

 Documentation/sound/hd-audio/index.rst        |   1 +
 Documentation/sound/hd-audio/models.rst       |   2 -
 .../sound/hd-audio/realtek-pc-beep.rst        | 129 ++++++++++++++++++
 sound/pci/hda/patch_realtek.c                 |  49 ++-----
 4 files changed, 139 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/sound/hd-audio/realtek-pc-beep.rst

-- 
2.25.2

