Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF1320CEE5
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 15:51:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D0B81654;
	Mon, 29 Jun 2020 15:50:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D0B81654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593438686;
	bh=XHtYOKJSfUA300e/p5ysfFZ8eKeqkxoTiM/IQ6Hezx8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A0jPFsKh1uOt33iC9612cLBSDP48LuL2r4ngzXs2jpgQf0upiolB+nU2xVx/qIRLa
	 wXd4jtvPjJvSCG7eV1SQ10FTgyktzHWmjsdVy0p00WUwhBxwAeijnFi79vaX9BHuuh
	 bKUNwzIsC7v6rGJIPOFgXo9SXU2r4IiMNmaWZYDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A1C3F8020C;
	Mon, 29 Jun 2020 15:49:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF5DDF8025F; Mon, 29 Jun 2020 15:48:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2533FF800BA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 15:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2533FF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oPeNk1jp"
Received: from localhost.localdomain (unknown [122.182.251.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3B3C23D67;
 Mon, 29 Jun 2020 13:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593438469;
 bh=XHtYOKJSfUA300e/p5ysfFZ8eKeqkxoTiM/IQ6Hezx8=;
 h=From:To:Cc:Subject:Date:From;
 b=oPeNk1jpTRqSnMK+lKozomFejz2j5aQRcZ4EeBGRNig7FvO3D2Q9ZHLKqOtHH4upq
 9gTDalb6sl47L730CJbjlYTLIbUJ3ms6ulS2HEm64suB8CgUqMzhpA3cEJ1wWKckTz
 ZwF6yy5a5Fa2Gpc3DWLn0g21xIcI13O1tC6l6urI=
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v5 0/3] ALSA: compress: Document stream states and fix gapless
 SM
Date: Mon, 29 Jun 2020 19:17:34 +0530
Message-Id: <20200629134737.105993-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Srini found issue with gapless implementation which prompted to look deeper
into SM for compressed stream.

So documenting SM was first step, so first two patches add that. Last patch
fixes the issue by keeping track on partial_drain and then moving state to
'running' in snd_compr_drain_notify() for partial_drain case on success.
While at it, noticed snd_compr_drain_notify() is lockless state change, so
fixed that as well.

I have tested this on Dragon board RB3, compressed audio works out of the
box on that platform and Srini will send driver and fcplay patches for
gapless soon.

Changes in v5:
 - Update SM diagram as suggested by Amadeusz

Changes in v4:
 - Add review tag by Charles
 - fix the lock deadlock pointed by Charles

Changes in v3:
 - Add pause->stop->free transition
 - Add setup->free transition
 - remove running->free as that goes thru stop

Changes in v2:
 - Added tested tag by Srini
 - Update compress SM with Free state and compr_stop() transitions

Vinod Koul (3):
  ALSA: compress: document the compress audio state machine
  ALSA: compress: document the compress gapless audio state machine
  ALSA: compress: fix partial_drain completion state

 .../sound/designs/compress-offload.rst        | 83 +++++++++++++++++++
 include/sound/compress_driver.h               | 10 ++-
 sound/core/compress_offload.c                 |  4 +
 3 files changed, 96 insertions(+), 1 deletion(-)

-- 
2.26.2

