Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA8E6EABC2
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 15:36:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E66BAE89;
	Fri, 21 Apr 2023 15:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E66BAE89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682084207;
	bh=gfdq7GtPljz/+0ZmKwS/uca3BOArz/tbYCuCgFqfEkg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Q9OM5+G12nO7tangfOWpfL7Jmi6q+sgBf5DVpOGaOf3drLVojEiPaRwaYC8sTZKey
	 O501wrkMtobWAeUWgWI1pa3kL+229GXsbtaScReor7jxvc3fWddMHjLRO0wkbUFIEs
	 Oy9etjlAIKl5dhtAbdJcQUvF4ZhbyFlW1UqGsXC4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CAF2F80149;
	Fri, 21 Apr 2023 15:35:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFC29F80155; Fri, 21 Apr 2023 15:35:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id CEB89F800F8
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 15:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEB89F800F8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1682084150402652502-webhooks-bot@alsa-project.org>
References: <1682084150402652502-webhooks-bot@alsa-project.org>
Subject: Realtek ALC 4080 on MSI B650 Tomahawk
Message-Id: <20230421133553.EFC29F80155@alsa1.perex.cz>
Date: Fri, 21 Apr 2023 15:35:53 +0200 (CEST)
Message-ID-Hash: DUF2C2ULFYGIGKNFNZS2EPOY2PTDBFFE
X-Message-ID-Hash: DUF2C2ULFYGIGKNFNZS2EPOY2PTDBFFE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUF2C2ULFYGIGKNFNZS2EPOY2PTDBFFE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #306 was opened from arleyantes:

I have Realtek ALC 4080 on an MSI B650 Tomahawk and the chip is not getting recognized, its usb id is "Bus 001 Device 003: ID 0db0:422d Micro Star International USB Audio". Manually changing the ids in ucm in File /usr/share/alsa/ucm2/USB-Audio/USB-Audio.conf made it show up correctly.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/306
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
