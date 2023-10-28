Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 341477DA67D
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Oct 2023 12:38:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92386A4E;
	Sat, 28 Oct 2023 12:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92386A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698489522;
	bh=0NrDMTYHBFhGooZBk+mj4ZxGd5f+rRCuvE7bmNmByVg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=TLgzNMmWCvcuU9OeD08SWPEx+79SneUsKjGSyBLgvpC3vTBg5tkZavVVzErc426A3
	 xrWIi1zEZZWs2Gisiw7xaKfkln/2l7pbnR+s2c+3lwJk95x+LqMxBwg+9+/gjSEp32
	 JiqBVI2G4jjg7WAO4nK68G+bq550+5xYGrY2RWHA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09948F80557; Sat, 28 Oct 2023 12:37:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE6E7F80165;
	Sat, 28 Oct 2023 12:37:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE5E7F8019B; Sat, 28 Oct 2023 12:37:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DC19F80152
	for <alsa-devel@alsa-project.org>; Sat, 28 Oct 2023 12:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DC19F80152
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1698489460663124800-webhooks-bot@alsa-project.org>
References: <1698489460663124800-webhooks-bot@alsa-project.org>
Subject: Possible bug in snd_ends1371 on Debian 12 with KDE (Wayland and X11)
Message-Id: <20231028103746.EE5E7F8019B@alsa1.perex.cz>
Date: Sat, 28 Oct 2023 12:37:46 +0200 (CEST)
Message-ID-Hash: 4O43VVJZNLBX5TCYT2LZNQRLJJK3QVBA
X-Message-ID-Hash: 4O43VVJZNLBX5TCYT2LZNQRLJJK3QVBA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4O43VVJZNLBX5TCYT2LZNQRLJJK3QVBA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #357 was opened from wschadow:

After installing Debian 12.2 running KDE I notice sveral crashes over night. There seems to be an issue with the screen locker and ALSA. Attached find the output of journalctl -p3 -r.
[journalctl.txt](https://github.com/alsa-project/alsa-lib/files/13195520/journalctl.txt)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/357
Repository URL: https://github.com/alsa-project/alsa-lib
