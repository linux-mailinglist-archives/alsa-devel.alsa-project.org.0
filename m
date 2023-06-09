Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF8672A427
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 22:13:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 872EA100;
	Fri,  9 Jun 2023 22:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 872EA100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686341589;
	bh=GsNvqOi+XKLSmdkS6fCUl8z5sIB+/KjQIHnZ07xhcUY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XNb5tPQEY/bv6QzC+poj6RuMUFvtUoLgmSBGWtqFpNdqwTPIZD7N9PQ1QMUzkR2Zf
	 N8BuqK7CHueZCDsTUAYuBH6VJLbQ8XzyHv09PiF4vpCVmSGvDW7PQegwbuXFFNakId
	 aYZskmOrmQqVCj4+L3zclySVwD7LFH96R/+SI14A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0567F80544; Fri,  9 Jun 2023 22:12:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29071F8016C;
	Fri,  9 Jun 2023 22:12:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61754F80199; Fri,  9 Jun 2023 22:12:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38794F800ED
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 22:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38794F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=p61QjFaP
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6b28fc460bcso938638a34.1
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 13:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686341523; x=1688933523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rHOOZo7bsVeX3U79OiwET6jS96iIboJPZYyWUC4/j+E=;
        b=p61QjFaP9ZAH/Nkc2mA3UZNgcGMnrxatk+VqJllLTay/gfH/IiN+UOlfzrWQM5fs2A
         CBBBSao+kN14lEYepG7MZvMdnZEruZQoQCa/SKlp83NBJ4e81+OyWfD5SkwYog5zx60d
         UJiNY3GiSWp4IiEL4sIBgZFwcSOmBU28PE2fdRnVPJnUb5JuoVZfEZ2qTacyoC1LbBsS
         wdIq00UxfExOi6portLFMBT/QZTb8JjmvNEPisvo9Sa3Ib3/8UjCVww4GpcQkrxnePMx
         9Dj2Bs+R1lgAEzjo/37GelsDHzGr73D93ScbrEzRXEFZk7fGIKQJi50BwosW66mKGeWc
         kRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686341523; x=1688933523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHOOZo7bsVeX3U79OiwET6jS96iIboJPZYyWUC4/j+E=;
        b=imnd37yS5OdrlBjuT/XhiRTi5nMDyCVzj+kQU2Ru9jffITWEv9lfvAsNMyGyszeDzQ
         lj06w0/1rjxhjgZb11EhFwTMXj/Kr75QJeDQ2EnVyYD7h47p484aUmP1TQ+l/aSzs/4t
         902V5j9t+wet8i94crP1EfG6O82BBGbur4ITGgaOcMHirqa/T/1Qp0aLFLvPpTW7Z9vv
         GWkerkztvyBIofB8vYsKFfGRJIk55DeBx+uFy6EUgSW66uoXdoAnP5XrMuonxqthzqKi
         MrKCcHYK4i+HSDlPJvG9hTYGCfelobs6uqqg+Ztvrc9DSg94ORdau+ZSUcjUaTMHSeN3
         2Rtw==
X-Gm-Message-State: AC+VfDwuZqV/z+lem1DSTzpzXZ4qDZwGmkYeyYWv1c/7TK8BqP2ffffH
	NIPAIKV/kZ+ETPClVbuJdjo=
X-Google-Smtp-Source: 
 ACHHUZ6w2AeU6XOEt8Km+cVTa5N3vHjD1cMgl0AqBRWsDhyXLJYZfZzFnvrTLIUhoAbV2yLsTFnevQ==
X-Received: by 2002:a9d:7acb:0:b0:6b0:73fe:cf10 with SMTP id
 m11-20020a9d7acb000000b006b073fecf10mr2380235otn.5.1686341522933;
        Fri, 09 Jun 2023 13:12:02 -0700 (PDT)
Received: from policorp.cardume.local (177.207.112.13.dynamic.adsl.gvt.net.br.
 [177.207.112.13])
        by smtp.gmail.com with ESMTPSA id
 w15-20020a9d674f000000b006adda5cddb7sm1713402otm.62.2023.06.09.13.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 13:12:02 -0700 (PDT)
From: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	sbinding@opensource.cirrus.com,
	tcrawford@system76.com,
	andy.chi@canonical.com,
	luke@ljones.dev,
	tangmeng@uniontech.com,
	p.jungkamp@gmx.net,
	kasper93@gmail.com,
	yangyuchi66@gmail.com,
	yangyingliang@huawei.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	edson.drosdeck@gmail.com
Subject: [PATCH] ALSA: hda/realtek: Add a quirk for Compaq N14JP6
Date: Fri,  9 Jun 2023 17:10:58 -0300
Message-Id: <20230609201058.523499-1-edson.drosdeck@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6ZNTLOJLXP4X3K3MKNKI3HSCS65QLE7H
X-Message-ID-Hash: 6ZNTLOJLXP4X3K3MKNKI3HSCS65QLE7H
X-MailFrom: edson.drosdeck@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ZNTLOJLXP4X3K3MKNKI3HSCS65QLE7H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a quirk for Compaq N14JP6 to fixup ALC897 headset MIC no sound.

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a5d55a7063d3..308ec7034cc9 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11740,6 +11740,7 @@ static const struct snd_pci_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1b0a, 0x01b8, "ACER Veriton", ALC662_FIXUP_ACER_VERITON),
 	SND_PCI_QUIRK(0x1b35, 0x1234, "CZC ET26", ALC662_FIXUP_CZC_ET26),
 	SND_PCI_QUIRK(0x1b35, 0x2206, "CZC P10T", ALC662_FIXUP_CZC_P10T),
+	SND_PCI_QUIRK(0x1c6c, 0x1239, "Compaq N14JP6-V2", ALC897_FIXUP_HP_HSMIC_VERB),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
-- 
2.30.2

