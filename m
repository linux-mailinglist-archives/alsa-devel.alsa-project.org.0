Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5A6515F55
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Apr 2022 18:48:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C546E827;
	Sat, 30 Apr 2022 18:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C546E827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651337323;
	bh=RyTvpy+xpNHSun3RlClaAqDovG8MWonIQwmp4Qj6ER4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IeBfn7Pl9qCTbZw3hHLAewkZd686Sie4t25On9XAxSlmFBOmTgHwNEk42cHTzjAop
	 QLggvfrMxTHwbwYyxzKyyZPN4ZK3Ugp4CqCTUqaEHswmmr3GnkdDEQ5oujQzkuE0xZ
	 6ANQDnIKOrzmnNKpUHX98AJq9VZMAqygx6dSUABw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E649F8012B;
	Sat, 30 Apr 2022 18:47:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F859F8012A; Sat, 30 Apr 2022 18:47:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7E6CCF80125
 for <alsa-devel@alsa-project.org>; Sat, 30 Apr 2022 18:47:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E6CCF80125
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1651337257584858894-webhooks-bot@alsa-project.org>
References: <1651337257584858894-webhooks-bot@alsa-project.org>
Subject: how can i swich between sound card without reboot in archlinux
Message-Id: <20220430164742.2F859F8012A@alsa1.perex.cz>
Date: Sat, 30 Apr 2022 18:47:42 +0200 (CEST)
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

alsa-project/alsa-utils issue #144 was opened from EN-KS:

currently there is no sound output when i try to plugin a usb 2.4G wireless headset in and then F6 to select the usb sound card unless I leave the usb adapter on the machine and reboot. the usb sound card was detected tho, Is this what it suppose to be? or any procedure that I missed?

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/144
Repository URL: https://github.com/alsa-project/alsa-utils
