Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A00487F2E
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jan 2022 00:01:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6BD21710;
	Sat,  8 Jan 2022 00:00:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6BD21710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641596505;
	bh=xzyq4z/oOMaEMuRfht7LhKXn8zpBvdEeFtrFzvI74DM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K+Uy8gSh0rtAt87Qtw7I1cCt9sGhN5XWWjgdsJpwsLec5T8U0lUGYiVrYGFEFy1nN
	 7Gd/gLMq9YqpnplLrFGnhv4+9Ib/9flKyhG/rGtoZYqrgsgx3exY/kRAbf6tGBGxlA
	 cFwEhHBSHc7LiDSmFHOw0H+q+3eBJrwj6SQG6Of4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E901F80254;
	Sat,  8 Jan 2022 00:00:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C73DF80249; Sat,  8 Jan 2022 00:00:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D26D9F8007E
 for <alsa-devel@alsa-project.org>; Sat,  8 Jan 2022 00:00:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D26D9F8007E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1641596428273905039-webhooks-bot@alsa-project.org>
References: <1641596428273905039-webhooks-bot@alsa-project.org>
Subject: amixer: needs sget/cget support in stdin mode
Message-Id: <20220107230037.5C73DF80249@alsa1.perex.cz>
Date: Sat,  8 Jan 2022 00:00:37 +0100 (CET)
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

alsa-project/alsa-utils issue #135 was opened from nick87720z:

I used alsactl and amixer to implement highly effective volume control applet executor. At least it's able to keep pace at touchpad, which sends 1000 scroll events in only 18 to 12 seconds.

`amixer --stdin` handles control events, while `alsactl monitor` is even source for applet display part (it's tint2 executor). But in order to get values to display - this display part has to run `alsactl sget` per request. Can't these commands be supported in stdin mode? From first look - expected lines number doesn't look unpredictable: for `sget` it depends on number of channels, and for `cget` - probably fixed.

Even `controls` command also could be supported, since it lists channel from biggest ID to 1, so moment of numid=1 could be understood as  end of list.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/135
Repository URL: https://github.com/alsa-project/alsa-utils
