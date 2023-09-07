Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0606F797D63
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 22:30:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FC37846;
	Thu,  7 Sep 2023 22:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FC37846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694118646;
	bh=3xneWt1lWEnLCFLNGBjipGmtnojdQSe/YEcETi3WK74=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=OXXfsWDwJEcw4Gz+TsGFIBHjJ3XwdJOXDKkyWIWhz5+P5DyAC7FKxqjhreBt8hlJb
	 vlOf3CGnEpWmot650P/ySYGEIfhMIfalefXyOhdopz53/eIfO6YLIF4vySMQRjvyNo
	 zpbCHSQDGadM/xIu2CAoVhSFiYOPQ525RkJhl5co=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88EB1F804F3; Thu,  7 Sep 2023 22:29:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C11EF8047D;
	Thu,  7 Sep 2023 22:29:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25147F80494; Thu,  7 Sep 2023 22:29:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 81F77F800AA
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 22:29:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81F77F800AA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1694118584679869652-webhooks-bot@alsa-project.org>
References: <1694118584679869652-webhooks-bot@alsa-project.org>
Subject: topology: add include for ENABLE_NLS on musl
Message-Id: <20230907202950.25147F80494@alsa1.perex.cz>
Date: Thu,  7 Sep 2023 22:29:50 +0200 (CEST)
Message-ID-Hash: 6U3MYPXMFSZWVOXYFGLRPJGB45Z5EPID
X-Message-ID-Hash: 6U3MYPXMFSZWVOXYFGLRPJGB45Z5EPID
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6U3MYPXMFSZWVOXYFGLRPJGB45Z5EPID/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #234 was opened from thesamesam:

Needed for setlocale().

Signed-off-by: Sam James <sam@gentoo.org>

Request URL   : https://github.com/alsa-project/alsa-utils/pull/234
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/234.patch
Repository URL: https://github.com/alsa-project/alsa-utils
