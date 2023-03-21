Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 825CA6C2AEE
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 07:59:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D26C1F1;
	Tue, 21 Mar 2023 07:58:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D26C1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679381940;
	bh=nW+ZhZJtXd7AokR5I+6btA/EStfprlpTJ0M/X3jsdXM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qoqA5dPsDEt3RECbSTLd1oZFNGydZCY4+60ynOT5mggoEzY9ieF8WhvKvGFoa8FsB
	 NDaREx7b6dSUuqjeboYoeB53HSOhaPBJReEtI6OMduB+Q5QWkWG44OcCDuo2FTAa0e
	 6gjWnYTI2aCps2JVuqHYgqs8RZj2WWhTGPLuW25Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAA76F80254;
	Tue, 21 Mar 2023 07:58:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 299BFF8027B; Tue, 21 Mar 2023 07:56:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A6A99F8024E
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 07:56:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6A99F8024E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - reopened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1679381792548673391-webhooks-bot@alsa-project.org>
References: <1679381792548673391-webhooks-bot@alsa-project.org>
Subject: Tegra: add UCM configuration for RT5631,
 WM8903 and MAX98089 based devices
Message-Id: <20230321065645.299BFF8027B@alsa1.perex.cz>
Date: Tue, 21 Mar 2023 07:56:45 +0100 (CET)
Message-ID-Hash: 36LVKE2ITFDFOXL7WJQWSEB73OPC4BTL
X-Message-ID-Hash: 36LVKE2ITFDFOXL7WJQWSEB73OPC4BTL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36LVKE2ITFDFOXL7WJQWSEB73OPC4BTL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #291 was reopened from clamor-s:

Proposed UCM configurations were tested for a while on wide range of devices.
Did not cause any issues so far.

List of supported devices using RT5631:
- ASUS TF201
- ASUS TF300TG
- ASUS TF300TL
- ASUS TF700T 

using WM8903:
- ASUS TF101
- ASUS SL101
- ASUS TF300T

using MAX98089
- LG P880
- LG P895

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/291
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/291.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
