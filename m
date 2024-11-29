Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E669DE72E
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Nov 2024 14:24:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B2BE2110;
	Fri, 29 Nov 2024 14:24:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B2BE2110
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732886655;
	bh=UlaS+n+NgV0bDNY0/7d38mPFHlRBSWVRbFdU//hWzI4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Web1pNV/uzBqUjEvh8TtcGP+aD0dcM8MZbmiKyFlq4GSLBVGzv7Aa/Zl9fBip11p/
	 gQSJfCseVcjFJ6KewJSu41NyaNm1prnG2XtfnkOGTgn8n2QHFL48n7tlO7bguKuVdX
	 U3ZakkECnEwf9oMMI04W+xX0PrkqpO2AMyd5fih8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EF34F80527; Fri, 29 Nov 2024 14:23:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02ACAF805BE;
	Fri, 29 Nov 2024 14:23:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8A15F80236; Fri, 29 Nov 2024 14:23:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 47F36F80116
	for <alsa-devel@alsa-project.org>; Fri, 29 Nov 2024 14:23:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47F36F80116
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1732886617713476896-webhooks-bot@alsa-project.org>
References: <1732886617713476896-webhooks-bot@alsa-project.org>
Subject: amd-soundwire: add support for AMD generic legacy machine driver
Message-Id: <20241129132339.E8A15F80236@alsa1.perex.cz>
Date: Fri, 29 Nov 2024 14:23:39 +0100 (CET)
Message-ID-Hash: PMW42WFQCA6INGYJI6O2JZP362NDM5X2
X-Message-ID-Hash: PMW42WFQCA6INGYJI6O2JZP362NDM5X2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PMW42WFQCA6INGYJI6O2JZP362NDM5X2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #478 was opened from perexg:

The card components string is similar to Intel's SOF driver like, so we can  reuse sof-soundwire configuration and it is logical to reduce future maintenance, because the chips connected to soundwire bus are similar for multiple PCI bridges.

Example of the components string:

    Components : ' cfg-amp:1 hs:rt722 spk:rt722 mic:rt722'

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/478
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/478.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
