Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F79187C8CA
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 07:26:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C57FD1549;
	Fri, 15 Mar 2024 07:26:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C57FD1549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710483970;
	bh=/5cEfUuER/Sxadm3GRlEtmyggnA8dXWP8plWBcsFHvQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jofVXvt6FhDWFtEogs+5VlwQbJUte7rgdUVG2hkAdR/CrUgNetYw26bBHK4ZyZTQT
	 TCmi2YOCZdbKCy38typcppGASoFw1NERlPFmKJFmkMsgs3M5B/inJlSLtnTnpMYLoK
	 3mApKMp/xgzSbCFTiMs5ExGLNPNqhrxbQjyxKHBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 759A3F80571; Fri, 15 Mar 2024 07:25:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AB81F805A0;
	Fri, 15 Mar 2024 07:25:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFE64F8028D; Fri, 15 Mar 2024 07:20:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 77889F80093
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 07:20:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77889F80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1710483635397922039-webhooks-bot@alsa-project.org>
References: <1710483635397922039-webhooks-bot@alsa-project.org>
Subject: ctl/hwdep/seq: optimize to gi-docgen 2023.3 or later
Message-Id: <20240315062039.BFE64F8028D@alsa1.perex.cz>
Date: Fri, 15 Mar 2024 07:20:39 +0100 (CET)
Message-ID-Hash: F6NXEUJZ7CIZIJDQ6ANF5DXCOOQVJDAJ
X-Message-ID-Hash: F6NXEUJZ7CIZIJDQ6ANF5DXCOOQVJDAJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6NXEUJZ7CIZIJDQ6ANF5DXCOOQVJDAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-gobject pull request #84 was opened from takaswie:

The version of gi-docgen applies the restrict rule for the version expression. In the rule, the dot following to the number causes failure.

The series of changes in this MR solves the failure.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/84
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/84.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
