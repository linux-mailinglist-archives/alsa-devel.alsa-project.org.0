Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6420677F4D7
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 13:15:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53D48845;
	Thu, 17 Aug 2023 13:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53D48845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692270924;
	bh=qS2I3UG0F4Q43sYPZZEBhKU6wJX2b3FDd65X9Xae4cU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NYicdOwUODPm3RnotwnXOWwbMizfbKDd8ikVUSyNk++5Dk4RwUq7nfKymmuvQvtxf
	 QDzkUUFu/vUfyVLd2fwMdTqb6B1uTctPqQTwbkH9nrhBmU8gALkBlKSUdbmXs52myh
	 cQ5RLW9+1BRBsVx+EgxE+jfQObhrQHbEOVIkbbzo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA2D4F80074; Thu, 17 Aug 2023 13:14:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64A72F8016A;
	Thu, 17 Aug 2023 13:14:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3BB7F8016D; Thu, 17 Aug 2023 13:14:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FC69F800D1
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 13:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FC69F800D1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1692270848532021999-webhooks-bot@alsa-project.org>
References: <1692270848532021999-webhooks-bot@alsa-project.org>
Subject: Fix 'errno undeclared' compile error with older gcc versions
Message-Id: <20230817111410.C3BB7F8016D@alsa1.perex.cz>
Date: Thu, 17 Aug 2023 13:14:10 +0200 (CEST)
Message-ID-Hash: 7XR3J6UW5QOERIEU4TTCKFYCNQ76PNID
X-Message-ID-Hash: 7XR3J6UW5QOERIEU4TTCKFYCNQ76PNID
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XR3J6UW5QOERIEU4TTCKFYCNQ76PNID/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-gobject pull request #83 was opened from michele-perrone:

It looks like errno.h has to be included explicitly when compiling with older
gcc versions. This issue was encountered on the following system:
- Ubuntu 20.04 LTS
- Linux 5.4.0-156
- gcc 10.5.0
- Meson 0.53.2

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/83
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/83.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
