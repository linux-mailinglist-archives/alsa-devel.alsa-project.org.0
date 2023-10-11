Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 186C87C46CB
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 02:38:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C7ACEC0;
	Wed, 11 Oct 2023 02:37:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C7ACEC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696984689;
	bh=sNb7tNHFs8IxsUwzQys+Y/w7K/+mNVqfH6AsNosdxYk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=K3wH9iDLj+Ox9fHnxbh/X0VaF45jHZe44mBe+bwk0ITo0YNZTi8Dsdh+Qv50Pf1dp
	 izW2PUsSauaFMceXK0XQEwVdKaL0iOXbjPG0DFeJjrAFn8as6HiJFGpv+fC4md0kWA
	 U+h//2wZZvM3NomTpSJq8psNBWzdvf/bCPWxPnNI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99A61F80557; Wed, 11 Oct 2023 02:37:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45838F80166;
	Wed, 11 Oct 2023 02:37:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E99CF8027B; Wed, 11 Oct 2023 02:37:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id DEA4BF80130
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 02:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEA4BF80130
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1696984629860895634-webhooks-bot@alsa-project.org>
References: <1696984629860895634-webhooks-bot@alsa-project.org>
Subject: Add UCM2 configuration for Behringer UMC404HD
Message-Id: <20231011003714.0E99CF8027B@alsa1.perex.cz>
Date: Wed, 11 Oct 2023 02:37:14 +0200 (CEST)
Message-ID-Hash: VPZHMCWLJBNSDR4TJU62272225B44PU4
X-Message-ID-Hash: VPZHMCWLJBNSDR4TJU62272225B44PU4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPZHMCWLJBNSDR4TJU62272225B44PU4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #358 was edited from Janhouse:

The only difference between UMC204HD and UMC404HD are the 2 additional inputs and a different USB device ID. Tested with my 404HD, works great.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/358
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/358.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
