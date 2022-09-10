Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CE55B44E1
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 09:24:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 235CF169B;
	Sat, 10 Sep 2022 09:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 235CF169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662794680;
	bh=6TdfJR7rY5jw8Xml2Wu5vzXdqO9cZVXwgjMlj8lAHxU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OZjj21s6dhNteWorQ7EveRspBt9nMTdvsY/R+vup8r79Urpzzvdt4Ikle7ipg4cdb
	 Jqp99xsB8FZHgcE28fWFUUUPwJ41NCnrp/EGBq78TNvLnPHFFpWcKHo1eaA1sIrgVb
	 4GwLjTLzPgy1Og/5HLHJ94ttt+pExQO+Sc34dU+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2825EF8049E;
	Sat, 10 Sep 2022 09:23:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34653F8011C; Sat, 10 Sep 2022 09:23:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C50FAF800B8
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 09:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C50FAF800B8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1662794606599087954-webhooks-bot@alsa-project.org>
References: <1662794606599087954-webhooks-bot@alsa-project.org>
Subject: aseqdump crashing after running for a bit
Message-Id: <20220910072329.34653F8011C@alsa1.perex.cz>
Date: Sat, 10 Sep 2022 09:23:29 +0200 (CEST)
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

alsa-project/alsa-utils issue #170 was edited from BlastBolt5:

I have been working on a script to control pipewire sources and sinks using faders on my midi keyboard but aseqdump keeps erroring out with

> Port unsubscribed 128:0 

I don't have any other midi device to test it out and see if it's specific to this conrtoller but I'm using the Korg nanoKontrol2. If i need to provide anything else just let me know.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/170
Repository URL: https://github.com/alsa-project/alsa-utils
