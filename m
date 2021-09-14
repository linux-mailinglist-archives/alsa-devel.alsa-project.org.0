Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FC140B3FA
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 17:58:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7970F17F5;
	Tue, 14 Sep 2021 17:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7970F17F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631635135;
	bh=Huoe5ucBVU+6uCcgSAB5eU40eN1ZDQX4WvQXMojyQes=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z0XTSKWlkCqMScj8gmBBDKVDeZg+vc7W5TVvAX4vihETscQPjK3sTisQwjvuOoFBW
	 +w1VyZbcVO3jk/bH7RxWVWDsgC2YMdt6kdHoV8UPloTPUtgJXTM7mk/WZRVeG/xvBY
	 lbI3/Bq1Qyh+lMR88ZRL8tTnxxTc3gu8Kg7E8WFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4CEBF80117;
	Tue, 14 Sep 2021 17:57:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C151F8025E; Tue, 14 Sep 2021 17:57:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E677DF80117
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 17:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E677DF80117
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1631635042945466042-webhooks-bot@alsa-project.org>
References: <1631635042945466042-webhooks-bot@alsa-project.org>
Subject: git clone failed
Message-Id: <20210914155735.7C151F8025E@alsa1.perex.cz>
Date: Tue, 14 Sep 2021 17:57:35 +0200 (CEST)
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

alsa-project/tinycompress issue #12 was opened from BalajiMalar:

i was building yocto image which uses tinycomrpess as part of NXP's recipe-multimedia. the yocto build failed since it wasnt able to clone the package.
i tried to clone from CLI using the command "**git clone git clone git://git.alsa-project.org/tinycompress.git**" and still it failed

Issue URL     : https://github.com/alsa-project/tinycompress/issues/12
Repository URL: https://github.com/alsa-project/tinycompress
