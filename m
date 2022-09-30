Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E875F1507
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 23:39:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4745316BA;
	Fri, 30 Sep 2022 23:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4745316BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664573962;
	bh=tusUStU1kCMoTV8C8IxmLL86gwzFNICWcH6XWVTfTHk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SEEGYVzwe0mWqUGIuf6bcQ3HLfSC6LXue9Iwv3abCjWqzfxLXJR4F63kfjUJwZjYc
	 XWDg9+FaSGvY2fQghbEPeYG2dp0xGOtriplK+dQTXFIPULWpfazQu6+mnvQ2e2opm9
	 CFhjHEg2STU+uGxuf45DQSp2VpAOy5ORma8s/mXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E171F800E8;
	Fri, 30 Sep 2022 23:38:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68F3EF80155; Fri, 30 Sep 2022 23:38:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E1652F800E8
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 23:38:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1652F800E8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1664573896127619028-webhooks-bot@alsa-project.org>
References: <1664573896127619028-webhooks-bot@alsa-project.org>
Subject: issues with the Arturia minifuse 1 sound card. i would like help with
 converting the minifuse 2 UCM config to work with minifuse 1
Message-Id: <20220930213823.68F3EF80155@alsa1.perex.cz>
Date: Fri, 30 Sep 2022 23:38:23 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #220 was opened from Ali32bit:

greetings.        so i have a sound card with multiple outputs and some loop back channels.  it is USB complaint but those extra bells and whistles  cause ALSA to think its a surround sound device when its actually just stereo.  and this actually impacts the sound when i play games on it cause sounds from behind are basically muted.   and thats the case with some music too but less obvious
here is what alsa_info generated for me too : 

http://alsa-project.org/db/?f=b6db7723ffa65f32b93297109bf1f8e4d853cf4e

there should already be a minifuse 2 setup so if possible please adapt it to minifuse 1 or help me convert and install it myself.     the hardware is mostly the same but it has 1 input instead of 2  and no extra midi ports in the back.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/220
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
