Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D2E588E7
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 19:42:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDEF2167F;
	Thu, 27 Jun 2019 19:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDEF2167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561657371;
	bh=oAQPnPb9nLY9IIxhBiZ35EYdiMh518OEVz6lMfzLHrg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aQe4J0KqSkzAFlkmvlT9jGYM2Wkj2SD9njoRBgT1cjEJzOAx96zbFNtTfvSaAzoFo
	 OX89ooEYc+LBdRsiMH1SGl87E5zmLg+2ZVUf71irC7fYnIXCIpg2hRFUkZ48yLtKq1
	 /m1RGCm121LuR9qrJvPQlvo9B401jEMvGL4ZWo1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 046B9F89727;
	Thu, 27 Jun 2019 19:40:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74F4EF89705; Thu, 27 Jun 2019 19:40:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1C2FF896FC
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 19:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1C2FF896FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WlQMzQja"
Received: by mail-pf1-x443.google.com with SMTP id y15so1589270pfn.5
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FR72I8Co0+MJGxYGED+5/dqb9dBV7h2vnmoy22KZs5Q=;
 b=WlQMzQjaD6Aa5Vpx6UqUNwQtzaS+/ZnzexxXnYOYG0W1PYAgkbHfE2fYWoFKiBP7Zh
 LEPR/SVzaF7l+Q0m/o+UQebDcRzFIfpgkyImNv/KS4nJvxOsSaAT7aN30UUxwZLvkXsZ
 S9TZz5Czs4+GdrWidNougIDcp9M3vrswqrYypZU7hhTfV/t60PFVpiIsb9HBmx5S6jHd
 XYri7Ee2gAkIhLJZTONReWvn31bZfWiomRHF24DigS8uElaw1RZfJHUfP4/QS8fFGm3R
 OfXHhpgZfeWICB17eszaHC1hpsNgliz4hxuW3YOWDqR0CZKbTCr1WzSwm8Hs3BR1Oq1K
 EqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FR72I8Co0+MJGxYGED+5/dqb9dBV7h2vnmoy22KZs5Q=;
 b=YMaQk7W2ALjmg0clD6K2NLkweBobGI6fUbuYfdyAgChkwtKKyIwBIMwSrn11QdEPVS
 bmIdJi219oMQWizmcD2tAabMVhdmCy4nWuLfKit+2M3LJ+j4ElqflWPLGRpFi3O6+Ac8
 VaYJTJo5AiE2pl5+RNpsx8pQv8OlxP/yiiwq0VzD70K2eqcukdrL+gonGqYsUq+13AH/
 3CbO6+MCv7+MropDBaDx62tLnGgOvqfXzs8n7VJfZwQXzPQYTTdVaZkLyOtH7pVfJl0X
 kIwGcgU+RWGi7zzsxBT3Ksq8yOFaY4bbztqcbRjPFcKoakbGy5wC5Lx/Hkkuygyg5Tlp
 xu/w==
X-Gm-Message-State: APjAAAWVB9WUJg9HtyoQZFReTZdCcL8hxlKJ05vPTsUby4eKaXEMhp2r
 iI5rApRkEl1UT+xCpFrN2P8=
X-Google-Smtp-Source: APXvYqyafuSdTGPVAkCNuqSoaQIqQdl9g85tFTYZqmB4WSXYWLjMlnD3sWyW3Lsdj+lZO711wPLnpQ==
X-Received: by 2002:a17:90a:9f08:: with SMTP id
 n8mr7522337pjp.102.1561657226195; 
 Thu, 27 Jun 2019 10:40:26 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id o95sm1727758pjb.4.2019.06.27.10.40.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 10:40:25 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Date: Fri, 28 Jun 2019 01:40:17 +0800
Message-Id: <20190627174018.4015-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Takashi Iwai <tiwai@suse.com>, Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Fuqian Huang <huangfq.daxian@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 41/87] sound: ppc: remove memset after
	dma_alloc_coherent
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
