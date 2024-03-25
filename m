Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D19889A0F
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 11:23:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8311514DD;
	Mon, 25 Mar 2024 11:23:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8311514DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711362203;
	bh=W7XDaqAQmd9DdhFDx7AILh3h9+furmHmwEjEivMvzO4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rN0UNCdaPM+I9L+0bE7OkEw1pD8m5kKXjMcZ6Z81eilKYVKprIcnnGPuZcjchfUHr
	 ybjpb94TpRbJAPnxGgVbFn6iPAps6aaiMGUYKJ6T7U5cOHAvj0Mh7ZRLIyHmcXQ4kC
	 2idgUgta77ouvE3acL5AbBj7KCCvDWUIhQBLGXGU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DA14F8058C; Mon, 25 Mar 2024 11:22:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84F56F8059F;
	Mon, 25 Mar 2024 11:22:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE205F80236; Mon, 25 Mar 2024 11:19:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FAF0F80093
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 11:17:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FAF0F80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1711361822414123774-webhooks-bot@alsa-project.org>
References: <1711361822414123774-webhooks-bot@alsa-project.org>
Subject: aplay: fix S24_LE wav header
Message-Id: <20240325101903.BE205F80236@alsa1.perex.cz>
Date: Mon, 25 Mar 2024 11:19:03 +0100 (CET)
Message-ID-Hash: TB2H7SLU7NXUMJOEHDNSFYZLO3ITELUA
X-Message-ID-Hash: TB2H7SLU7NXUMJOEHDNSFYZLO3ITELUA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TB2H7SLU7NXUMJOEHDNSFYZLO3ITELUA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #260 was edited from psi-sue:

S24_LE is 32 bits in width storing 24 bits of data and 8 bits of padding So wav header needs to be 32 bits not 24

Request URL   : https://github.com/alsa-project/alsa-utils/pull/260
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/260.patch
Repository URL: https://github.com/alsa-project/alsa-utils
