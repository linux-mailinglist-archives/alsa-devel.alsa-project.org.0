Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B85613575C3
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 22:19:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EE831671;
	Wed,  7 Apr 2021 22:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EE831671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617826753;
	bh=JuXtV3ZhriEwz3yS1AJZgFmIdcxyJUbqOwUkzSWS9SI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C0kSBnfjwm5jD62MXlBxvgLJX0BQaOe7vSK5nbXWsuolvh3wi6YRigHAozjOBYMrT
	 5Xp+/u4LfQ3IjLBVyMjzAzjav2FFsjrZ3esdjJ0QR3rGi78ieX3MglBjXgBrWm8+5Z
	 m5lM7vJmC9BFbmt8Xwzz/nGpbVNJqkIpbAOSnrEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47111F801F5;
	Wed,  7 Apr 2021 22:18:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C0E2F8016A; Wed,  7 Apr 2021 22:18:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAB0FF80162
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 22:18:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAB0FF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Y0EJieNP"
Received: by mail-ed1-x533.google.com with SMTP id ba6so14874275edb.1
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 13:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=El8GdD2d96inZ9wo4Q2FU1a1BUNbrhpV5VkOUXIOlp0=;
 b=Y0EJieNPnfNL3RGIfLOvJHVbH/l7+MS95W5Ck1ggWmvcJ7I5JztdDTEW2Or/tlrKng
 YqzeMEEoP9ntOJTjtEfliKTyHWpjoLFsElmnBVVe+7BoFdRcZzvBePKckgacgFhgLvRe
 elcb8ObR2Dp5bhzGZYkWUO0B19D1Cia5PLlOrMb0wlBMtnxtk+K2KZxrfhDVZ8igF2/Q
 b/SORLFfrIDF5jWGRi2POphLSVLo4yxpgrMmw0/XxPsEecr4ll6AhvJL/FKJQMYHDDFZ
 YCIByfPTw3NcZC5/EDWu86p5j4zkzwDAbCIUAQF8sRi0d2gMa6ziKGbrzOJSISFc6XCh
 ghQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=El8GdD2d96inZ9wo4Q2FU1a1BUNbrhpV5VkOUXIOlp0=;
 b=RBAaivu75P1xbW2nRGkCcFzapxktOKKCZaa+v/b/B5nz6NowLmCukX34J2LOCa7zG4
 2R02dqcGhm6EhMhS4hBJpx9dE5xnDAz6gRIxKkol6knfsttI7rW4QwA85wAZiuL05uGs
 rwErEfIjPX2xySaWS62VZRPzxB0vwejXmzN7yK7rBhDyHgYyXOKgTLp2GjNIzv0IQd0q
 SjM36t9TpR3+5zRnkd+Gi+3bGJqzGOJ3vZP9c3KqLCs6XJfFeMxoQK55SzadHjh85LYh
 AHU/SnOXuXOXiHzD7GBtUyFokB1biZB+cF/DO3vB/Wx9hErDCrT2Ak9sMc2cUyjYt2ck
 YNFQ==
X-Gm-Message-State: AOAM533SXyMGgrOXYh0i3UgMQVWM99Ws4B/G64/m/uaovUveIu2JEC8M
 ulGKvWxyLEFVQ5VZrmxj/dp+XDiCpPQu+8HDB7EhKHPxk4c=
X-Google-Smtp-Source: ABdhPJwASSAp/WZqxQyjLMEK/eyUDLBKw+LKeajACb2n4Sgql1p8tBD+33oMFCewS8T9MddQdvdsHpkkW4TMcekVhZ8=
X-Received: by 2002:aa7:dc0b:: with SMTP id b11mr6771976edu.124.1617826693823; 
 Wed, 07 Apr 2021 13:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
In-Reply-To: <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Wed, 7 Apr 2021 15:18:02 -0500
Message-ID: <CAOsVg8p5vefJhR=+8XE+3HoSG0DRp_DF_f9W4zKdzGfJwmGr0w@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Mike Oliphant <oliphant@nostatic.org>
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

I didn't notice anything wrong when I added my Roland device IDs to your
patch's method.  Its information can be found here, but I really doubt it
applies to your issue, other than Takashi Iwai's simplified
capture-quirk-only table patch (which Geraldo already mentioned):

https://bugzilla.kernel.org/show_bug.cgi?id=212519

Since I built my patch upon your previous patch, is there anything I can do
to test it on my devices for you?
