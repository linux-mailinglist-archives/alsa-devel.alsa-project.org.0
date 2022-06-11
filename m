Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94666547721
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jun 2022 20:35:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20E0018B1;
	Sat, 11 Jun 2022 20:35:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20E0018B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654972553;
	bh=dd2Kl+Oy+Z6jK6JYaccTODf32HqWeFvPOIFeZTzS8/Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rLAxRlRYyXcjrEGmJBlLdxeDJPSs/fdaz4yxCum7FuNYaBEEQ3Bi7kK9whjb40hCx
	 36U1X0aGkzNHv4OeeYtW57T/Q+Cjl9T5fJ7nZDChOcu6d+W0srohbMDbcJguB69kiS
	 MTDJg+MJfAlSsrzEjq0kQsEzo9YKmDUIzTgHrRmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95CE7F80271;
	Sat, 11 Jun 2022 20:34:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 021F3F8025A; Sat, 11 Jun 2022 20:34:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1010EF80107
 for <alsa-devel@alsa-project.org>; Sat, 11 Jun 2022 20:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1010EF80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654972488169918060-webhooks-bot@alsa-project.org>
References: <1654972488169918060-webhooks-bot@alsa-project.org>
Subject: Asus Z690-E: No Profiles Available in alsa-lib 1.2.7-2
Message-Id: <20220611183452.021F3F8025A@alsa1.perex.cz>
Date: Sat, 11 Jun 2022 20:34:51 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #168 was opened from BrothersRM:

Upgrading alsa-lib from 1.2.6.1-1 to 1.2.7-2 seems to have broken support for my motherboard's sound card. 
Downgrading the package did resolve the issue.

Device is listed in `lsusb -v` as : `Bus 001 Device 002: ID 0b05:1996 ASUSTek Computer, Inc. USB Audio`

My hardware configuration uses speakers attached to the front, surround and subwoofer ports on my motherboard.

Some interesting things I noticed while it was broken:
- Plugging headphones into the front-panel headphone port allowed me to turn on the rear speakers, though they didn't seem to use the correct profile. Max volume was far lower
- Though the device was listed as unavailable, I could manually enable the rear speakers using pavucontrol when front headphones weren't plugged in
- Trying to run speaker-test on the device failed with 'no valid configuration'

Please let me know if I can provide more information / do any testing.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/168
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
