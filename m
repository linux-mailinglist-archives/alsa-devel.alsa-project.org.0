Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CE0762B9C
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 08:39:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 800F07F4;
	Wed, 26 Jul 2023 08:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 800F07F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690353543;
	bh=CUzWGqywD1soyYn8VP3flcPrCsDrA7SXXIE949xrpko=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=fm85w2GKh7VnDPFkdAgU6raswfXLzI8NiVScFh61QDSe/6bc95MDB0YmTHEt07px0
	 xQtVmO+C3fY6uNvqegkngddftyoHBBXq6sU0HuaXcjAPdYlfP6zkoGZre/lRI+I+yg
	 q1sNNZufJ3horyFi/tNPEPbZJABIv2wpKVN6olM0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C393BF802E8; Wed, 26 Jul 2023 08:38:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60892F80153;
	Wed, 26 Jul 2023 08:38:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF03FF8019B; Wed, 26 Jul 2023 08:38:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8580EF800D2
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 08:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8580EF800D2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1690353479259249687-webhooks-bot@alsa-project.org>
References: <1690353479259249687-webhooks-bot@alsa-project.org>
Subject: topology: nhlt: intel: support more device types and directions
Message-Id: <20230726063806.DF03FF8019B@alsa1.perex.cz>
Date: Wed, 26 Jul 2023 08:38:06 +0200 (CEST)
Message-ID-Hash: TN7EORMMB7HTP6TCVCR6G547F3B6BLUH
X-Message-ID-Hash: TN7EORMMB7HTP6TCVCR6G547F3B6BLUH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TN7EORMMB7HTP6TCVCR6G547F3B6BLUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #226 was opened from brentlu:

In current NHLT table the device type of all SSP endpoints are set to BT Sideband(0) instead of SSP Analog Codec(4) and the direction only supports Render(0) and Capture(1).

Here we introduce two new quirks from topology to set the device type correctly and support two more directions: Render with loopback(2) and Feedback for render(3) for speakers with echo reference or IV sense feedback.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/226
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/226.patch
Repository URL: https://github.com/alsa-project/alsa-utils
