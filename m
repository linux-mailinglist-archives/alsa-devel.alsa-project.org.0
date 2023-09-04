Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AA37917E6
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 15:19:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAD97825;
	Mon,  4 Sep 2023 15:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAD97825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693833573;
	bh=oeSPAXL6iWbarxVoWOCTRjMoINaJZdSnzCwmZorvWXo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gT/hqs8UNfiK2I+ye2gfQ2X52Fx8rjlM/ZlYqG/pflrxFMPRAJ5bukLsv/CnEzRcd
	 xml1/wIRQJc84E8C3fFuL3wKXhMCYa2wYvwK/6rmfxOUx+tEkTETBjNTeT0TwzYdwl
	 XsFZZsXyhOkKT48LwXCHSXcfk9SfzA4sF7MqUwMQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40686F8047D; Mon,  4 Sep 2023 15:18:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6887F800AA;
	Mon,  4 Sep 2023 15:18:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78526F8047D; Mon,  4 Sep 2023 15:18:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A6A93F80236
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 15:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6A93F80236
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1693833515304615021-webhooks-bot@alsa-project.org>
References: <1693833515304615021-webhooks-bot@alsa-project.org>
Subject: Fix build failure on Clang 16
Message-Id: <20230904131838.78526F8047D@alsa1.perex.cz>
Date: Mon,  4 Sep 2023 15:18:38 +0200 (CEST)
Message-ID-Hash: L56BJ66FXUHHSJKNJIVGDATCCYOK7ZUL
X-Message-ID-Hash: L56BJ66FXUHHSJKNJIVGDATCCYOK7ZUL
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L56BJ66FXUHHSJKNJIVGDATCCYOK7ZUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools pull request #17 was opened from mazunki:

Explicitly casting to `GCallback`, defined as `void (*)(void)`, through the `G_CALLBACK` function.

Fixes issue #12 and by extension https://bugs.gentoo.org/show_bug.cgi?id=880997.

cc @capezotte @thesamesam

Request URL   : https://github.com/alsa-project/alsa-tools/pull/17
Patch URL     : https://github.com/alsa-project/alsa-tools/pull/17.patch
Repository URL: https://github.com/alsa-project/alsa-tools
