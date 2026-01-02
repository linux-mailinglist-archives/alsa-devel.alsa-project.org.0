Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E002CEDF7D
	for <lists+alsa-devel@lfdr.de>; Fri, 02 Jan 2026 08:19:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE2F46017C;
	Fri,  2 Jan 2026 08:19:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE2F46017C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767338386;
	bh=rXPDe1OdP8crJ+R7WhFdbGHhMljGf6cEVWv+SbH/7qk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kSHX/6fKK1T7tNPbomP4wMky4ncWTj+2IzpN2pj25vIvscAkIp0wdq3Blmrvt7w6z
	 Rkn25eb9rnb33TjpVeOzzErvuhYrBkr29dAVIXR08p9Yc6Zhtec3bUVKRxypqA8VDG
	 Tek7iSC7vnTDLyn0LXgexaI5DZ1p6G8xXnheDEm4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F8F6F805CB; Fri,  2 Jan 2026 08:19:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2B90F805D8;
	Fri,  2 Jan 2026 08:19:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A619F800AC; Fri,  2 Jan 2026 08:17:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 76C5AF800AC
	for <alsa-devel@alsa-project.org>; Fri,  2 Jan 2026 08:17:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76C5AF800AC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1886d8c24a5b8f00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/670@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/670@alsa-project.org>
Subject: ucm2: Qualcomm: disable broken companders and low power modes (fix
 #595)
Date: Fri,  2 Jan 2026 08:17:20 +0100 (CET)
Message-ID-Hash: KGKTYXVDEKKSHGFQE5MTASRXDTSGDIHS
X-Message-ID-Hash: KGKTYXVDEKKSHGFQE5MTASRXDTSGDIHS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KGKTYXVDEKKSHGFQE5MTASRXDTSGDIHS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #670 was opened from valpackett:

It's 2026. Let's finally land the fixes for #595 maybe? :)

// Not (yet?) tested on wcd934x, wcd937x and wcd939x.. but let's see if we can get any testers with different devices to show up..

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/670
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/670.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
