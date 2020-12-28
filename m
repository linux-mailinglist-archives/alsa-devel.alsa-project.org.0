Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F682E36B9
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 12:42:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 183AD170B;
	Mon, 28 Dec 2020 12:41:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 183AD170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609155726;
	bh=kVmqgPs/wntwJXEtpqryoQLMyb3G+iWkUAaMVG2SVoc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u5FvFgCdssKQbwrH4183QUNSARlrwK73BkxF/Bb92twzX+7qdFHQtDzRegoca0aIw
	 ptK+QNBGH8CjSevXcrEAVrMkGGVarzwKrmktBDPz5XEjI5xerzSwKImH98TVAqO8nr
	 1aSmLRTghCxbPl+Lj/roEVYWNTG7uk0RiNI1iR1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7075EF801F9;
	Mon, 28 Dec 2020 12:40:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41892F801F5; Mon, 28 Dec 2020 12:40:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1F3D7F80143
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 12:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F3D7F80143
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1609155621883091927-webhooks-bot@alsa-project.org>
References: <1609155621883091927-webhooks-bot@alsa-project.org>
Subject: pulse plugin crash when stream has a hole
Message-Id: <20201228114029.41892F801F5@alsa1.perex.cz>
Date: Mon, 28 Dec 2020 12:40:29 +0100 (CET)
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

alsa-project/alsa-plugins issue #16 was edited from i-garrison:

Following up on this debian bug report https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=824850

Looks like this crash is caused by missing stream hole handling in pulse plugin. Pulseaudio change was done just before `pulseaudio-v3.0` release and this issue should be reproducible with all current versions: https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/commit/dfd44036b54d65314664622ff93dfd18eee03c7b quoting from there:
```
... let the caller decide how the holes should be handled, so
in case of holes, pa_stream_peek() will return NULL data pointer and
the length of the hole in the nbytes argument
```

Here in pulse plugin, if there is a hole in stream `pa_stream_peek` would return NULL buffer pointer but non-zero `frag_length` and later memcpy is happily trying to copy from NULL source:
https://github.com/alsa-project/alsa-plugins/blob/7028580da1db9a2362dd9b0631d7f667b373c313/pulse/pcm_pulse.c#L517-L534

Instead, pulse plugin should detect there is a hole by checking if `src_buf` is still NULL while `frag_length` is not zero, and adjust transfer result accordingly.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/16
Repository URL: https://github.com/alsa-project/alsa-plugins
