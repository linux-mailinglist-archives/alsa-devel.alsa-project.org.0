Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC58B20F3A9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 13:37:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8057B1663;
	Tue, 30 Jun 2020 13:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8057B1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593517078;
	bh=bxKN3vAdNWXnt0CK7YkWLOLnsWBGKSWVjsCMpMitgmA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sW37bB1T+4BNfX15v3SocTl9xvgXBZmHg1RCoUosh6mjo746dBOpsWUuau98x6Uph
	 A5uy1daugNQdNVX4g3mEu8eNzo6DVS+ZghERAHOhwBDrlW/H7V0fStGHNubtiqy3qp
	 iAD3zVrD0AuBD8OERMi00dViM1DnbiecYhbR/mBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5318F8022D;
	Tue, 30 Jun 2020 13:36:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30E39F801F2; Tue, 30 Jun 2020 13:36:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 65AAAF80135
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 13:36:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65AAAF80135
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1593516970720158100-webhooks-bot@alsa-project.org>
References: <1593516970720158100-webhooks-bot@alsa-project.org>
Subject: ucm2: Fixes for moving DragonBoard UCM files.
Message-Id: <20200630113615.30E39F801F2@alsa1.perex.cz>
Date: Tue, 30 Jun 2020 13:36:15 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #37 was opened from Srinivas-Kandagatla:

Hi Jaroslav,

Nico just noticed that you have moved and renamed all the DragonBoard ucm2 files.

We have below few issues with that patches:

1> DB820c belongs to APQ8096 SoC, so it should be moved to ucm2/apq8096 folder rather than apq8016.

2> DB410c belongs to APQ8016 SoC, so it should be under ucm2/apq8016 rather than apq8016-sbc.

3> All the board specific ucm conf file names with actual board file are now replaced with SoC names, like DB845c is replace with sdm845. Any particular reason for doing this? Are you suggesting us to use some matching on card long names to include correct board files from top conf file? Can you provide us some pointers on how board specific config files should endup looking like?

This PR fixes (1), and (2).

Thanks,
srini

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/37
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/37.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
