Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 896A4926CAB
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 02:14:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0802105F;
	Thu,  4 Jul 2024 02:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0802105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720052074;
	bh=lIYX6EfNcFy7jgwlKMOj5VtfAntGkN1hNNbWyhZYut0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LKNdNvkWys5XgpBQVif8WXe8797nxw7vS6aj991K89x0DnJYfXxKliAqtA5M4qMSH
	 hYgMpW3thrAtZTFL+up6mbgIDVvrX82fyO986Nv0PR5vzTFoFrPrUwZl9h/kW68aXf
	 oj50wK+uNcgfboDmaDAEoozXW/ihcLEjUSoXcrOo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C20D7F80589; Thu,  4 Jul 2024 02:14:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B3E9F80301;
	Thu,  4 Jul 2024 02:14:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFE7EF8025E; Thu,  4 Jul 2024 02:13:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 56B6AF800FE
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 02:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56B6AF800FE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1720052033648464203-webhooks-bot@alsa-project.org>
References: <1720052033648464203-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Add support for Solid State Labs SSL 2+
Message-Id: <20240704001357.DFE7EF8025E@alsa1.perex.cz>
Date: Thu,  4 Jul 2024 02:13:57 +0200 (CEST)
Message-ID-Hash: BZNMVM3TGAALV6G7KAEGWLMDEFSGZHRC
X-Message-ID-Hash: BZNMVM3TGAALV6G7KAEGWLMDEFSGZHRC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZNMVM3TGAALV6G7KAEGWLMDEFSGZHRC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #429 was opened from kescherCode:

This adds support for the [Solid State Labs SSL 2+](https://www.solidstatelogic.com/products/ssl2-plus).

Note that this *is* a distinct device to the SSL 2, support for which was added in #377. The most notable difference is that this device has two additional outputs (physically four, but two of those are mirrored).

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/429
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/429.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
