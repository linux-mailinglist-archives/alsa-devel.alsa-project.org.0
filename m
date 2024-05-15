Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C79128C69CF
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2024 17:33:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A01ABB6A;
	Wed, 15 May 2024 17:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A01ABB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715787220;
	bh=lCRsxzUmlT2FtYPrvpdCNBEWBe9p2f47/m8HbkL28lQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MNaRRzqmKZwPfD/nh4q+/4U06tjwdJSbmJV0dMsbnL6631HRJsXxF3lFrKB+LgDno
	 /s7EfZy7HYaWr2Eqx9N3gVuLjjUX+0Lpv0n9PsbwZpOA38vTpzTxSAH5XznfsLGa3W
	 zFWZx4oXmtT9J7seHNO0Bb67hGrj59VDbY1l7dGU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B30E2F80563; Wed, 15 May 2024 17:33:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 536D3F805A0;
	Wed, 15 May 2024 17:33:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DD18F80224; Wed, 15 May 2024 17:33:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 683F9F800E2
	for <alsa-devel@alsa-project.org>; Wed, 15 May 2024 17:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 683F9F800E2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1715787157441715479-webhooks-bot@alsa-project.org>
References: <1715787157441715479-webhooks-bot@alsa-project.org>
Subject: Ucm2 device sorting / ordering
Message-Id: <20240515153302.6DD18F80224@alsa1.perex.cz>
Date: Wed, 15 May 2024 17:33:02 +0200 (CEST)
Message-ID-Hash: HGRZFMEGZUPP76P4IZRTU6JPANCK3EK5
X-Message-ID-Hash: HGRZFMEGZUPP76P4IZRTU6JPANCK3EK5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HGRZFMEGZUPP76P4IZRTU6JPANCK3EK5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #397 was opened from beatboxa:

The sort order that devices are probed and ultimately listed in my OS sound settings is reversed--though consisten--from the order that they appear (top to bottom) in the UCM configuration files.  And they also do not appear consistent with configured device priority.

In other words, if the UCM configuration file hypothetically lists the following, from top to bottom:

1. Device 1 - priority 300
2. Device 2 - priority 100
3. Device 3 - priority 200

These devices will be probed and listed in the OS in the following order:

1. Device 3
2. Device 2
3. Device 1

I am currently creating a UCM config file for a device with 32 discreet output channels and 30 discreet input channels (and both stereo and mono device versions of many of these), so the sort order is crucial for user experience in a list this long.

Related:

- https://github.com/alsa-project/alsa-ucm-conf/pull/416#issuecomment-2111101525
- https://github.com/alsa-project/alsa-lib/issues/245#issuecomment-1168910073

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/397
Repository URL: https://github.com/alsa-project/alsa-lib
