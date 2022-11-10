Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9F9625456
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 08:14:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26326167A;
	Fri, 11 Nov 2022 08:13:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26326167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668150843;
	bh=CGsQjgYh8dmUES9esL1LJKSAmpZLcctFOTGZDBQ2iTk=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lQpSBG1DkBSHwmK4zWL2QBWdAwljRCM/DE87VDdoE7jzBBl+syTGiZu++vaXDhv0x
	 LLV/Ly2VN4bcpUaxilQpudVZOom8p031v1XAyr7TlAo0DFoR8Onkzqk/x/xdG4ObnN
	 bCiawYjCkd1KqOPCcuiqewJOq12AzK5jX5VRRlPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1EF4F80557;
	Fri, 11 Nov 2022 08:12:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3212DF8021D; Fri, 11 Nov 2022 00:49:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS, USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E453BF80104
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 00:49:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E453BF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="kfAZg4l2"
Received: by mail-yb1-xb49.google.com with SMTP id
 b142-20020a253494000000b006ca86d5f40fso3102605yba.19
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 15:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=i8OGXI21yG4/vYrWdaCsJN7pH+UoXAbIMXQRvfwOvAk=;
 b=kfAZg4l29Nnl/PddKmcj5WZRBcjTSjt+O34kPvWGi9GGa7fVyOvNrYQLsK2jiRl1Ej
 KhRS6cZtrrsNxz6+1qDspP9LoLPeymnpoiSNxiRoCKAnLpfOsbO4xs8CCUjQmmyb+OXB
 gz8b4sTzqUNErxZmeSfXm4ZoZJLRr8CZJHF7DhcOAn/7u4tTVanAlk6uk4J2km/IBMMi
 xA8l7J5N/El+5z9VvK/qHnzvjf3xrsxwiCsUb2u9EWWDOAcB3cqUnTH274jP/49zWkJ7
 QkZnhzX4WmRBP4n6OJ/70d6lkr+aiTQm/7oMnUU3Qe5rRQ9LKDBeulrWCClGJqA+Qkkn
 2MAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i8OGXI21yG4/vYrWdaCsJN7pH+UoXAbIMXQRvfwOvAk=;
 b=EsDppSfpJk0DYcxpxo8/JBiBDa1jID3OYwdIsoIgZekIjW0NnERsCWk8QEKAzEj2QY
 dHBmB66FKx4yqduJhiVXxPYLf212wcvLLeHXPa++y26hmBQqoCF/qjV5OOOEOin9fqtq
 AcvGudZWaX5WP7sFgO5aMnZ5lLGYpoEMrR9DTvlHQ2ByT6ProJWN6w/81LDW17YCk2IO
 rRKAdm4cFSCe4t2rg2g56BepH+Juy/UlB31UHAss/573+XRU4VAFHpF4kz1ru79bspIm
 DNPbmRM+euthJLzm1eSYuYArzngzO0coSeHcAOXCtQwPHg7xnmZQTH7n3+K8wJ++YbcN
 dqnA==
X-Gm-Message-State: ACrzQf1HWgc2hg3UYxKENep8aW16iBCo9RF8+UvoamSlpMV9+Fwf4u8b
 CMIs0f98JcSYtX4io8dswkqJyUjNtyHv81bPZ09cdLDowFusCkfeUFF4YRdtbstRJ+Qz+FI+mA3
 faNrsaTsv+oZkQfMHfnUNNwFmy678HTM/Lq0Mywl5677Amr0cHZYWiyBeIRsUtZgqyxEo
X-Google-Smtp-Source: AMsMyM4YwemNxOBTySGcA2F0aEG2TzLlU+ymMr52sNSrvuRukI8hwA1xxwxUYOw8U1RoCxQBhdKUz2KGU9Y=
X-Received: from adchan1.nyc.corp.google.com
 ([2620:0:1003:314:c778:36ed:aead:289])
 (user=adchan job=sendgmr) by 2002:a81:892:0:b0:36f:e7:9809 with SMTP id
 140-20020a810892000000b0036f00e79809mr63261817ywi.250.1668124157596; Thu, 10
 Nov 2022 15:49:17 -0800 (PST)
Date: Thu, 10 Nov 2022 18:49:15 -0500
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221110234915.2446931-1-adchan@google.com>
Subject: [PATCH v1] ALSA: hda/hdmi: Add a HP device to force connect list
From: Adrian Chan <adchan@google.com>
To: ALSA development <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 11 Nov 2022 08:12:19 +0100
Cc: Adrian Chan <adchan@google.com>
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

Add the 'HP Engage Flex Mini' device to the force connect list to
enable audio through HDMI.

Signed-off-by: Adrian Chan <adchan@google.com>
---
HDMI audio is not working on the HP Engage Flex Mini because the pin is
unconnected. This issue can be resolved by using the 'hdajackretask'
tool to override the unconnected pin to force it to connect.
The alsa-info.sh output can be found at
http://alsa-project.org/db/?f=0e8f829d184407dca6dae4dc2686eac561a14ec6.

 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 21edf7a619f07..4ffc7c452de9b 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1977,6 +1977,7 @@ static const struct snd_pci_quirk force_connect_list[] = {
 	SND_PCI_QUIRK(0x103c, 0x871a, "HP", 1),
 	SND_PCI_QUIRK(0x1462, 0xec94, "MS-7C94", 1),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", 1),
+	SND_PCI_QUIRK(0x103c, 0x8715, "HP Engage Flex Mini", 1),
 	{}
 };
 
-- 
2.38.1.431.g37b22c650d-goog

