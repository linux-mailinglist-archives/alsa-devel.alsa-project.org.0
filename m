Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC093937BC
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 23:04:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B800170D;
	Thu, 27 May 2021 23:04:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B800170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622149492;
	bh=df2I8BYnPJXweYhJI1dF7utExWrI9HBFbzi+Evd+j8Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ocp2+bDxyTAANDRPDHTpoWs9VP2WIRZ291b8+2b/wBx5urZ6KsPJf4fMXEfVtLDW4
	 JuicnOuYgNzubOCKEwvIg8cfcM6VinanH3GkESWxxEoT5dq8jj5S118Jktj6qDaFJ8
	 4n3CjxtXmi7iBwQ2Sx2rxR9fiyyjPReJxVkSJdlY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD1C2F8014B;
	Thu, 27 May 2021 23:03:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43F05F80149; Thu, 27 May 2021 23:03:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id F3D50F800F9
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 23:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D50F800F9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1622149399817282915-webhooks-bot@alsa-project.org>
References: <1622149399817282915-webhooks-bot@alsa-project.org>
Subject: No sound with Realtek ALC3306
Message-Id: <20210527210322.43F05F80149@alsa1.perex.cz>
Date: Thu, 27 May 2021 23:03:22 +0200 (CEST)
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

alsa-project/alsa-lib issue #139 was edited from dantahoua:

Realtek ALC3306 (Lenovo 13s Gen2 ITL i7), but seems common problem with any computer using this codec.
-Headphone, HDMI, BT working great.
-Speaker not working (but computer seeing audio output and sending audio, meter even showing audio in GUI).
Seems like something (amp?) is not turned, like missing something between speaker and codec...
Works perfect in Windows 10.
Tested lots different distro and kernel...

Computer report ALC287 but it is not! It's ALC3306...

Here is the alsa infos:
[Infos](http://alsa-project.org/db/?f=1f3e847b60bd38085e39e26d992ea8680dd90869)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/139
Repository URL: https://github.com/alsa-project/alsa-lib
