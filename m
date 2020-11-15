Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B36572B3821
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Nov 2020 19:54:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F71F1699;
	Sun, 15 Nov 2020 19:53:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F71F1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605466442;
	bh=GmbznsxWDGW3LOGY45OuiRo2uKc6Sz1fSXaNqxlCIek=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lMmGhd2YDr2JdqH4rtpUw5mRdFrq1ofHxBdAHsYVxA7VkQ3RCypKV1FFATaSQmjTn
	 CqHF8s+s484hX/eXg6GT+vJEWF7pJ9e5NzNUKf6smPjqahf/A2Gu5QRJZWv6TSm1Ab
	 ZQ1swa306xtEjWCFTCihxhZDTWkZ5Z3bwmCJi28U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91F87F800E9;
	Sun, 15 Nov 2020 19:52:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08E52F801F5; Sun, 15 Nov 2020 19:52:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5376CF800E9
 for <alsa-devel@alsa-project.org>; Sun, 15 Nov 2020 19:52:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5376CF800E9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605466341431607008-webhooks-bot@alsa-project.org>
References: <1605466341431607008-webhooks-bot@alsa-project.org>
Subject: USB Audio: Xonar U7 MKII needs `iec958_device` entry
Message-Id: <20201115185228.08E52F801F5@alsa1.perex.cz>
Date: Sun, 15 Nov 2020 19:52:28 +0100 (CET)
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

alsa-project/alsa-lib issue #100 was opened from ndl:

`USB-Audio.conf` includes V1 of Asus Xonar U7 card but not [MKII version](https://www.asus.com/ch-en/Sound-Cards/Xonar-U7-MKII/), the section `USB-Audio.pcm.iec958_device` should be extended to include the string

        "Xonar U7 MKII" 1

without this S/PDIF output doesn't work.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/100
Repository URL: https://github.com/alsa-project/alsa-lib
