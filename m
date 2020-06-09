Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AF31F369E
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 11:09:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D7AE1682;
	Tue,  9 Jun 2020 11:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D7AE1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591693793;
	bh=lSyo51taR74q2+ycK9QSiYQEJJuXUxVX9FP2NuPhFsc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=khAX298TTwSY5HWD5o2IIRguQKU+m0rzl5pjVgORRcvbRw8+2cnqIUVM8VCAvEeuv
	 9GykdLIhW6zF4ij5eO+YUvwT4muYCN/vKnheNW14SO+Oeu13JxM1rZ7ZtGcw8mG1hD
	 3BQjdnG1/eVY6wvq9wNNng59BYk9ena368GE0TDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C175F8028D;
	Tue,  9 Jun 2020 11:08:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83737F8028C; Tue,  9 Jun 2020 11:08:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B1B35F80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 11:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B35F80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1591693685913017988-webhooks-bot@alsa-project.org>
References: <1591693685913017988-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: timer: add global method to retrieve current source of
 timestamp
Message-Id: <20200609090809.83737F8028C@alsa1.perex.cz>
Date: Tue,  9 Jun 2020 11:08:09 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #27 was opened from takaswie:

ALSA snd_timer kernel module has a parameter for source of timestamping. Applications cannot refer to the parameter via UAPI of Linux kernel, however it's possible via sysfs.

This patch adds an API to refer to the parameter.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/27
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/27.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
