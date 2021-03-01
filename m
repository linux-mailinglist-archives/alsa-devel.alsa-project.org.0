Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C1632774C
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 06:58:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4006E167F;
	Mon,  1 Mar 2021 06:57:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4006E167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614578308;
	bh=3UmKPT8kn62B1toOuoVA8CGfx08hNPwMx0GcY/nCh54=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bN1WWYyh0DlWkLVAA15ZAkxhAGSF4GDR3HNnZeWUHah5pKULnqhSm80H5/p/hJbTF
	 DmwzGBiYt1LcBBQb3XKovrS88FXTG7KsKq3DtT5wU9lrfpRF4lzPAPhw2idQ00PjQo
	 NjaTXFZ02Lg5yQnmg53Mlw2OIHW8s3/bap0/o+Yk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 783E9F800E0;
	Mon,  1 Mar 2021 06:56:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8FA4F80257; Mon,  1 Mar 2021 06:56:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A9B93F800E0
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 06:56:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9B93F800E0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1614578202265048981-webhooks-bot@alsa-project.org>
References: <1614578202265048981-webhooks-bot@alsa-project.org>
Subject: conf: USB - add "Cmedia Audio" to USB-Audio.pcm.iec958_device
Message-Id: <20210301055654.E8FA4F80257@alsa1.perex.cz>
Date: Mon,  1 Mar 2021 06:56:54 +0100 (CET)
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

alsa-project/alsa-lib pull request #122 was opened from jason77-wang:

Otherwise, there will be a "Digital Output(S/PDIF)-Cmedia Audio" from
Gnome UI, but there is no this physical interface on the card.

Signed-off-by: Hui Wang <hui.wang@canonical.com>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/122
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/122.patch
Repository URL: https://github.com/alsa-project/alsa-lib
