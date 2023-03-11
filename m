Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F3C6B57CC
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Mar 2023 03:21:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D2BF184C;
	Sat, 11 Mar 2023 03:20:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D2BF184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678501261;
	bh=qoQqNSNyF3PwAxkOpB7WTrvhmLYYj6tPnnKFkDk4SnE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=u5BMzIBFhp6/l7RuHyE2cst142SYAe4Xo74DGoHcKJqqUvCOBR6wMB3N0Oj/CwLoh
	 RqCPQyc7shOpHIrRVQjrOlefow0zWji6yfCz5otx8X+vVZBPy26R3qIIRbeWU9rDlo
	 H37Y373eVjuXedoOrttvKG+bCeBUUO1LkcMKQ9IU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0550EF80236;
	Sat, 11 Mar 2023 03:20:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BC64F8042F; Sat, 11 Mar 2023 03:20:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id AB51FF800DF
	for <alsa-devel@alsa-project.org>; Sat, 11 Mar 2023 03:20:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB51FF800DF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1678501204275999308-webhooks-bot@alsa-project.org>
References: <1678501204275999308-webhooks-bot@alsa-project.org>
Subject: USB-Audio: ALC4080 - Add MSI MAG B650M MORTAR WIFI
Message-Id: <20230311022006.3BC64F8042F@alsa1.perex.cz>
Date: Sat, 11 Mar 2023 03:20:06 +0100 (CET)
Message-ID-Hash: YMARC7GNDYHHJ3D2THUMBOQJQ65VNLXG
X-Message-ID-Hash: YMARC7GNDYHHJ3D2THUMBOQJQ65VNLXG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YMARC7GNDYHHJ3D2THUMBOQJQ65VNLXG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #289 was opened from cloudy-dev:

USB ID: 0db0:7696

Adds support for the MSI MAG B650M MORTAR WIFI motherboard front & back 3.5mm jacks.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/289
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/289.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
