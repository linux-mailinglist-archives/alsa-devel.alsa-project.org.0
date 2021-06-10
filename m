Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 273673A2B58
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 14:20:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FC711792;
	Thu, 10 Jun 2021 14:19:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FC711792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623327620;
	bh=aHp4oslbab1zRnJ3Hd2wObQtTqdNPppob3CPqV/dAEw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nBoQdpIcgl0qoDnQ0Ya7jXcokd368zXX8WfKiAcj/2H2aQv0RlFHhqVeTWJzKzSU5
	 rUfrcv9u+agAyM8Y0u/cQgbR/fUiYi48DbfJGy5mg/WCK8ejhZGr6dx6v9codcG/rB
	 OQprM2cXhtYaiKgHjmHKyL6ER/9kXGq5gNq1TAMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01498F800FC;
	Thu, 10 Jun 2021 14:18:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EE27F80218; Thu, 10 Jun 2021 14:18:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CC6E2F801EC
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 14:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC6E2F801EC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1623327521455009937-webhooks-bot@alsa-project.org>
References: <1623327521455009937-webhooks-bot@alsa-project.org>
Subject: Logitech C922x microphone intermittently working
Message-Id: <20210610121850.9EE27F80218@alsa1.perex.cz>
Date: Thu, 10 Jun 2021 14:18:50 +0200 (CEST)
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

alsa-project/alsa-lib issue #152 was opened from sambo57u:

I have a Logitech C922X (detected as C922) USB webcam. Running latest updates on Fedora 34. The microphone of this device only works about 1 out of 5 reboots. When not working if I install another microphone, activate that one, the unplug and plug
C922 back and switch to it,  it starts to work. Some kind of a timing issue that is very annoying. Don't have this problem with
Logitech C270. The camera always works fine.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/152
Repository URL: https://github.com/alsa-project/alsa-lib
