Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9F416F792
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 06:46:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C3BD1674;
	Wed, 26 Feb 2020 06:45:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C3BD1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582695962;
	bh=kWI2Z1ZTEatJGsq0Lyj6wU6/YlCL2cP9pZH/4+uJ/bg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q/WSwC541N8NRcCwOyxeFQ99KkdupVvq0JnF1jz+Q5JSS5ewvvtQ30D7uMDd9dpHg
	 tZooxrS7wqKbXG++UeMX3R7cJxOh5Hq7F+3sqhZR8+tpr0zSG3wsWy3axF/j3nrb0T
	 j+pfcyRfPklsj1SR3SJEWNTIACu0/EaBRtc0hv8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18DE4F800E8;
	Wed, 26 Feb 2020 06:44:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CA63F8014E; Wed, 26 Feb 2020 06:44:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.7 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODYSUB_1,SPF_FAIL,SPF_HELO_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B2E1DF800AD
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 06:44:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2E1DF800AD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1582695851008845091-webhooks-bot@alsa-project.org>
References: <1582695851008845091-webhooks-bot@alsa-project.org>
Subject: Most speakers don't work
Message-Id: <20200226054414.9CA63F8014E@alsa1.perex.cz>
Date: Wed, 26 Feb 2020 06:44:14 +0100 (CET)
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

alsa-project/alsa-lib issue #28 was opened from JonathanReeve:

I have a Lenovo Yoga C-930, which has a Dolby sound bar, and it seems that only one or two out of six speakers work. Is there a way I can make this work? 

Here's my alsa-info: http://alsa-project.org/db/?f=87931920f5a8cbfcaa9a2490b88d8c1ed6337e9f

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/28
Repository URL: https://github.com/alsa-project/alsa-lib
