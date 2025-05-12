Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D5AAB7FCC
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:07:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB2B762AA4;
	Thu, 15 May 2025 10:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB2B762AA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747296197;
	bh=KrZ4FqgljugzGOOHWnrlHpqthuw8KqSjIlI83kfaWfU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=lml5kej2xVGlxVlbC44uvHDELu40iKip5JsmkTPtdm0D8Wel8B2PhTau/nminYzqt
	 ZL0+kbeklgXX3/KQiLrYUb9KgXoLTldSpaUN1+Js177Ew0OJlHa3WmEzb9VkF38YVP
	 6yb9ddAvH/jVP99d4juObasduFBiB/XpgS6/3txg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D558F89A52; Mon, 12 May 2025 20:08:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69EBAF89A4C;
	Mon, 12 May 2025 20:08:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C32ABF89A46; Mon, 12 May 2025 20:08:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id F3B02F89A40
	for <alsa-devel@alsa-project.org>; Mon, 12 May 2025 20:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3B02F89A40
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <183ed9ef18a33d00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/562@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/562@alsa-project.org>
Subject: ucm2: IO-Boards: Toradex: smarc: add support
Date: Mon, 12 May 2025 20:08:48 +0200 (CEST)
Message-ID-Hash: ZEITO4YBGSLV7JBWUAV3M2JEA5PZETLD
X-Message-ID-Hash: ZEITO4YBGSLV7JBWUAV3M2JEA5PZETLD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZEITO4YBGSLV7JBWUAV3M2JEA5PZETLD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #562 was opened from hiagofranco:

Add support for Toradex SMARC Development board, using the WM8904 audio codec.

This is a carrier board for the Toradex SMARC family, where any SMARC SoM can be connected to it, therefore this is being added to the IO-Boards instead of a specific hardware vendor.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/562
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/562.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
