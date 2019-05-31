Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F192D315DE
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 22:10:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB8EB1680;
	Fri, 31 May 2019 22:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB8EB1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559333407;
	bh=sz0H6GK5dT4EZuTg8zgezQAIEf5pB9GfP+ilArDj6/M=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uPJcYeD7byTrffwxw3nHdaBEzAHE+TOTQNIoOroEb6XKqCKrzEZy4xjozAef1uad6
	 gaZLJ96xgjOi9kmzkFDFNqZQIJzuds4/W6SZ2KLuOTduBRWcDjfdOESw+5zgpIBmFH
	 cPe0eDIKqzpn2N0N2WFzDsMujfwmMVtB0LX2Sly0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8CE8F89732;
	Fri, 31 May 2019 22:06:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B7AEF896E5; Fri, 31 May 2019 11:19:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05A52F8072E
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 11:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05A52F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="up4pZ9za"
Received: by mail-ot1-x32f.google.com with SMTP id n14so8515226otk.2
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 02:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=J9tS0afbQeGMMsxpoThhYftM8X7KtmtGxUFKWwShBBk=;
 b=up4pZ9zakN9gXZzAICrHYbk6VGfB2xfGhcKlsWBVgIzyesNIaZ7iqpU3DTcA1Q0kvG
 72+vYoQGQipRpq6o9DKIak+DV08DbrA6ThAoAWknF6krCF9JnEiuRlTgYa/gcZ9ReA4Q
 kAJqE6cVSzqFrVoIRKumntEDHCqmutN7h9bqYaIegZdoIejg6dN8NlucPbwtmwEszaT9
 24Pl7GaqgIvXn40YqgsfExSQ3LSS8hxh/khkx6a1neVEmlZ7kzl/oGryq7ge9b58qa4K
 ZKpCpaqmb6wtxqfH++FRJJSXDOeu9wNs0PKJRUatDiQl38DW1PRTq7/EszA1u9FMEumr
 ekzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=J9tS0afbQeGMMsxpoThhYftM8X7KtmtGxUFKWwShBBk=;
 b=irK433qUF73XuEOPaXH8F680W5UnpVRWu2uhrVoVaHVP0TJ6BlKlZiBpKgdfSCmzJn
 GM+cmSUAtq6VNhm5GgaxsRkiy7CUGUDH41lRYGZbwT+xzYoX/bODGoXkmc02rbWimSYw
 zCPkUOtJJttlz6m8i5OXnL7NndqFg5RD3lweFmMr4Oq3XgMX+ntx6xW+10w4uqkrg84i
 6n729wXXCKOW0mEmlt9WyjMc9pJFJ/ptWmJwxU9myz0XovzYjsh2myxxkHY0D3UCCKpL
 K3vmYW2++GwbO1GyA2hEaxVUHhMaJz1QzIofbML05MekPGPG9X4REWKG/5A0b+00br7V
 8usQ==
X-Gm-Message-State: APjAAAVmFPYpI7whFS7jm0okNp9ex7A5VbjsI8EIlOGZfUE5Ym/M+H6M
 UGI8CRHMQ3TjZsldYTgTBc9/YXQ3mcfiC+U2ZxC5CQ8I
X-Google-Smtp-Source: APXvYqz6p9vijUBDHiKhJsGMtyyRi2e2u5lPNI2BZyXXz80IgSKCFlPxO8m3vOnP3NVkM/RQQHUwgkdQYJ9Jq6MVan0=
X-Received: by 2002:a9d:3ba4:: with SMTP id k33mr1004340otc.68.1559294337759; 
 Fri, 31 May 2019 02:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAEMX6L2gUUTTtQ9OPfPZe0JkUk_ur+d9+Tk7yymcWZesmmsUjA@mail.gmail.com>
In-Reply-To: <CAEMX6L2gUUTTtQ9OPfPZe0JkUk_ur+d9+Tk7yymcWZesmmsUjA@mail.gmail.com>
From: Martin R <martin.rajwa@gmail.com>
Date: Fri, 31 May 2019 11:18:46 +0200
Message-ID: <CAEMX6L3USMp8d4OAot-8MdC_2nRidi6NHZXz90oLWF6G3XYbfg@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Fri, 31 May 2019 22:06:35 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Fwd: Problem with aplay params
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,

I have built aplay using github repository
https://github.com/alsa-project/alsa-utils/ as well as
https://github.com/thesofproject/alsa-lib. Now when I try to run it by
"./path_to_aplay/aplay -C -D hw:0,8 -r 16000 -f S16_LE -c 2 tmp.wav -vvv I
get immediate error message saying: arecord: pcm_read:2150 read error:
Input/output error.

Why is it failing? The system aplay/arecord works OK - only the one I built
fails with above error.

PS: system aplay version is 1.1.8 while the one built by me is 1.19

Regards,
Marcin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
