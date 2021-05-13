Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E56037F103
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 03:49:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4A5317DB;
	Thu, 13 May 2021 03:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4A5317DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620870545;
	bh=2jGXoJMd4VfxNYtbxEopTJcmXUBP+SSTklXeAkRTwN8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H1NN9263HQjvLCYg+tyTBJ2rDAMEBMPB6w7gUX3MY6XGQBW1tFlXNsQ8AWXruupes
	 E5PkDZzqBdpKtehBJOMKL0uT4WXiy48dAjkQ9546ALeL/Nx8dXUecmq0kToylPQCwD
	 kl5MAUH4qXWCU7aDXzlHlVCpLZzmeuCtxDkgDgrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E644F8016B;
	Thu, 13 May 2021 03:47:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D8E6F80163; Thu, 13 May 2021 03:47:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 67476F800E3
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 03:47:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67476F800E3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1620870451312767029-webhooks-bot@alsa-project.org>
References: <1620870451312767029-webhooks-bot@alsa-project.org>
Subject: pulse.conf overrides ~/.asoundrc for default
Message-Id: <20210513014735.5D8E6F80163@alsa1.perex.cz>
Date: Thu, 13 May 2021 03:47:35 +0200 (CEST)
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

alsa-project/alsa-lib issue #134 was opened from flatmax:

On many systems pulse audio sets the default device to pulse. This overrides the settings in ~/.asoundrc.

This is further complicated by using a tool like pasuspender and finding that pulse's default device is still set and overriding ~/.asoundrc

It would seem more empowering to let the user override the default device in ~/.asoundrc and have that take effect over pulse.conf which resides in /usr/share/alsa/alsa.conf.d

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/134
Repository URL: https://github.com/alsa-project/alsa-lib
