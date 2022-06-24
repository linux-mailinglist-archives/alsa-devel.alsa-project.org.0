Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A18E6559CB3
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 16:58:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 221F1185C;
	Fri, 24 Jun 2022 16:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 221F1185C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656082695;
	bh=UIFEeYLpr9guYKYqDkgfYUoxkCGfqIRK9mVSei4iAtI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f5PZLO8xI4jCU1FRNMVqX4hn/ee/Vow182cEXGBVDXp4ste2tSA7uDSCFmWHaKXjC
	 JrbojKVKw1gOdPRUIWxKzzyJVHN22kOB2QDro0uglkowsFHh/IrhRdrzo7+3RmOZkk
	 dHiS7M/YIgchdgd2Xw5mJPkwgqMDNuuV5kapyQXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D696F80107;
	Fri, 24 Jun 2022 16:57:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 283E6F80139; Fri, 24 Jun 2022 16:57:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id F04CEF80107
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 16:57:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F04CEF80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1656082627462064981-webhooks-bot@alsa-project.org>
References: <1656082627462064981-webhooks-bot@alsa-project.org>
Subject: UCM for Behringer UMC204HD not working
Message-Id: <20220624145714.283E6F80139@alsa1.perex.cz>
Date: Fri, 24 Jun 2022 16:57:14 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #178 was opened from maru-sama:

Similar to #177 I have problem with the ucm setting for the UMC204HD. The problem is that apparently no mixer is being created for the device, when trying to open the card with alsamixer it just fails with cannot load mixer controls. the mixer has been created though if I do not missread the output from alsa-info.sh (attached)
[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8977069/alsa-info.txt)

I am using alsa-libs 2.0.7 and the latest ucm from master on ubuntu 22.04 to make sure that I have all the minimum requirements.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/178
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
