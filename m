Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9937B24540
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Aug 2025 11:21:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03386601DD;
	Wed, 13 Aug 2025 11:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03386601DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755076880;
	bh=2P9AZQWEfCdgyBd8ev85dku5w/TBV0z2E0Q0yEbMj0g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pPt8NG5VpRxLPtvqXzvKgXb0ZJeIlIXjr+tFfgkOwF4NmjeSCjmtHJZeFUKJ4tCE/
	 t9iU/tXKf3NT75+J5Os6q6mg0mSz/mahXmw7SBFXJMJJNR9GbI7LXfiujPePhWMahy
	 8rOv/+TCGAmHYUlxCamegRTcjC1B2QQPRceHXPnU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D699FF805CA; Wed, 13 Aug 2025 11:20:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87070F805D2;
	Wed, 13 Aug 2025 11:20:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B676F8021D; Wed, 13 Aug 2025 11:20:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E105F800F3
	for <alsa-devel@alsa-project.org>; Wed, 13 Aug 2025 11:20:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E105F800F3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <185b4914df1e8000-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/602@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/602@alsa-project.org>
Subject: ucm2: Qualcomm: x1e80100: Add X1E001DE-DEVKIT configuration
Date: Wed, 13 Aug 2025 11:20:37 +0200 (CEST)
Message-ID-Hash: 4P2NEMJMXG2CMOLFKOTF2SPVNK2WTOND
X-Message-ID-Hash: 4P2NEMJMXG2CMOLFKOTF2SPVNK2WTOND
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4P2NEMJMXG2CMOLFKOTF2SPVNK2WTOND/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #602 was opened from stephan-gh:

The X1E001DE Devkit needs basically the same audio configuration as the X1E80100 CRD, so just include the HiFi.conf intended for the CRD. The only difference is that there are no speakers connected to the pin header on the mainboard by default, so remove the speakers from the available outputs.

If someone wants to connect speakers there they could drop the RemoveDevice line after verifying that it works correctly for their speakers. At the moment we do not have any way to automatically detect if there are speakers connected or not.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/602
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/602.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
