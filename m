Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4E91E110B
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 16:55:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C710E16B5;
	Mon, 25 May 2020 16:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C710E16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590418505;
	bh=65CJ+DbAipukWjylk2xV+eb63JN4JNyOUaRoqB9I72Y=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p/Y2KdJZ75Qjw9q8Guzu1aPHTDvqoDldH2fQ3V8xxc7PP6uhwIpAvf+D/d+Frb7B2
	 ZrWE29/KC69guhWvS6+nVWA7wHOmL1Qftu0wg6jOOoy06XeRi3jsFYV992uEptCsdN
	 2B/X7JKoQuOWdYXFZjn5Dj58qZWLZ8Bu4S0Q/VJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6244F80100;
	Mon, 25 May 2020 16:53:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5710CF8016F; Mon, 25 May 2020 16:53:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D210F80100
 for <alsa-devel@alsa-project.org>; Mon, 25 May 2020 16:53:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D210F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="INezxxTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1590418400;
 bh=65CJ+DbAipukWjylk2xV+eb63JN4JNyOUaRoqB9I72Y=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=INezxxTcGyM0eAZNjZddeEe8ZenYlhiwieK1V59xkhZ9vkE4x5bXfEP/8dRlYoJmk
 jXOWccvk4qvq6TCjVxAe1jrtM3noz617gbOCH8k6qf+84WW0AwuyREtrtQY7Heq5uH
 NE+g10d3tAzKoLYcPgSAf03sywCVueze0x8Kwthg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.20] ([188.195.215.33]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5wLT-1jeZuu3UmR-007UjC for
 <alsa-devel@alsa-project.org>; Mon, 25 May 2020 16:53:19 +0200
To: alsa-devel@alsa-project.org
From: Clemens Koller <clemens.ml@gmx.net>
Subject: BUG: aplay (arecord) vu-meter overwrites /dev/null
Message-ID: <f61154a3-b211-5f50-ef9b-365ec864d0a2@gmx.net>
Date: Mon, 25 May 2020 16:53:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
X-Provags-ID: V03:K1:CATrMSUIvd/DOY74GOh96wAZn7I1VZXeKI7aFvISh70qN7ocXgg
 MoBH7YMVh8KA+A4EAjnsC/KDnwFiTLN4WVUCXHVnFD7nJXCWQ3oF7gwzud7mHJpdN9mPEqy
 AYUPBS3KkQX5RLXDLItqaEJrHSMxO/h9sabJ00tmVTqTiY7u3d/kqHO7PYewJf3ZFcu8NeT
 zS6sOgL/Ap9CFAH9mQ6zQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7rPajMbUTPs=:5LjzbfcUEQiNJ1ZUQ/+GQV
 tv5UtjKoSeIxrJDa8drXCRQEJDvDKJcaNiRabpQv+UnVY77uTzseY4JlFTjP9oNUcJ1oePns1
 jQwHovx0e/kSQSpdFMxbZiPt6uZzA1qVgY8wFomgGWgTUHCWPEJ3qnSNQTroIDCXwvV08+9Wk
 jVF2hfOAN475FIfClsnWI5cFziIUFQ0Ikk/cqaE/PvemLNaYU6BWzbCeX46Ff/gRBavNJETmb
 fIcJ3lQsX8uthsy9AwSrhbQhGEgYkCAhS7EG7UMnR4zXSZiJDa6EviiBG/82jiEd80+nl1fgK
 x4HBa6bvhq3B9oXXILZnT/dt6YtVYYt1GJKUNkArNs2dfE8fMZbxiET+wMydOBFlMTsMK7ybZ
 f/z/1vq2I1rBb4kzJ5SOEsKlhw79Ovb2fUhHeqnbEf9YiIHpcXRD2n//qNn8q90ZjURtMbbRi
 xRiQEjXVQW+PZ0N6uDaXUQqO0YJ/3MxWEr5Aiv37PvqF5WqUvU65CMYQYulqjtXBvZBXJP/IZ
 NNKUDjxKjD+CXrQ6WdQcYn3IFHGA2e6n+d1NG6PQDqnfieTvE07X24M6e8MMzZhZv7JcyTiWi
 PyZK+cI1L0aAFBMSD1YAFl+rN10Mw0AsImQXPQVS4ic5jfmodKG03dl5ZwMrxOz7jXc0fnOSF
 HH5zICYzuX5dkHunZIjEpIlk1LbEoz2y+5t/eDh2Z8Ljl/Wih2pNQCSgPB6XcwyF5rK8ZGbJY
 TXdJoP1ZRcsqnze//brcLJv12q3m79kVtPe1VfsnTtx+ig7571G1eK3f2yezJNJJbyYTle4Wz
 SNZvhTruwkbU4AaBL11SinzpARSkaCehOiE/YVIq3ICZq5cLD4K4v3US33ZcORKdKivkpJX6Q
 K1K9hJ+Cm9AnxDITnrc8ypQZrPYH8F6ejMKebhyKbbnx/7rQOyZqC1mW5MvAEOlJPy+STBgiQ
 R0H92AqpR2E7AMsFB4XBt1c/1qhmOdV8z7ykr/V7RavjbPDOWy3n4dAjBDp+fQ37ZVi9FYety
 y1IavdqZipfiU9kBunxdXIiQV1AbxFWuAElZ+KUEHyJ6beMHZPljXB+bU4kaidt7rUsAT/ruK
 izcHYVbM9JxiOT4qaXOE7v3aZW/v+PvblAyjgDoFzPA98v9mQChXv7Mv5Uc40gQYi0cNka5wO
 huhnxhHgBb1koEzFPuUi9DcgPs4W9bIqnAs2MAYD3YXXtQBXygWqLejIn4ltP+QuIYd//gfTZ
 V91tINcWGRpqoYmEf
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

Hello!

I am using the vu-meter of arecord v1.2.2 for monitoring remote computers audio input, which is usually (according to web search) done as:

$ arecord -f S16_LE -r 44100 -c 2 --vumeter=stereo /dev/null

This command was run as root, which is obviously not good, but still... every once in a while, I ran into some state, where /dev/null gets overwritten with (corrupted) audio data immediately upon start or after a long time (i.e. when max_filesize is reached).
I would expect that this is not the desired behaviour.

I was reading some code at: https://github.com/alsa-project/alsa-utils/blob/master/aplay/aplay.c#L3152

So I guess I could use:
$ arecord -f S16_LE -r 44100 -c 2 --vumeter=stereo - /dev/null

instead. But I am still not sure not to corrupt /dev/null when
* max_filesize is reached or
* we get a SIGUSR1 which will trigger recycle_capture_file

Can somebody shed some light on how this is supposed to work? This code is very old and the documentation is still missing some bits and pieces there.
There are also some commits trying to fix this behaviour - i.e.
https://github.com/alsa-project/alsa-utils/commit/85827fbb642463ab724a9471a7a88f93fa2a217d

I am able to assist with further debugging if necessary or dig deeper into the code. But I am not too familiar with this grown piece.


Thank you very much!

Clemens Koller
