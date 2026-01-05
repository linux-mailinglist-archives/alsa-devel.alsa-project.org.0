Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D80CF4659
	for <lists+alsa-devel@lfdr.de>; Mon, 05 Jan 2026 16:29:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47304601CE;
	Mon,  5 Jan 2026 16:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47304601CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767626971;
	bh=Jp/vODDGaDJFI/JdXGZrEgrkoO8ZCgWKUym2apjrcYA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZXOWDlsVri9NfInPooco33dfaUNTEhhhVsCPfcArgmMr+soxMrdpmWvh+hUYjwApC
	 0ZuR0pa8eaJmfOP99hRdk9VHHSDG8CJWjvvEaYWb+DDPjYpHVzXyeJXBDd/v8cWVi7
	 YDlrxJQwGGi5SArylLb8LOFeFOh5AeOo9SAZ/tVI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 036E1F805C7; Mon,  5 Jan 2026 16:28:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8135CF802DB;
	Mon,  5 Jan 2026 16:28:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4776F802DB; Mon,  5 Jan 2026 16:27:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id C90B4F80154
	for <alsa-devel@alsa-project.org>; Mon,  5 Jan 2026 16:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C90B4F80154
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1887df45c0aec400-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/675@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/675@alsa-project.org>
Subject: Fix scarlett 18i20 channel detection
Date: Mon,  5 Jan 2026 16:27:51 +0100 (CET)
Message-ID-Hash: GW76HKNXKYQQ2QYDVAEQMWLLCIVFWC2P
X-Message-ID-Hash: GW76HKNXKYQQ2QYDVAEQMWLLCIVFWC2P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GW76HKNXKYQQ2QYDVAEQMWLLCIVFWC2P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #675 was opened from perexg:

It's a follow-up for #660 .

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/675
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/675.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
