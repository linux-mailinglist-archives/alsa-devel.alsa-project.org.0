Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 650E49764B0
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2024 10:35:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7781882B;
	Thu, 12 Sep 2024 10:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7781882B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726130108;
	bh=lsy56WWx6BVMS95bkosEBXALW2PtJ8fo1m2kbrWVRWA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MPDfZlUpz6kr0UeCtyhf36f1BSuQNsIYEd5Qf6rc49TrhF0njQyp0SyZytE4BXgpL
	 7qD9GAxbJMqyiDQDCJtRxBWmYHV2Oi/yEcQM/vloMvpC2MWKgzoZJV4c+Nqov387af
	 YWu4DphCm5NeZyc1xNILjmis30t83Zz+HS3CbuEM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADF56F805A9; Thu, 12 Sep 2024 10:34:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E91DF8026D;
	Thu, 12 Sep 2024 10:34:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08E6EF801F5; Thu, 12 Sep 2024 10:34:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B83CF80074
	for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2024 10:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B83CF80074
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1726130067482922554-webhooks-bot@alsa-project.org>
References: <1726130067482922554-webhooks-bot@alsa-project.org>
Subject: ucm2: soundwire: rt722: add ConflictingDevice in each device
Message-Id: <20240912083430.08E6EF801F5@alsa1.perex.cz>
Date: Thu, 12 Sep 2024 10:34:30 +0200 (CEST)
Message-ID-Hash: 3KOU4NZT7JURHPEID37SRSL7SGURYJ33
X-Message-ID-Hash: 3KOU4NZT7JURHPEID37SRSL7SGURYJ33
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KOU4NZT7JURHPEID37SRSL7SGURYJ33/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #441 was opened from shumingfan:

This patch allows only one input and one output to be opened simultaneously.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/441
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/441.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
