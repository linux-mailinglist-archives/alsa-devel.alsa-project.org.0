Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 069CB2B34E6
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Nov 2020 13:22:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DAC417D9;
	Sun, 15 Nov 2020 13:21:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DAC417D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605442957;
	bh=BiFzyyHX0cu8irIo44fgju/9AuV8VYo5DHXhVtYj+CY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZokD74jWwYg9PuD2KftnUKxZZStxbKq/nUH+6kGCgRkwzh4QyMcptYRcLea3Xpumi
	 PVTFpvWZkj7jaFNwd7nkXwSHEI/+T36Ji/cQaVl9hWT60tIYP7hgVK4ZZWId7F88lS
	 eQoTownLcby/hlbPO58wE1btEP6soB0W6b/VU6uw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE7C2F800E9;
	Sun, 15 Nov 2020 13:21:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 267E9F801F5; Sun, 15 Nov 2020 13:21:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from host.euro-space.net (host.euro-space.net [87.117.239.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01D40F8010A
 for <alsa-devel@alsa-project.org>; Sun, 15 Nov 2020 13:20:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01D40F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=birdec.com header.i=@birdec.com
 header.b="jIuvz2M+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=birdec.com; 
 s=default;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version
 :Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XmHXTe7cxRnQuTBQKB4v6q2G6D8or4BNzeFn2Gmr0D4=; b=jIuvz2M+Emk4aaBpOiKGQP4kEd
 DCX4GjrN8wJVxuVQcfugu0I4LuvkJ/Rq+dY7TLFCy7x7I/8t8rATrrvr3YFjVSVveaOwP6EHDBKY6
 Mdd77K4KlE8zIiWf10loXcZN7TKRC0v0ttLXKRQXzj6+oJILgA4DxvCTC2kEsYdH9+yxKlJv6b9bE
 gmtP3y1edcOAk0PElv7EtFUwuz8En0/JRSMAZ38TtOf/Pfao42IsRxHjKaL8BpAQlXaniBz/l0ErO
 4loCDpTHCyaaQI9/ADnFF1o9it9qlfqa6/QecVYFWlMyRAweCF9Rng263R5eYvNm6WmY8WkPMDkDS
 pheH9LLQ==;
Received: from dynamic-078-054-118-130.78.54.pool.telefonica.de
 ([78.54.118.130]:55232 helo=gentoo0.localdomain)
 by host.euro-space.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <kmarinushkin@birdec.com>)
 id 1keH1Y-000338-HQ; Sun, 15 Nov 2020 12:20:52 +0000
From: Kirill Marinushkin <kmarinushkin@birdec.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v3 0/4] ASoC: pcm512x: Patch series to set fmt from `set_fmt()`
Date: Sun, 15 Nov 2020 13:23:02 +0100
Message-Id: <20201115122306.18164-1-kmarinushkin@birdec.com>
X-Mailer: git-send-email 2.13.6
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - host.euro-space.net
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - birdec.com
X-Get-Message-Sender-Via: host.euro-space.net: authenticated_id:
 kmarinushkin@birdec.com
X-Authenticated-Sender: host.euro-space.net: kmarinushkin@birdec.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Matthias Reichl <hias@horus.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.com>
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

Set format from `set_fmt()` func instead of `hw_params()`, plus supportive
commits

Kirill Marinushkin (4):
  ASoC: pcm512x: Fix not setting word length if DAIFMT_CBS_CFS
  ASoC: pcm512x: Rearrange operations in `hw_params()`
  ASoC: pcm512x: Move format check into `set_fmt()`
  ASoC: pcm512x: Add support for more data formats

 sound/soc/codecs/pcm512x.c | 134 ++++++++++++++++++++++++++++-----------------
 1 file changed, 84 insertions(+), 50 deletions(-)

-- 
2.13.6

