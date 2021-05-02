Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63490370AD4
	for <lists+alsa-devel@lfdr.de>; Sun,  2 May 2021 10:57:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE6EF1687;
	Sun,  2 May 2021 10:56:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE6EF1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619945846;
	bh=XDyLDFs/RFsqPnhWgV/4yh4RdP5LN3AIN04r+cJmUa0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZyTTc+tAkj/0OiK7W+J5gl3MPfSzNxCrg7If6Vgbw1iesOM9kvJUQAgx3SfZjDS1Q
	 wKHvH9h+tHifVY0vLXGhvPvXIrRHAzAmj+DoLIda+D8CzfRN8LaREvY24UtvDVtva1
	 SSwasSVH1C9HTHaj4QPDEIUvsXiWshUQHvaCKrA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52834F8014D;
	Sun,  2 May 2021 10:55:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5C2EF8021C; Sun,  2 May 2021 10:55:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 8FF5EF8014D
 for <alsa-devel@alsa-project.org>; Sun,  2 May 2021 10:55:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FF5EF8014D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1619945748249073029-webhooks-bot@alsa-project.org>
References: <1619945748249073029-webhooks-bot@alsa-project.org>
Subject: Surround sound
Message-Id: <20210502085555.D5C2EF8021C@alsa1.perex.cz>
Date: Sun,  2 May 2021 10:55:55 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #91 was opened from mchemweno:

Is there a way to enable surround sound?? My laptop is a HP Envy13 so it has 4 speakers. Tried using the pulse/daemon.conf to no avail.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/91
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
