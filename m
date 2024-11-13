Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D73B9C701F
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2024 14:03:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F311A211D;
	Wed, 13 Nov 2024 14:03:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F311A211D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731503002;
	bh=aMHbpvBZmtE/XBtRhdNaEkOWvkIYLjrPs2OeiQbyx6Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=vTRv9/Lt17RNdkmxuAEYdG+oBy1nREXtpwNp5lMQxdaXTYKwY6miRvfN5AFzqYyKi
	 K9jd+YGjvF4EupDNrAMbAXXgnEXZua7fnL1Fyn+qT7I4uv8O+A1eh/SGZ1dpqm3cml
	 q7kkJQvE18Jz+tH2Kgngf2YMD4rouzQyp5S4/daM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB16DF805B5; Wed, 13 Nov 2024 14:02:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44131F805BB;
	Wed, 13 Nov 2024 14:02:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 403BFF8058C; Wed, 13 Nov 2024 14:02:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 698B3F80587
	for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2024 14:02:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 698B3F80587
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1731502963954722404-webhooks-bot@alsa-project.org>
References: <1731502963954722404-webhooks-bot@alsa-project.org>
Subject: UCM2: Intel: sof-hda-dsp: Fix handling of empty sys_vendor string
Message-Id: <20241113130246.403BFF8058C@alsa1.perex.cz>
Date: Wed, 13 Nov 2024 14:02:46 +0100 (CET)
Message-ID-Hash: BON2X3EF4MP5OTLGYEIMKTHAQ7VBNB4C
X-Message-ID-Hash: BON2X3EF4MP5OTLGYEIMKTHAQ7VBNB4C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BON2X3EF4MP5OTLGYEIMKTHAQ7VBNB4C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #463 was opened from singalsu:

The mistake in UCM syntax caused in alsaucm start error:

ALSA lib ucm_cond.c:367:(if_eval) unknown If.Condition.Type

Fixes: 13022a97711d ("sof-hda-dsp: Fix the case where sysfs dmi
       sys_vendor attribute is not set")

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/463
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/463.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
