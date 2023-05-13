Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF23701624
	for <lists+alsa-devel@lfdr.de>; Sat, 13 May 2023 12:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E4A9BC0;
	Sat, 13 May 2023 12:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E4A9BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683973592;
	bh=9mangd1Pv8j4mhAEG2mcgr3FcAfKWqDx6L7dn6ptZD0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LTwZ+q4NBsJzkJlvvmW0RYdyFC3Z9pXYor5CPYwk3va6XShxZKo3929jGLdhrQt2m
	 fRopfY4ooeOgZAuvTX8Nq3vHmjmlTgM7MfI801OnAFi5GrNfDYDxJU0bcRuVNkqggp
	 7Yci1U9LykS2ftoBQXr373RwXw2tA5ImCxv/JP04=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1A21F80544; Sat, 13 May 2023 12:25:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CABFF8032D;
	Sat, 13 May 2023 12:25:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9335DF8052E; Sat, 13 May 2023 12:24:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 766B2F802E8
	for <alsa-devel@alsa-project.org>; Sat, 13 May 2023 12:24:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 766B2F802E8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1683973467866495371-webhooks-bot@alsa-project.org>
References: <1683973467866495371-webhooks-bot@alsa-project.org>
Subject: Update USB-Audio.conf
Message-Id: <20230513102431.9335DF8052E@alsa1.perex.cz>
Date: Sat, 13 May 2023 12:24:31 +0200 (CEST)
Message-ID-Hash: TWQ5JM3BDLLKYYTVP27W4ZHWGIDOKP7P
X-Message-ID-Hash: TWQ5JM3BDLLKYYTVP27W4ZHWGIDOKP7P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWQ5JM3BDLLKYYTVP27W4ZHWGIDOKP7P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #315 was opened from Sunsheep:

Added configuration for ASUS ROG Strix B650E-I Gaming WiFi and ALC4080

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/315
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/315.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
