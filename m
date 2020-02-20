Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2361F1654FC
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 03:22:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB9E1166E;
	Thu, 20 Feb 2020 03:21:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB9E1166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582165361;
	bh=lB0dAJopOD70I9sOuBBn9oKUyC0f5/TFfoXCXh6acj0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MJEWPkCQ6ZX5keYwAcoja+lvM/uUEZ0Dtd4oSF8UVYa4M69fzzGkal+YvFjlUmqpN
	 lYqDUCigj4D4/4ZyEwc9n8wCQnjVUtH4z43g88kp9l1ju0w9Hjayfa45yhnOMnQObU
	 Hh/9o7yqv/Ac2DR0EnViAOwsOKs+kHt1ixq0FbTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B005F80290;
	Thu, 20 Feb 2020 03:20:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E358FF8028F; Thu, 20 Feb 2020 03:20:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 94EC5F8028D
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 03:20:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94EC5F8028D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1582165218427489996-webhooks-bot@alsa-project.org>
References: <1582165218427489996-webhooks-bot@alsa-project.org>
Subject: usage of snd_rawmidi_status_get_avail()
Message-Id: <20200220022020.E358FF8028F@alsa1.perex.cz>
Date: Thu, 20 Feb 2020 03:20:20 +0100 (CET)
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

In non blocked raw MIDI, is snd_rawmidi_status_get_avail supposed to return the number of available bytes that can be read using a snd_rawmidi_read. (port is opened for input only)  It seems get_avail always returns 0 even there is MIDI data when using a read.  Else is there a(nother) way to find the number of unread received bytes in the buffer?
snd_rawmidi_status_alloca (&status);  	
snd_rawmidi_status(client, status); 
snd_rawmidi_status_get_avail(status);

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/26
Repository URL: https://github.com/alsa-project/alsa-lib
