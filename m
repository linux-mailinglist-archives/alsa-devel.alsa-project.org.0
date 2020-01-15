Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C92141CCC
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jan 2020 08:17:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FB1616C8;
	Sun, 19 Jan 2020 08:16:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FB1616C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579418263;
	bh=CRoOW0SJOKAp0/WN7WhWCI2tk7b5geCQ5a0oqMfOXX4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hwewN4si4L1dVS3uj/+bwUQr0aHojTwLlg0oCHFl9c3P5qeHw+I3focqKoYnrrO0i
	 eZtDYqRqDu84zdvOakYWtGYFKtmKHnC37vp8Zpl0ML+c94I1ozlMJmIoWqclyWxpMW
	 gfum5oPuJs0Ppf40T7n48iwXjxwcgZy0FIimqxrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21DA0F80274;
	Sun, 19 Jan 2020 08:14:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA494F800E9; Wed, 15 Jan 2020 12:57:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26DACF800E9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 12:57:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26DACF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ojab.ru header.i=@ojab.ru
 header.b="KR51ay5x"
Received: by mail-ua1-x92e.google.com with SMTP id 1so6124203uao.1
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 03:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ojab.ru; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nddCGnFcsW03zjGmL23O/qk8Jk0qrXfu8kieJSLgTQo=;
 b=KR51ay5xJcjsVPkMXjiN4574KJ9Wp/h9QUlsmHpVckzZf+/yC2FErv24sLJG76j3Pv
 6HH78UsGAlpLIXtprK8pcmIpgLJHIPnx+isQNltkNaUuVcn/qBs6Ba+B3RkmjblFGZE0
 wr7Rl4ao7AKbZTGfhweKIX6gaNBfaxBwGkRMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nddCGnFcsW03zjGmL23O/qk8Jk0qrXfu8kieJSLgTQo=;
 b=RxvXddPj4/YRVQ2hsCTUNNDfhpQHV9MXHBmcpHP47JH1H5VfGh/ZXmaRehrwqfdtyJ
 Q+AGkJwgkodCgzQHrWJMhjUbShHcHkW5pP9cpqspobn16NyVRxAbRiJaHFW+sreLOz/g
 lLgsCJW75UmBz/sOoVHs+BpE9i3WQ/LCea6vwh6/8JYDGQcP7CW5DImYbPhxTu8TczwG
 4JpPhl0emKh5RE/wmUmd1utIR1Hc45031/LtLnVNvzc7qpI1dZAUg2GYrCse2ELM/0tb
 mVF6pB3T2Y9b3NIv857Cm9IXk4yAJnBEs5Y7mN2xvt3Pw4ctsdVBCsDZQ5B3wy5GNsn8
 TwCg==
X-Gm-Message-State: APjAAAWzN5wQ5Xyjyt1BFv/mYLdIsSjGGxxgha4FiNBIhLn2Luant6pK
 gGwcJCPZ00aG08W+devt769heoKdgrLUSGMf2FKjoQ==
X-Google-Smtp-Source: APXvYqxGYB16wj3rhXSZFKPHpojQcWDonSjuAHFIx1TqtXkPJVqcVS7B1OZHp/V9HpOtt+JelW5Vm83oCwqw8XSFCcY=
X-Received: by 2002:ab0:7411:: with SMTP id r17mr14348263uap.31.1579089464851; 
 Wed, 15 Jan 2020 03:57:44 -0800 (PST)
MIME-Version: 1.0
References: <CAKzrAgTD2oeyajKGOaPea98vZ-uKJOn6uOqABA+CKtpvYpWYvQ@mail.gmail.com>
 <CAKzrAgTCE4btXr04pkvLUG6PPbtn9dm5h_9rjqDYG0HrTZ0zbg@mail.gmail.com>
 <87h80x8t41.wl-kuninori.morimoto.gx@renesas.com>
 <130af222-1086-ebcf-6a0f-9a390f9afbc3@linux.intel.com>
In-Reply-To: <130af222-1086-ebcf-6a0f-9a390f9afbc3@linux.intel.com>
From: "ojab //" <ojab@ojab.ru>
Date: Wed, 15 Jan 2020 14:57:33 +0300
Message-ID: <CAKzrAgRJZd4UZjt411vA8WwUv1KyVahVTNyUS8nA1TbKsA57dg@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Mailman-Approved-At: Sun, 19 Jan 2020 08:13:54 +0100
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] No sound since 5.4 on skl_n88l25_s4567
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

On Wed, Jan 15, 2020 at 4:41 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> Please post the results of alsa-info.sh somewhere so that we can take a
> look.

5.3.0: http://alsa-project.org/db/?f=d82b3ef237a5050dfb73231ba114e45a6a4420ef
5.4.0: http://alsa-project.org/db/?f=d922b77306a1287eae3624d241f3d46d347c8098

//wbr ojab
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
