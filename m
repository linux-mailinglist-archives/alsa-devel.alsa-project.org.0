Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9865AD23F
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 14:18:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63D3484C;
	Mon,  5 Sep 2022 14:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63D3484C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662380287;
	bh=Cr1IcXeHldFzxffzu/QlzSBZS0u7fgjwCYCcOJCssx4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MPlv2k8bjGbDroile1P/wN653YnjqdU7raf3jV+yuZis2HDWrGe3QkZ95OlfOOlCL
	 FTX0x+Is38DPzPTNrsAET4ezZFBSXW+FGcqxKxw2S0B973xBoTvJrZmnBnEh/uA4BT
	 hEX2Q95Vfds1TgJ7YPXS/T65MiRhOf1iPdp7cKks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB3D0F8032D;
	Mon,  5 Sep 2022 14:17:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96CF5F80238; Mon,  5 Sep 2022 14:17:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E7CBF800E9
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 14:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E7CBF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="CwV2vJGy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B70461268
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 12:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA58C4347C
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 12:16:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="CwV2vJGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1662380211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cr1IcXeHldFzxffzu/QlzSBZS0u7fgjwCYCcOJCssx4=;
 b=CwV2vJGy8mCc88L4hEfJaJxZjl6MNE+EkYCQcn5mnte3BPuW4v8jztHt3VHCVqWegUT+Rc
 Sz3gxLtB4OlTZ31MIWwSx8ZX8nPKTvFZ2MJMF3SaChZC+uwXl941Skfen2aqT+kXbZADpK
 MCqR0kq/m4rGmgOQKJRNX8pGJnnzlgQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f0818f9a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <alsa-devel@alsa-project.org>;
 Mon, 5 Sep 2022 12:16:51 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 123so12527029ybv.7
 for <alsa-devel@alsa-project.org>; Mon, 05 Sep 2022 05:16:50 -0700 (PDT)
X-Gm-Message-State: ACgBeo0FVc2rqFxccFlaG1W/M8oaambkq3LJOq3U2YlZFWEaq9o351R2
 703AzsygHHH+2hyARIN3xPMXy1vFj4wj04m59SI=
X-Google-Smtp-Source: AA6agR40YDbjCBMD8pN4NCXW0CVx2QQgBqWwvWtpwyBDPcmXuzTa4eE+iPHNNQ3+6JEkZXUvnbb50POAMQdpmxGhgw8=
X-Received: by 2002:a25:1c5:0:b0:6a9:3222:72e6 with SMTP id
 188-20020a2501c5000000b006a9322272e6mr3013991ybb.351.1662380210011; Mon, 05
 Sep 2022 05:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220905101403.1435037-1-Jason@zx2c4.com>
 <87sfl6jbb3.wl-tiwai@suse.de>
In-Reply-To: <87sfl6jbb3.wl-tiwai@suse.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 5 Sep 2022 14:16:39 +0200
X-Gmail-Original-Message-ID: <CAHmME9oUtVgwtUY5afG5Yed1j6OVKwvLH=keCp63gDSOQRgDSA@mail.gmail.com>
Message-ID: <CAHmME9oUtVgwtUY5afG5Yed1j6OVKwvLH=keCp63gDSOQRgDSA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Don't refcount multiple accesses on the
 single clock
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Wim Taymans <wtaymans@redhat.com>,
 =?UTF-8?B?TmlrbMSBdnMgS2/EvGVzxYZpa292cw==?= <89q1r14hd@relay.firefox.com>,
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
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

On Mon, Sep 5, 2022 at 1:44 PM Takashi Iwai <tiwai@suse.de> wrote:
> When you load snd-usb-audio with dyndbg=+p option, does it show the
> new error message "Mismatched sample rate xxx"?

No.
