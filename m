Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A133B16B4
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 11:20:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD1BC166F;
	Wed, 23 Jun 2021 11:19:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD1BC166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624440014;
	bh=YS8IVMPII7ZlDjry0VK+yQlXyOExWkUmmS2lCH0cJJY=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kJH4ifiMii3Avpwpzr90YsuIVq3Pod34DhatV2UDHlSofQLFAgvFw991B1ASdyK+4
	 VmxzxIBSTvSnk+pmufkPWDx+jPXp3xEIwOFXFT7MtkN+62gAYX7rqptdZ7Sz5XlXCu
	 oE0csJzecgqFktlOOLFnKKcVKJxMfRT93w/rGOK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B388EF804B0;
	Wed, 23 Jun 2021 11:17:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2449F80268; Tue, 22 Jun 2021 10:27:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99C39F80161
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 10:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99C39F80161
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 3A432FB03;
 Tue, 22 Jun 2021 10:27:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fPibtmydCwzb; Tue, 22 Jun 2021 10:27:11 +0200 (CEST)
Date: Tue, 22 Jun 2021 10:27:09 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: simple-card: Fill in driver name
Message-ID: <YNGe3akAntQi8qJD@qwark.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Jun 2021 11:17:51 +0200
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

alsa-ucm groups by driver name so fill that in as well. Otherwise the
presented information is redundant and doesn't reflect the used
driver. We can't just use 'asoc-simple-card' since the driver name is
restricted to 15 characters.

Before:

 # cat /proc/asound/cards
 0 [Devkit         ]: Librem_5_Devkit - Librem 5 Devkit
                      Librem 5 Devkit
After:

 0 [Devkit         ]: simple-card - Librem 5 Devkit
                      Librem 5 Devkit

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
This came out of a discussion about adding alsa-ucm profiles for the
Librem 5 Devkit at https://github.com/alsa-project/alsa-ucm-conf/pull/102

 sound/soc/generic/simple-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 0015f534d42d..a3a7990b5cb6 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -621,6 +621,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	card->owner		= THIS_MODULE;
 	card->dev		= dev;
 	card->probe		= simple_soc_probe;
+	card->driver_name       = "simple-card";
 
 	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
 	if (!li)
-- 
2.30.2
