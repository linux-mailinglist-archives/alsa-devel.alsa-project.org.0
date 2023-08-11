Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A720477978F
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 21:11:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB40F822;
	Fri, 11 Aug 2023 21:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB40F822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691781092;
	bh=OOnMjxTA+NW+7/2jqxbn6oT9VT7Wdc65m/E+tYofWqM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=tg/PNkm4DRM3BlDlMptJ314YmvN5AzCVSvb6oqWBkz32VkI8uHGrV3Te3+/LVHYH2
	 4M8rivrN6rZp8AmcL3YtLZolbW3XB7QNWEmyY+CyvZtFtAca1BFMRrtwohThUmz/im
	 KELYJjTsUstysp1PNIbTY0cP1ISM3EqCBFAJqgVE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69FADF80134; Fri, 11 Aug 2023 21:10:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA4AFF80134;
	Fri, 11 Aug 2023 21:10:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87C0AF80166; Fri, 11 Aug 2023 21:10:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 6430CF800EE
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 21:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6430CF800EE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1691781006590857506-webhooks-bot@alsa-project.org>
References: <1691781006590857506-webhooks-bot@alsa-project.org>
Subject: MSI x570s Carbon Max WiFi ALC 4080
Message-Id: <20230811191010.87C0AF80166@alsa1.perex.cz>
Date: Fri, 11 Aug 2023 21:10:10 +0200 (CEST)
Message-ID-Hash: JZZ2H2H2VKK5FUBWEO7MRN4MOCJYL2VE
X-Message-ID-Hash: JZZ2H2H2VKK5FUBWEO7MRN4MOCJYL2VE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZZ2H2H2VKK5FUBWEO7MRN4MOCJYL2VE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #338 was opened from zpackrat:

Fedora 38 patched to current, issue has existed for months. Rear output jacks for Center/Sub and Rear Speakers are reversed. I use a 5.1 speaker setup. When I run sound tests in the gnome audio settings the issue is verifiable. Also audio that requires center channel for dialogue has issues.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/338
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
