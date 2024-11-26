Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD709D95EE
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2024 12:03:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B41AC193B;
	Tue, 26 Nov 2024 12:03:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B41AC193B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732618998;
	bh=Krl+0qSBteurZs2xlfMBdXpeXhACO5841G4SZNj/+ag=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=crjEAtAwrwLMocWreZnVW535891eATFYzOaStcBBoiTJzwsqpIQzigaZkispC21i0
	 WRpV0UYATJfaz6jFvXgpvknGyTzktjfHnCfmgdl6bhWdAOBznpaO+/dNkqvDJ3ZgIQ
	 mKH4yUVZJfKCOrfESZ1he1uu7VbbqGg6JKufUlZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2435AF805AA; Tue, 26 Nov 2024 12:02:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C7B4F800F0;
	Tue, 26 Nov 2024 12:02:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F2DCF80496; Tue, 26 Nov 2024 12:02:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A2080F800F0
	for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2024 12:02:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2080F800F0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1732618959199579716-webhooks-bot@alsa-project.org>
References: <1732618959199579716-webhooks-bot@alsa-project.org>
Subject: No built-in microphone in Thinkpad X1 Carbon (Gen 12) after update to
 v1.2.13
Message-Id: <20241126110241.7F2DCF80496@alsa1.perex.cz>
Date: Tue, 26 Nov 2024 12:02:41 +0100 (CET)
Message-ID-Hash: K6SGMNODEPMXIEL3XKSBGHWKIADEVSZR
X-Message-ID-Hash: K6SGMNODEPMXIEL3XKSBGHWKIADEVSZR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6SGMNODEPMXIEL3XKSBGHWKIADEVSZR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #476 was opened from iyanmv:

I think the title is self-explanatory. After updating from v1.2.12 to v1.2.13 in Arch Linux, the built-in microphone on my laptop is not working. Downgrading to previous versions fixes the issue.

In addition, I also noticed that when attached to an external monitor using a docking station, the speakers of the monitor are not listed as before, and only the laptop's built-in speaker appears.

I'm running linux 6.12.1 and KDE Plasma 6.2.3.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/476
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
