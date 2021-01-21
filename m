Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B652FF694
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 21:57:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9FEF1937;
	Thu, 21 Jan 2021 21:56:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9FEF1937
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611262656;
	bh=h6v/uGsaVenVoZDioA8ViEkItsuPkkbxSfb7jG6SfBc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qQkhKAjita9ici4xjY0JnmxIrVjJKiU6k3yVgDoHUYK0kcrzGTAVNRMC6PkjMVCeI
	 ExEet/8lFFn/6jUvZ1ggdmkuS52uiF5yRSmYcI+0DcufTl7SnMBVUNQv13VBgIWzzP
	 QVT6pe46p5MN1PxNqc1IX3eCC9J2ayG4GsW4X4JE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CF12F80125;
	Thu, 21 Jan 2021 21:56:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DB02F80125; Thu, 21 Jan 2021 21:56:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C024EF80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 21:55:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C024EF80125
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1611262556395826101-webhooks-bot@alsa-project.org>
References: <1611262556395826101-webhooks-bot@alsa-project.org>
Subject: SOF: Improve dmic support
Message-Id: <20210121205601.5DB02F80125@alsa1.perex.cz>
Date: Thu, 21 Jan 2021 21:56:01 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #75 was opened from plbossart:

DMIC support seems incomplete for HDaudio (not handling all possibilities for cfg-dmics) and missing completely for SoundWire.

This is an untested draft just to get UCM3 feedback from @perexg and tests from @aigilea on an HP Spectre x360 device.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/75
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/75.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
