Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4FB15AB7F
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 15:58:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43097167A;
	Wed, 12 Feb 2020 15:57:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43097167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581519522;
	bh=SwuecwTFerUrU8hmiJiks9wA9AtV0paJwGdD8ZNuRYE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NrBmvrRr5mo1hqy7UjvhyFUyyHCNtwMGZRjoYR7ycalWm1gUmb3G14nu9vGvdK3c1
	 e02p4Kwu2ddrNq6HdKI0VWGuVs3gzAA8oBy0RYwh2WXom7dQYn86uqt3d6l5Z1tUHh
	 vInKF4ZN4kV2QOa3ZLk3G+7DD3ujkQVCQvmbMt0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2529BF800F0;
	Wed, 12 Feb 2020 15:57:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D56BFF80158; Wed, 12 Feb 2020 15:56:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F70CF80125
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 15:56:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F70CF80125
Received: from ramsan ([84.195.182.253]) by xavier.telenet-ops.be with bizsmtp
 id 1qwu2200d5USYZQ01qwuvz; Wed, 12 Feb 2020 15:56:55 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1j1tRe-0004yo-NF; Wed, 12 Feb 2020 15:56:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1j1tRe-0001DQ-Kn; Wed, 12 Feb 2020 15:56:54 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Randy Dunlap <rdunlap@infradead.org>
Date: Wed, 12 Feb 2020 15:56:47 +0100
Message-Id: <20200212145650.4602-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 0/3] ASoC: Fix SND_SOC_ALL_CODECS imply fallout
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

	Hi Mark,

As expected[*], commit ea00d95200d02ece ("ASoC: Use imply for
SND_SOC_ALL_CODECS") introduced several build failures, due to missing
dependencies.

This patch series fixes several of them.  There are probably more.

Do we want to pursue this, or just revert instead?
Thanks!

[*] https://lore.kernel.org/alsa-devel/20200207091351.18133-1-geert@linux-m68k.org/

Geert Uytterhoeven (3):
  ASoC: Fix SND_SOC_ALL_CODECS imply SPI fallout
  ASoC: Fix SND_SOC_ALL_CODECS imply I2C fallout
  ASoC: Fix SND_SOC_ALL_CODECS imply misc fallout

 sound/soc/codecs/Kconfig | 88 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 82 insertions(+), 6 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
