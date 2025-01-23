Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE6FA1A469
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2025 13:38:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF4D360174;
	Thu, 23 Jan 2025 13:38:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF4D360174
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737635926;
	bh=+NZyFBX86N91jliQjAJsKSrKQC3XeYcSeA0KPqZdVKY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ruHlP5UXJKz+ebWfzubfeizCO6Ba67Xm90T7vH7UcYH/KuOINZlQkB9K6Wk68Bp8G
	 +KmgSoJ5E4vpup92cAlDyAb8B+onRQgpsPb1CpMkwHl3xGwwArdD7lJjLBzqTHl2T3
	 VTXQ7oRKY1AGJtfsYsIRCLAFui9COVEoa1CUYY4w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF846F8025F; Thu, 23 Jan 2025 13:38:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60C29F805AF;
	Thu, 23 Jan 2025 13:38:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CB4CF80217; Thu, 23 Jan 2025 13:37:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 8618EF800FE
	for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2025 13:37:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8618EF800FE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1737635839619709730-webhooks-bot@alsa-project.org>
References: <1737635839619709730-webhooks-bot@alsa-project.org>
Subject: ucm2: Intel: avs: Add UCM files for HDA configuration
Message-Id: <20250123123748.0CB4CF80217@alsa1.perex.cz>
Date: Thu, 23 Jan 2025 13:37:47 +0100 (CET)
Message-ID-Hash: QUVVRI7GRPUFSLQS2MHUPFB4JCWJCOAC
X-Message-ID-Hash: QUVVRI7GRPUFSLQS2MHUPFB4JCWJCOAC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUVVRI7GRPUFSLQS2MHUPFB4JCWJCOAC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #499 was opened from amadeuszslawinski-intel:

Add configs for devices using HDA codec.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/499
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/499.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
