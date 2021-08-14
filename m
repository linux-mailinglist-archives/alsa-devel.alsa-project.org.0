Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7EE3EC41D
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Aug 2021 19:31:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17F2B1764;
	Sat, 14 Aug 2021 19:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17F2B1764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628962298;
	bh=ex9sbI0uhorEe2QO2fYo3RScsqUEG3nLmDz0W3rSHOY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SnlSfAsQ6rRZP34ssZHPrLUpmYsmRbG8W+FvkZifiyILaLendOncLIoElgfDEBhTL
	 DLWxLW6vvr+yE1bcL/83IqFIiJOb6OQVKc664QSGhN3p3rGT6YqrOP0PNffiqMWzL0
	 YJHdwzW1tc0ScM/O1JtAalKE3jW21Mjl2KbNkgWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52CB7F80279;
	Sat, 14 Aug 2021 19:30:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5FB9F8025D; Sat, 14 Aug 2021 19:29:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id EDD52F80127
 for <alsa-devel@alsa-project.org>; Sat, 14 Aug 2021 19:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDD52F80127
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1628962184419898033-webhooks-bot@alsa-project.org>
References: <1628962184419898033-webhooks-bot@alsa-project.org>
Subject: unable to play audio in a application running as root.
Message-Id: <20210814172958.D5FB9F8025D@alsa1.perex.cz>
Date: Sat, 14 Aug 2021 19:29:58 +0200 (CEST)
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

alsa-project/alsa-lib issue #170 was opened from PeaceNIRA:

ALSA lib pcm_dmix.c:1075:(snd_pcm_dmix_open) unable to open slave

what ive tried: 
unistall and reinstalling the app
adding root to the audio group

application:
war thunder

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/170
Repository URL: https://github.com/alsa-project/alsa-lib
