Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD44637F104
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 03:49:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C34517F1;
	Thu, 13 May 2021 03:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C34517F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620870560;
	bh=thWO3DvSuKu5zcMr5gRB60mG68cIdHkaM09vvUwn98Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tixn7V0+GYkoMrVaLS3yCU2E+qvTVQ55F+X5qaPIFx1N3FF2EsiavqEglCQtR1dzX
	 KBsPRSRPwv27U14oPtwl3u2z33752nqhhutdoUbLXWC0ybFFwVwxFjvkIJ3vx0jkBo
	 ivAdRmVycnL/89TbrZ63LSlm90wGJq9LDC5duvq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E0C2F80279;
	Thu, 13 May 2021 03:48:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3066F80245; Thu, 13 May 2021 03:48:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 81690F8012E
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 03:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81690F8012E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1620870492337914944-webhooks-bot@alsa-project.org>
References: <1620870492337914944-webhooks-bot@alsa-project.org>
Subject: pulse.conf overrides ~/.asoundrc for default
Message-Id: <20210513014814.C3066F80245@alsa1.perex.cz>
Date: Thu, 13 May 2021 03:48:14 +0200 (CEST)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #134 was edited from flatmax:

On many systems pulse audio sets the default device to pulse. This overrides the settings in ~/.asoundrc.

This is further complicated by using a tool like pasuspender and finding that pulse's default device is still set and overriding ~/.asoundrc

It would seem more empowering to let the user override the default device in ~/.asoundrc and have that take effect over pulse.conf which typically resides in /usr/share/alsa/alsa.conf.d

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/134
Repository URL: https://github.com/alsa-project/alsa-lib
