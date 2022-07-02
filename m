Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3558563CEB
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Jul 2022 02:02:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0775416B6;
	Sat,  2 Jul 2022 02:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0775416B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656720177;
	bh=pSOMRLy/GubJ8MuEBvwegRGOVN+ghhk5zLJhYAiDrr4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YNJdjOOAvYMDAIsNfSALUS1ELuI6+dgmmNu+HLlRu35oWj3wQ9N+Ssp05Efcg0yGa
	 3IQ/50QHI47a8Odzt1PLpAfz36DAbXEUrxNgvcpF8MIv0yIYHLlWOBVZRMauOa+T12
	 OY/dlSIvQpqvBzet/OZiL9HTGp9Ttx3EpazSjVSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62A4FF80107;
	Sat,  2 Jul 2022 02:01:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A16B6F80155; Sat,  2 Jul 2022 02:01:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 406A7F80107
 for <alsa-devel@alsa-project.org>; Sat,  2 Jul 2022 02:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 406A7F80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1656720112710935116-webhooks-bot@alsa-project.org>
References: <1656720112710935116-webhooks-bot@alsa-project.org>
Subject: Crackling on playback - Mackie ProFX6v3
Message-Id: <20220702000155.A16B6F80155@alsa1.perex.cz>
Date: Sat,  2 Jul 2022 02:01:55 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #182 was opened from emaxoda:

Hi. I tried to add support for the Mackie ProFX6 and while it technically works (before I was getting one a 4.0 surround profile instead of the two output devices it should show) I get this crackling sound on playback whenever I try to play any sound, the craclking or distortion can be heared alonside whatever is on playback. I tried playing sound with aplay and paplay and got the same craclking noise alongside with the played track. 

[alsa-info](https://github.com/alsa-project/alsa-ucm-conf/files/9032058/profx.txt)

https://github.com/emaxoda/alsa-ucm-conf/commit/51b9b6f1a81ab55e16bba12a370afc518d961550

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/182
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
