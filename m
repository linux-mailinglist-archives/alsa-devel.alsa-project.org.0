Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F1A41F905
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 03:14:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68B0C16B2;
	Sat,  2 Oct 2021 03:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68B0C16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633137276;
	bh=K9GZonOvlNSqx1rqsfWVJuafIBs/em0kcsSh1U/XXM4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cxTYYOZNn1RxD41JgoXaG9BnKjNJy1scV+9Fpb6iaGroBhq1Ksnejrs9p5vupQAF6
	 asyYAaDOVOSrK5oZXvZbUkK9tI36SAftBYcNSt5ePtXAOsZ0fX3Ov6ZZn9Jw+BXmf+
	 co8/fNJ/FDl1uIqtcOfe3div+A6Rqhz7U9UHTySI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE29DF800EF;
	Sat,  2 Oct 2021 03:13:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2338CF800EF; Sat,  2 Oct 2021 03:13:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D514FF800EF
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 03:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D514FF800EF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1633137188020005941-webhooks-bot@alsa-project.org>
References: <1633137188020005941-webhooks-bot@alsa-project.org>
Subject: Scripts to save and reload ALSA settings on shutdown/reboot doesn't
 work for Baytrail atom
Message-Id: <20211002011318.2338CF800EF@alsa1.perex.cz>
Date: Sat,  2 Oct 2021 03:13:18 +0200 (CEST)
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

alsa-project/alsa-utils issue #113 was opened from Pic-master:

Issue persists across various distributions.  
"best" workaround I've found is to save a copy of asound.state to user home directory, and run alsactl --file /home/asound.state restore at boot.  Janky work around that only works for one user.  Chased the issue as far as I could.
Running sudo alsactl restore also works, but must be done after each reboot (also had to manually "sudo alsactl store" first)

Currently on GalliumOS 3.0
Acer CB-131 N15Q10

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/113
Repository URL: https://github.com/alsa-project/alsa-utils
