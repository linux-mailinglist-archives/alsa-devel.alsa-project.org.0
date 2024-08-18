Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D37B955D0B
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Aug 2024 16:55:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 966BB19E7;
	Sun, 18 Aug 2024 16:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 966BB19E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723992906;
	bh=TLUbRgpQUa9LD327FD5LS2y2/eR35Iugg+VodLrN6fA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FQHIHgZyTLufjjv8HKrrG312JtTu7XUt2Q6W3maB70BSt4+CLtaoPrGQHUl6XO1Al
	 iLFPeiTQhiHt8N2+WX0tpp3Tt4ISAQgFdIaiObwcBOoB3xivG8YJGISC+mW5/MmmkR
	 78q2eRyEqQvZpKU0cfPq4cUc5o9IFR2yftjw6SSU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9600F80107; Sun, 18 Aug 2024 16:54:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 719DBF80589;
	Sun, 18 Aug 2024 16:54:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF880F80494; Sun, 18 Aug 2024 16:54:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id EA130F80107
	for <alsa-devel@alsa-project.org>; Sun, 18 Aug 2024 16:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA130F80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1723992861242682219-webhooks-bot@alsa-project.org>
References: <1723992861242682219-webhooks-bot@alsa-project.org>
Subject: Port API coverage reporting to Python 3 and adapt to current doxygen
 output
Message-Id: <20240818145424.AF880F80494@alsa1.perex.cz>
Date: Sun, 18 Aug 2024 16:54:24 +0200 (CEST)
Message-ID-Hash: AKM6T7YO7Y3POSRB2I2TWFJTT3CRT4EJ
X-Message-ID-Hash: AKM6T7YO7Y3POSRB2I2TWFJTT3CRT4EJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKM6T7YO7Y3POSRB2I2TWFJTT3CRT4EJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-python pull request #15 was opened from tormodvolden:

Tested by comparing the new output from alsa-python-coverage.py with the old COVERAGE file.

For transparency and easier review there are multiple commits for the Python 3 fixups, but this can be squashed if desired.

Request URL   : https://github.com/alsa-project/alsa-python/pull/15
Patch URL     : https://github.com/alsa-project/alsa-python/pull/15.patch
Repository URL: https://github.com/alsa-project/alsa-python
