Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F24E679F3A9
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 23:18:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB289886;
	Wed, 13 Sep 2023 23:17:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB289886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694639882;
	bh=Ux1wyoOuxnb0DR57U2rXBI93mQ61yPLN0ox5OTXhgdc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pP5n0NBjsXOi5ZAZEC7peAWGeJRUZV9YiC87TSXfhKkGb9Pl3Cm+acysgKgtrtbW5
	 x4GzytZ3zsPo343EcOFCrq58sWa6zialmjnSN0qhNlGDTgg9SSIyG+nvTiz3Q9A5wP
	 EENOXWXBHwqLV3JmJA4xVJlOoMUJIRXs0GHnD9/s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D6D0F80425; Wed, 13 Sep 2023 23:17:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46383F80246;
	Wed, 13 Sep 2023 23:17:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07A77F80425; Wed, 13 Sep 2023 23:17:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E096F801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 23:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E096F801F5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1694639828339812279-webhooks-bot@alsa-project.org>
References: <1694639828339812279-webhooks-bot@alsa-project.org>
Subject: Roland Bridgecast - add missing intermediate config file
Message-Id: <20230913211710.07A77F80425@alsa1.perex.cz>
Date: Wed, 13 Sep 2023 23:17:10 +0200 (CEST)
Message-ID-Hash: VGCAHL4KGF2MQSGOQLJ5ESCQSM2M27RC
X-Message-ID-Hash: VGCAHL4KGF2MQSGOQLJ5ESCQSM2M27RC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VGCAHL4KGF2MQSGOQLJ5ESCQSM2M27RC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #354 was opened from smangels:

- closes #353
- tested on ArchLinux running UCM version 1.2.10

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/354
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/354.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
