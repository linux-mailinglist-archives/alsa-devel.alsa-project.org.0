Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE0328CB69
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Oct 2020 12:08:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB8BA1681;
	Tue, 13 Oct 2020 12:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB8BA1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602583725;
	bh=AU+C6TEmeeIcL8Dz+W5SN/nwZDKXyLL6Qog9gwzgVpA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OtTGUZejHqi+Hu5pqSiOi3cjIbAtHTvpOIzhAxy4QY3eJlc03pJsNePHfdDMgoaL1
	 gnp83+qQh4el+ZhzJd51U+FDVmsf/skQJstu1UDtFUwjkpKp5cvatOboqVG7ok7jET
	 BZloI1EUYRqFatjz2NGHqvFOWr+4bLQ0bTes4e5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4259BF801D9;
	Tue, 13 Oct 2020 12:07:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 067D6F801A3; Tue, 13 Oct 2020 12:06:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A2BA9F800CE
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 12:06:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2BA9F800CE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1602583604138755083-webhooks-bot@alsa-project.org>
References: <1602583604138755083-webhooks-bot@alsa-project.org>
Subject: error(no sound) over boundary time [src/pcm/pcm_dshare.c]
Message-Id: <20201013100648.067D6F801A3@alsa1.perex.cz>
Date: Tue, 13 Oct 2020 12:06:48 +0200 (CEST)
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

alsa-project/alsa-lib issue #84 was opened from syuuha:

there is an issue when we use pcm_dshare over boundary time,
eg.  will be no sound after 12 hours 


[src/pcm/pcm_dshare.c] Line 114:

[before]
	/* calculate the size to transfer */
	size = dshare->appl_ptr - dshare->last_appl_ptr;

[after]
	/* calculate the size to transfer */
	if (dshare->appl_ptr < dshare->last_appl_ptr)
		size = dshare->appl_ptr + (pcm->boundary - dshare->last_appl_ptr);
	else
		size = dshare->appl_ptr - dshare->last_appl_ptr;

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/84
Repository URL: https://github.com/alsa-project/alsa-lib
