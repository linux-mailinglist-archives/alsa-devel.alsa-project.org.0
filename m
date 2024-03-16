Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A92DE87D951
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Mar 2024 09:38:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81BB52391;
	Sat, 16 Mar 2024 09:37:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81BB52391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710578286;
	bh=CSx2D8ramr59UydukUGJ3IsIrrZIr6ucMMpxdHbeMBQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=O1ycZWsVYVwAQy27sbfJO9J6Ib+Yk+Yh3pFfVL+DTgxFW+MSrqUZAT2mYfrJIUNKh
	 SstqUAXSrqJBi7cQ9K+P0cu3MquLJ1PwzyFZrmU+YmVJj81c2PRL5MHQnGcyjigxF3
	 8vRiF69d+Zvjxlv2OuJ5GCUY/GfnU1AFyi0SUw3Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABDF9F80588; Sat, 16 Mar 2024 09:37:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71BEDF805A1;
	Sat, 16 Mar 2024 09:37:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97DF5F8028D; Sat, 16 Mar 2024 09:36:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id C234DF80088
	for <alsa-devel@alsa-project.org>; Sat, 16 Mar 2024 09:36:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C234DF80088
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1710578175747917414-webhooks-bot@alsa-project.org>
References: <1710578175747917414-webhooks-bot@alsa-project.org>
Subject: GitHub Actions: Use actions/checkout@v4
Message-Id: <20240316083620.97DF5F8028D@alsa1.perex.cz>
Date: Sat, 16 Mar 2024 09:36:20 +0100 (CET)
Message-ID-Hash: AFTZ77TWLBIMYJWTSHSBP4WPE2PPRGKT
X-Message-ID-Hash: AFTZ77TWLBIMYJWTSHSBP4WPE2PPRGKT
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #390 was opened from ryandesign:

Fixes: #389

Request URL   : https://github.com/alsa-project/alsa-lib/pull/390
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/390.patch
Repository URL: https://github.com/alsa-project/alsa-lib
