Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB8BA59AB5
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 17:13:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 455BB606CB;
	Mon, 10 Mar 2025 17:13:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 455BB606CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741623235;
	bh=R3QbFZDWrowA2rM0N12GkbwWT9CkkMBpu2NyOKxLMc8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CuqD5rt97WWg/mkoiKI75tCvwtCZIghQ4OfBAiNKaE4JMPgHaEm4JwHSlJO2ko7vb
	 h/JtrxQcepWgQFQWPsRlfQV82wPIarLWo9gzrIkIksuSKtymfv4O1YfTxCRu7xXKkJ
	 ZSr/b35WdRWCSSJNsT58gyFtnO953GXmHfGRd5hc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C91CF80549; Mon, 10 Mar 2025 17:13:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B457F80533;
	Mon, 10 Mar 2025 17:13:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FD74F800ED; Mon, 10 Mar 2025 17:13:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id CE814F800D2
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 17:13:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE814F800D2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182b7d11d4bb9d00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/516@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/516@alsa-project.org>
Subject: USB-Audio: Improve support for Focusrite 4th Gen devices
Date: Mon, 10 Mar 2025 17:13:18 +0100 (CET)
Message-ID-Hash: UBO5KRQ3JWRJPOYUJZXV2BUB4T333VPP
X-Message-ID-Hash: UBO5KRQ3JWRJPOYUJZXV2BUB4T333VPP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UBO5KRQ3JWRJPOYUJZXV2BUB4T333VPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #516 was opened from perexg:

There are 4 capture channels.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/516
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/516.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
