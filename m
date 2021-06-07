Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 010CA39D6D7
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 10:14:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 703B8167B;
	Mon,  7 Jun 2021 10:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 703B8167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623053680;
	bh=JVdxgc+tiyOp/Wyd9LAchCFWNRLIo/yHdLDPjrVzBYI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BZu3ehI5Gy3HgmJCPE0ec4QSvOWlkgBjKp8eIEh9Eaj6+2LftZjhAZ1xXoxMEGWIZ
	 5co88p7xTTXBhWlvspJuBd2FpNKPHF8EYWCwSsKUjUE4yKDXgAsrNY5M/zJi9UIb99
	 aIHX0C97b983uexGwXLVYVOQ8pkBh2ivMczOkoFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09C97F804C1;
	Mon,  7 Jun 2021 10:13:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF55BF800DF; Mon,  7 Jun 2021 10:13:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C524EF800DF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 10:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C524EF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="V4VaerOa"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="q7MPMduE"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 02A225C0132;
 Mon,  7 Jun 2021 04:12:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 07 Jun 2021 04:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=FSJrs/8mEmHlkDAy9L5MwvB1zd
 Mh9BbV+MtAwXEKo9o=; b=V4VaerOacSFz3vMWOk+b5OgcZcaoBtYNCIvVAYLQyc
 aVhnQDOEEu7Hl4hKXuJlZVYfZIn7Ol2QOf7vYe+VXxbtidwEk2+WrIasDTz8WPFp
 eJt6+PXlql6tTYNxdTQI9tgcYnPy1K/As7bOBddrvJqTCAgU9yIfoIJPv4syL34t
 Me3/kiutuQH3KzZRKa0UAYZjHs8HcE4En5CuGYj/UQLLLFEtvzv3ExzaOql0oVnt
 7wRwOFxWs57FSx4BsPrg1DkKiiqsQzDEWmXi3I96C/eNeA4dZFrIXCk0Cb6VoFbH
 PY83ir2mB8azALHpoSGmDO8eTGA6gyToK2CxDygPKdxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FSJrs/8mEmHlkDAy9
 L5MwvB1zdMh9BbV+MtAwXEKo9o=; b=q7MPMduEEm0cR5uJCq7QpIUS1QpfpUuPU
 A6WolJJ9EJwGaIrwXai2gNV2vLLueyRJ8mJN6+QReotYZeEFp7rRre5IcHePbZFA
 m+8c95gKmzCI8YTtmUZWEBUrKqSuujT1WsFCUY4j30KLxUH0e28JwqhXLD7wWuUL
 LomJqmEY/UpZc5S5La2jBYeyrvOIuWKYQ4yoZUIO0LnOSYhiyfLM2hD4aAdX2kb1
 2OqdhXcTSTpL6WvLJ1IM4QxEJIA9IJMNOwruOE+9ne9qYiLcuWz3weaj2y6Q8Fn+
 wF3DKlko69rSCSJNvE1OyNSelRwtlo31uxVKDO1d6mVHfM70Z0smw==
X-ME-Sender: <xms:B9W9YP1c6fxK2QZQth0pR-bbkqv1KOIyCONsoBsFsOwhtndCyOUycg>
 <xme:B9W9YOEBGsBPlkn9JaTXrRlVY2WtIITkg6xXvi9JoMCu4CyEWVqK6n2xi8kPoSh8g
 f_QzusvyxhXzA7ynwo>
X-ME-Received: <xmr:B9W9YP5Kj_nz4zDFSSoaC-sgx2Zyoo_JVwsqULK2xLuDCMvgT8iwJeFUdCRwRlw91psULhSfi4VP1cdpUh_LISvS3_UP6JokOLnfpNSIKQ46s8tdmgrM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertddtne
 cuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedujeetlefhtddtkefgtd
 euieelhffgteejjeehkeegveduvdevgeeiheeuueekjeenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmoh
 gttghhihdrjhhp
X-ME-Proxy: <xmx:B9W9YE2ObqoCWX4VAMbPXiSX-Fg2rQjAUf-vHAlY6X0mzPLeh6S1hA>
 <xmx:B9W9YCGJKxYowNEgZMGV3dQ4jeoBEXYb9jc27bdQdjgQU28JW2XDEQ>
 <xmx:B9W9YF-lDxep7K4xTBS6HjBM6zGvn7gXE7bHzTg8NQ0gLGacfLNDiw>
 <xmx:CNW9YEM2GiI2IdwKyUfxQIF8JOXa1gfd4YqrtMNr3TVolSn37ccFUA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 04:12:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/9] ALSA: firewire: cease from delayed card registration
Date: Mon,  7 Jun 2021 17:12:41 +0900
Message-Id: <20210607081250.13397-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

Hi,

Since Linux kernel v4.7, delayed card registration was introduced to all
drivers in ALSA firewire stack. Nowadays it brings less benefit than
code complication.

This patchset ceases from it.

Takashi Sakamoto (9):
  ALSA: bebob: cease from delayed card registration
  ALSA: fireworks: cease from delayed card registration
  ALSA: oxfw: cease from delayed card registration
  ALSA: dice: cease from delayed card registration
  ALSA: firewire-digi00x: cease from delayed card registration
  ALSA: firewire-tascam: cease from delayed card registration
  ALSA: firewire-motu: cease from delayed card registration
  ALSA: fireface: cease from delayed card registration
  ALSA: firewire-lib: delete unused kernel API

 sound/firewire/bebob/bebob.c         | 159 ++++++++++-----------------
 sound/firewire/bebob/bebob.h         |   4 -
 sound/firewire/dice/dice.c           | 138 ++++++++---------------
 sound/firewire/dice/dice.h           |   4 -
 sound/firewire/digi00x/digi00x.c     | 101 +++++------------
 sound/firewire/digi00x/digi00x.h     |   3 -
 sound/firewire/fireface/ff.c         |  90 +++++----------
 sound/firewire/fireface/ff.h         |   3 -
 sound/firewire/fireworks/fireworks.c | 107 ++++++------------
 sound/firewire/fireworks/fireworks.h |   3 -
 sound/firewire/lib.c                 |  32 ------
 sound/firewire/lib.h                 |   3 -
 sound/firewire/motu/motu.c           |  84 +++++---------
 sound/firewire/motu/motu.h           |   3 -
 sound/firewire/oxfw/oxfw.c           | 128 ++++++++-------------
 sound/firewire/oxfw/oxfw.h           |   6 +-
 sound/firewire/tascam/tascam.c       |  92 +++++-----------
 sound/firewire/tascam/tascam.h       |   2 -
 18 files changed, 296 insertions(+), 666 deletions(-)

-- 
2.27.0

