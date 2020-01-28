Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D234A14C2F4
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 23:30:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3912B1673;
	Tue, 28 Jan 2020 23:29:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3912B1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580250622;
	bh=5aVFRRgYnWno60qBg45mXEz0HtTZEmuDJKW+H59kub0=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=omMpJCFQssqMB//WCmsoVbEDXHUzFXm2Ko/vheDIvZUG6Li9Mc1A1vdh9WSi/l7MR
	 LQXVMO2t9QhTNw4yIK937s4HmxXDp8c3WdZ1+RPe6PM0aqCPU6DnUUq8WOa+xTGU6j
	 JqeaSKMLDeQ0srM9x5bZkZSXe+jWHxBHhEQHwjVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A682F800FF;
	Tue, 28 Jan 2020 23:28:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16E41F80150; Tue, 28 Jan 2020 23:28:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28A83F80123
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 23:28:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28A83F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JnBRA1xX"
Received: by mail-ed1-x52b.google.com with SMTP id m13so16462811edb.6
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 14:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Tab0u8Zp/wRWZyyTRm9QlUdkOU05qv/SPBWJKk6h5S0=;
 b=JnBRA1xXbp40jmT8+/5AUEdWcwMOZISLM033h5+zMAN1uoncfRATKovFqxsjhBzL1R
 b9TG6yKfwtLncLIthunVhzV4KCMUls/pIkBmfUbJLfXkNEHKfrZ7pXO/3hdIMdJ9BKpm
 ndgbvu8+AzX7O/Bvp6belWGYQjR3eb2ZuIdf5qpD0dmbGpXuIlmo5Z1Evxk2v5rsq2WM
 jJKPLaCeO6aTLdApyLzxZBQ5QtqD0DbZGVUNmYyo4fkXwajpDRfh6rg+NgojGPZmT/a1
 0Z6P6Sg70lr3lbA/2PUTOFswLdfaTriT99ilwfSROcB06KJnREsoxcBf/Nuh3H9zCPB2
 Ss3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Tab0u8Zp/wRWZyyTRm9QlUdkOU05qv/SPBWJKk6h5S0=;
 b=f6Z0sqcWAo6xpDoeNdfOGj9Id8fGu2+qDv/xxWe+NJqs9cm698ZKouSyM7a6h46K71
 57F7jcCYgjW3YTJZTZ28DnmnMLMBeJfrQaGqz/JJzwI+ww9lJ/BPnje7HvI2s8r8NY0Y
 04PVxsQ2w2ZJJqhSqxHEC/QY1bh97HcsxC3Q1LAGuUU2nfNPfjRGMVJ70GKsBdq7ruNI
 QmOHcnuD5lZ3Auq0yk5M4252KZY3acV7Fbhel7WDvKEecpHMeLuenEI9ea0+Rd4W/ErK
 VyoodRbcLedYNFPsKobFbSvwSapZmwzNhWxqFF5KHVrYYbaoaVWQK3SZh+Hc7QWkBzKp
 Rjjw==
X-Gm-Message-State: APjAAAXDCb4JdHmogiCbj69LX44Y9b9bv3gkRzZWOOXuro6/+nKpgdSk
 F47hBeD36Xd4hnx8QFJPO5Kezk8aAx+fV7NyKMM=
X-Google-Smtp-Source: APXvYqxlrwEZqDPpDMnxRiyPLWtRJ+deqlwPTEV6znfaFA84m+iFLzidD0ZuiKTVgSJo8mohFTu6lpfveWRPEF+kAxc=
X-Received: by 2002:a17:906:82cb:: with SMTP id
 a11mr5133478ejy.206.1580250513072; 
 Tue, 28 Jan 2020 14:28:33 -0800 (PST)
MIME-Version: 1.0
References: <CAK5Eu=tVQjBn+YvsHOLqSEir5aV8Q0hA1OgFiJZYdqnspdMz-Q@mail.gmail.com>
 <CAK5Eu=snx3s9r9hoeF4Th0V0YXJYa=7PKUqDn3W4NdWZben-zg@mail.gmail.com>
 <CAK5Eu=v2x+zFhCygKq8DPWd+CH5JTpZEayg=k2NvaTY7DUNA9g@mail.gmail.com>
 <CAK5Eu=ucuW6Pp=+j7afPoYgPUdFXjh+PZ-PK6mc+m61M80ZndA@mail.gmail.com>
 <20200119164335.GA11974@workstation>
 <CAK5Eu=sS8kMe5hCPgTx+V6AjzcCo3vN73tEQ1f=kY03Y2_CcJQ@mail.gmail.com>
 <20200120141901.GA32472@workstation>
 <CAK5Eu=tX=87xD0xt-UdrDWTsxw9Y4xOrvAV8pHKyYC7tau==XA@mail.gmail.com>
 <20200125031801.GA5554@workstation>
In-Reply-To: <20200125031801.GA5554@workstation>
From: Daniel Jozsef <daniel.jozsef@gmail.com>
Date: Tue, 28 Jan 2020 22:28:20 +0000
Message-ID: <CAK5Eu=tV+T4OupWNToLE8nfG00Y68kiTRcUGia9YOFtzYQNSRg@mail.gmail.com>
To: Daniel Jozsef <daniel.jozsef@gmail.com>, ffado-user@lists.sourceforge.net, 
 alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: Re: [alsa-devel] Toneweal / Trigaudio FW66 device
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

Hey Takashi,

I'm a little baffled by what my device just did. :P

$ ./firewire-request /dev/fw1 fcp 0x016002c0000100ffff00
response: 000: 0c 60 02 c0 00 01 00 ff ff 00 00                .`.........
$ ./firewire-request /dev/fw1 fcp 0x016002c0000101ffff00
response: 000: 0c 60 02 c0 00 01 01 ff ff 00 00                .`.........
(<- didn't fail)
$ ./firewire-request /dev/fw1 fcp 0x016002c0000102ffff00
response: 000: 0c 60 02 c0 00 01 02 ff ff 00 00                .`.........
$ ./firewire-request /dev/fw1 fcp 0x016002c0000103ffff00
response: 000: 0c 60 02 c0 00 01 03 ff ff 00 00                .`.........
$ ./firewire-request /dev/fw1 fcp 0x016002c0000104ffff00
response: 000: 0c 60 02 c0 00 01 04 ff ff 00 02                .`.........
(<- didn't fail)

In fact...

$ ./firewire-request /dev/fw1 fcp 0x016002c0000105ffff00
response: 000: 0c 60 02 c0 00 01 05 ff ff 00 03                .`.........
$ ./firewire-request /dev/fw1 fcp 0x016002c0000106ffff00
response: 000: 08 60 02 c0 00 01 06 ff ff 00                   .`........
(<- shorter)
$ ./firewire-request /dev/fw1 fcp 0x016002c0000107ffff00
response: 000: 08 60 02 c0 00 01 07 ff ff 00                   .`........
$ ./firewire-request /dev/fw1 fcp 0x016002c00001ffffff00
response: 000: 08 60 02 c0 00 01 ff ff ff 00                   .`........
(<-srsly?)

As for the second batch:

$ ./firewire-request /dev/fw1 fcp 0x016002c0010100ffff00
response: 000: 0c 60 02 c0 01 01 00 ff ff 00 00                .`.........
$ ./firewire-request /dev/fw1 fcp 0x016002c0010101ffff00
response: 000: 0c 60 02 c0 01 01 01 ff ff 00 00                .`.........
(<- didn't fail)

So again...

$ ./firewire-request /dev/fw1 fcp 0x016002c0010102ffff00
response: 000: 0c 60 02 c0 01 01 02 ff ff 00 00                .`.........
$ ./firewire-request /dev/fw1 fcp 0x016002c0010103ffff00
response: 000: 0c 60 02 c0 01 01 03 ff ff 00 02                .`.........
$ ./firewire-request /dev/fw1 fcp 0x016002c0010104ffff00
response: 000: 0c 60 02 c0 01 01 04 ff ff 00 03                .`.........
$ ./firewire-request /dev/fw1 fcp 0x016002c0010105ffff00
response: 000: 08 60 02 c0 01 01 05 ff ff 00                   .`........
(<- shorter)
$ ./firewire-request /dev/fw1 fcp 0x016002c0010106ffff00
response: 000: 08 60 02 c0 01 01 06 ff ff 00                   .`........
$ ./firewire-request /dev/fw1 fcp 0x016002c001010fffff00
response: 000: 08 60 02 c0 01 01 0f ff ff 00                   .`........

Honestly I have no idea what is going on. :D

Daniel

On Sat, Jan 25, 2020 at 3:18 AM Takashi Sakamoto <o-takashi@sakamocchi.jp>
wrote:

> Hi,
>
> On Fri, Jan 24, 2020 at 10:16:53PM +0000, Daniel Jozsef wrote:
> > $ ./firewire-request /dev/fw1 fcp 0x01ff3000ffffffff
> > response: 000: 0c ff 30 07 0f 00 23 27                         ..0...#'
> > $ ./firewire-request /dev/fw1 fcp 0x01ff3100ffffffff
> > response: 000: 0c ff 31 00 08 60 ff ff                         ..1..`..
> > $ ./firewire-request /dev/fw1 fcp 0x01ff0200ffffffff
> > response: 000: 0c ff 02 00 02 02 04 03                         ........
> > $ ./firewire-request /dev/fw1 fcp 0x01080200ffffffff
> > response: 000: 0c 08 02 00 04 01 ff ff                         ........
> > $ ./firewire-request /dev/fw1 fcp 0x01600200ffffffff
> > response: 000: 0c 60 02 00 06 05 ff ff                         .`......
> >
> > From what I gather from the reference you linked, this seems more or less
> > what's expected, though I'm not entirely sure yet what it means for the
> > device to have 6 destination and 5 source plugs on the music subunit...
> :D
> > (If I read the specs correctly...)
>
> You got it correctly. Here, let's back to FFADO log:
>
> > Error (bebob_avplug.cpp)[ 237] discoverPlugType: Plug does not implement
> extended plug info plug type info command
> > Error (bebob_avplug.cpp)[ 120] discover: discover: Could not discover
> plug type (1,1,0,0,1)
> > Error (avc_subunit.cpp)[ 189] discoverPlugs: plug discover failed
> > Error (avc_subunit.cpp)[ 131] discoverPlugs: destination plug
> discovering failed
> > Error (avc_subunit.cpp)[  99] discover: plug discovery failed
> > Error (avc_unit.cpp)[ 283] enumerateSubUnits: enumerateSubUnits: Could
> not discover subunit_id =  0, subunit_type =  1 (Audio)
> > Error (avc_unit.cpp)[ 177] discover: Could not enumerate sub units
>
> It's my mistake to interpret the target subunit to which the command
> fails. It's 'Audio' subunit, not 'Music' subunit...
>
> > plug type (1,1,0,0,1)
> 1 = node ID (=0xFF01)
> 1 = subunit type (=audio)
> 0 = subunit ID
> 0 = direction (=input)
> 1 = plug ID (=0x01)
>
> The EXTENDED PLUG INFO command is one of specific command for BeBoB
> solution and its specification is closed. In your case, 4 plugs are
> detected as destination plug and 1 plug as source plug in Audio
> subunit by AV/C PLUG INFO command for Audio subunit, thus below
> commands are expected to return valid information as long as
> implemented correctly:
>
> (4 destination plugs = 4 input plugs)
> (AV/C EXTENDED PLUG INFO command for input plugs of Music subunit)
> $ ./firewire-request /dev/fw1 fcp 0x016002c0000100ffff00
> $ ./firewire-request /dev/fw1 fcp 0x016002c0000101ffff00 (<-)
> $ ./firewire-request /dev/fw1 fcp 0x016002c0000102ffff00
> $ ./firewire-request /dev/fw1 fcp 0x016002c0000103ffff00
> $ ./firewire-request /dev/fw1 fcp 0x016002c0000104ffff00 (should fail)
>
> (1 source plug = 1 output plug)
> (AV/C EXTENDED PLUG INFO command for output plugs of Music subunit)
> $ ./firewire-request /dev/fw1 fcp 0x016002c0010100ffff00
> $ ./firewire-request /dev/fw1 fcp 0x016002c0010101ffff00 (should fail)
>
> However, some vendors seem to implement the above with less care of
> compatibility, as long as I know. In your case, below command might
> fail:
>
> $ ./firewire-request /dev/fw1 fcp 0x016002c0000101ffff00 (<-)
>
> I'd like you to execute the above commands and share their responses.
>
>
> Regards
>
> Takashi Sakamoto
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
