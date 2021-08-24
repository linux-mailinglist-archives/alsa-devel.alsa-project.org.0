Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCDD3F5B59
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 11:51:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B59CA1677;
	Tue, 24 Aug 2021 11:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B59CA1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629798713;
	bh=EaYSRKh2tHN1kEXKcJq3BMetCuHyxR5zXHLcOOKbpuI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O0hzhtp1Am0fBo5u8NqBJ8Hk5uJiyZAvSsvyXVtJ2qhPua9aJ7OvqbfVoGlJIGQd2
	 jarLKZD4Pn78Wzdt2qj+76TclzfOUA5qcZNR3d+WNcQYFlnaUjotWpGvzESB2GmcTJ
	 epHi25kXxciRf3v6owY2Q8sopSn40Tw6la26fRbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E625F80424;
	Tue, 24 Aug 2021 11:51:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CFAFF8032D; Tue, 24 Aug 2021 11:51:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 20713F80087
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 11:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20713F80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1629798654458581924-webhooks-bot@alsa-project.org>
References: <1629798654458581924-webhooks-bot@alsa-project.org>
Subject: Timestamp
Message-Id: <20210824095101.0CFAFF8032D@alsa1.perex.cz>
Date: Tue, 24 Aug 2021 11:51:01 +0200 (CEST)
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

alsa-project/alsa-utils pull request #108 was opened from folkertvanheusden:

Added -T / --timestamp (with parameter "realtime", "monotonic" or "raw")
    which adds a timestamp before each received message when using --dump.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/108
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/108.patch
Repository URL: https://github.com/alsa-project/alsa-utils
