Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5037475B0
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 17:54:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88C98886;
	Tue,  4 Jul 2023 17:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88C98886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688486059;
	bh=n7EApB9aBcn43zncrn6pU/zlWjsBq5juXtaj8cXrTlM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BzQ4rGCkiHyly848mw2jvKDvOiijkV54tL980dfk0BuZycBmBqq0miTY2tsQlSwGE
	 m7jCYdF1cI9zIC8NCWitVEKRhKAosI1F815aafEljyybbztKKeaTe4oxK8N8KwvO89
	 0j+IjtvROvYy/2zsFncUqk57c3sHUqDKpLoLx9aY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66DCEF80580; Tue,  4 Jul 2023 17:52:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E4B0F80578;
	Tue,  4 Jul 2023 17:52:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20965F80125; Tue,  4 Jul 2023 15:02:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23649F80093
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 15:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23649F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=q+vIsYHi
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-668711086f4so3544841b3a.1
        for <alsa-devel@alsa-project.org>;
 Tue, 04 Jul 2023 06:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688475751; x=1691067751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SdXUxK+a1YB+zJOclgAZUovmZZT+3zpJEQp7SeGvRFs=;
        b=q+vIsYHiKwRk68x5mJk2HWPxjJ7P0EtjAQyQ8FQVb5YR5R723C5epb1cwtZBVTHRdg
         YFCImxmX+m+svuCOcg4FLs4Gy2Bdw4K8g1Wf6Z3g5lJ02HJWM36TqZHb+7uaNmZemh0U
         3Jv+oP3HziW9fDxcj7uKV5KfYZYbkUOEEhWiDNubPn+oLGZlLIYIf02b6HT8EILD7m6p
         Qh9A+5DBxZHdoDOfBkTQln1CF3ECE6wzalYoabJhSdIxYlmz8y2le3TI8EgzrTiuw+Xc
         ANSWjUwcAo9DxKC660ffXm3bzDgIAYQPV+yMOMuW9jPD3bBFIJ5+duDDhvV26o8E6vN4
         FB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688475751; x=1691067751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdXUxK+a1YB+zJOclgAZUovmZZT+3zpJEQp7SeGvRFs=;
        b=NoyMKs/ofA3wnhYqAJkk2EG1hNTUSytT5JVNWg+xFN7Dwb0bIF87qTD/HMhkCaWOBp
         OLJMtcMl6Ba6W1uV2c9xetIjmKNWhC234vrc49tBPiJe3vf4Nx7neXJobjCKjiV3l5t8
         QOJ6mSLVaKyoXomZuJnA5I+UhxJ8zK6suzAAWcN86Jj2bwLTVJuvIj2+sDGGO23AKW4T
         MPTN1LixoAO5gRmlW0ty+3pEdkAKhw70IReQO3VQp33Uv+Ba38BSmmAA9BZNUrYn/zZp
         mrmA1K1+rFln58yge9Jupgt63uoHl1UP+84Dcs87yJADsTfp1mxNny7T7zNJeMFWEq8J
         oNlw==
X-Gm-Message-State: AC+VfDzD038bD2r8xrHIvnDGGyoqI4eSIE3imb/h5Akd0WyQ1Wp1icdO
	W0ILBcyQCkvkguOY3sA44hM=
X-Google-Smtp-Source: 
 ACHHUZ5vcAkUmcTOklEqrYIlojQm+aoGgNhS0ML7/izYwVQ8LjmBIdZq6hc5XJN+lnApTglHLppiyQ==
X-Received: by 2002:a05:6a00:1402:b0:67a:72d5:3365 with SMTP id
 l2-20020a056a00140200b0067a72d53365mr26257437pfu.6.1688475750870;
        Tue, 04 Jul 2023 06:02:30 -0700 (PDT)
Received: from localhost.localdomain (87-121-248-135.dyn.launtel.net.au.
 [87.121.248.135])
        by smtp.gmail.com with ESMTPSA id
 o6-20020a63e346000000b00553b9e0510esm16156126pgj.60.2023.07.04.06.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 06:02:30 -0700 (PDT)
From: "Pentracillin@" <pentracillin@gmail.com>
X-Google-Original-From: "Pentracillin@" <Pentracillin@gmail.com>
To: tiwai@suse.com,
	alsa-devel@alsa-project.org
Cc: "Pentracillin@" <Pentracillin@gmail.com>
Subject: [PATCH] Add Dell XPS 15 9530 ALC289 speaker fix
Date: Tue,  4 Jul 2023 23:02:23 +1000
Message-Id: <20230704130223.13873-1-Pentracillin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: pentracillin@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TZI3O6Z6W3WAVQBIEZITJTFOSXVLAN5M
X-Message-ID-Hash: TZI3O6Z6W3WAVQBIEZITJTFOSXVLAN5M
X-Mailman-Approved-At: Tue, 04 Jul 2023 15:52:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index afe8253f9..b5b80b6cd 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9355,6 +9355,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0a9d, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0a9e, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0b19, "Dell XPS 15 9520", ALC289_FIXUP_DUAL_SPK),
+	SND_PCI_QUIRK(0x1028, 0x0beb, "Dell XPS 15 9530", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0b1a, "Dell Precision 5570", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0b37, "Dell Inspiron 16 Plus 7620 2-in-1", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x0b71, "Dell Inspiron 16 Plus 7620", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
-- 
2.34.1

