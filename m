Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4979695A526
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 21:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38AF03E7;
	Wed, 21 Aug 2024 21:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38AF03E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724267565;
	bh=SxWEWx4TinLZrxno5ALgxrwD74WG09ZwCxUcPqSBUc8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FytAwDeDbaNHC3kIMSatd1I4tSzTqj+aWF2ImP0hewg7og25x2VQ+sa2erCDdMfGg
	 djFtKRY9Kut8jDOcNZzoITBRS1unkbqBzBX3YwMey866w4cOUFRVUesB9dcG3jRUt8
	 n5qfR9GSZbgagzkbG4XL8nm/xwYSXXw5Snj+6ht8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4DB9F80580; Wed, 21 Aug 2024 21:12:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34477F805A9;
	Wed, 21 Aug 2024 21:12:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC015F80496; Wed, 21 Aug 2024 21:12:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id BE62EF800F0
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 21:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE62EF800F0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1724267534578495026-webhooks-bot@alsa-project.org>
References: <1724267534578495026-webhooks-bot@alsa-project.org>
Subject: No sound from XonarDX
Message-Id: <20240821191219.BC015F80496@alsa1.perex.cz>
Date: Wed, 21 Aug 2024 21:12:19 +0200 (CEST)
Message-ID-Hash: X4L37PMRDRUGPUSIJCOU47CO2VPLHEXV
X-Message-ID-Hash: X4L37PMRDRUGPUSIJCOU47CO2VPLHEXV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X4L37PMRDRUGPUSIJCOU47CO2VPLHEXV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #408 was opened from 3bitbrain:

No matter what wiki or advice I try, no sound at all from a known good Xonar DX card.
Distro : Gentoo, fresh install.
Always un-muted everything in the console alsamixer.

alsa-lib version 1.2.11

[alsa.txt](https://github.com/user-attachments/files/16697602/alsa.txt)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/408
Repository URL: https://github.com/alsa-project/alsa-lib
