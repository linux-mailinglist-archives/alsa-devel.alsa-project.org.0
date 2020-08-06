Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 025BE23DA26
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 13:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FD6C82B;
	Thu,  6 Aug 2020 13:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FD6C82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596714929;
	bh=A6xkKaxFfY+DyF4Lv2eKfuP/S7t14MPNNP9R7LE9IMA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aw4XaaLMHeO9vhoDK6VH7YMvWS4CJJmPp8V0SK5mtBScSHlu9QzPGsnxZYO8cPbbw
	 1B1h2VgmQUvynQJkV/9O4jyylCRCDKzRZdoCjhr5YLX0ottkscW9ZDJrGqQaWIIL2D
	 xLP0hKkRzSb54F7+kAS6txWjeIG3hhUDkyWvdIFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1A4FF8015A;
	Thu,  6 Aug 2020 13:53:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7FB3F80159; Thu,  6 Aug 2020 13:53:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2F6CEF800B7
 for <alsa-devel@alsa-project.org>; Thu,  6 Aug 2020 13:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F6CEF800B7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1596714815273674965-webhooks-bot@alsa-project.org>
References: <1596714815273674965-webhooks-bot@alsa-project.org>
Subject: Correct conflicting mic in max98090
Message-Id: <20200806115346.D7FB3F80159@alsa1.perex.cz>
Date: Thu,  6 Aug 2020 13:53:46 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #43 was opened from jacobopantoja:

'mic' was conflicting 'mic' instead of 'headset', thus preventing correct configuration regarding microphones.

With this corrected, introducing a headset enables 'headset' mic and disables internal 'mic', whereas releasing the headset disables 'headset' mic and enables internal 'mic'

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/43
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/43.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
