Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 869E060BF29
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 02:01:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EB0B1E72;
	Tue, 25 Oct 2022 02:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EB0B1E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666656070;
	bh=JMFxiXyL/GeWdBmfac8B4/BY9EwtWcq3HbCN2vFoDeo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P4wA6cbqtRRs+OA/uj2T+J6C4gGF1cwJmkeFFYpwasuryedpWdFOYYZr0hbE5uQRS
	 2wYmHeCTZH+zblELnUFVI/zIZat6VYL/TbnfcJ0DmHipy35NgKm7IjrGDmOIFwtCc7
	 xM/upXjxEsJt64Ii+0Mqltp4fZW+oA0dly0qPMJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 681C2F80240;
	Tue, 25 Oct 2022 02:00:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66560F80533; Tue, 25 Oct 2022 02:00:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B6B1F80431
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 02:00:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B6B1F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="pWW9K8vh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4DDD6165E
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 00:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0365C433B5
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 00:00:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="pWW9K8vh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666656002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e6ouPlU6BGs4kPFwrmXeWjPLmjyMG2MThW4WJxW1s7s=;
 b=pWW9K8vhmx6hLrKIXvek8LsHCDkuswwo10zuOMeGTRGrWVUzvBTZFfdqJt9q4uX6gpGm6O
 w08+t/qymWPsTJYHo60ToERIBwjsXbDDGyqmOAKfAQvG7NEBx6p//dadLs/rg0Jzbjj113
 gRs8RsQki54FTm0Csnarmxo4VAk9V1Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a80f57b9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <alsa-devel@alsa-project.org>;
 Tue, 25 Oct 2022 00:00:02 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id 1so9424362vsx.1
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 17:00:02 -0700 (PDT)
X-Gm-Message-State: ACrzQf25W5YLcYB0ueST4a4Nx5xTJyb0m4G7DiEDllxe/299u5GxcNDf
 gMNB38UXEAolWcV65F/FrSmzvlrR3nb/ADtbDeU=
X-Google-Smtp-Source: AMsMyM4uJtrhUNYc7Adm4TVrz9Gz+yFl4Ma2o6YtJnG1sietFGIpDFqeO4WLPFF0JwDGBtUuGk9vZZzh1HHJCZPQS+M=
X-Received: by 2002:a05:6102:411:b0:3aa:329e:18c8 with SMTP id
 d17-20020a056102041100b003aa329e18c8mr1060016vsq.70.1666656000860; Mon, 24
 Oct 2022 17:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221024162929.536004-1-Jason@zx2c4.com> <Y1b/iNMncyKI/W5c@ZenIV>
In-Reply-To: <Y1b/iNMncyKI/W5c@ZenIV>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 25 Oct 2022 01:59:50 +0200
X-Gmail-Original-Message-ID: <CAHmME9q2JOGMKNrXqK7q=xfZdciy89P+GT0eGHVmVqOvKDYA8g@mail.gmail.com>
Message-ID: <CAHmME9q2JOGMKNrXqK7q=xfZdciy89P+GT0eGHVmVqOvKDYA8g@mail.gmail.com>
Subject: Re: [PATCH] ALSA: au88x0: use explicitly signed char
To: Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
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

Hi Al,

On Mon, Oct 24, 2022 at 11:11 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Oct 24, 2022 at 06:29:29PM +0200, Jason A. Donenfeld wrote:
> > With char becoming unsigned by default, and with `char` alone being
> > ambiguous and based on architecture, signed chars need to be marked
> > explicitly as such. This fixes warnings like:
>
> It might make sparse to STFU, but it does *not* resolve the underlying
> issue:
>
> vortex_adb_checkinout() returns a number in range of 0..31 on success
> and -ENOMEM on failure.  Quite a few callers don't bother to check...

Yea, I saw that. I assume that the places that don't check don't
*need* to check. But maybe this driver is junk and other bugs lurk.
I'm not sure. Either way, I think this change is certainly an
improvement on the status quo. I don't intend to develop further on
it, but feel free to send patches atop once this lands.

Jason
