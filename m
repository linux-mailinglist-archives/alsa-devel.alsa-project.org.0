Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D540296BD3
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 11:11:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2F5817FD;
	Fri, 23 Oct 2020 11:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2F5817FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603444272;
	bh=HmKv+ISk63qJXZOq/5Sp5uQA2xZwr+T0jibyIFHo7To=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i7+vbiWIXkFiO0qESJRtDEwtAzV23k/5wLXCGyugXAf1xuycRoYta8BhrmdTFkNk3
	 u89GZ6DHsNEsFGyoo1Oii0g1M0Aay84d6Edv8xPg7UqFnDaRCRAK2vB2q+Z5pi5q6H
	 NvHexlhKS0CEcgDKacDnOadfAVwjwspL+RTzeSiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56CEBF8025A;
	Fri, 23 Oct 2020 11:09:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D39F0F800BD; Fri, 23 Oct 2020 11:09:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1A965F800BD
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 11:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A965F800BD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1603444171719347000-webhooks-bot@alsa-project.org>
References: <1603444171719347000-webhooks-bot@alsa-project.org>
Subject: aplay: try to use 16-bit format to increase capture quality
Message-Id: <20201023090938.D39F0F800BD@alsa1.perex.cz>
Date: Fri, 23 Oct 2020 11:09:38 +0200 (CEST)
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

alsa-project/alsa-utils pull request #69 was opened from jason77-wang:

Recently users reported a bug, I tested it and found it is a common
issue on Laptop or Desktop machines.

The issue is users plug a headset and use "arecord test.wav" to
record a sound with default input volume, the recorded sound has
poor quality and nearly can't distinguish it is the sound we want
to record.

This is because the input volume is low and the default format is U8.
The driver records sound with 16bit, because the input volume is low,
most of samples are within (-256,+256), when converting 16bit to U8,
those samples will be 0x7f. This is called quantization noise and we
could only workaround it by increase the input volume or adding -f to
arecord.

But users want to record a better quality sound with default input
volume (after installing a new OS, the volume is the default volume),
and they don't want to add parameters to the arecord because most of
new linux users just use "arecord test.wav".

So this patch tries to change the default format from U8 to S16_LE/BE.
If the machine doesn't support S16_LE/BE, it still uses U8 as default
format.

Signed-off-by: Hui Wang <hui.wang@canonical.com>

Request URL   : https://github.com/alsa-project/alsa-utils/pull/69
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/69.patch
Repository URL: https://github.com/alsa-project/alsa-utils
