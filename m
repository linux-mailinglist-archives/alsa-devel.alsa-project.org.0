Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7057C5F2155
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Oct 2022 07:07:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 121851FB2;
	Sun,  2 Oct 2022 07:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 121851FB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664687268;
	bh=ckK8r+zTSCauabWQHRin6GAAltiHQmFrC0WUbw+U9JI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D0ivMw2zq0R9Lqz1fTLdekTgQ2kkMGK48aJvm1f73UQAXOJjepBy/evPxfaEF/RFB
	 BTT8Fq4GwIyq0RVwvtMl1nl9XsNkNGd1KjlLVWwF5h+QCQRRM2evnAWMHTkiMhTpr0
	 iyqgNViZOWKrEQ2kMt/0560Bnn9euMgFbIxOa2Ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86545F800A7;
	Sun,  2 Oct 2022 07:06:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA8BEF80246; Sun,  2 Oct 2022 07:06:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9AD23F800CC
 for <alsa-devel@alsa-project.org>; Sun,  2 Oct 2022 07:06:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AD23F800CC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1664687203350027084-webhooks-bot@alsa-project.org>
References: <1664687203350027084-webhooks-bot@alsa-project.org>
Subject: USB-Audio: UR24C - add Steinberg UR24C (USB0499:174d)
Message-Id: <20221002050650.AA8BEF80246@alsa1.perex.cz>
Date: Sun,  2 Oct 2022 07:06:50 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #221 was opened from goremil:

[Yamaha Steinberg UR24C 2x4 USB 3.0 Audio Interface](https://www.steinberg.net/audio-interfaces/ur24c/)
[UR24C_Operation_Manual_English.pdf](https://download.steinberg.net/downloads_hardware/UR-C/Manuals/UR24C_Operation_Manual_English.pdf)

Add UCM2 profiles for UR24C (USB0499:174d):
1. Direct: 4.0 out (FL,FR,RL,RR) + 2.0 in (FL,FR)
2. HiFi: 2x stereo out (FL1,FR1,FL2,FR2) + 2x mono in (MONO1,MONO2)

[alsa-info.sh](https://alsa-project.org/db/?f=0c5414fb5d96287c51a6479b537123440f4b35b8)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/221
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/221.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
