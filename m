Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2194F157E8B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 16:13:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD2FD1673;
	Mon, 10 Feb 2020 16:13:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD2FD1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581347632;
	bh=yUoGjJvrmX9B1RjoBVxAl9xDXUcoVh12otpNBk9dk/o=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cKoFUQQH81urG7tdIAaL/QZTW04CcJaxKSjgyQhEOxbD9gWI5JAv+3bxN4uYtHmQb
	 vxGfET4G7yhiM8IO+X2A/eLRsxaM9YuJ00aOMSHjLJ0wOWCCpbapi35cgFziQ4aeIU
	 mnNJySY5zonf/xp3eHOZp8LsGdvR3VJTfR3RDgJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBFB4F80118;
	Mon, 10 Feb 2020 16:12:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91E3DF80157; Mon, 10 Feb 2020 16:12:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 434A0F80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 16:12:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 434A0F80118
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1581347526348470926-webhooks-bot@alsa-project.org>
References: <1581347526348470926-webhooks-bot@alsa-project.org>
Message-Id: <20200210151209.91E3DF80157@alsa1.perex.cz>
Date: Mon, 10 Feb 2020 16:12:09 +0100 (CET)
Subject: [alsa-devel] upmix: complete generalizing format
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-plugins pull request #6 was opened from bku-sue:

Unfortunately these lines were overlooked in the [previous pull request](https://github.com/alsa-project/alsa-plugins/pull/2).

Request URL   : https://github.com/alsa-project/alsa-plugins/pull/6
Patch URL     : https://github.com/alsa-project/alsa-plugins/pull/6.patch
Repository URL: https://github.com/alsa-project/alsa-plugins
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
