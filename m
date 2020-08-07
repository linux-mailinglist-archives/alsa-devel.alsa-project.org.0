Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E393123EF1A
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 16:38:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72C6F1614;
	Fri,  7 Aug 2020 16:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72C6F1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596811085;
	bh=/8S8Cv/FG9TD4t9LwrAWG6D5QvAr34LeehYO4R5yFFs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uc28O9x9+trR+uu2jUAUnxdUAYG/rpY5zYRyoPFPn0RPCBio23KegNBLKfa/U6hCc
	 eqMI6Vgg4lph/sYjgYI0PzGLjAQpmdbAQtnDB4P9djqSUwbcE9GsWw5o6hxHPWVOPA
	 tPkDflw9G+tsio4Wp4tfjX9q2haxrKAz4dAziTeM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 991B2F801F7;
	Fri,  7 Aug 2020 16:36:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CD01F80218; Fri,  7 Aug 2020 16:36:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C3521F801F7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 16:36:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3521F801F7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - reopened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1596810972284259081-webhooks-bot@alsa-project.org>
References: <1596810972284259081-webhooks-bot@alsa-project.org>
Subject: Correct conflicting mic in max98090
Message-Id: <20200807143622.8CD01F80218@alsa1.perex.cz>
Date: Fri,  7 Aug 2020 16:36:22 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #43 was reopened from jacobopantoja:

'mic' was conflicting 'mic' instead of 'headset', thus preventing correct configuration regarding microphones.

With this corrected, introducing a headset enables 'headset' mic and disables internal 'mic', whereas releasing the headset disables 'headset' mic and enables internal 'mic'

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/43
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/43.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
