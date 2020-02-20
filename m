Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DFB1654EE
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 03:17:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E69C516AE;
	Thu, 20 Feb 2020 03:16:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E69C516AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582165043;
	bh=Z+sASznJh+bslUT6kPFjf4BDi5wm37g/BQfES+J7E7E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fp7FTJpZPz/JbPzziqpYR6CJv5pMluqS5kKdm4lohsSP2R02zWhlbBy/bPS8XVgHa
	 JsTYow0htckiPICSG6yWD8ZT20EMLokQp4heMAvwICmfg+R1mFCKr3/t2hhC5wvugE
	 Bw9f1iUqMXGIJ9ZK8ROYFRFVer6SBRRbSuH4F7uU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9C27F80276;
	Thu, 20 Feb 2020 03:15:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 278A5F80273; Thu, 20 Feb 2020 03:15:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 842D4F80142
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 03:15:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 842D4F80142
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1582164934834173918-webhooks-bot@alsa-project.org>
References: <1582164934834173918-webhooks-bot@alsa-project.org>
Subject: usage of snd_rawmidi_status_get_avail()
Message-Id: <20200220021538.278A5F80273@alsa1.perex.cz>
Date: Thu, 20 Feb 2020 03:15:38 +0100 (CET)
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

alsa-project/alsa-lib issue #26 was opened from MusicMaker:

In non blocked raw MIDI mode, is snd_rawmidi_status_get_avail supposed to return the number of available bytes than can read via snd_rawmidi_read. (port is opened for read only)  It seems always return 0 even there is MIDI data when using a read.  Else is there a(nother) way to find the number of unread received bytes in the buffer?
snd_rawmidi_status_alloca (&status);  	
snd_rawmidi_status(client, status); 
snd_rawmidi_status_get_avail(status);

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/26
Repository URL: https://github.com/alsa-project/alsa-lib
