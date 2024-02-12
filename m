Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E92851226
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 12:25:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B152950;
	Mon, 12 Feb 2024 12:25:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B152950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707737119;
	bh=cAk5RPNtr3SsUGGuja6Sw/mzISkeHIu6NbxDFFbkr8E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=op1Mi9s4tKMwNCob75xvEDihKK4+V+MGrUbi56CEOQylBVNojtWXuSopkwtaE9kiZ
	 pV2syf0i1XDX2YFEzpv416ajQCv52klEIZIikDv0w8uq3oecioCg2Ul1vh5wIPvyOr
	 JpFIalayxWY1EPUJJ3AdeGJoSBnds64wusqs5B78=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFB6CF80587; Mon, 12 Feb 2024 12:24:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B61BF8059F;
	Mon, 12 Feb 2024 12:24:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02BE8F80238; Mon, 12 Feb 2024 12:24:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 41E15F800EE
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 12:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41E15F800EE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1707737072576266766-webhooks-bot@alsa-project.org>
References: <1707737072576266766-webhooks-bot@alsa-project.org>
Subject: MAG Z790 TOMAHAWK WIFI DDR4 no Sound Front Audio Realtek 4080
Message-Id: <20240212112436.02BE8F80238@alsa1.perex.cz>
Date: Mon, 12 Feb 2024 12:24:36 +0100 (CET)
Message-ID-Hash: 4ZBHHMXTZXUZCXEQKVPX2PTKCLNIU6LB
X-Message-ID-Hash: 4ZBHHMXTZXUZCXEQKVPX2PTKCLNIU6LB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ZBHHMXTZXUZCXEQKVPX2PTKCLNIU6LB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #395 was opened from Acer6920:

Greetings,

back audio is working the sound card is recognized as Generic USB Audio
3 [Audio ]: USB-Audio - USB Audio Generic USB Audio at usb-0000:00:14.0-11, high speed

alsa information:
http://alsa-project.org/db/?f=655312de1f9b11ddc33de5fa41c6cad87bcbab9d

if i missed something excuse it please i use zorin os/linux since yesterday and need some advice if you need more information.

thanks a lot.

ace

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/395
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
