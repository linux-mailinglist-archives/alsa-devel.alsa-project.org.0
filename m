Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A183536E99
	for <lists+alsa-devel@lfdr.de>; Sat, 28 May 2022 23:34:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08230173F;
	Sat, 28 May 2022 23:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08230173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653773660;
	bh=2QsIpZW0rHXg9dpvOz7aZtcvSGY290Qt+UrlrWuxru0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kBZOZY3xpK3iLaK1czYsRIfbb69WiV4RIsAEK9SgmDBYImmx8NOGw29KZoWyFull2
	 smzgknuIANBw1J0xGXdZzSvphOERo1fLGXdAEAZuShBtHDJUzC12B2kENlKoV8pucw
	 bdk4wQvqblypwkeDwF18xDC1fVSO47dMkX0qi5zs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77B26F802DB;
	Sat, 28 May 2022 23:33:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43D92F80279; Sat, 28 May 2022 23:33:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C3DC3F80124
 for <alsa-devel@alsa-project.org>; Sat, 28 May 2022 23:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3DC3F80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1653773595802241087-webhooks-bot@alsa-project.org>
References: <1653773595802241087-webhooks-bot@alsa-project.org>
Subject: ucm2 profile for Behringer Flow8
Message-Id: <20220528213320.43D92F80279@alsa1.perex.cz>
Date: Sat, 28 May 2022 23:33:20 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #160 was edited from smangels:

- kudos to Pekka Oinas for supporting me finding the right settings
- provides an UCM2 profile for Behringer's digital mixer Flow8
  configured into "streaming" mode
- 2 stereo outputs, 1 stereo input
- prepare filenames for Flow8's recording mode (10 chan input, 4 chan output)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/160
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/160.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
