Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE1E2FF7ED
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 23:31:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 509ED19FE;
	Thu, 21 Jan 2021 23:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 509ED19FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611268267;
	bh=AbmWnn2ruaLUE6yAN/XKZRRzBGtEXNGSqz9+dZK7Uhs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BVILbyb8fovQTxS5vNXBWVXeUKX6TZMz+p28qRJE6m5ImC6VYX76pSou2UKF5DrGW
	 MjFospPpYqLlQ0w/S85H0i06Y2gT4EqxfLisqaUkStIjMZNTBbWz6Wx+SicpDi2Q5Q
	 q6djGSOoUFw0LFbk288gdKuJYI8beMJm1ZlsGn9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7EFCF80162;
	Thu, 21 Jan 2021 23:30:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 258B1F80272; Thu, 21 Jan 2021 23:30:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B3F01F80255
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 23:30:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3F01F80255
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1611268201369405031-webhooks-bot@alsa-project.org>
References: <1611268201369405031-webhooks-bot@alsa-project.org>
Subject: [Regression] Game "Rise of the Tomb Raider" crashes at launch
Message-Id: <20210121223006.258B1F80272@alsa1.perex.cz>
Date: Thu, 21 Jan 2021 23:30:06 +0100 (CET)
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

alsa-project/alsa-lib issue #116 was edited from Oschowa:

The the native linux version of the game "Rise of the Tomb Raider" crashes at launch when it doesn't detect a working pulseaudio server and it falls back to alsa-lib directly. This is a regression, the last working alsa-lib version is v1.2.1.2 and bisection yields 5ee5ef31b5ff3f as the first bad commit. The crash happens when using "real" alsa hardware drivers as well as when running on the pulseaudio-alsa or pipewire-alsa software plug. Happy to provide more info if i can.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/116
Repository URL: https://github.com/alsa-project/alsa-lib
