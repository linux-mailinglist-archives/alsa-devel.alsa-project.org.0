Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0025F8C69DA
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2024 17:36:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D313200;
	Wed, 15 May 2024 17:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D313200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715787390;
	bh=0ghQ3Cd5T54otV0JdwUgEfJOlpQqre/iBbnvvUC15OY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=avnfyZS3+cpeT22NXefokbdaV1Jz/IKOLqf0f/rF5eA8xB3btWc+ZA61K2KFFToaW
	 Sd+H6XIuManxwK+R7LfS4szVGAb+OswJc9b0M5yRfoRRyPUoUnRkQ9GcxiMdl78d6C
	 Ey6O9t5rBMzWOawFsuxN4XNundHAPq+vcfvuaCT8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEA2EF804FB; Wed, 15 May 2024 17:35:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06F91F8025F;
	Wed, 15 May 2024 17:35:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A721CF80224; Wed, 15 May 2024 17:35:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id EE35BF800F5
	for <alsa-devel@alsa-project.org>; Wed, 15 May 2024 17:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE35BF800F5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1715787347486447811-webhooks-bot@alsa-project.org>
References: <1715787347486447811-webhooks-bot@alsa-project.org>
Subject: Ucm2 device sorting / ordering
Message-Id: <20240515153554.A721CF80224@alsa1.perex.cz>
Date: Wed, 15 May 2024 17:35:54 +0200 (CEST)
Message-ID-Hash: NEP43PVAC6IH2T6LHMTI67MZ2IPNEZSW
X-Message-ID-Hash: NEP43PVAC6IH2T6LHMTI67MZ2IPNEZSW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NEP43PVAC6IH2T6LHMTI67MZ2IPNEZSW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #397 was edited from beatboxa:

The sort order that devices are probed and ultimately listed in my OS sound settings is reversed--though consistent--from the order that they appear (top to bottom) in the UCM configuration files.  And they also do not appear consistent with configured device priority.

In other words, if the UCM configuration file hypothetically lists the following, from top to bottom:

1. Device 1 - priority 300
2. Device 2 - priority 100
3. Device 3 - priority 200

These devices will be probed and listed in the OS in the following order:

1. Device 3
2. Device 2
3. Device 1

I am currently creating a UCM config file for a device with 32 discreet output channels and 30 discreet input channels (and both stereo and mono device versions of many of these), so the sort order is crucial for user experience in a list this long.

I originally tried to reorder and rename the devices in the ucm configuration file to make it easier to follow and list correctly in my OS, but then I ran afoul of the alsa-lib rules for naming and ordering.

Related:

- https://github.com/alsa-project/alsa-ucm-conf/pull/416#issuecomment-2111101525
- https://github.com/alsa-project/alsa-lib/issues/245#issuecomment-1168910073

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/397
Repository URL: https://github.com/alsa-project/alsa-lib
