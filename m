Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AE79B01EB
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2024 14:09:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2888851;
	Fri, 25 Oct 2024 14:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2888851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729858183;
	bh=KWeHL03zG2XtfvUC5qi18da7cLf3LMkFc7eigmeQXPE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NH9UeIO4bQ5jD6NIDWicULA/CRnaPiep87NxCjdwQmTapqpMDVYfNsmLTEgUvBAW7
	 6u0C5PIHpF3me6nyMNoPNXhxmnDIIXWNAkoyi6qAEtRe9PwUlLBAyhAnLDybibjWsT
	 6mahmPWCm5RDco5T9J9k1F7RpK7Tp+QdpH3gFVlg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D468BF805B4; Fri, 25 Oct 2024 14:09:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB35AF8057A;
	Fri, 25 Oct 2024 14:09:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35F21F8016C; Fri, 25 Oct 2024 14:09:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 81EEBF8014C
	for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2024 14:09:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81EEBF8014C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1729858144063719511-webhooks-bot@alsa-project.org>
References: <1729858144063719511-webhooks-bot@alsa-project.org>
Subject: ALC225 the microphone does not work in jack3.5
Message-Id: <20241025120906.35F21F8016C@alsa1.perex.cz>
Date: Fri, 25 Oct 2024 14:09:06 +0200 (CEST)
Message-ID-Hash: RCJNUETC54OLZTFEFUKXZYERMH5GM73B
X-Message-ID-Hash: RCJNUETC54OLZTFEFUKXZYERMH5GM73B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCJNUETC54OLZTFEFUKXZYERMH5GM73B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #416 was opened from PavelGu:

I have notebook clevo NL55AU with Ubuntu24.04 installed.
The microphone does not work on a headset connected to a combined audio output jack 3.5. 

Logs: https://alsa-project.org/db/?f=89d2b631cb1635dd48357610d54e062bddef81b4

Can you help me?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/416
Repository URL: https://github.com/alsa-project/alsa-lib
