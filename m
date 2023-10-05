Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 544227B9B00
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 07:59:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B69CFDED;
	Thu,  5 Oct 2023 07:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B69CFDED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696485546;
	bh=g7af1N5TnhvnSwxWbnth1n6uC/AhebMwjyh0aT06pLA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Xw8J6hAkI9oSyR/teczVgFFTc7FTZ+Uw0TUUcMVkPcj80hRIdFNR2NO5T4t4RZOYy
	 uTVTnnpNB1ncITGF7xoc/be0L1nBJAFIQdxQ69vZHTtx+xD+q+dwyCJAuQF/m7DcEJ
	 tqKhXJEVYkE4bV/hY08Jrf/LDStMCSj2ifjDpEjw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CE4BF80551; Thu,  5 Oct 2023 07:58:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA56CF80310;
	Thu,  5 Oct 2023 07:58:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 689BBF8047D; Thu,  5 Oct 2023 07:57:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 0791FF800C1
	for <alsa-devel@alsa-project.org>; Thu,  5 Oct 2023 07:56:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0791FF800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1696485412207242012-webhooks-bot@alsa-project.org>
References: <1696485412207242012-webhooks-bot@alsa-project.org>
Subject: ucm2: acp3xalc5682m98: Add JackControls
Message-Id: <20231005055705.689BBF8047D@alsa1.perex.cz>
Date: Thu,  5 Oct 2023 07:57:05 +0200 (CEST)
Message-ID-Hash: QHURKSKV6XSJBCXAFIXPPZNTIK3BIV4L
X-Message-ID-Hash: QHURKSKV6XSJBCXAFIXPPZNTIK3BIV4L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QHURKSKV6XSJBCXAFIXPPZNTIK3BIV4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #357 was opened from akihikodaki:

As suggested at https://github.com/alsa-project/alsa-ucm-conf/pull/146#issuecomment-1747643983, it's time to add JackControls.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/357
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/357.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
