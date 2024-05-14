Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF308C5846
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2024 16:50:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E6F8822;
	Tue, 14 May 2024 16:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E6F8822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715698238;
	bh=m46/o8L45FiOFS31SAblDo5uVg71k3LupmipKDfutos=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FTVcscPufia4gHyIdDqWBeqtoL7aQUnq8sCUblT5fXAZM+K14xr8WngLA4NFIXB4Y
	 ONLx1dLMLwYK7EzZN5O7vEEn/dtcz23yufFHXZS2LmYAwdVV4OKpns6l2qVnsc9Spf
	 gNjDJULqVXc/Rz7XtgABHM1SawrAvCsOKtWD3tB4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82AD9F8058C; Tue, 14 May 2024 16:49:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F092EF800F5;
	Tue, 14 May 2024 16:49:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46B5BF80224; Tue, 14 May 2024 16:49:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A7F6FF800F5
	for <alsa-devel@alsa-project.org>; Tue, 14 May 2024 16:49:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7F6FF800F5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1715698189412448883-webhooks-bot@alsa-project.org>
References: <1715698189412448883-webhooks-bot@alsa-project.org>
Subject: [DNM] common: pcm/split: add support up to 32 / 8 channels
Message-Id: <20240514144952.46B5BF80224@alsa1.perex.cz>
Date: Tue, 14 May 2024 16:49:52 +0200 (CEST)
Message-ID-Hash: ZVJ2AWETAHHOS6JREPYLABJBJZVCSXT5
X-Message-ID-Hash: ZVJ2AWETAHHOS6JREPYLABJBJZVCSXT5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZVJ2AWETAHHOS6JREPYLABJBJZVCSXT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #417 was opened from perexg:

**DO NOT MERGE - after 1.2.12!**

MOTU 828 has up to 32 hardware channels. Add support for this configuration to common/pcm/split.conf.

Also, add support for up to 8 channels for the abstact devices (like 7.1 surround).

Note that this change requires recent alsa-lib (Syntax 7).

Link: https://github.com/alsa-project/alsa-ucm-conf/pull/416

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/417
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/417.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
