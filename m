Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B60B364874
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 18:43:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 563821694;
	Mon, 19 Apr 2021 18:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 563821694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618850588;
	bh=gBllu+gIAsiFsfATANdtT05MzauI4Jr3lLVOaXnXCxs=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k88D4H6uBduJ1Gt/6+qJwS7LnwDtfRw829/IqvSMXuHJY6buieAism57nA2kYjIwo
	 Zv3nEOr/UbALB8fQqTqf9iBFQu+DPODmCvGqkgPDkWf/3BSOObkFLBW5/cPrQRkgM4
	 Y9vsIWxtSmXhJP8x5U2IBoXcmInALnTxOJK9W3uQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97007F800C5;
	Mon, 19 Apr 2021 18:42:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5562F80276; Mon, 19 Apr 2021 18:42:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx6.ucr.edu (mx.ucr.edu [138.23.62.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9B20F800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 18:42:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9B20F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu
 header.b="l9oOQnhU"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1618850530; x=1650386530;
 h=mime-version:from:date:message-id:subject:to;
 bh=jSFunXbDMrqQ45wSfZrNYAgGyt66/xcoQui7W98yh7k=;
 b=l9oOQnhUye9F3BbvMHsORr9ubJVGdvlAhnch5Z5V1MgK2VM3a/7VvtJr
 aQYjkvkfeVm7RjJavQHcGj1eUqNK/c6rJWgpBZMJnv+ZgET6r8U6wdHaN
 9MCMvEyiVy8VyiJxk+itRkvW4qYkkMAdEHQ5pqdmYqJalvUOIt27WvPYu
 vTXvZsZu3/WnVY40l/U9HH66kpKafrT7N22NNnEsx+6vjcW6JNGQcFlPe
 avVVncuGJU2hg4w6F6zTcnQ86BO31PDHrWWK7V6cuQjTy2fY3yGiAF8wS
 o2POlx8UN/2uae2+JLHLGt8+kF+zrKywJXSgQSskMb1mvguBgQGgoe4N4 w==;
IronPort-SDR: KfhaDHjSvzRvsf5iLTSHNDAlLGRQQTQgc/8bjSJ6eIIjDI2mu+2XFzFgedBotBMpKyvt3KOGzl
 oTePbWiTsXROtpOj+aSy6nXwHl3z+t+mFwKuSnBfUPYJsAf+QRcu0jS1w8sOg2G99k3laAV7rd
 c5frsMc3AYdmdKY9vtKRurO77OoTG25HOKDVhrnNiyBZ+J67JREvstIGD0AbihYNkbCuJHdzhc
 IoGT9gdqK89DQO+cJM9EsiG3+Dj5gDp/p+HREVKgkcSbaY1XnYyMOgCo+E6osmMQ4hf5ck9BGQ
 7ac=
X-IPAS-Result: =?us-ascii?q?A2EkAACUsn1gf0fYVdFaHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?gcBAQsBgSKCVWuEQ4EehwaKW4IQAZEthiSBfAIJAQEBDzQEAQGGRwIlNAkOA?=
 =?us-ascii?q?gMBAQEDAgMBAQEBAQYBAQEBAQEFBAEBAhABAW6FF0aCOCkBhAQRbwYHAzQCJ?=
 =?us-ascii?q?BIBBQEiARIihVcFjkWPFYEEPYsxgTKBAYgNAQkNgUQSgSgBhwABAYJdhByCJ?=
 =?us-ascii?q?4ETNoI2dIQJg1CCYQSCR4EOW4JIUwEBAY9ejXqcLAEGAoJ1GZFbizEjpQEBL?=
 =?us-ascii?q?Y9VhRyjUxAjgTGCFDMaJX8GZ4FLUBkOnQwkLzgCBgEJAQEDCYpJgkYBAQ?=
IronPort-PHdr: A9a23:Ob7ryhaY9CBfx8qmgonjnjr/LTHk0IqcDmYuwqpisKpHd+GZx7+nA
 na3zctkgFKBZ4jH8fUM07OQ7/mxHzZYvd3e4DgrS99lb1c9k8IYnggtUoauKHbQC7rUVRE8B
 9lIT1R//nu2YgB/Ecf6YEDO8DXptWZBUhrwOhBoKevrB4Xck9q41/yo+53Ufg5EmCexbal9I
 RmrqQjdrNcajZdtJ6o+yBbEoWZDdvhLy29vOV+dhQv36N2q/J5k/SRQuvYh+NBFXK7nYak2T
 qFWASo/PWwt68LlqRfMTQ2U5nsBSWoWiQZHAxLE7B7hQJj8tDbxu/dn1ymbOc32Sq00WSin4
 qx2RhLklDsLOjgk+2zMlMd+kLxUrw6gpxxnwo7bfoeVNOZlfqjAed8WXHdNUtpNWyBEBI63c
 okBAPcbPetAoIbzp1UAoxijCweyGOzi0SVHimPs0KAgz+gtDQPL0Qo9FNwOqnTUq9D1Ob8QX
 uC0zajIzSjDb/RL0jj+6IjHaBEhquyLULNwcMvRyVMgFwLZglmMp4HoJC6V2fgXs2SB8eVvS
 P+vhnchpgpsrTeh2t0ihZPVhoIJ1F/E7yN5zZ4oKNC5RkB3fcOpHZ9SuiyEOIZ7Td0vTn1mt
 Ss7xLAKpIC2cSwFxZkp2xLTdeKLf5aU7xzsSuudPTN1iXZ5dL6jgRu57EuuyvXkW8WqzFpHq
 jBJn9rMu3wXyRDf98mKRuF/80u83zuEyhrd5fteIU8ukKrWM5shwrktmZUNqUnDBSr2mFnuj
 K+Ra0Uk5vCk6+T5bbXioZ+RL4p0hRv/MqQqg8C/GeY4PhUXU2iV++mwyafv/UL+QLVNgf02l
 rfWvIrGKsQco661Gw5V0oA95BajFzqqzsgUkH0dIF9GeB+LlZblN0zPLfziD/qznkygkDJxy
 PDHOr3hDI/NLn/GkLr5fbd86k5cxxAyzdxD+55ZBKoMIO/vVU/rrtDXEAI2MxGsz+b9FNp9z
 p8eWX6IAqKBKqzStUSI6fg2L+aReoAVpijyK/w+6vH0iX85gkUScbCx3ZsNb3C4HOppLFmFY
 Xb2hdcBC2gK7UICS7nIgUeFSjpaeT6RTrkx4jhzXJqrF4rTbpigmrGRmiypSNkeb2RdAxWAH
 Gnlc62NX+wFLTqIJc1smSBCUqKuD8cd3BKnrw/7g5t4J+ucrjEZqpvi/MNo/OCVnhY3o29aF
 cOYhlCMXWFpmSs6RzY3lPRus0x0yw/bioBliOYeGNBOsaAaGjwmPILRmrQpQ+v5XRjMK5LQE
 A7Ofw==
IronPort-HdrOrdr: A9a23:4Nb9V6y3EoSGRNflokrjKrPwp71zdoIgy1knxilNYDZSddGVkN
 3roeQD2XbP+VEscVwphNzoAtjifVry7phwiLNwAZ6HfC3L/FSlN5tj64yK+VzdMgnz7PRU26
 slU4UWMqyTMXFAgcz34Ba1Hr8bqbHtzImTmezcw31xJDsaDp1I0gERMHf+LmRGACdDQb40Do
 CV6MYCnSepZHh/VKmGL0hAce7EqdjG0L/FQTpDPR4o7wGSkSilgYSRLzGomjkZVT1LzfMZ9X
 Xd1zb++r6ov5iApSP05ivp455bmMTsx7J4aKKxtvQ=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.82,234,1613462400"; 
 d="scan'208,217";a="208966466"
Received: from mail-pj1-f71.google.com ([209.85.216.71])
 by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2021 09:41:45 -0700
Received: by mail-pj1-f71.google.com with SMTP id
 h15-20020a17090a054fb02900c66a1b9826so18220377pjf.8
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 09:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=THALAKT+8krVRXjHm8S5RMPhGROlVpuPvbtAPCfoXVE=;
 b=MXnNfotsoXXBcn6wNOMveMO1WnJqWZak4xwX9cowEbT9H9nIddgC9xspbDLdZnQ4oT
 l0OdUOVHX2BET5+3wEfkcNFbX0zdMD7YDz5ORe9o+ksWI2C83l9wFtek7/jHRqPt/Fjs
 mGd9cZJIF0cLD1SOTn8QHAio+DYv1Gi15oqmjVrpobN9a5CAaxBUBUBvgc1nLrAp+kIh
 Xusfb7zSxtoTfTKX+4/YWQtEgj2bcviVjD4dQrjuOjqjt7x1PnaVIW6NKwQWj6xeGlki
 bA1nEe4YPS9PKvmpYtuGCy/YxiT8sV+JYuA4CdZjoJeUBIKx2WcOjsMyOZvkXnzgplcy
 nkDA==
X-Gm-Message-State: AOAM5325vUxmvApPi1DoKsELm0gTlCkEvE14nR8215N0EVl2XNOFV4MX
 Z6vSW46MdqINQTdwL/GV6Zw82mFDKdm09vlVYOURsiTvJhhJCuqsI3n+c46jfJgu5wI2/4Igtq9
 bhbpTQzba7XbY0dFpdGIb/AfAu/J4x0F7pg2ZXfmc
X-Received: by 2002:a63:fb12:: with SMTP id o18mr12454586pgh.438.1618850503968; 
 Mon, 19 Apr 2021 09:41:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGVVA14w9cd00bzTIqGvJsXABtgR3UNwt3E3wk2wdGuq27iMVtJMez5tf5FxVDxI3/68gIDM1NaIVZSoVI4ZY=
X-Received: by 2002:a63:fb12:: with SMTP id o18mr12454563pgh.438.1618850503708; 
 Mon, 19 Apr 2021 09:41:43 -0700 (PDT)
MIME-Version: 1.0
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Mon, 19 Apr 2021 09:41:33 -0700
Message-ID: <CABvMjLQqYA60BpBs+yvE5q9He+4hutb_4vAPX1nt2nu14Lp-xg@mail.gmail.com>
Subject: [PATCH] ALSA: ctxfi: Avoid writing uninitialized variable in
 uaa_to_xfi()
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, 
 Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Inside the function uaa_to_xfi(), variable "l_timer" could be
uninitialized if pci_bus_read_config_dword() returns
PCIBIOS_BAD_REGISTER_NUMBER. However, it is write back to PCI
config space via pci_write_config_dword(), which is potentially
unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 sound/pci/ctxfi/cthw20k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ctxfi/cthw20k1.c b/sound/pci/ctxfi/cthw20k1.c
index 0cea4982ed7d..7c3436499974 100644
--- a/sound/pci/ctxfi/cthw20k1.c
+++ b/sound/pci/ctxfi/cthw20k1.c
@@ -1789,7 +1789,7 @@ static struct capabilities hw_capabilities(struct hw
*hw)
 static int uaa_to_xfi(struct pci_dev *pci)
 {
        unsigned int bar0, bar1, bar2, bar3, bar4, bar5;
-       unsigned int cmd, irq, cl_size, l_timer, pwr;
+       unsigned int cmd, irq, cl_size, l_timer = ~0, pwr;
        unsigned int is_uaa;
        unsigned int data[4] = {0};
        unsigned int io_base;
-- 
2.31.1

-- 
Kind Regards,

*Yizhuo Zhai*

*Computer Science, Graduate Student*
*University of California, Riverside *
