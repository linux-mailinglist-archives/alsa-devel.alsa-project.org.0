Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F96598383
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 14:57:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62D831655;
	Thu, 18 Aug 2022 14:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62D831655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660827427;
	bh=EgheZtYjuHdfV9Mpsjm+dBdGrnifs/sBwfyBJlLH+sk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=liKCqB+884XPry6ZYz04QjRl6WkMBL9ehjyCUst8DnVxEjywYgzX+uNnjpZgORJ3o
	 Qd5lWnks7E4SmzCAVvKmQ1Kz0QMJBkRNZawPiDWwni0rhB/RaC5Hx6gCg1xXoajePZ
	 jFLfsGZeX/0x2XWdvhOor04LS4ctUCfldyI+tuxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B0D7F800B5;
	Thu, 18 Aug 2022 14:56:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EE5CF80430; Thu, 18 Aug 2022 14:56:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C7675F800B5
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 14:56:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7675F800B5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1660827363369755030-webhooks-bot@alsa-project.org>
References: <1660827363369755030-webhooks-bot@alsa-project.org>
Subject: Add ASUS ROG Zenith II Extreme configuration
Message-Id: <20220818125606.8EE5CF80430@alsa1.perex.cz>
Date: Thu, 18 Aug 2022 14:56:06 +0200 (CEST)
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

alsa-project/alsa-lib pull request #263 was opened from nabajour:

This points iec958_device to the correct PCM device.

complements this [ALSA kernel patch](https://bugzilla.kernel.org/show_bug.cgi?id=211005).

Request URL   : https://github.com/alsa-project/alsa-lib/pull/263
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/263.patch
Repository URL: https://github.com/alsa-project/alsa-lib
