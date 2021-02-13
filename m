Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E1831AACF
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Feb 2021 11:21:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBD871720;
	Sat, 13 Feb 2021 11:21:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBD871720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613211712;
	bh=ArAtQAGDWg/bEAgF+toBXGflHP3lZhinqWSY2mmqIaU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hd69K1iLLBQIoA3o6C2u0AilZazI5Ui/LLIq1ASu1maCjfk2nscXOStR+BVI98Eml
	 77+6Qnkz4re51FOK5vvv+8Ab9K/XX0f7LIV5nhHYnZk3XX1TfeIxVZX+SFp4noENR8
	 HhWbFsgMfWV/NWB0n26g+MpzbDQ6mfsJivZyXMNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 798DDF8016B;
	Sat, 13 Feb 2021 11:19:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05812F801EB; Sat, 13 Feb 2021 11:19:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78431F8016B
 for <alsa-devel@alsa-project.org>; Sat, 13 Feb 2021 11:19:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78431F8016B
X-IronPort-AV: E=Sophos;i="5.81,175,1610406000"; d="scan'208";a="372960479"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-SHA;
 13 Feb 2021 11:19:14 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 3/4] ASoC: sun4i-i2s: drop unneeded snd_soc_dai_set_drvdata
Date: Sat, 13 Feb 2021 11:19:06 +0100
Message-Id: <20210213101907.1318496-4-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210213101907.1318496-1-Julia.Lawall@inria.fr>
References: <20210213101907.1318496-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

snd_soc_dai_set_drvdata is not needed when the set data comes from
snd_soc_dai_get_drvdata or dev_get_drvdata.  The problem was fixed
usingthe following semantic patch: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,y,e;
@@
	x = dev_get_drvdata(y->dev)
	... when != x = e
-	snd_soc_dai_set_drvdata(y,x);

@@
expression x,y,e;
@@
	x = snd_soc_dai_get_drvdata(y)
	... when != x = e
-	snd_soc_dai_set_drvdata(y,x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 sound/soc/sunxi/sun4i-i2s.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 78506c3811dc..c57feae3396e 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1079,8 +1079,6 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 				  &i2s->playback_dma_data,
 				  &i2s->capture_dma_data);
 
-	snd_soc_dai_set_drvdata(dai, i2s);
-
 	return 0;
 }
 

