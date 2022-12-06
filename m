Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F7E644E95
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 23:40:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A10518D7;
	Tue,  6 Dec 2022 23:39:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A10518D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670366424;
	bh=bqAoilqxXfNUqkjautlTAnHoAvETKuc1C5QwzlAtzGo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PI2ZGRnioqlG+bYpWanXfIzn+vNCU1qdZDAee0LHft9TUcdCBvWMGwt3J/MER5gX/
	 IoQUKofEpAHXh1u1nd1GW5xkMNL45oFSO48xOhWbmm2tOIMlV9Pfo5WefT7mxzCU8C
	 Tt0IH1A+5IJxuNw4dCDpWf2m+s4kPfFnwICH2Dj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1748CF8014C;
	Tue,  6 Dec 2022 23:39:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB5E6F8014C; Tue,  6 Dec 2022 23:39:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,SPF_FAIL,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 607F4F8014C
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 23:39:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 607F4F8014C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1670366361915508986-webhooks-bot@alsa-project.org>
References: <1670366361915508986-webhooks-bot@alsa-project.org>
Subject: Add: 0b05:1999 ASUS ROG Strix Z590-A Gaming WiFi
Message-Id: <20221206223924.AB5E6F8014C@alsa1.perex.cz>
Date: Tue,  6 Dec 2022 23:39:24 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #247 was opened from 13r0ck:

This works great for 5.1, but I cannot get the line in to become a side left / side right. I'm not sure what I'm missing?

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/247
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/247.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
