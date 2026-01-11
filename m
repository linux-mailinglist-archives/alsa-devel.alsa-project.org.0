Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6AFD0F400
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Jan 2026 16:06:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9381C601F5;
	Sun, 11 Jan 2026 16:06:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9381C601F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1768144017;
	bh=hFcKsLZjE4uFbm7oaGZfhL6/4Heli0PXJCkLQw+lIgU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XyWA5UXbkNh82wL85vZMDs6z9Wbc1uf9J7qPDa7dxM1P18YsyB2yd9BM/LoIjORr2
	 F9PdFNCiOHmg79sbf1BqWxO71YvXZDQ3L6fWvogbFcleJBpeCQua5NMoyKymCwdfT4
	 XfggkhtwHisL0eV/lyTUVNOFywgysFzm2wN+Y4SU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47809F805E2; Sun, 11 Jan 2026 16:06:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE6B3F8055C;
	Sun, 11 Jan 2026 16:06:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCB0CF80149; Sun, 11 Jan 2026 16:04:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 53B36F80100
	for <alsa-devel@alsa-project.org>; Sun, 11 Jan 2026 16:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53B36F80100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1889b574898ec100-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/684@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/684@alsa-project.org>
Subject: USB-Audio: Add support for UR24C firmware version channel
 differences, fix UR22C
Date: Sun, 11 Jan 2026 16:04:06 +0100 (CET)
Message-ID-Hash: QY3IGYFTGBCQLBJ5PMRA2BWL27BVSQXO
X-Message-ID-Hash: QY3IGYFTGBCQLBJ5PMRA2BWL27BVSQXO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QY3IGYFTGBCQLBJ5PMRA2BWL27BVSQXO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #684 was edited from jwlademann:

Steinberg UR24C has a similar change to the number of capture channels for version 3 firmware that UR22C. During implementation I found an issue with the condition used for UR22C which I fixed also.

See: https://github.com/alsa-project/alsa-ucm-conf/pull/554 and https://github.com/alsa-project/alsa-ucm-conf/issues/547

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/684
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/684.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
