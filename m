Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 168907C98FE
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Oct 2023 14:34:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0CF6857;
	Sun, 15 Oct 2023 14:34:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0CF6857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697373290;
	bh=WWiIshGZv9u5a+nnLpkpT/7YAWtjIZIi3WG29wEQ6EQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RvHtUtcD/JEgs1k8Tzt7+MDx9fUkmDJA08hSFQGmJ7cxZf4w4+cKLJ4eQiFJ5ge35
	 S5pgfEU4iUw0KDSo8m5MDbSCFgmzaKPBiRznCDFQqiRqs/arb7H9f68jQ8sDR+iPu8
	 vjIdcRCwNeNVT4M0huhYtjjZkFC7Rm4a/HPjon1g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA3CDF80557; Sun, 15 Oct 2023 14:33:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89E80F8024E;
	Sun, 15 Oct 2023 14:33:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D10DDF8025F; Sun, 15 Oct 2023 14:30:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BC1BF80166
	for <alsa-devel@alsa-project.org>; Sun, 15 Oct 2023 14:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BC1BF80166
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1697373009016794205-webhooks-bot@alsa-project.org>
References: <1697373009016794205-webhooks-bot@alsa-project.org>
Subject: Use stdint.h types
Message-Id: <20231015123014.D10DDF8025F@alsa1.perex.cz>
Date: Sun, 15 Oct 2023 14:30:14 +0200 (CEST)
Message-ID-Hash: EAO6BOFD2FTU2ML7FAC4MS7WCWN5PGD4
X-Message-ID-Hash: EAO6BOFD2FTU2ML7FAC4MS7WCWN5PGD4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EAO6BOFD2FTU2ML7FAC4MS7WCWN5PGD4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-firmware pull request #10 was opened from thesamesam:

u_int_* aren't standard, but uint* are. Use those instead for musl compat.

Bug: https://bugs.gentoo.org/832969

Request URL   : https://github.com/alsa-project/alsa-firmware/pull/10
Patch URL     : https://github.com/alsa-project/alsa-firmware/pull/10.patch
Repository URL: https://github.com/alsa-project/alsa-firmware
