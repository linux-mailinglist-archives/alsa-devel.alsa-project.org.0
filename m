Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7C3279975
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Sep 2020 15:03:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64A651A94;
	Sat, 26 Sep 2020 15:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64A651A94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601125434;
	bh=3PFG3N7XwK6O4p1fn6Zp0ZDTTM5E9MZj+kTkguS9S00=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XhZhJDXhwbt1biNQvzl6CqIfpl/pTU7ST2Vl6Mk9oJKeNuvM/IoTzcPHHUiLRdqGY
	 HMQY9gY0K//KGxCMabeOUZD+uPupqdftDPK59pE5s4vJy4UlaD6ESUtKE081R1CgGZ
	 EZac8WxbGDAQU5xurgCUQ6IwMhJgXbvOJQDP9URk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84B64F80162;
	Sat, 26 Sep 2020 15:02:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55BE8F80229; Sat, 26 Sep 2020 15:02:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E8C9EF800FD
 for <alsa-devel@alsa-project.org>; Sat, 26 Sep 2020 15:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8C9EF800FD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1601125327433012009-webhooks-bot@alsa-project.org>
References: <1601125327433012009-webhooks-bot@alsa-project.org>
Subject: Ability to set ALSA PLUGIN DIR,
 etc. at runtime via environment variables
Message-Id: <20200926130211.55BE8F80229@alsa1.perex.cz>
Date: Sat, 26 Sep 2020 15:02:11 +0200 (CEST)
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

alsa-project/alsa-lib issue #82 was opened from peanutbutterandcrackers:

Hello there,

I would like to request a feature to set things like `ALSA_PLUGIN_DIR` etc during runtime using environment variables. Currently, these seem to be set-able only at build-time, or by using a `.asoundrc` file.

Or, if something like that is already possible, please do point me to the relevant documentation. Thank you very much.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/82
Repository URL: https://github.com/alsa-project/alsa-lib
