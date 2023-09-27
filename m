Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B417B3F09
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:11:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE960F73;
	Sat, 30 Sep 2023 10:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE960F73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061474;
	bh=zYQlpbL61EMP9nyuhMZEPIXzWxJUvsiz6DycgU+sZIM=;
	h=Date:From:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aLAJv26u3gBbzMO+dJKDDmZKcpza5U3A55vKzQmksbo4ociqGZvfK8m2/GNF9fOhm
	 RQAj1785/tCLwnNtVO28zY9hk+dydduKzV0++v6qkqEjrK0QDGJ0QzRSLecOF0DWKK
	 94ZFjIv46cwAKpio5KQqtPuBwDsVZCjpnh/ENkDc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05659F806A8; Sat, 30 Sep 2023 10:07:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2289F806A5;
	Sat, 30 Sep 2023 10:07:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C58D1F8016A; Wed, 27 Sep 2023 18:29:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1D79F80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 18:29:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1D79F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j/KSkuu+
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-405524e6740so95666625e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695832173; x=1696436973;
 darn=alsa-project.org;
        h=mime-version:message-id:cc:to:subject:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QDCfzaeGWcIi7AD4z9zDOVfBWix11jNGiL4ta6mok7Q=;
        b=j/KSkuu+htiqsTimLWwvTv8H5nSFSrUvOqQL7AJM16iVDiNA3pAHRFoxh67TH7b00J
         6jTL9BVA0Fj3x6JTuh7E2dCsjd5LQeP5qxxDKhDEsPLO1DhiFKZ9Rq9t/SvCtsbwRw33
         I+j5706XRx5+a63H5BZNT0jj8NSqKSnb3DF3cueMFGRhkYQp7ToFAoNqzw0D6zeU5Use
         a4vaIWSpeoyM/6Lc1khJMi3exCnERwVAF8V0oE5znR1YoIGdGvpdNNboHndVIOApw3pX
         el24T8EHx9y/r8dMjFKQUkc4Nf518nci+TN+hrCK9G9FtrTd8Xj8DLxzd99z0g0IrrR1
         FiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695832173; x=1696436973;
        h=mime-version:message-id:cc:to:subject:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QDCfzaeGWcIi7AD4z9zDOVfBWix11jNGiL4ta6mok7Q=;
        b=bvGUn0wceSkKC5FctFRivWp3Z2XgjQ1NeZya113HkGM/2U118KLqhJ4sNZeN+o0kbH
         tlS5a+9owk0tanVb2jraWql3YFpTYI/jXPDaxJ4bunjfuLKKIaEghwWhWLBIebnSbzMI
         p/1rmpGAtI+7eFRkYLPDQX55/vZ99v+uoamhNSg209F43ZLWrRiQKAKd6cR2/a4/r0lb
         plVs1/PDoxIqF2fSVhyxx6sTXCO8ZkjoJRt+VfWuwZjdd43ATzOigkOjs9OBh1boi8HW
         A89YZ+V8A119jg9Nnrj4YLJTF9sI/NFjVwOmI3xGzWdkhkFOg3pBozZCe6sv4BeFLGSZ
         GN+A==
X-Gm-Message-State: AOJu0YwSZH+KBZ6P7jjnNC17SyKEeOmNJGgyPcVh6liP3/HJ2Pmwhu3t
	z2KmCHm0mxlEfLFU7VGaZAc=
X-Google-Smtp-Source: 
 AGHT+IHZ14obC9/XSaCfdC7bhMAaNzWl5pFem971kF4c1AI/TMOUFYjMimOzF5kR/Wyx/g+tjXrfzw==
X-Received: by 2002:a05:600c:244:b0:3fe:1232:93fa with SMTP id
 4-20020a05600c024400b003fe123293famr2392386wmj.22.1695832172753;
        Wed, 27 Sep 2023 09:29:32 -0700 (PDT)
Received: from yoga ([2001:638:904:ffe5:5742:c50f:bd0:6aa6])
        by smtp.gmail.com with ESMTPSA id
 z9-20020a05600c114900b004058e6379d8sm9334215wmz.23.2023.09.27.09.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 09:29:30 -0700 (PDT)
Date: Wed, 27 Sep 2023 18:22:39 +0200
From: Sven Frotscher <sven.frotscher@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
To: broonie@kernel.org
Cc: git@augustwikerfors.se, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
	regressions@lists.linux.dev
Message-Id: <R5KN1S.18M6QDS4T9PY1@gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-MailFrom: sven.frotscher@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6XNR6KWHLTTXZDOYYQRVWPOCF5NVZJA7
X-Message-ID-Hash: 6XNR6KWHLTTXZDOYYQRVWPOCF5NVZJA7
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:07:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6XNR6KWHLTTXZDOYYQRVWPOCF5NVZJA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Like the Lenovo 82TL, 82V2, 82QF and 82UG, the 82YM (Yoga 7 14ARP8)
requires an entry in the quirk list to enable the internal microphone.
The latter two received similar fixes in commit 1263cc0f, see
https://lore.kernel.org/r/20230911213409.6106-1-git@augustwikerfors.se.

Signed-off-by: Sven Frotscher <sven.frotscher@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c 
b/sound/soc/amd/yc/acp6x-mach.c
index 3d8a51351e29..e3d2b9d01552 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -241,6 +241,13 @@ static const struct dmi_system_id 
yc_acp_quirk_table[] = {
 >..>...>...DMI_MATCH(DMI_PRODUCT_NAME, "82V2"),
 >..>...}
 >..},
+>..{
+>..>....driver_data = &acp6x_card,
+>..>....matches = {
+>..>...>...DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+>..>...>...DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
+>..>...}
+>..},
 >..{
 >..>....driver_data = &acp6x_card,
 >..>....matches = {
--
2.42.0


