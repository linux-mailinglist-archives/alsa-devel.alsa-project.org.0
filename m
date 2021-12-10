Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9029F47038A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 16:12:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6DD51FC3;
	Fri, 10 Dec 2021 16:11:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6DD51FC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639149162;
	bh=rvNl7qd5p9y3Cnh1ZMlY0hnxgikF+fR+3FMkCjAWZd0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hBHIf1nwyYl8n/F9tSmACXfEpiYx/6ud4xeHuMkXrK0ZXEtUp4QxMKqKxF1ppp8xr
	 prl9e6PJbAQbxGaLoqdsYsqalIOU+51pocrykW6Ie+jJBiUyzwj5sRrC3CEnvNJLnl
	 ZfdwB9tAaHCgjNi4BZmR/k4lLqWEnYMib4ZqH+zI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62F7CF804CC;
	Fri, 10 Dec 2021 16:11:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E045BF804EC; Fri, 10 Dec 2021 16:11:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM, SPF_HELO_NONE, SPOOFED_FREEMAIL autolearn=disabled version=3.4.0
Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn
 [202.108.3.166]) by alsa1.perex.cz (Postfix) with SMTP id E00EDF804E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 16:11:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E00EDF804E5
Received: from unknown (HELO localhost.localdomain)([36.36.86.102])
 by sina.com (172.16.97.23) with ESMTP
 id 61B36DFD0001D2F3; Fri, 10 Dec 2021 23:11:11 +0800 (CST)
X-Sender: chenshumin86@sina.com
X-Auth-ID: chenshumin86@sina.com
X-SMAIL-MID: 13655154919406
From: Shumin Chen <chenshumin86@sina.com>
To: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org
Subject: [PATCH 0/2] This patches provide ASoc codec support for ES8156
Date: Fri, 10 Dec 2021 23:10:39 +0800
Message-Id: <20211210151041.108751-1-chenshumin86@sina.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Shumin Chen <chenshumin86@sina.com>
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

Introduce new ASoc codec ES8156 support

Shumin Chen (2):
  ASoC: add ES8156 codec driver
  ASoC: convert Everest ES8156 binding to yaml

 .../bindings/sound/everest,es8156.yaml        |  49 ++
 sound/soc/codecs/Kconfig                      |   5 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es8156.c                     | 614 ++++++++++++++++++
 sound/soc/codecs/es8156.h                     |  76 +++
 5 files changed, 746 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8156.yaml
 create mode 100644 sound/soc/codecs/es8156.c
 create mode 100644 sound/soc/codecs/es8156.h

-- 
2.25.1

