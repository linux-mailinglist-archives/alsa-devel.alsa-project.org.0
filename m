Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D51163CDB1
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 04:08:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E91511657;
	Wed, 30 Nov 2022 04:07:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E91511657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669777721;
	bh=BI3Z9dPBmCk5iVYsRyfiot/s8BguXHflyKX05PO4JeY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BOwt+sw0lBfGLY0GLx15GqCnJaUxyzaAN7uxs4C5u00hoAyR05+YMud1trjHY2/bH
	 m2y4TgOJ6ALGfIImltDggCrqUkK99o1NphZj6uovveKU+qB31MqVWoswuWrV7Jn0Q8
	 p49tJQnOYGjbtkputP/c4WPNzf4NviHLRK0tEiZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97CD1F80118;
	Wed, 30 Nov 2022 04:07:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E3F2F80166; Wed, 30 Nov 2022 04:07:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_FAIL,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 64BF8F80166
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 04:07:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64BF8F80166
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1669777657172286034-webhooks-bot@alsa-project.org>
References: <1669777657172286034-webhooks-bot@alsa-project.org>
Subject: arecord leaves doubled audio at end after a SIGTERM
Message-Id: <20221130030743.7E3F2F80166@alsa1.perex.cz>
Date: Wed, 30 Nov 2022 04:07:43 +0100 (CET)
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

alsa-project/alsa-utils issue #179 was edited from chconnor:

Hello: I issue a command like this:

`arecord -t wav -c 1 -f S16_LE -r44100 -D hw:2,0 test.wav
`

It works fine, but then I hit ctrl-C to terminate. This works, but the file has "junk" at the end that repeats the last fraction of a second. E.g. in this demo file I ctrl-C when I say the word "one", and the recording is like "three, two, on-on":

https://caseyconnor.org/pub/audio/arecord_bug.wav

It's as if it is mistakenly writing a buffer an extra time?

(In my total ignorance and total lack of qualifications, I traced the code to [here](https://github.com/alsa-project/alsa-lib/blob/d28e8cb29485cc93f741b01dc65893c798359963/src/pcm/pcm.c#L7544), but I get lost and can't see if anything is awry...)

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/179
Repository URL: https://github.com/alsa-project/alsa-utils
