Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEE5A61584
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Mar 2025 16:58:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39EA660414;
	Fri, 14 Mar 2025 16:58:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39EA660414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741967893;
	bh=hb1rNFcy7x4r+WKETC3Emi8l3CGYOAIQ2Vnq4dZVtkM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=SXbjw3SPvryiJHjf+9Ws///NBmgYUoem5vtNAwvFKICB+gA2U83gFam6G/ErVRHtm
	 IVtGb4Ah1WdAL/EfK6CJDHa16ortHRiTi2912lv2RWxAxs3wt/qyxkV1tSEOPeFar1
	 Y7BK/8nHLi2P3WtxTkq100THUntZfsKQNiolXPnM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63E80F805BD; Fri, 14 Mar 2025 16:57:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F9B7F805B3;
	Fri, 14 Mar 2025 16:57:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 575CAF80424; Fri, 14 Mar 2025 16:57:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A2D6BF800FA
	for <alsa-devel@alsa-project.org>; Fri, 14 Mar 2025 16:57:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2D6BF800FA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182cb685f3079a00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/522@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/522@alsa-project.org>
Subject: ucm2: Add support for Lenovo Yoga 7x and T14s
Date: Fri, 14 Mar 2025 16:57:24 +0100 (CET)
Message-ID-Hash: NB32PCEAGCSHRBXS2MXF57MAQNFWYLUE
X-Message-ID-Hash: NB32PCEAGCSHRBXS2MXF57MAQNFWYLUE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NB32PCEAGCSHRBXS2MXF57MAQNFWYLUE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #522 was opened from Srinivas-Kandagatla:

This patch series adds support for Lenovo T14s and Yoga Slim 7x based on Qualcomm x1e80100 SoC.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/522
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/522.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
