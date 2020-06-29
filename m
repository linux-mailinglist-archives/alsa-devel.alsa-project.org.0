Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E028820CC20
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 05:25:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A2FA1675;
	Mon, 29 Jun 2020 05:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A2FA1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593401140;
	bh=GLo2TyclngioM5ejyNuUSGXaY7cT++dGp5711A9S0do=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vf+L727BNduttPNmn2Vixzn4z03GtgOYW8sW/Hr8Xw4gCzWO9ICIgzarGtZfKUEv8
	 LL7Hitk8IhPxg7AGdRc8fKjVEqO6dWHmft3Z2+9k+p/dnWL1Wj8DSYp6ysKZFModfa
	 4oWOSY7GD6Pm6GoL7R1qwezMMLv6HADmOuVGyXtY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B504F801F8;
	Mon, 29 Jun 2020 05:23:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 843FEF8020C; Mon, 29 Jun 2020 05:23:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AF5FF800EA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 05:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AF5FF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="DE01pAvH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=blQRyd/HnAyTbWfbQ9xtykWqeCj1aEkm67zC7s9PG2w=; b=DE01pAvHW6rcfid3cvE/jIdTqU
 nqqb9R2nFsmYFIjfnzSXtcbUHQzBQ95NnEZPBuq7UNDzYSHWA5DhHA9ZAUXVOSdrixZqIQdMu0y3S
 v7F9ibuJJoanNGjL1CC9W+CoBW6KsNZoF06HAKqv3EBhpa7G+BCKyzb+ZtxhnV6vxy475Lf5Fl7xV
 75aDqAn1/Bi0T6Z0VxVzxkg6vqZCjEWqcxVBAoBE+Rjus2AeKz+GA8NWMl0lnSIkis89unej4pTSk
 lYmf1ALW0kemIFuM6ca57rm/yYqUy1jDytPH4zD64cjYRGnDME8bc9pdmm+QXInAKpdCC2Y4E/FXf
 2oo5LwhA==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpkOO-0003eW-BA; Mon, 29 Jun 2020 03:23:37 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] ASoC: Documentation: fix reference to renamed source
 file
Message-ID: <a9f59f30-8cf2-ea82-567c-1706fd64fe62@infradead.org>
Date: Sun, 28 Jun 2020 20:23:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

From: Randy Dunlap <rdunlap@infradead.org>

sound/soc/soc-io.c was merged into sound/soc/soc-component.c, so fixup
the Documentation to use the updated file name.

Error: Cannot open file ../sound/soc/soc-io.c
WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno ../sound/soc/soc-io.c' failed with return code 1

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>
---
 Documentation/sound/kernel-api/alsa-driver-api.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200626.orig/Documentation/sound/kernel-api/alsa-driver-api.rst
+++ linux-next-20200626/Documentation/sound/kernel-api/alsa-driver-api.rst
@@ -99,7 +99,7 @@ ASoC Core API
 .. kernel-doc:: include/sound/soc.h
 .. kernel-doc:: sound/soc/soc-core.c
 .. kernel-doc:: sound/soc/soc-devres.c
-.. kernel-doc:: sound/soc/soc-io.c
+.. kernel-doc:: sound/soc/soc-component.c
 .. kernel-doc:: sound/soc/soc-pcm.c
 .. kernel-doc:: sound/soc/soc-ops.c
 .. kernel-doc:: sound/soc/soc-compress.c

