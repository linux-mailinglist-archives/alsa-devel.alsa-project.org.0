Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EA8591BF
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 04:53:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 758FF16D9;
	Fri, 28 Jun 2019 04:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 758FF16D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561690407;
	bh=oAQPnPb9nLY9IIxhBiZ35EYdiMh518OEVz6lMfzLHrg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KGOezn+wM9DVsF9DNC0nxNiP3r6u7BlLkoQOykEKHLKEoc++oI7lYWOH0sxZHIHnJ
	 RFfTtxbSQz2A/wy0L6A4Q/6TrQ7IJVAYVzaZgcmDKHHzAmb7RMp1LzFD25q+s9cudD
	 IsNEZ8sG48LgV7KvySZskzc1wooF8QxaCHyPvd5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5A0AF89727;
	Fri, 28 Jun 2019 04:51:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48A8AF896CB; Fri, 28 Jun 2019 04:51:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 713D9F896CB
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 04:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 713D9F896CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IhxJ2cyQ"
Received: by mail-pl1-x644.google.com with SMTP id m7so2350416pls.8
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 19:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FR72I8Co0+MJGxYGED+5/dqb9dBV7h2vnmoy22KZs5Q=;
 b=IhxJ2cyQo1/nvunCFvFfS0lEbh/0091c04NKKkhNShMj9sWqyfADIGoFXQl05TpjYZ
 7j9A1FXpIIEdEwYze1FTKINBI27EiSaozaS7oQ9bNK1BFztQRxa22TtkmWEFmUKAQ+ZB
 Nzy0w3v1kP9zev1mkPZoA9lp3fLcgU4t6y3NmEjraSL8V+oHQ6LknVwFeNHupu+NLP73
 Q8YBHbhPZtOVyBiwviEQHq0703WzQ6nsqSlyYrcGslLgXO3uwcIsdDebNOqrEuhe0uPS
 29oPRFdsznFFLxhrSOb7M5UCeR5+K1sx5WNlxrRdHaRg5YW1mkMs3kIi/offf8HJ0AZ8
 ngdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FR72I8Co0+MJGxYGED+5/dqb9dBV7h2vnmoy22KZs5Q=;
 b=fhek7j/xbdgXUfolGkExTNU8j/egNVunNmkW3c7Kome6NBzJ/Xg1/LydQmA9bG2oUK
 pQ5uMTfQystOgXQ98DDb/ap8mcbaIDulHbj6RsjB/H1AkZccRoDMti+azDdeMnFuapql
 RwhcJilFlS632pDXmC77USWO1H8inymvY2dHlqFXVNdSBBI6U7VQ+/SGO9wyCpFd+rOK
 B4mWGTe1f8U11RP2fEmwAT9h8XWpyXa+en2M5TDcgvJm53Z4XrgLYdcS/sWBS++zCGmz
 RkXXPurVO3t0qATLsJzJaokgxR1l0DEmMlVfCY2BzEXrPhejWC/px3+n7wlFCYt6NlLI
 Asig==
X-Gm-Message-State: APjAAAXpvGjXElmtijeDgV5qjYi7m1mXdKtwNT4JvhvG+Y8h5pCa1bfY
 JzMyEx6L8lJp9OfaLMHE/zE=
X-Google-Smtp-Source: APXvYqzL32mC6au/7C3TzD/kwMbOVnb1DJlzl+HtOU7wDCsXVoSrKw2C4o6YPmea15yYB/y61C1tKg==
X-Received: by 2002:a17:902:868f:: with SMTP id
 g15mr8558096plo.67.1561690262921; 
 Thu, 27 Jun 2019 19:51:02 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id b1sm457294pfi.91.2019.06.27.19.50.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 19:51:02 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Date: Fri, 28 Jun 2019 10:50:54 +0800
Message-Id: <20190628025055.16242-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Takashi Iwai <tiwai@suse.com>, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Fuqian Huang <huangfq.daxian@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH v2 27/27] sound: ppc: remove unneeded memset
	after dma_alloc_coherent
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

In commit af7ddd8a627c
("Merge tag 'dma-mapping-4.21' of git://git.infradead.org/users/hch/dma-mapping"),
dma_alloc_coherent has already zeroed the memory.
So memset is not needed.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 sound/ppc/pmac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
index 1b11e53f6a62..1ab12f4f8631 100644
--- a/sound/ppc/pmac.c
+++ b/sound/ppc/pmac.c
@@ -56,7 +56,6 @@ static int snd_pmac_dbdma_alloc(struct snd_pmac *chip, struct pmac_dbdma *rec, i
 	if (rec->space == NULL)
 		return -ENOMEM;
 	rec->size = size;
-	memset(rec->space, 0, rsize);
 	rec->cmds = (void __iomem *)DBDMA_ALIGN(rec->space);
 	rec->addr = rec->dma_base + (unsigned long)((char *)rec->cmds - (char *)rec->space);
 
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
