Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82299663235
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 22:06:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E74F8327C;
	Mon,  9 Jan 2023 22:05:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E74F8327C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673298390;
	bh=D+VscChgiWTPKtIwaw8rdDitfiHORz8XsKI8hsLYmxs=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=UqvdRU7yxQ1TRu4IRxVF4DQqMF+jzzMcrEA3MWv/e2h8yMh2FcLgF6mGrDXco4kjD
	 6JnMcV1VHUsxi0FFazdM/UFxJK1jEW8eg8po1vFSI4jp8VcAtw+TXoNLxz9NK18n2J
	 zfEauCllBd6dgwazzhHxf8AoZ9L/UI1kwYwb8wdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 782AAF802BE;
	Mon,  9 Jan 2023 22:05:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04C48F8030F; Mon,  9 Jan 2023 22:05:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AA09F803DC
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 22:05:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AA09F803DC
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=QxztEx1y
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-4ad7a1bd6f4so106160977b3.21
 for <alsa-devel@alsa-project.org>; Mon, 09 Jan 2023 13:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WESRQ9yH+JOY/7DKJ6JNXcSdKyv9nRu0lUgi9KO1OY0=;
 b=QxztEx1yvvRNc76jN0UhMymaknpOhdB12dCg4DFANQ5BS13OLONqykToNH8X24Eh7d
 Ls6zMKNICto7QqR2H6lIPTNpxyW7LAhuCmY9VWl3Aex7HLq7c8gKVmQCuEdphuu4/qN9
 2KfmPMyfYArXWhaQttnYsOwybULDqcPrFICxMDO4Lg0LvLZqD3uIrJhxcbcQ7E5GyE3F
 zOGueTJD353BQSMAVyUC/QHkhVFYKXq+aCtaFvR5LCWBwkODJN0923rPuqTwj9rIVsOj
 GO4MkWypOwcCTUU6i+kVhs7L4Fz6U9LN9gMVr1XJtr1jiufYv5b4LH1IR5Pta/krl0YL
 ttJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WESRQ9yH+JOY/7DKJ6JNXcSdKyv9nRu0lUgi9KO1OY0=;
 b=a0ydXm0NOnqHQMd9qlJ/TmdNAos9X3lz/pQ0JAX3EsNvIJITF3rD60NaSx84hJW/mL
 sW/kmHJvdGNdO5WWODTJRTr7pz4SJML2weYZUouKLYdZeulCDDYDShdTAObbQmmpzuP8
 hYHORM3M9OzWK3D0LCsB26jzxr43J6Uaic9UszLtO3VdOlOYMQ+3bBufdCU9RNyH5Idl
 HvD19GCm7OfBg7RyRX7uwBYuQu8Gc8OLyjuenB5pubo7KyXgFvibwtjXouC00SwqdCYr
 kG3M13YBMVCCWK+xfPEr+R7Ppv2Cyk7kN8+viznM0hub9lnvjOCi+ItbH4VP+Ngawf1H
 n57g==
X-Gm-Message-State: AFqh2kp38iC6+47NIjvYIeVpQ6t52jTz5XddspVX0f0t2ycAXU+MqznD
 dwHH9FBHY9oIalNrwA+xPaC3guz6vtnzVgGDF7rQCIZZJJyiKJBnSTmngRi1chjRlGk5qF0aArs
 gw1GzC03SdIVV+exoNFT7xja/VQ9Z+l2Lz5FYDnhZB+kB/KFyJStZv+y1VpnkhnUIuP4T
X-Google-Smtp-Source: AMrXdXtWiyk8v2l4z9HYh+3mPvu2wvyhfNoGcuE3TboNKmYoFn35iqYoPyyk5tgBjNAy2UX7Ctol8v9TPps=
X-Received: from adchan1.nyc.corp.google.com
 ([2620:0:1003:314:9a4a:7a09:4d52:d0ab])
 (user=adchan job=sendgmr) by 2002:a25:9f0b:0:b0:6f0:f80e:9e87 with SMTP id
 n11-20020a259f0b000000b006f0f80e9e87mr7588510ybq.247.1673298323955; Mon, 09
 Jan 2023 13:05:23 -0800 (PST)
Date: Mon,  9 Jan 2023 16:05:20 -0500
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109210520.16060-1-adchan@google.com>
Subject: [PATCH] ALSA: hda/hdmi: Add a HP device to force connect list
From: Adrian Chan <adchan@google.com>
To: ALSA development <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Takashi Iwai <tiwai@suse.de>, Adrian Chan <adchan@google.com>
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
index 386dd9d9143f9..9ea633fe93393 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1981,6 +1981,7 @@ static const struct snd_pci_quirk force_connect_list[] = {
 	SND_PCI_QUIRK(0x103c, 0x870f, "HP", 1),
 	SND_PCI_QUIRK(0x103c, 0x871a, "HP", 1),
 	SND_PCI_QUIRK(0x103c, 0x8711, "HP", 1),
+	SND_PCI_QUIRK(0x103c, 0x8715, "HP", 1),
 	SND_PCI_QUIRK(0x1462, 0xec94, "MS-7C94", 1),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", 1),
 	{}
-- 
2.39.0.314.g84b9a713c41-goog

