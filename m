Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7C26B6F48
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 06:50:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 190281496;
	Mon, 13 Mar 2023 06:49:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 190281496
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678686641;
	bh=UE+AU1eUod0FIPezavg3uVKHUVQmtPAQjiBAhNeelBU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NM0qQdPUjdzSRHSEnquFNiC8K2lUuT/Kj3c9qImbvofWYskbAjgCMK7VjJehqs/5I
	 DQGui8iJErvPvZawMpT9TSlqaAAW30ryU4qhpTxkZmyUC4E9F7SnOI35Sd5ARjtZJh
	 fpBmLUfKouLJRr/ZuO/AIpEr/Fr5/anAnvMHVMMg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12874F8032D;
	Mon, 13 Mar 2023 06:49:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 876F1F80272; Mon, 13 Mar 2023 06:49:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CFF8F80272
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 06:49:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CFF8F80272
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1678686542063389778-webhooks-bot@alsa-project.org>
References: <1678686542063389778-webhooks-bot@alsa-project.org>
Subject: topology: pre-processor: fix regular expression flags
Message-Id: <20230313054909.876F1F80272@alsa1.perex.cz>
Date: Mon, 13 Mar 2023 06:49:09 +0100 (CET)
Message-ID-Hash: QORRMGCLOKVTPJ73AS56L6VEY4PDA4LQ
X-Message-ID-Hash: QORRMGCLOKVTPJ73AS56L6VEY4PDA4LQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QORRMGCLOKVTPJ73AS56L6VEY4PDA4LQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #195 was opened from aiChaoSONG:

The REG_ICASE flag is a compile-time flag (cflags), it should be used with regcomp() instead of regexec(). Also add the REG_EXTENDED flag in this patch to make patterns like 'tgl|adl' work.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/195
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/195.patch
Repository URL: https://github.com/alsa-project/alsa-utils
