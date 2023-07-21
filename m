Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1074E75D629
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 23:08:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C66CD1F3;
	Fri, 21 Jul 2023 23:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C66CD1F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689973736;
	bh=9nOAf6ZDXt4xC8/u1WC6g5aDLBrg7irR2mZX6R5iv8w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cGfLicCzNF7OkToWJ3f+Vr76cy0QJaygNe+beEVwoHrGMeugyu0XjLaCFguzaiHym
	 C2WdM+cVjnYYooZlj/FTSF0fVD1rE6KHALmLgulm57O1gyv6jISJVa0UCGUFL50dRS
	 8M/jTUOcnCUUY/HiSIqXvMucm1UXi2nsW6iDIT+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28851F8027B; Fri, 21 Jul 2023 23:08:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B05F1F8032D;
	Fri, 21 Jul 2023 23:08:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93E40F8047D; Fri, 21 Jul 2023 23:07:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id D0C74F8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 23:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0C74F8027B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1689973672329874754-webhooks-bot@alsa-project.org>
References: <1689973672329874754-webhooks-bot@alsa-project.org>
Subject: USB soundcard no longer working after update from 1.2.8 to 1.2.9
Message-Id: <20230721210759.93E40F8047D@alsa1.perex.cz>
Date: Fri, 21 Jul 2023 23:07:59 +0200 (CEST)
Message-ID-Hash: 3S6EESZQ43JQWD72GXVMQRJUDROQBWLT
X-Message-ID-Hash: 3S6EESZQ43JQWD72GXVMQRJUDROQBWLT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3S6EESZQ43JQWD72GXVMQRJUDROQBWLT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #336 was opened from bothesven:

I use a "Teufel Cinebar Ultima" as a usb sound card with driver snd-usb-audio.
This works with alsa-lib, alsa-ucm-conf and lib32-alsa-lib in version 1.2.8. When these libraries are updated to 1.2.9, any player just hangs when this sound card is selected as output.

[alsa-info.txt.gz](https://github.com/alsa-project/alsa-lib/files/12134686/alsa-info.txt.gz)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/336
Repository URL: https://github.com/alsa-project/alsa-lib
