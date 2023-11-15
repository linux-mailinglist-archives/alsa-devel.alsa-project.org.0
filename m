Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2832C7ED728
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 23:27:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB0AF828;
	Wed, 15 Nov 2023 23:26:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB0AF828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700087224;
	bh=nfEchX43T/OGlmTxL0CoFXqU6lZryfUoJxIFyP0nNGs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=garuChNAvoSapTkvjc26BZNbDoJWtBonpcOn7Y76SO1olXcrpRYQrgE8e6rBhTS6z
	 HEewRUnr6i5HMN2FR10DTBt6T2Qw41zagrG3Kq0Q927ufs0M60DCHbEk03GRHuXqqX
	 t7Mi1LRR+L+pdJ9vHIamDFB0PswqnSCDL96oXniI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F56EF80558; Wed, 15 Nov 2023 23:25:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBD54F8016E;
	Wed, 15 Nov 2023 23:25:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA0F5F801D5; Wed, 15 Nov 2023 23:25:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 06F10F80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Nov 2023 23:25:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06F10F80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1700087144946636915-webhooks-bot@alsa-project.org>
References: <1700087144946636915-webhooks-bot@alsa-project.org>
Subject: Potential arbitrary code execution via dlopen
Message-Id: <20231115222549.CA0F5F801D5@alsa1.perex.cz>
Date: Wed, 15 Nov 2023 23:25:49 +0100 (CET)
Message-ID-Hash: KRFUZDX4NGQA2GINGHFLJAB7Y2ZXV45H
X-Message-ID-Hash: KRFUZDX4NGQA2GINGHFLJAB7Y2ZXV45H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KRFUZDX4NGQA2GINGHFLJAB7Y2ZXV45H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #365 was opened from szsam:

The value of the first argument of dlopen() may come from getenv. Using externally controlled strings in a process operation can allow an attacker to execute malicious commands.

https://github.com/alsa-project/alsa-lib/blob/ed6b07084bfea4155bbc98bcf38508ab81bdd008/src/dlmisc.c#L155
https://github.com/alsa-project/alsa-lib/blob/ed6b07084bfea4155bbc98bcf38508ab81bdd008/src/pcm/pcm_ladspa.c#L1094

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/365
Repository URL: https://github.com/alsa-project/alsa-lib
