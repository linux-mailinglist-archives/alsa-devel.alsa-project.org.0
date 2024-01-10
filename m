Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EA7829657
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 10:32:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 242D1EBE;
	Wed, 10 Jan 2024 10:32:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 242D1EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704879136;
	bh=Sj4jyV0lN9Zruvpct0A0o44jmWav87eYeck6w/Xey4Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NzjUp/kA+87eUcOTHbKHOn12xrIFsIEMKKDEq1USFnCmJge7Jr1t3l3HpzPRDs683
	 au1fFrY+mxLg3aY2n4zEB//4/uGa223qhf98P1TqPC97PQpVfPNhPCJBKRBIJdFj4F
	 QaODib9o+pBv1yOIuDCm5eSYYALbs3yFu0+4yh2k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F28ABF805AA; Wed, 10 Jan 2024 10:31:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75809F80580;
	Wed, 10 Jan 2024 10:31:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3588FF80254; Wed, 10 Jan 2024 10:31:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E017EF8014B
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 10:31:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E017EF8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1704879084458483219-webhooks-bot@alsa-project.org>
References: <1704879084458483219-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Add support for Solid State Labs SSL 2
Message-Id: <20240110093134.3588FF80254@alsa1.perex.cz>
Date: Wed, 10 Jan 2024 10:31:34 +0100 (CET)
Message-ID-Hash: EFSGZG3AD4EXBXTOOVG5ELMPCOKDMNRB
X-Message-ID-Hash: EFSGZG3AD4EXBXTOOVG5ELMPCOKDMNRB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFSGZG3AD4EXBXTOOVG5ELMPCOKDMNRB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #377 was edited from 999eagle:

This adds support for the [Solid State Labs SSL 2](https://www.solidstatelogic.com/products/ssl2).

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/377
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/377.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
