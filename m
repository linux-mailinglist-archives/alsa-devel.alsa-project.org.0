Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3629C3A9C4
	for <lists+alsa-devel@lfdr.de>; Thu, 06 Nov 2025 12:37:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 888A260205;
	Thu,  6 Nov 2025 12:36:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 888A260205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762429019;
	bh=0U3agU+QxCAl6AcUwnMEpoHScnnGiGMMdQAg4PGGJRs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FiBueFBjuB/2DAGvvgtG8BITqFECEIY4FElzUgkeCuTsL0CzVJLDD8ZkJZK0K2B7e
	 Omryct5AKMeNUKrIFlHiudYwaO4XWFY13bow9MML36GmHHGKgU5FXvQ3zkXmbLyMHN
	 yWlfUpVKRWjsVTkeR65aF8R1O9p5aEFJIKYX6sl0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83B0EF805B4; Thu,  6 Nov 2025 12:36:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4134F805C8;
	Thu,  6 Nov 2025 12:36:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BC8DF80272; Thu,  6 Nov 2025 12:36:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A5D8CF800FA
	for <alsa-devel@alsa-project.org>; Thu,  6 Nov 2025 12:36:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5D8CF800FA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187567cf34365200-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/637@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/637@alsa-project.org>
Subject: ucm2: Add setting LED Mode in SetLED macro
Date: Thu,  6 Nov 2025 12:36:15 +0100 (CET)
Message-ID-Hash: LVIDNH7JV2MP4J5OQWFTWXK5UGHYZEPE
X-Message-ID-Hash: LVIDNH7JV2MP4J5OQWFTWXK5UGHYZEPE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LVIDNH7JV2MP4J5OQWFTWXK5UGHYZEPE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #637 was opened from mstrozek:

Add 'Mode' argument to SetLED macro in order to allow setting a different LED mode. This will allow mute switches with inverted values to control the LEDs with 'follow-route' option instead of default 'follow-mute'.

Update all calls to SetLED with appropriate Mode argument.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/637
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/637.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
