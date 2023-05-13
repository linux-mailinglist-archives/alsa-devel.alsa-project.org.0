Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30595701627
	for <lists+alsa-devel@lfdr.de>; Sat, 13 May 2023 12:28:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82DFDAEA;
	Sat, 13 May 2023 12:27:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82DFDAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683973688;
	bh=pKewJq9PI7YrzEiyW1kxpGbqcGWbjgqkujmscXxDEzA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HIvdKmeHJOBp1H/kYZDa04QmwFbFaUebcTD3+z3TdL57EkrWVFbejxwVQBSd0WiqE
	 gWhOnjj4papGMxyNmJYZIAUVP3sw3lheq3vfrbyBt/WK556EQp3CLtxUrizECOAVSp
	 n341puDD91ylUpqYcXoogmbjSd/I2UVzpCdy+tBI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 425ADF8052E; Sat, 13 May 2023 12:27:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8E56F8032D;
	Sat, 13 May 2023 12:27:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C726F8052E; Sat, 13 May 2023 12:27:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E40F802E8
	for <alsa-devel@alsa-project.org>; Sat, 13 May 2023 12:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16E40F802E8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1683973633074224710-webhooks-bot@alsa-project.org>
References: <1683973633074224710-webhooks-bot@alsa-project.org>
Subject: Update USB-Audio.conf for ASUS ROG Strix B650E-I Gaming WiFi and
 ALC4080
Message-Id: <20230513102714.8C726F8052E@alsa1.perex.cz>
Date: Sat, 13 May 2023 12:27:14 +0200 (CEST)
Message-ID-Hash: 34YBN4XGRHPXBVEQB3TMOLY4HIJRQTHQ
X-Message-ID-Hash: 34YBN4XGRHPXBVEQB3TMOLY4HIJRQTHQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/34YBN4XGRHPXBVEQB3TMOLY4HIJRQTHQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #315 was edited from Sunsheep:

Added configuration for ASUS ROG Strix B650E-I Gaming WiFi and ALC4080

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/315
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/315.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
