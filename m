Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A865A7A089C
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 17:08:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EB94AE9;
	Thu, 14 Sep 2023 17:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EB94AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694704081;
	bh=Ddw6BPQWP69LSENGHTgLVgcZxf2eNwFoHpSiNHRQ1+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tPpvRyqccvmJKKsIq0FvD1mBs0r/rYtszva+X1p3P6SzsLynpETWR9eL2nP7YSx4m
	 lx3XS/ro8H2aUCmP5xhFz6y31N/WzD8BOQNtPeRfojgMC4AUWmcH8bIFkdKpTN9CK0
	 lmaCw6bGQhdtOBXt9bbpzMPvCXKTaC1f/szWIJKI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D7A1F801F5; Thu, 14 Sep 2023 17:06:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EC09F801F5;
	Thu, 14 Sep 2023 17:06:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EBC9F80425; Wed, 13 Sep 2023 04:29:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp158.hiworks.co.kr (smtp158.hiworks.co.kr [211.43.203.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8E39F801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 04:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8E39F801F5
Received: (qmail 97224 invoked from network); 13 Sep 2023 11:28:51 +0900
Received: from unknown (HELO smtp4.hiworks.co.kr) (121.254.168.203)
	by 0 (qmail 1.03 + ejcp v14) with SMTP;
	13 Sep 2023 11:28:51 +0900
Received: (qmail 176455 invoked from network); 13 Sep 2023 11:28:51 +0900
Received: from unknown (HELO hiworks.co.kr) (192.168.10.180)
	by 0 (qmail 1.03 + ejcp v14) with SMTP;
	13 Sep 2023 11:28:51 +0900
Received: (qmail 163461 invoked from network); 13 Sep 2023 11:28:50 +0900
Received: from unknown (HELO saram-MINIPC-PN53..)
 (mwkim@gaonchips.com@220.88.49.178)
	by 0 (qmail 1.03 + ejcp v14) with SMTP;
	13 Sep 2023 11:28:50 +0900
X-Authinfo: HIWORKS SMTP authenticated
 <mwkim@gaonchips.com|220.88.49.178|mwkim@gaonchips.com|230913112850_3679163100>
X-MailFrom-INFO: Info <country_code:KR|rbl_level:0>
From: Myunguk Kim <mwkim@gaonchips.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	fido_max@inbox.ru,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	mwkim@gaonchips.com,
	perex@perex.cz,
	tiwai@suse.com,
	u.kleine-koenig@pengutronix.de,
	xingyu.wu@starfivetech.com
Subject: Re: [PATCH] ASoC: dwc: fix typo in comment
Date: Wed, 13 Sep 2023 11:28:15 +0900
Message-Id: <20230913022815.1446867-1-mwkim@gaonchips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZQBoyKulheGf8h/e@finisterre.sirena.org.uk>
References: <ZQBoyKulheGf8h/e@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mwkim@gaonchips.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GQ5ATKR35GQ7QB4NXIIW32GBYS6JKTR2
X-Message-ID-Hash: GQ5ATKR35GQ7QB4NXIIW32GBYS6JKTR2
X-Mailman-Approved-At: Thu, 14 Sep 2023 15:06:21 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQ5ATKR35GQ7QB4NXIIW32GBYS6JKTR2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> This doesn't apply against current code, please check and resend:

Sorry, I will send a clean v2 in a moment.

