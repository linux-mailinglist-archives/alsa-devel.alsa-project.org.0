Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2189044E042
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Nov 2021 03:25:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99CF315E0;
	Fri, 12 Nov 2021 03:24:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99CF315E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636683929;
	bh=gOd/WLQ6DSeJpROlTk1tm1sAEPYERsLUzUKfBTyx7QI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ye4+TNrpJK+WOxN5hY/pFqHG+iC6XMBdrsE6Ej4c7qMhaeYT4+/U+h5uu2zPU7eMh
	 1GK3hg8FGpTQCgzLxaIPC1KRw/kWp0ZC33TxjrmsATVlhd48zAAD9xtRoF3V57OQ64
	 Gc4Jxxy0+dxHPZuRhJTD1XBfOzvOd5+prHM5vA3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECCF5F80086;
	Fri, 12 Nov 2021 03:24:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBA55F8049E; Fri, 12 Nov 2021 03:24:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 941CAF800C1
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 03:24:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 941CAF800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1636683845420989037-webhooks-bot@alsa-project.org>
References: <1636683845420989037-webhooks-bot@alsa-project.org>
Subject: UCM can't match the USB device ID in Ubuntu 20.04
Message-Id: <20211112022410.DBA55F8049E@alsa1.perex.cz>
Date: Fri, 12 Nov 2021 03:24:10 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #119 was opened from shumingfan:

We created the UCM2 conf files and used the 'components' string to match the right UCM config.
Unfortunately, the system can't apply the right UCM config.

The test files and alsa-lib version shows below.
USB-Audio.conf
https://github.com/perexg/alsa-ucm-conf/commit/e3517b1cbb4ac0c69496329eeb15dc6bd4ed3a13
Dell-Desktop UCM2 files
https://github.com/shumingfan/alsa-ucm-conf/commit/16dce692843b05d9cd720ddae1e790c26881d47e
$ alsaucm --version
alsaucm: version 1.2.2

Is it possible to resolve this problem when using alsa-lib-1.2.2?

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/119
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
