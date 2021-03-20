Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 517CC342FD5
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Mar 2021 23:18:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60DF3829;
	Sat, 20 Mar 2021 23:17:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60DF3829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616278686;
	bh=Z6uQFcBY1v9//Z5zu+wE8AfDvKxJZ56J4SnZQ1edfnQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TRdghLVC3ACo0OUejwAHcoNAWXxBfnt0BEyoKdI3ztcsHaQR3326PDqg03zKAT2iq
	 caOjpT/eFM2zY1oDo/5xW5BV5aMHBQCaIHe6P3QIL3SVKjTnAQ2OOKdD+tAMWGsrF3
	 4Ol1OOBSKjzs1cSL4lm/VfaN6HNbc9D9YB4BPJR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC37FF80218;
	Sat, 20 Mar 2021 23:16:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0CF2F80165; Sat, 20 Mar 2021 23:16:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4C63F80118
 for <alsa-devel@alsa-project.org>; Sat, 20 Mar 2021 23:16:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4C63F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hCfMNy7t"
Received: by mail-qk1-x72f.google.com with SMTP id v70so6809568qkb.8
 for <alsa-devel@alsa-project.org>; Sat, 20 Mar 2021 15:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YgTEn7uxn8Ay3cd4QaCSxvxMq4Z8va37K/vdBDVPpbg=;
 b=hCfMNy7tQlrpXLY4WbP1zHOceFNXn3obMVp4vlT9nt42lSGS2iSaqeutir7ODkzy9k
 ntKzIvdWWEbMGWK+TXi2E9QIyXP/EtCUJvaNFQNJfsSK08OTNRNw4SE40ofdOIlQdtlz
 585X3onVtHwg4CMantv/98LEoqmJx+MOXNivNzRkQVdqOufmfApt5f9/X753cYqx8tb1
 wt9e5YGFFp9DI/3CZ2k1T/Be7PsFdcsCTqmjVQFq/w6ewruzLDpGBvSPJ0LTrAcWAEO9
 FSszqseo62qpRQYaT2ekahkNiBdNQnt0t7yLiCYGb1KqjX+RxK13hieDG+ay+wYjNy6f
 jOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YgTEn7uxn8Ay3cd4QaCSxvxMq4Z8va37K/vdBDVPpbg=;
 b=dbfQQxfMPHb+5Igxmb15+1QreZc1BtoRZCMIe7j316RcjB1u18w+9BWH4pOXdlKAiI
 u34OwNjnVBDg1lgG94OXW34m1nyqKVD3z0EoonTBg5vJ97bRaTtPiL7rzeiesGh6oXfT
 hBpVbWU7WtuzaxJ2LiSsV4yJMt/2qEfLOs0ud6qVlzD+XqbS57kvDthZOJO5x5ybg9/0
 yM1pnmMpjXaoHL/6k/i78YQNbhDdRZa7cVy6TKOLaiJe4EhID1ZaEMX0CDRIiJ9Xublu
 5Y3mRb9MejZNqVJvj/ErdRT0o8KLihhEIs6Ttix/drkLLJJ+lYR8dKif5d0lQGfOehMl
 Uxbw==
X-Gm-Message-State: AOAM533Tj2aIkxCktYF6tSFzuPgNZneTAAFX7QoeOr/uN9sjMzK7nsku
 HrP1tU8iReiUkRqcUu5Lq8o=
X-Google-Smtp-Source: ABdhPJzrCym9WR3/qtFtSgCH2q7LXMNWXLHSTGEmwqCEqp+3/dzuRHJ6fHrprh/fG0dIUa/PcjB8uw==
X-Received: by 2002:a37:a54f:: with SMTP id o76mr4724164qke.95.1616278592955; 
 Sat, 20 Mar 2021 15:16:32 -0700 (PDT)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:f925:bb4b:54d2:533])
 by smtp.googlemail.com with ESMTPSA id x1sm6223973qtr.97.2021.03.20.15.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 15:16:32 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jasmin Fazlic <superfassl@gmail.com>, Leon Romanovsky <leon@kernel.org>,
 Tong Zhang <ztong0001@gmail.com>, Allen Pais <allen.lkml@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Naoki Hayama <naoki.hayama@lineo.co.jp>, Tom Rix <trix@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Joe Perches <joe@perches.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Romain Perier <romain.perier@gmail.com>
Subject: [PATCH 0/2] ALSA: hdsp and hdspm, don't disable device if not enabled
Date: Sat, 20 Mar 2021 18:16:18 -0400
Message-Id: <20210320221620.226155-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This series fixes issues in hdsp and hdspm. The drivers in question want
to disable a device that is not enabled on error path.

Tong Zhang (2):
  ALSA: hdsp: don't disable if not enabled
  ALSA: hdspm: don't disable if not enabled

 sound/pci/rme9652/hdsp.c  | 10 ++++++----
 sound/pci/rme9652/hdspm.c | 10 ++++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.25.1

