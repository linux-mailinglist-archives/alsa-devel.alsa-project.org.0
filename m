Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A73758F2D
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 09:37:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C41101F7;
	Wed, 19 Jul 2023 09:36:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C41101F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689752219;
	bh=ch99UwWfSZtxB2tVAYGPC3X9f/VqmwoB5kZqzylaNvA=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kQgpGfvR5LYfcKcIWRzpiH/hH/13gl/kup62unZK6QwDNN+gMIw5857ZY7u7EDdbJ
	 OHRzencxMHM3mngBNcss0ORTCPA0rgI+SsAMk4dtwJcAiOMM8pJM3MIVcnGXD4DJRJ
	 pyuvJFuujOljF5J6arZ9h3LmxsgzNTFJzjTkBWPA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2D30F8058C; Wed, 19 Jul 2023 09:35:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76214F8057E;
	Wed, 19 Jul 2023 09:35:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 525C4F8047D; Wed, 19 Jul 2023 04:26:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 594EDF800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 04:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 594EDF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=kaKWKqrU
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-98dfb3f9af6so872385966b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Jul 2023 19:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689733573; x=1692325573;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ch99UwWfSZtxB2tVAYGPC3X9f/VqmwoB5kZqzylaNvA=;
        b=kaKWKqrUipae3n35cXLzMAdA/UOpHY7a5WweF31980el5z/VB1pnRYaA2/RxgWSTV2
         L5fmcqeSrEriz4tuUM5zfXFCmWWQo9JKrAjRx0B73CUj7qBCDyMTlT2yayp23PFgyXIY
         xtT9jLh54MXiNfe0mfjc8fhwr8ifOx2sQXnJ0vGY1hxsqXCUZ9u/uR4lLMhBKiOaVzmK
         cqMZwfbApnHrF0LE4zj2EOoA9dObyZT4KGZtAI3PKd8kOx7aMhGjl//BMkm0G8GfFrkM
         0qEyQ6btTWvC1tEJphkzb5A5tZuAkr/ZWhDR3z1430yzmlbZ7gMK9uMj/XyF+Z1cWtGD
         F1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689733573; x=1692325573;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ch99UwWfSZtxB2tVAYGPC3X9f/VqmwoB5kZqzylaNvA=;
        b=Y1gB67w8lsf+uNYvQ5fjw++cmx2qxoXDWYpysEiBPRM6IqXYfEDRfIxk98liKgiM3p
         iRS7LFLw76WHjG8t5cSb+rCMAaogFM0mA6ZDagbFmMNDVD6/gKV1I+fWSrXlSFDs8xLQ
         mZJgXmIqO3uqOG7Nan2CRlFTrnMraH+SLGXnnrdiYW3ON7tS0lcExHjk2ilNvXJkDHgu
         34bS3l9qqY45Wffji4p2Hr4imJbL2YZpleWxUd81eSgBCF/5vU9c4FXnssF9R8ebpN6R
         CPP+84MwJxDW3GVJ6KakVGHhzZheQPhEdXtCXVY+Xf+FHrZzpcWSaK15eVXgp9oKw/7p
         xkKw==
X-Gm-Message-State: ABy/qLaamVPotAilEu0jcmeMKDwq55ZXUGPU2NnGnvSKAR3u+csjAthF
	CNBKlBSILw9vLdwtIsNoPyCCMvSOChyhJGhEJjkKosdM/8g1owBjjH8Ucw==
X-Google-Smtp-Source: 
 APBJJlHnJbJrFfX2GSkOhmmMsNhLluRobzk1kXLPOGHEt6aebU40MYsyDE07uwUqkGVivx9scbUesj8P7sAecxEZ1P4=
X-Received: by 2002:a17:906:1dd:b0:98e:2334:af12 with SMTP id
 29-20020a17090601dd00b0098e2334af12mr1250275ejj.45.1689733572570; Tue, 18 Jul
 2023 19:26:12 -0700 (PDT)
MIME-Version: 1.0
From: Chas Leichner <cleichner@google.com>
Date: Tue, 18 Jul 2023 19:25:35 -0700
Message-ID: 
 <CAA=k9AuqMMJF=deoQkpBetNdMf5XFZ+SfcFwZNjnCBYcwA5LEQ@mail.gmail.com>
Subject: Correct Home For Documentation of ALSA's PCM State Machine
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: cleichner@google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: G3WBN6RPHYIYKWAN7YG5L3QMC52VIGIQ
X-Message-ID-Hash: G3WBN6RPHYIYKWAN7YG5L3QMC52VIGIQ
X-Mailman-Approved-At: Wed, 19 Jul 2023 07:35:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G3WBN6RPHYIYKWAN7YG5L3QMC52VIGIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi all,

Several years ago, I went through the kernel and documented how ALSA
API calls influence the PCM state.
(https://source.chromium.org/chromium/chromium/src/+/main:chromecast/media/cma/backend/alsa/alsa_fsm.dot;drc=249548aedd61993a7d919ca1de32bd96697f8bdb)
One of my coworkers noted that this was still a useful document for
their work, so I thought it might be worthwhile to put it somewhere a
bit more discoverable than deep in the Chromium source tree, but I
don't see an obvious spot from poking around the ALSA wiki.

Do you have a suggested location for it?

Thank you,
Chas
