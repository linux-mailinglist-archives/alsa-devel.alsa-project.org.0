Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4A71654FA
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 03:21:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB82216AD;
	Thu, 20 Feb 2020 03:20:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB82216AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582165296;
	bh=KEqPVV9AL7y6gEdZRkOd+qs1ADdrmWibtXzY5t2EFuQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SIm3BuCN+ouWtzySNigm5KIoBugfTN4ITPgduSUA6OP6LrEcCdzMqMHyCOGCppNBz
	 p7jTWJm4ag9VxD0pA7BSbg5qmyfNsDhoAVsaFQZ8ZvYC6XfGCBhgffVe7R4Aj3mpgg
	 M7VjtlJzX+TKLyarrnmakZiX9dWFyBKokEyjuhWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03393F80276;
	Thu, 20 Feb 2020 03:19:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60B11F80273; Thu, 20 Feb 2020 03:19:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 76721F801F5
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 03:19:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76721F801F5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1582165190266139030-webhooks-bot@alsa-project.org>
References: <1582165190266139030-webhooks-bot@alsa-project.org>
Subject: usage of snd_rawmidi_status_get_avail()
Message-Id: <20200220021953.60B11F80273@alsa1.perex.cz>
Date: Thu, 20 Feb 2020 03:19:53 +0100 (CET)
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

alsa-project/alsa-lib issue #26 was edited from MusicMaker:

In non blocked raw MIDI, is snd_rawmidi_status_get_avail supposed to return the number of available bytes that can be read via snd_rawmidi_read. (port is opened for read only)  It seems get_avail always returns 0 even there is MIDI data when using a read.  Else is there a(nother) way to find the number of unread received bytes in the buffer?
snd_rawmidi_status_alloca (&status);  	
snd_rawmidi_status(client, status); 
snd_rawmidi_status_get_avail(status);

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/26
Repository URL: https://github.com/alsa-project/alsa-lib
