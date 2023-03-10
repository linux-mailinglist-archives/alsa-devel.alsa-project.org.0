Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F236B474E
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 15:50:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B31918D3;
	Fri, 10 Mar 2023 15:49:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B31918D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678459810;
	bh=cRP+GznZmglvgjYF/6nIRzGsGRrJdtMPmenptBryG5U=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rCsNfkv7luNxTDVt4R68JbZFg8eJMHSJXjf3vtOTnwVc2h0gcVlAXSY+R2d/W7m9x
	 YNDyu+dw+O2uv+D+h8SdFHdSC8ou3c8WmpCqboZOa7kiNcvZox3BFroilZYFP0RHxT
	 pKYtidukahMhm34rqScBznbXyINzanL90r8M9uV0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90B6EF80544;
	Fri, 10 Mar 2023 15:48:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BDA5F80548; Fri, 10 Mar 2023 15:48:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D3E9F80520
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 15:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D3E9F80520
Received: by mail-oi1-f173.google.com with SMTP id s41so4366879oiw.13
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 06:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qg0iiSi5D59knB4afnWtDWtKwbjfNwldsnK0gCKicW0=;
        b=2POrur1Ifa/OvwMbGi4OBBJ7I8DLjH8+Bz9Ed63f5N7ZFUF7ggQ7ePqgBlLOFF0Q3s
         +ak02p9CPmf3N9NhhXC09NDsKS1/BX+pcsj9w9qWZqf3Q/M2ZcSvrRYm9pEZSvAFi0QE
         Jw+BDlIfQMJ6G/GxpdyGPa0jUQ2WtmSTae/sDytJReSEmw7QG5sHZcfjFpiZWR4GRFLB
         2tT1iWnNs0QFlU9T/Xiia3c5pgnRgU3ea1GmkMnLDjh/EmJJzeCR5c0vNex8MLgih7Nb
         nl/MymsM+k1mc5vQmpYcgqKKyw9lWcNUPCW7FpVezvHbsen7vppTADobYNAmeBaXGl82
         IB1A==
X-Gm-Message-State: AO0yUKWouiWqLiALgQBT4Xc4/r8ZSvx8eaRezBF1xRyhOiomWqFNOOsV
	ll+4Eep3K63vKhyQFq48qw==
X-Google-Smtp-Source: 
 AK7set92BIXB3jjxOYgKQPRW8pbJ81CxrVf+/wWybdPCOhgKgGGi0VZyqb33P79YwF+5XDXBzMvJFQ==
X-Received: by 2002:a05:6808:15a4:b0:37a:2bf0:5027 with SMTP id
 t36-20020a05680815a400b0037a2bf05027mr1100385oiw.21.1678459712608;
        Fri, 10 Mar 2023 06:48:32 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 n204-20020acaefd5000000b0037d7c3cfac7sm982882oih.15.2023.03.10.06.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:48:32 -0800 (PST)
Received: (nullmailer pid 1546613 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:34 -0000
From: Rob Herring <robh@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: Use of_property_read_bool() for boolean properties
Date: Fri, 10 Mar 2023 08:47:33 -0600
Message-Id: <20230310144734.1546587-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VPKSIX2GLHL6AQSJWWU7WNZX2J5RRMHH
X-Message-ID-Hash: VPKSIX2GLHL6AQSJWWU7WNZX2J5RRMHH
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPKSIX2GLHL6AQSJWWU7WNZX2J5RRMHH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties.
Convert reading boolean properties to to of_property_read_bool().

Signed-off-by: Rob Herring <robh@kernel.org>
---
 sound/ppc/tumbler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/ppc/tumbler.c b/sound/ppc/tumbler.c
index 6c882873b344..12f1e10db1c4 100644
--- a/sound/ppc/tumbler.c
+++ b/sound/ppc/tumbler.c
@@ -1361,7 +1361,7 @@ int snd_pmac_tumbler_init(struct snd_pmac *chip)
 
 	for_each_child_of_node(chip->node, np) {
 		if (of_node_name_eq(np, "sound")) {
-			if (of_get_property(np, "has-anded-reset", NULL))
+			if (of_property_read_bool(np, "has-anded-reset"))
 				mix->anded_reset = 1;
 			if (of_property_present(np, "layout-id"))
 				mix->reset_on_sleep = 0;
-- 
2.39.2

