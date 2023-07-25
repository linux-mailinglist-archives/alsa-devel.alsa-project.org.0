Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C76FC760E17
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 11:13:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACE7EECE;
	Tue, 25 Jul 2023 11:13:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACE7EECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690276434;
	bh=GS58ix1iT/MPeoZhnwvDdlnalBEBEMlhmv2CSUSsKGY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uboqciYty3MDogD1vCAhUp6zcgaZOUKyf8YFjwTydgQ/ae54Mr1f3MGnv3x65qMCA
	 k1chS4ezt32sFC3iHZ9/H3DtJO4CQCATsgFyR1wGcz5xV/EvdjL414K6p5uk3WWnds
	 lUgQdVpH1l9PyTPqSYRMKkk1bdAP6yR60AzFMXdY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84698F801F5; Tue, 25 Jul 2023 11:12:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD97BF80163;
	Tue, 25 Jul 2023 11:12:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7C90F8019B; Tue, 25 Jul 2023 11:12:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 27F17F80149
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 11:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27F17F80149
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1690276346494989634-webhooks-bot@alsa-project.org>
References: <1690276346494989634-webhooks-bot@alsa-project.org>
Subject: alsa-utils-1.2.4's aplay play 11.025k wav file by digital Mi
 Headphone (S24_3LE) with abnormal electrical noise sound
Message-Id: <20230725091232.A7C90F8019B@alsa1.perex.cz>
Date: Tue, 25 Jul 2023 11:12:32 +0200 (CEST)
Message-ID-Hash: EQN52PRH3B2ERLCJE2HVF3PEC6GAZQNQ
X-Message-ID-Hash: EQN52PRH3B2ERLCJE2HVF3PEC6GAZQNQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQN52PRH3B2ERLCJE2HVF3PEC6GAZQNQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #338 was opened from raintiliang:

Hi, 
    we use  aplay play 11.025k wav file by digital Mi Headphone (S24_3LE) with abnormal electrical noise sound,  But aplay 8K, 16K, 32K,48K wav as normal except 11.025k, 22.05k, 44.1k.  May i have any idea ?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/338
Repository URL: https://github.com/alsa-project/alsa-lib
