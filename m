Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AE31CD471
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 11:06:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 185B81654;
	Mon, 11 May 2020 11:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 185B81654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589187967;
	bh=WntTpW8hqRRazarcoLbA24mPF7vuZn0MzsWydZqr9CE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vAhdm+h6TkJCC+yZu0rHOLs/llAQtjkPaO8F4GLG++TwEe4AzEJewv7h5Ok0AcdNh
	 tscFzsHAvwx8Q4eTb5zLkQ/ZqAeQCAaZZ3kXQ0AQuZ8FnBytA2TJgJuVTJGutK6T+Y
	 wKclXYBcW/c4XHA8SwQYHrfj/C7J2XdWGYJiiaxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25846F80107;
	Mon, 11 May 2020 11:04:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3ACFF80157; Mon, 11 May 2020 11:04:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9F5C0F800E3
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 11:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F5C0F800E3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1589187859103775024-webhooks-bot@alsa-project.org>
References: <1589187859103775024-webhooks-bot@alsa-project.org>
Subject: Fix pour Asus Xonar U5 card SPIF in USB-Audio.conf
Message-Id: <20200511090423.B3ACFF80157@alsa1.perex.cz>
Date: Mon, 11 May 2020 11:04:23 +0200 (CEST)
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

alsa-project/alsa-lib issue #48 was edited from burningd0g:

It would be greatly apreciated to add the iec958 correct device in the default USB-Audio.conf for the Xonar USB sound card :

USB-Audio.pcm.iec958_device {
        ...
        "ASUS XONAR U5" 1
        "XONAR U5" 1
       ...
}

It would prevent me (and maybe some other people) to freak out on why it doesn't work out of the box! :)
I know the issue is also present on the U7 but i don't have all the possible device name for it.

Thanks!

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/48
Repository URL: https://github.com/alsa-project/alsa-lib
