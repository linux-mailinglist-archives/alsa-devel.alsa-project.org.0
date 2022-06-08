Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C4C543BAC
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 20:44:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24BAB1B2D;
	Wed,  8 Jun 2022 20:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24BAB1B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654713847;
	bh=OwrRkjAndIN1eGR4geSs0u9bzVeTXjr5YvYeH+47FDg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GSXZy5W+Y+11xN20G/H5aTGNMs+DNH9zhcEgzICwo8isTyPNAeeaBihkTywNhbpGB
	 uBY8hP4a2qsEAOQfnGNczEBRrV2x+UVK3lh9xjPa8hUH/0t/qNzzuTkvUml1zFX+35
	 lC7LQX47sn78NDU/8Y6G4pa2DRD5ss9DqmXW87I8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63FCEF8026A;
	Wed,  8 Jun 2022 20:43:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C53A9F8024C; Wed,  8 Jun 2022 20:43:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E4631F800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 20:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4631F800C7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654713784042361021-webhooks-bot@alsa-project.org>
References: <1654713784042361021-webhooks-bot@alsa-project.org>
Subject: no input from razer headset microphone when using RAZER BASE STATION
 V2 CHROMA
Message-Id: <20220608184307.C53A9F8024C@alsa1.perex.cz>
Date: Wed,  8 Jun 2022 20:43:07 +0200 (CEST)
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

alsa-project/alsa-lib issue #236 was opened from fiercebrake:

Greetings everyone!

So I currently have a razer "blacksharck v2 pro" headset that i connect to a razer "base station v2 chroma"

The razer base station is properly detected/listed by (arch) linux.

Problem is though the card and mic are detected and listed, the mic has no actual input at all.

For the mic to start showing/taking any input I need to manually unplug and replug the headset from the base station.

The jack in the base station is a 4-pin 3.5mm (TRRS) jack

This article/fix below seems to 
 alleviate the problem, say 50% of the times. So I am wondering if there is anything else I can do via ALSA to completely fix the problem
 
 "https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture#Correctly_detect_microphone_plugged_in_a_4-pin_3.5mm_(TRRS)_jack"

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/236
Repository URL: https://github.com/alsa-project/alsa-lib
