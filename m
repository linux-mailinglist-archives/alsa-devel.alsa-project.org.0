Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE796F505D
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 08:52:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CE6113B9;
	Wed,  3 May 2023 08:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CE6113B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683096755;
	bh=3DWypTfanWK/qdQ0GxwoEbmpms50gFuJC/Tblw7XYhw=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uWLM7jNlJDmoRaudYTiq1Cr9kxt9T6xJ1dyYs+1cdJgt8eJtCNckTRp0hWxaNK5RM
	 xs9ziG17azyfmLqph3bP666wJnRzpjplWQN6Ay6+Ar1JQ8ucpra51BOX6u014tpHa4
	 puzkBo3S/KTKIfKlZPegZyjPoDyphlr/eW5aaydE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C99B3F80520;
	Wed,  3 May 2023 08:50:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38FB6F8049E; Mon,  1 May 2023 12:16:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95109F80114
	for <alsa-devel@alsa-project.org>; Mon,  1 May 2023 12:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95109F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=sTjGdt9k
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94f161ee14fso78145866b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 01 May 2023 03:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682936198; x=1685528198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=93TBlzDzoT1wtp8An/95IHkU2ENlETSYZYDB2GGro8w=;
        b=sTjGdt9kxizaGq0cMEqXozsjwqpOak96bF/ispjSAjjx4TKex54FFHoU/aAjHUsfg6
         6pVl8lftP6u6eVu70MR+0R2D22wu+YgwMBnRranzfrwhmUAl1f5MKxdqUMivO8avT4Fe
         J419B8HhXlx5Gmazxy5Wd16J7qFfwYvarFpEXnPSy3JDndmi3LjdH/9uEFv23Io3d+3G
         9/2E++rzy5Q+mQNp7KOB1Lfriig1kocdJ7G9S8V/0QZdCbu/OJJloGXeMaAKr+gdIHTC
         9toKT170vXKOMzu8kpTz9gz60c9lyPxabrdBXojpy1q6g6P6WAOJzkRd/ekRX7Z/IGZu
         Sayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682936198; x=1685528198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93TBlzDzoT1wtp8An/95IHkU2ENlETSYZYDB2GGro8w=;
        b=KyhvV+LZ3w2ct+3AtOuEp+b35Zx15L2sGSu3rfnCJsbRlxnHqJty76Fr3KajQKvEMe
         YqQVn9kVSqCLPc2sUoUaW21d5Fg8XeBMKvvjApylXO1E+hblShwJvwdSl8++PNy3BAH8
         iTGJrT5Ja14skdCmDCMH5aJt7iwnuT0S7Xtxog2Xpqv7tdF66guDPVWUvEmX23mWVhOn
         NUwbjve80RfD2uNLKzfXohBql3SSyDdKMP/x7K0oFZc7lerSFIcOXtk+wUhMq4uUgqLI
         0uyQ85JJz2tZaHetydlX7yLSp0c0DiOF+s5/Qqe3Evn3vYv8/qVHjfHEUfvw8tCdLDqF
         05sw==
X-Gm-Message-State: AC+VfDzxJJVQ+qpOKCjUJeEYE/jdxelMe/SCd3ahaVg06slx98A2e0o0
	y0EmW6WH59raKtkmg8VtWEoQYq61jE7RPQ==
X-Google-Smtp-Source: 
 ACHHUZ5JCVLg6Vd1xQS7WcqurRX9+ZHoyD7a601rkTEbwcCPZpjAT/5x0iwRqtZAY7lHlu7F9o6owA==
X-Received: by 2002:a17:906:5352:b0:94f:4ec3:f0e7 with SMTP id
 j18-20020a170906535200b0094f4ec3f0e7mr11395200ejo.2.1682936198106;
        Mon, 01 May 2023 03:16:38 -0700 (PDT)
Received: from ivan-B550MH.. ([37.252.94.55])
        by smtp.gmail.com with ESMTPSA id
 gq18-20020a170906e25200b0094eeda0df09sm14749458ejb.179.2023.05.01.03.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 03:16:37 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	corbet@lwn.net
Subject: [PATCH] ALSA: docs: Extend module parameters description
Date: Mon,  1 May 2023 14:16:34 +0400
Message-Id: <20230501101634.476297-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7IN77UR73CXTJCRCZMT3NV26TSX422TG
X-Message-ID-Hash: 7IN77UR73CXTJCRCZMT3NV26TSX422TG
X-Mailman-Approved-At: Wed, 03 May 2023 06:50:50 +0000
CC: Ivan Orlov <ivan.orlov0322@gmail.com>, alsa-devel@alsa-project.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, himadrispandya@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7IN77UR73CXTJCRCZMT3NV26TSX422TG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Common ALSA module parameters look a little bit confusing because of the
description lacking, and it took me a while to understand the purpose of
their existence. To figure it out I asked the question about them to the
"alsa-devel" mailing list, and Takashi Iwai answered me with the text I
appended to the ALSA documentation in this patch.

These common module parameters aren't used a lot nowadays, but as I
understand they are important for providing compatibility with some
existing user-space apps. So in my opinion it is a good idea to document
why we need them.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 Documentation/sound/alsa-configuration.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index af71c68f1e4e..829c672d9fe6 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -133,6 +133,19 @@ enable
     enable card;
     Default: enabled, for PCI and ISA PnP cards
 
+These options are used for either specifying the order of instances or
+controlling enabling and disabling of each one of the devices if there
+are multiple devices bound with the same driver. For example, there are
+many machines which have two HD-audio controllers (one for HDMI/DP
+audio and another for onboard analog). In most cases, the second one is
+in primary usage, and people would like to assign it as the first
+appearing card. They can do it by specifying "index=1,0" module
+parameter, which will swap the assignment slots.
+
+Today, with the sound backend like PulseAudio and PipeWire which
+supports dynamic configuration, it's of little use, but that was a
+help for static configuration in the past.
+
 Module snd-adlib
 ----------------
 
-- 
2.34.1

