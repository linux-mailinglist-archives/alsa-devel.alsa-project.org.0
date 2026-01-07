Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3965CFD523
	for <lists+alsa-devel@lfdr.de>; Wed, 07 Jan 2026 12:06:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8853F601B3;
	Wed,  7 Jan 2026 12:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8853F601B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767783967;
	bh=xVGQRY4VOgQ6i2zE+47N3Q+etZQ2vmaL1bIb0mEmusE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=AiOL/TNtf0dfy3+2laoNBUXjxj4RT6B2GSgCp36xNjMTMtPgYkQdmoUf4mjqy2p9q
	 DvCA0c2bcBR85cttfr76woaYa4xCuCeGRvk/WVgz3bOGHieXSlxTnRdGVD5hktbuwJ
	 Tg9L6qMtsjXVq2cCqePmftjlo/QyWU/vE9BO0eZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA660F805D2; Wed,  7 Jan 2026 12:05:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FB6EF805DA;
	Wed,  7 Jan 2026 12:05:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9774DF80448; Wed,  7 Jan 2026 12:05:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E998F80254
	for <alsa-devel@alsa-project.org>; Wed,  7 Jan 2026 12:05:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E998F80254
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18886e18222ca000-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-utils/pr/317@alsa-project.org>
References: <alsa-project/alsa-utils/pr/317@alsa-project.org>
Subject: Alsaloop fix short options
Date: Wed,  7 Jan 2026 12:05:14 +0100 (CET)
Message-ID-Hash: CIC7ZXGJ6LXY3U7AGALBVG7KMOMYCMIS
X-Message-ID-Hash: CIC7ZXGJ6LXY3U7AGALBVG7KMOMYCMIS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CIC7ZXGJ6LXY3U7AGALBVG7KMOMYCMIS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #317 was opened from jacmet:

Various minor fixes to the alsaloop command line parsing

Request URL   : https://github.com/alsa-project/alsa-utils/pull/317
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/317.patch
Repository URL: https://github.com/alsa-project/alsa-utils
