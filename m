Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6823AA9CD
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 06:14:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A8B416C5;
	Thu, 17 Jun 2021 06:13:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A8B416C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623903273;
	bh=BvVAqJSQlix/SUgqpWoGdxG3S3QKQrAqaXP8u+Qca4E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JLxMoJWH1Z5Y/atm/ZdeQ1e1HXYaSFN3pbdbBaEJqbAaFX8IIo43x6nLCE/VxZc0y
	 +g+FynG+hVLAqbt59UBmB0KcOCSU3Rzd9QI79w/1dbedOT3nYMMttvZrZGXrjHUJBu
	 H5FnCXP8v8thGAO81mYtsdh3vHfr02nzrV4Ldt4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82717F8025E;
	Thu, 17 Jun 2021 06:13:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAD4BF8025A; Thu, 17 Jun 2021 06:13:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 48BD7F80148
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 06:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48BD7F80148
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1623903169197036028-webhooks-bot@alsa-project.org>
References: <1623903169197036028-webhooks-bot@alsa-project.org>
Subject: HDA-Intel: add Boost volume control for Headset Mic
Message-Id: <20210617041302.EAD4BF8025A@alsa1.perex.cz>
Date: Thu, 17 Jun 2021 06:13:02 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #101 was opened from jason77-wang:

Ubuntu Linux users complain even they set the input volume to maximum,
they still can't record sound with a pretty satisfied volume, they
need to run commandline commands to adjust "Mic Boost/Headset Mic
Boost/Headphone Mic boost" value to increase the input volume.

That is because the current ucm only defines "Capture Volume" to
control the input volume. Here we add Boost control, then users could
adjust both "Capture Volume" and "Boost Volume" through Pulseaudio and
Gnome.

BugLink: https://bugs.launchpad.net/bugs/1930188
Signed-off-by: Hui Wang <hui.wang@canonical.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/101
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/101.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
