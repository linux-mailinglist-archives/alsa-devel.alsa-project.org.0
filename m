Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBBAB03A48
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jul 2025 11:05:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E5B860177;
	Mon, 14 Jul 2025 11:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E5B860177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752483956;
	bh=pJ8hBIdq1EUHjWH39bpowQDSBg7zLXnCQnkvu1sp690=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RA3oZGtuELGlmiAIJphDySe7SYn/Vi3PAIVI2qWlgBbEpk4KPn5rCi3S62z/WUtZ5
	 w3iXdZj+wabvcW58fCffLndw9twrTxQEEMkbfbqpTZb0z6wH5JQ73kDv6ALoJgTctv
	 D2vWp/CKVJZbB96V43aeEjuAVZMtwayip6btHlXQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB175F805C9; Mon, 14 Jul 2025 11:05:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF34DF805C2;
	Mon, 14 Jul 2025 11:05:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C215DF804E5; Mon, 14 Jul 2025 11:04:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id D8275F800F8
	for <alsa-devel@alsa-project.org>; Mon, 14 Jul 2025 11:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8275F800F8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <185212d073047700-webhooks-bot@alsa-project.org>
In-Reply-To: <185212d06fc0ae00-webhooks-bot@alsa-project.org>
References: <185212d06fc0ae00-webhooks-bot@alsa-project.org>
Subject: Feature request: Add native support for Cirrus Logic CS8409 codec
Date: Mon, 14 Jul 2025 11:04:54 +0200 (CEST)
Message-ID-Hash: VHIYTELGD5TDGKQI2HA4TL7X2HEXH6AJ
X-Message-ID-Hash: VHIYTELGD5TDGKQI2HA4TL7X2HEXH6AJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VHIYTELGD5TDGKQI2HA4TL7X2HEXH6AJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #591 was opened from Marek-mahav:

-w

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/591
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
