Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A44C4704666
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 09:30:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E692C82A;
	Tue, 16 May 2023 09:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E692C82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684222200;
	bh=IRhjRvV8Etr7ByPZaJaB9ywEjQZWCXGliMcTkXupCBg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uDA5GLLUVcaGhWI9EV3ySJdmIX8OX3w1SDTsBYuyrL5+91z5m/FM2AomaUW/GLEth
	 1E9yzcqT5+N/6J4X0TjrIBooM1L0ZTXN5VDdkjscyAtbA3cqATtiJXecd8wYU/7rEx
	 6p9UZECsuE7/us/JdorjHA+shuU+1NhPE6UsdqNc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B11DEF80557; Tue, 16 May 2023 09:29:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BF90F802E8;
	Tue, 16 May 2023 09:29:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2C97F80544; Tue, 16 May 2023 09:29:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 7464FF8016D
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 09:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7464FF8016D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1684222142389495611-webhooks-bot@alsa-project.org>
References: <1684222142389495611-webhooks-bot@alsa-project.org>
Subject: Update USB-Audio.conf for ASUS ROG Strix B650E-I Gaming WiFi and
 ALC4080
Message-Id: <20230516072903.F2C97F80544@alsa1.perex.cz>
Date: Tue, 16 May 2023 09:29:03 +0200 (CEST)
Message-ID-Hash: GU47FO7I5BWVYX7PBRJ3VF5TTR42W5CZ
X-Message-ID-Hash: GU47FO7I5BWVYX7PBRJ3VF5TTR42W5CZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GU47FO7I5BWVYX7PBRJ3VF5TTR42W5CZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #315 was edited from Sunsheep:

Added configuration for ASUS ROG Strix B650E-I Gaming WiFi and ALC4080

Edit: Added Information from ALSA Information Script

[https://alsa-project.org/db/?f=fe7e76a335dc8f1009ecaac9aa341fb68231aee5](https://alsa-project.org/db/?f=fe7e76a335dc8f1009ecaac9aa341fb68231aee5)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/315
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/315.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
