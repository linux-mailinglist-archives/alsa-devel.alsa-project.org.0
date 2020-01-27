Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8441C14AA7F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 20:31:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 285B89F6;
	Mon, 27 Jan 2020 20:30:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 285B89F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580153472;
	bh=C0M8J4jSGHHZ/ZAUxGlj9w5nYTZ44w8LNKd+4ouP1gw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L5l0ChGlE7B97JazVBJE3c+fcx18CbuCwE4CPc/+/BBV5739PkGzKweOqaP8zjMEP
	 XcK+wzv2OO/c2lOm3xzq7e5wMt5PTx2PChgKS8Z3aumk7j6P6BuLr6mKjQ3tgoeW8e
	 vu6Os9Ult0sgCKCZ74nq2L5r7M35+gltmC7blohE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 198DAF80254;
	Mon, 27 Jan 2020 20:28:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63BA4F80253; Mon, 27 Jan 2020 20:28:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 278B1F80082
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 20:28:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 278B1F80082
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 26185AC91;
 Mon, 27 Jan 2020 19:28:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 27 Jan 2020 20:28:27 +0100
Message-Id: <20200127192831.14057-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/4] ASoC: realtek sdw: Add __maybe_unused to
	PM callbacks
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

the trivial compile warnings were caught by my build test after pulling
Mark's tree.  Here are the fixes.


Takashi

===

Takashi Iwai (4):
  ASoC: rt1308-sdw: Add __maybe_unused to PM callbacks
  ASoC: rt700: Add __maybe_unused to PM callbacks
  ASoC: rt711: Add __maybe_unused to PM callbacks
  ASoC: rt715: Add __maybe_unused to PM callbacks

 sound/soc/codecs/rt1308-sdw.c | 4 ++--
 sound/soc/codecs/rt700-sdw.c  | 4 ++--
 sound/soc/codecs/rt711-sdw.c  | 4 ++--
 sound/soc/codecs/rt715-sdw.c  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
