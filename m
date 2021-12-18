Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD4F4799FA
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Dec 2021 10:37:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73D791A40;
	Sat, 18 Dec 2021 10:36:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73D791A40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639820257;
	bh=g2yjfIGTZINeoHy6KIJck6iXTmu31rubWgWYHUA4/h4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QkZe4ri1TYQhBr1QpDdqzVp6J53uDoKB+/M2Gwm6Bi8Eu3awaIQlzlinv4BjTTTdV
	 rdfrk7cNIaPuVun960+6z2+vSv96iPdzqxkXfH2AiIk6G7uydDWpPcVOf7Gh8JmNj7
	 YusQydcSJLkNVzY5i1cUf5PiwpglyIISOWZmG0Cg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9E78F800B0;
	Sat, 18 Dec 2021 10:36:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F128EF80139; Sat, 18 Dec 2021 10:36:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2308EF800B0
 for <alsa-devel@alsa-project.org>; Sat, 18 Dec 2021 10:36:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2308EF800B0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639820178115478039-webhooks-bot@alsa-project.org>
References: <1639820178115478039-webhooks-bot@alsa-project.org>
Subject: ALSA update from 1.2.5.1 to 1.2.6.1 loses audio devices on Dell XPS
 9700
Message-Id: <20211218093625.F128EF80139@alsa1.perex.cz>
Date: Sat, 18 Dec 2021 10:36:25 +0100 (CET)
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

alsa-project/alsa-lib issue #206 was opened from roland-d:

Hello,

On December 16, Manjaro pushed an update which included an ALSA update from 1.2.5.1 to 1.2.6.1. This has caused users of a DELL XPS 9700 to no longer show any audio devices except the built-in speaker. This has been reported in the release post as well by a user named sparcplug.
https://forum.manjaro.org/t/stable-update-2021-12-16-kernels-kde-gear-21-12-0-gnome-extensions-libreoffice/94942/18

I can confirm that for me the audio devices also disappeared. A rollback to 1.2.5.1 and restart of the system brought back the sound devices.

I have no idea what causes this but wanted to report it and if you need me to test I am happy to do so.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/206
Repository URL: https://github.com/alsa-project/alsa-lib
