Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1486C103431
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 07:11:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88EC81694;
	Wed, 20 Nov 2019 07:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88EC81694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574230291;
	bh=CE/G934ZBdfm2xDzYrOAKwNL9X8mB7JejyPLkfOTdUg=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dnf70uWNC+TuJwT39ucQrbH0yT4N7S0vS5bTX/YrO4wD7hINSwAkyfnDZixPj70ho
	 smE7FHdUcn+bxXpeyujZHaGXse7rlduBDpSAL4BvdE5Ulapb4z+3AmNEEPVgcT32p1
	 MHrDUlWNClnOW40TDwBT+V+K72SSq1UUQhXTb1Bw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B7E1F80140;
	Wed, 20 Nov 2019 07:09:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BB01F8014B; Wed, 20 Nov 2019 07:09:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAF52F8013F
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 07:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAF52F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="KoMOmEjc"
Received: by mail-vk1-xa4a.google.com with SMTP id p77so10925091vkf.17
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 22:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=NaqhrJo4HWx9garF2ZdtWPr9XagMlbE/rBAeSnAKpyk=;
 b=KoMOmEjcVzs07ypFWBnESeyWveAkHHRKTIVHZegZ9+BgFE82cypYup+ml7VuuaaM9U
 XputTlT9vVldJcbLh0Bk4bOyB8j06tL6VguUlorBJc7cthXn1LPXwr6AntxvcHy9AMTf
 iCzcX/VUAg9mrNFCSnhEdWLF3S0oCdg66sgl/gB/4sWXBoZmCKJXNB6lyHI7pBBj73ZA
 OGO0F0fjQXP6HKTMaBZdge9u/Cz2QyWsNeUsJcviavOUbYbc3pCltipjgTmkQGC5LH15
 ceVJHeVoleyLc/YTFX8lGv2VyZ0hk3+Z4NQzo08lmCTut4JGICq13FQwNfj9bwjmFpPL
 7zxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=NaqhrJo4HWx9garF2ZdtWPr9XagMlbE/rBAeSnAKpyk=;
 b=GAAw3FjtseTknJjyAOMs1yPoRGTl20MRDuXcUDgduk8sR1RVP2s+QGo7VEY8Ssj+i/
 B1n41o2OfW4Wb3i8aUWOLEr0EG2JJ8G3v93deUGKLw50pivJsBWIxVQdw+2fugGee7bz
 JX03LKKRVxV4grC4UsfgHzFbG1KHLGqYke7Q8oh0hZdtMYFQpGmIS3oRYNp9sB8G063N
 DDU7OwpZn0bDEEIE+sgXxWiTYM6jEc1PYaY90JcOUYoo670RzFi24tZBFiFS7jrpsOp/
 Tvkxu4Xb+mEGht6MV8W1gpJUvzHeimug2u4WLxP1bA9BdbRaV+wfEj9enZlqM7jczqR/
 NBjQ==
X-Gm-Message-State: APjAAAVKDFjlmXqSEpfa8PDyAChJdGRDp10nq4PDMleNk3hmPdQX4h+m
 ZGrzlWqW4GwV/u5s/Spr7nVVWIN+Eh1/
X-Google-Smtp-Source: APXvYqx0sPU8PouhiMCTnmIZWZ/6Lh4W+REB+3hQ1A34w3m4hKegCpSIkw6lZTLWQsyJ1V49r9nYJiD3OzWI
X-Received: by 2002:a1f:250b:: with SMTP id l11mr474353vkl.10.1574230138360;
 Tue, 19 Nov 2019 22:08:58 -0800 (PST)
Date: Wed, 20 Nov 2019 14:08:43 +0800
In-Reply-To: <20191120060844.224607-1-tzungbi@google.com>
Message-Id: <20191120060844.224607-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20191120060844.224607-1-tzungbi@google.com>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 1/2] ASoC: core: add SND_SOC_BYTES_E
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

Add SND_SOC_BYTES_E to accept getter and putter.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 include/sound/soc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index e0855dc08d30..1accb724e1d1 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -299,6 +299,12 @@
 	.put = snd_soc_bytes_put, .private_value =	      \
 		((unsigned long)&(struct soc_bytes)           \
 		{.base = xbase, .num_regs = xregs }) }
+#define SND_SOC_BYTES_E(xname, xbase, xregs, xhandler_get, xhandler_put) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.info = snd_soc_bytes_info, .get = xhandler_get, \
+	.put = xhandler_put, .private_value = \
+		((unsigned long)&(struct soc_bytes) \
+		{.base = xbase, .num_regs = xregs }) }
 
 #define SND_SOC_BYTES_MASK(xname, xbase, xregs, xmask)	      \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname,   \
-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
