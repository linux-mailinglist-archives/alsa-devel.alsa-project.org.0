Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EBB63F35C
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 16:13:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F272B172C;
	Thu,  1 Dec 2022 16:12:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F272B172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669907591;
	bh=Bn9v6m8r20Br8Ry2dCurc002hpKwyusxJ1gFbPhdNpw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a8DWaxU7ZMlxwtf33K/RSHzMUbWT615WJccnRNzq++mL0nWT3D6qISuL1sCzuNu8t
	 DB/DJtxb6fwQlsUr9HAveQO/pKEDUVeIpRbuVGNixg3SbDkmq6WD23V/ZubQ+lZ9aO
	 PPkdjbo+bN3FlzeYRoiQ27D95HfboffT7TeW1SJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 889BEF804B1;
	Thu,  1 Dec 2022 16:12:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A17CAF8028D; Thu,  1 Dec 2022 16:12:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2EC45F80162
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 16:12:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EC45F80162
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1669907530305380106-webhooks-bot@alsa-project.org>
References: <1669907530305380106-webhooks-bot@alsa-project.org>
Subject: Update HiFi.conf
Message-Id: <20221201151213.A17CAF8028D@alsa1.perex.cz>
Date: Thu,  1 Dec 2022 16:12:13 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #246 was opened from junocomp:

This enables the speakers from startup, detects the HDMI audio and enables the internal microphone. I have tested this on 3 devices with Debian now and it seems to work. Can other people test it too please. If it works, it will be worth pushing it upstream.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/246
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/246.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
