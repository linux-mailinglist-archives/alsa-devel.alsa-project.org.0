Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4935ACFBE
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 12:16:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 074041660;
	Mon,  5 Sep 2022 12:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 074041660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662372967;
	bh=mje1XfzUXneXB8mOvRlrEb7IGbPQZX311/9cO2XB3ms=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tas8l3BmdxpAA7PuVwGlnET09Sj5RDItPz+Hbe9QXGg0Bv4dXpKopVY6kgdP0BkHW
	 ELU8gDoFRO1EYsIcqhvsVNnuG7rWCIsyZ5TG8QygT/EDxI4Dnhf1FrEG6mVMVgNT2z
	 /xk6vGrfC0Mt1YZ7walU3pyE+YqlGwJFDYYqp9pI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ED5AF804D9;
	Mon,  5 Sep 2022 12:15:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B796F800E9; Mon,  5 Sep 2022 12:15:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B3E7F8032D
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 12:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B3E7F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="iF/hwuDG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D7166611A0
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 10:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE50C433C1
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 10:15:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="iF/hwuDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1662372897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mje1XfzUXneXB8mOvRlrEb7IGbPQZX311/9cO2XB3ms=;
 b=iF/hwuDGlyJ7eWQltgqfG3TiDJDjCCB/UKOXmD1D3u9UEDPGBWqdOJkXNdoGrXfrGXjzbO
 OG/nPpmqP1eQXUWwAuJ3L2HcRsmAy1Z+5Zd7psDJBWza/LQhGHgOhz+va2FA8HneCn5vWP
 YlBAZwhkbwCx3puRcg9Y1DxICXzMwBY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ce27c5f0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <alsa-devel@alsa-project.org>;
 Mon, 5 Sep 2022 10:14:57 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id c9so12127277ybf.5
 for <alsa-devel@alsa-project.org>; Mon, 05 Sep 2022 03:14:56 -0700 (PDT)
X-Gm-Message-State: ACgBeo0kte6DWsOIIo77RYkbCDCNC/o0yz3sM4Kvc3ifRHUE+Lzrgnlv
 ByF6zZN7BZO9te84fKtywBE60P4P3tQY5imiVdE=
X-Google-Smtp-Source: AA6agR7q5r7oCDcBrWFAFYKqzwheYzc2NIErQgZWSkOyoAvffB/WFpVuq3cduMy2sDFnCHzIcbGLc7br9EjEDoW3E9g=
X-Received: by 2002:a25:8d02:0:b0:696:42f8:fa6f with SMTP id
 n2-20020a258d02000000b0069642f8fa6fmr29088730ybl.365.1662372896087; Mon, 05
 Sep 2022 03:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220516104807.16482-1-tiwai@suse.de> <YxXIWv8dYmg1tnXP@zx2c4.com>
In-Reply-To: <YxXIWv8dYmg1tnXP@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 5 Sep 2022 12:14:45 +0200
X-Gmail-Original-Message-ID: <CAHmME9qJfZ06RjBc7h1LnEfngOp0w_sn6xH-7XQgFqH6jcRG1w@mail.gmail.com>
Message-ID: <CAHmME9qJfZ06RjBc7h1LnEfngOp0w_sn6xH-7XQgFqH6jcRG1w@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Refcount multiple accesses on the single
 clock
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, 89q1r14hd@relay.firefox.com,
 LKML <linux-kernel@vger.kernel.org>, Wim Taymans <wtaymans@redhat.com>
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

On Mon, Sep 5, 2022 at 11:59 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Can we revert this for the time being and backport the revert to stable?

I sent the revert here:
https://lore.kernel.org/all/20220905101403.1435037-1-Jason@zx2c4.com/
