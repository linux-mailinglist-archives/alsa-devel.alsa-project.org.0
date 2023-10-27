Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A80B7DA193
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 22:00:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39CF6A4C;
	Fri, 27 Oct 2023 22:00:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39CF6A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698436854;
	bh=zwtAyE9mqFDyiaaTW+wA9nPolrUlNeuOF/XY/F+LfbQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UY+4H8BdJLEzrAfD12saFsZr3uqmvsEPoHLshJwkNB2BUgUzDLJjUGVPz/1itFus4
	 0CFp4YuczuJl++URr1LP+WE2igUBCXsGMwy19Ex/4MQNxDl9ffg3AAUVIQ3pPlQLr4
	 5W8yimygKybvIvdtjFNafoItwDPIGGYx9Yzi9SnU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EF2DF8012B; Fri, 27 Oct 2023 22:00:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8690F8012B;
	Fri, 27 Oct 2023 22:00:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2C6EF8019B; Fri, 27 Oct 2023 21:59:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 80858F8014B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 21:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80858F8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1698436791537719965-webhooks-bot@alsa-project.org>
References: <1698436791537719965-webhooks-bot@alsa-project.org>
Subject: aplaymidi uses the wrong tempo
Message-Id: <20231027195956.C2C6EF8019B@alsa1.perex.cz>
Date: Fri, 27 Oct 2023 21:59:56 +0200 (CEST)
Message-ID-Hash: RZF7SSBCDJ2ZGURFTXFLJINOAKJS3EAG
X-Message-ID-Hash: RZF7SSBCDJ2ZGURFTXFLJINOAKJS3EAG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZF7SSBCDJ2ZGURFTXFLJINOAKJS3EAG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #241 was opened from PQCraft:

It seems to be locked to a tempo of 120 for some reason.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/241
Repository URL: https://github.com/alsa-project/alsa-utils
