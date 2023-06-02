Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C5771FF69
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 12:35:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDE921F4;
	Fri,  2 Jun 2023 12:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDE921F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685702102;
	bh=MPLGbHNDiodTR4iQv12OEnZGvLkC38oLoCNtvyRN0MU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QmWQgETgokSi7Kp+CcsHyBSa9JEMkIvxU19nuNag3QPj+egAohmNDR0uBZbPqfuxD
	 D/YFV/kYaL3d3K7MWcVO0+ALmDudRl67vpRyC6ly7hXAkUNxwSVCPrGPPelxIpL5ZB
	 US//wqy762I0IbUBtK/yh52SaLvYSmYpSBP1AZFE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E9FFF800ED; Fri,  2 Jun 2023 12:34:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0011FF80132;
	Fri,  2 Jun 2023 12:34:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D47D5F80149; Fri,  2 Jun 2023 12:34:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 69DE1F800C1
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 12:34:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69DE1F800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1685702042730272293-webhooks-bot@alsa-project.org>
References: <1685702042730272293-webhooks-bot@alsa-project.org>
Subject: configure: Update for autoconf 2.71
Message-Id: <20230602103406.D47D5F80149@alsa1.perex.cz>
Date: Fri,  2 Jun 2023 12:34:06 +0200 (CEST)
Message-ID-Hash: FNDC4MZW44IQ4T6B7D7C3HC3AFGG5VIQ
X-Message-ID-Hash: FNDC4MZW44IQ4T6B7D7C3HC3AFGG5VIQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FNDC4MZW44IQ4T6B7D7C3HC3AFGG5VIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #324 was opened from phodina:

Hi,
this is an update due to Alpine Linux packaging only `autoconf-2.71-r2` so that the https://github.com/alsa-project/alsa-lib/pull/308 could be tested.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/324
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/324.patch
Repository URL: https://github.com/alsa-project/alsa-lib
