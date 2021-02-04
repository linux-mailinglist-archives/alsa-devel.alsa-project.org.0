Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C757E30FA1F
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 18:50:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B6B71665;
	Thu,  4 Feb 2021 18:49:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B6B71665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612461016;
	bh=OysMNGUQijjmd0oeUA/Kh6rs73ZAYEoF3qxv1GXeNhs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AJuEP6A9i3OboriWrHCVR+hNINmOReLAt8a+HpquobSTLZNqxCOyfiX7TSS1MSSSV
	 rbqfoNfRNCY9ACL0wBQacZG9CjTp2iiG29NStSZ1KQNMbK+3I7Sn8sNSDpA9o3++dR
	 W9mYo39kLRrUD0Mxeh9qKxpLIbLjSMSxIOk9ZNfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE279F801F7;
	Thu,  4 Feb 2021 18:48:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26399F80139; Thu,  4 Feb 2021 18:48:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D0DBAF80139
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 18:48:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0DBAF80139
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - reopened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1612460920035167933-webhooks-bot@alsa-project.org>
References: <1612460920035167933-webhooks-bot@alsa-project.org>
Subject: hdspmixer: Hardware output loopback toggle buttons
Message-Id: <20210204174843.26399F80139@alsa1.perex.cz>
Date: Thu,  4 Feb 2021 18:48:43 +0100 (CET)
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

alsa-project/alsa-tools pull request #4 was reopened from pfandl:

Hi, as promised in the [sound/pci/rme9652 patch](https://github.com/tiwai/sound/commit/da2a040ee7cfe1dd57d5bec7906cb979c5787a86) here are the user land changes which provide the user the ability to toggle the hardware output loopback functionality per output channel. I tried to hide the buttons for devices which do not expose the snd controls yet, but due to probably unnecessary struggle i cancelled that. Please let me know though should you want them removed for not yet enabled devices.

Request URL   : https://github.com/alsa-project/alsa-tools/pull/4
Patch URL     : https://github.com/alsa-project/alsa-tools/pull/4.patch
Repository URL: https://github.com/alsa-project/alsa-tools
