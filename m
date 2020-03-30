Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7BB1980AC
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 18:13:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6406D1673;
	Mon, 30 Mar 2020 18:12:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6406D1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585584820;
	bh=0TNUCOMj93/3vOuGGs9Wk8c8PAFOVYSLIof2XuzgLmw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XBMxZ4+eCpkACCEDIQUMZrajxIwuNdo4Tx0sjoZ3seUG9NyAlwQx87Vwe7f2JWnvO
	 +RmTT80tStR2h8GVPmvqXkAxWGrCTnEJgZNU9yAd3ywIWmETgJfX78eCXEhYOOpZdr
	 pZeyZ15d9cBqeoz0Y73/zKS4RoeKSt7TvS2JiOqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05667F8014C;
	Mon, 30 Mar 2020 18:11:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B91D8F8022D; Mon, 30 Mar 2020 18:10:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4048FF800AA
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 18:09:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4048FF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bpq7LsqJ"
Received: by mail-qk1-x736.google.com with SMTP id b62so19571983qkf.6
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 09:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UtnZua9sH2Iz7Lmw4x/rdjkPSeBWQLU1aJEbCn/TIY4=;
 b=bpq7LsqJ6UNpk2gk9z/Tl5PrVf64JY3bOJ3Di3Vg97FIDygLrz9nK6Re0fdMXazZ/F
 /Beo8zSsS2BXoyBYZNu7q7BPgBTyt50DWidVdeYzEcDjuOm3vY1+2e2yn4Fz4pDvOkL3
 qFy+kqIEqFDzZ3UY6tNcSpKKAdMgHGShtno8lRa1Aon8joF8bE4L8U/jWa87OopMVxMB
 s1BY0r5hOMQNlZYVEyFIRYunxexRpqrPzvrcTal6T+FcFEQkcVRfac1hZV7VaKXzVItQ
 hTNT24N/FOcfA2USXvDPc3RAlHF5UnoClWLLgWHSlPgs3bE0zInO6J8ieXT/867NfS2t
 hPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UtnZua9sH2Iz7Lmw4x/rdjkPSeBWQLU1aJEbCn/TIY4=;
 b=rmqSdjbrIiQqSkR1oab4xO7jEQOQipSotocOAPC6yZchQs924pNb3SIwankqQjl9lZ
 OuXCmIbatHhlYpMa9J6Cx7kYbxoazzRQ517OLIWjvppxKSus4rMbHpwBZZXI3dcAje1h
 pskn7oCck/mwjWxsvB+lmRgzwR+wuO1alk7kV/Mlbq1qWnSQIhPQdGvfP3NBDown3SAU
 Tg3DC91/IMNd5XQJt3Y6FWUG+fHn3xc+7zXWrwNt6jaEcofX7l0kSgwnPcc0lgmJvUuM
 EJyyBYkyhLNhNh9lKGuiH5S7eWUqzQc3y6scmWI4bWmu81Zn7Cs7w5vUoy0JaiWSjoan
 go0A==
X-Gm-Message-State: ANhLgQ1PqATl77Wvbhvc5AGStAszwNdaF28DU3avG1jCqyMtW8GfaRyD
 nlx97UktQ2p0NLzU3fihh0IRfT/CtYRWKg==
X-Google-Smtp-Source: ADFU+vsIf6Rq8zIGRIGqrFGZj1stu4iXXpPIMDoOLgUuA+FCsvZIsHP9TqFltRu78UbXw6AiHhneeg==
X-Received: by 2002:a37:8044:: with SMTP id b65mr727931qkd.238.1585584592639; 
 Mon, 30 Mar 2020 09:09:52 -0700 (PDT)
Received: from stingray.lan (pool-173-76-255-234.bstnma.fios.verizon.net.
 [173.76.255.234])
 by smtp.gmail.com with ESMTPSA id z18sm11789091qtz.77.2020.03.30.09.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 09:09:52 -0700 (PDT)
From: Thomas Hebb <tommyhebb@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/3] Properly fix headphone noise on the XPS 13 and other
 ALC256 devices
Date: Mon, 30 Mar 2020 12:09:36 -0400
Message-Id: <cover.1585584498.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Kailang Yang <kailang@realtek.com>, Tomas Espeleta <tomas.espeleta@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergey Bostandzhyan <jin@mediatomb.cc>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 Thomas Hebb <tommyhebb@gmail.com>, Jian-Hong Pan <jian-hong@endlessm.com>,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
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

Changes in v2:
- Change fixed value from 0x4727 to 0x5757, which should behave
  identically, on advice from Kailang.

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

