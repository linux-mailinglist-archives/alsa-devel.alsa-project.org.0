Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF40774202B
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 08:06:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FE5C826;
	Thu, 29 Jun 2023 08:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FE5C826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688018775;
	bh=94Nb+XBL4b4Azl1edp+do4BjHjqCcQ9iMB0Ae1Nwtpo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=S3EJ24oHjTOIuLWLZAWUq/QpUWLLiVPlb86uOH9u5xU3y4VK0KuL8YvouK9YGWBm9
	 z627bomVVYqd1jBOCjKZ/2mg8Hun5prAdEM/JscQM0yDzjlheQ3udbT7u1oEpFBdOP
	 aH/XFg/db+T3Deu1j3oxZDXTTS3HqI9Vwao1NLj8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D78A5F80093; Thu, 29 Jun 2023 08:05:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62E6CF80212;
	Thu, 29 Jun 2023 08:05:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4EF8F80246; Thu, 29 Jun 2023 08:04:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 75BFEF80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 08:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75BFEF80169
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1688018695748901129-webhooks-bot@alsa-project.org>
References: <1688018695748901129-webhooks-bot@alsa-project.org>
Subject: Fix symver build error on non-ELF platforms
Message-Id: <20230629060458.B4EF8F80246@alsa1.perex.cz>
Date: Thu, 29 Jun 2023 08:04:58 +0200 (CEST)
Message-ID-Hash: DKCCYBWQLOCWO72XADK2NZKSLV7G2KVQ
X-Message-ID-Hash: DKCCYBWQLOCWO72XADK2NZKSLV7G2KVQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DKCCYBWQLOCWO72XADK2NZKSLV7G2KVQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #334 was opened from bkuhls:

The following error is observed on Microblaze [1] build:

    error: symver is only supported on ELF platforms

due to using __attribute__((symver)) on non-ELF platform.

[1] http://autobuild.buildroot.net/results/1e9/1e965d83d75615f35308440c5db044314a349357/build-end.log

ac_check_attribute_symver.m4 was downloaded from
https://github.com/smuellerDD/libkcapi/blob/master/m4/ac_check_attribute_symver.m4

Request URL   : https://github.com/alsa-project/alsa-lib/pull/334
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/334.patch
Repository URL: https://github.com/alsa-project/alsa-lib
