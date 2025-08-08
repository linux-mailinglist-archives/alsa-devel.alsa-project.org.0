Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39266B1EAE8
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Aug 2025 16:59:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62ACA60252;
	Fri,  8 Aug 2025 16:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62ACA60252
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754665142;
	bh=BtinUxnFlhNxJYIWHGmSa6Hnjaw/Phn5pGJIMwQXnv0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=iiDiL+Vfkb7S1E79D2Hiabn4MpfvEVG3uid9dEo53mDehk3xjiQ5zb42lLVvI8Pr7
	 aSAH6UdXeEFG5zPeACT31bYJl5C2d4s2EhBD6nmNhR6Hbt+iUyscqrAzRDEEDuZGuZ
	 /aHIbhijxqIBcosrJkOCP/s3nA7LZ44IxUJlNwmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F14ADF805BD; Fri,  8 Aug 2025 16:58:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61920F800F8;
	Fri,  8 Aug 2025 16:58:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21584F8024C; Fri,  8 Aug 2025 16:58:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 931D7F8010B
	for <alsa-devel@alsa-project.org>; Fri,  8 Aug 2025 16:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 931D7F8010B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1859d29c34838700-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/596@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/596@alsa-project.org>
Subject: Rename qcs6490-rb3gen2 and qcs9075-iq-evk ucm2 conf
Date: Fri,  8 Aug 2025 16:58:21 +0200 (CEST)
Message-ID-Hash: LERXY3PMXEBFRFHXNNDIA5DO6XCGS243
X-Message-ID-Hash: LERXY3PMXEBFRFHXNNDIA5DO6XCGS243
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LERXY3PMXEBFRFHXNNDIA5DO6XCGS243/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #596 was edited from mohsRafi:

Rename the ucm2 conf for Qualcomm qcs6490-rb3gen2 and qcs9075-iq-evk

qcs6490-rb3gen2-snd-card.conf -> QCS6490-RB3Gen2.conf
qcs9075-iq-evk-snd-card.conf -> LEMANS-EVK.conf

Removed snd-card tags from conf files

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/596
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/596.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
