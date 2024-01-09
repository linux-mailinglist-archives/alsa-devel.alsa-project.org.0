Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A0A828015
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 09:07:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2361582C;
	Tue,  9 Jan 2024 09:07:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2361582C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704787673;
	bh=TwnCMQt4cIqfepHGjKHxZQoPAshjFJBX3Im2GgzxdvY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VZqXD19VxnGb5OpHG09iNDP2qT3mB/DYUTIe5tD2KSSRwegKCwtbdimRI2eQsAkVO
	 1g0jr4Tl++cp9szkIZEzim8Y+z9ZGSkg39DTeOMPa9D+csS7bJnOw0k0Xzkrw/m7/C
	 yyJZVkt2Y9FWJpk5qQKJ9z/OHL1wo/r3o96fK0h4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9034BF8059F; Tue,  9 Jan 2024 09:07:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77313F80580;
	Tue,  9 Jan 2024 09:07:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95845F80254; Tue,  9 Jan 2024 09:07:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 2136DF80086
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 09:07:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2136DF80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1704787624561822891-webhooks-bot@alsa-project.org>
References: <1704787624561822891-webhooks-bot@alsa-project.org>
Subject: Update USB-Audio.conf
Message-Id: <20240109080712.95845F80254@alsa1.perex.cz>
Date: Tue,  9 Jan 2024 09:07:12 +0100 (CET)
Message-ID-Hash: 3NQGMUWF6BTZQQ7I4TSG6RZIJQUYF5BJ
X-Message-ID-Hash: 3NQGMUWF6BTZQQ7I4TSG6RZIJQUYF5BJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NQGMUWF6BTZQQ7I4TSG6RZIJQUYF5BJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #376 was edited from MiroslavGubenko:

added MPG Z590M GAMING EDGE WIFI

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/376
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/376.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
