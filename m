Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E458FB278
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 14:43:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D4FC93A;
	Tue,  4 Jun 2024 14:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D4FC93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717505002;
	bh=F7NWoyGwUVYB2ZYNkvUfNkf4hZrw/t7y2+4fL62zXso=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=BZohYGKO7CUz+J9EsXGCfY0i1JO7a6Cugg29NcRwqxsIyvq7NQvY9PKDvU8QkTfcj
	 Jn2dPcxXXLIVqQsH/TtLzJyYLX1yhN6WcLtLjXMdgaCV+qTm4p3A3Ck017edfXKc/F
	 IF8g1OY/VH4v6TgNMq52SHVT7iAfiZ1QPKcEOB2E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B855F805A0; Tue,  4 Jun 2024 14:42:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EDEAF80589;
	Tue,  4 Jun 2024 14:42:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D5A6F802DB; Tue,  4 Jun 2024 14:42:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C535F80088
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 14:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C535F80088
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1717504963563093185-webhooks-bot@alsa-project.org>
References: <1717504963563093185-webhooks-bot@alsa-project.org>
Subject: ucm2: Qualcomm: x1e80100: add USB DisplayPort playback
Message-Id: <20240604124247.2D5A6F802DB@alsa1.perex.cz>
Date: Tue,  4 Jun 2024 14:42:47 +0200 (CEST)
Message-ID-Hash: MX2QDAQUZ3OR4D4GUBXPROAAGVJS7DJE
X-Message-ID-Hash: MX2QDAQUZ3OR4D4GUBXPROAAGVJS7DJE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MX2QDAQUZ3OR4D4GUBXPROAAGVJS7DJE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #423 was opened from krzk:

Add two DisplayPort (over USB) playback devices, conflicting with the headset, because they use the same Multimedia1 frontend.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/423
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/423.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
