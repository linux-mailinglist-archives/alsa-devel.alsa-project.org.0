Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7158F1490CC
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 23:18:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 046BD1681;
	Fri, 24 Jan 2020 23:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 046BD1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579904337;
	bh=p6gvG1dZ3yUWIpB3lF86ZGuDo+hJkLzLLH9t6FnkrLM=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sWy5KYZtk1zad5AnO9r7C4FYrt9VTuRUCaITkWVMh1OwpYIMoCmkJq4bY0YsVNUNf
	 /zoZlOzsy10gmpYRfd/Ltf4TnrhSxBFe4y9tzlqrxAuSXu5S3Su6Q4qG9DvreqIOwc
	 CIl+tLh9WWK6LySzXmEqLJDsjXOh9o/92Xlnybpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4E2DF80229;
	Fri, 24 Jan 2020 23:17:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E610BF8020C; Fri, 24 Jan 2020 23:17:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_59,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C465FF800DE
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 23:17:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C465FF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hmsb3vVn"
Received: by mail-ed1-x535.google.com with SMTP id r18so4263222edl.1
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 14:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=VTxLbbBHYeJGRlxS/pxBzZ2jkb86oMujVCZ8Aa521Ug=;
 b=hmsb3vVngAbtjbtSYs0hXPU3lBnuejCVjgj0uKaQzzasWilAV0kBhL4WAbYeNV1xVp
 VX+WAaH0R71HIBbj/X3yEbpa8/ruQOTF33+n0cicpeI56/APCDSmY0TaYGe5L1QHE+3p
 WNKy2oKckWMFzDb9cgBFEyXIchhwmsl4zD5KurIg1/01d/0VPMEyqZQOLcAPZy1F2J2P
 9WJ+F1191nAJpbQC/YRG4+62pP30g1B8XqRx2Zjy6NsZA9TJCTd5Q7Rpo2+mgUx+hE3t
 2qgOLp8sIVHZlJlm7iCaqNYV3AeX4JqlruBwifNlPdwSHo5ak0H3/c2fJ4JQ6FQnZvJS
 IJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=VTxLbbBHYeJGRlxS/pxBzZ2jkb86oMujVCZ8Aa521Ug=;
 b=Gg2pnOowE6AwVoFNMhbd4N2tAlMA1DdSI8YdEvVaYHJFogbskZBTQvaoExnOkILz5T
 KOcvjs8G4eOHGcdJxu49vB+SdnwYWhQ/l2nSh82KiTL8uLS93HFW7yKkL685GLshkyf3
 RQSg33sdTB2pwrA4Hz2eyFv24poGzfc6wwlpDwCai0v5tufDsYrnBwSc5MWJ3aFQxibU
 PQSx2mgRHWhdIQNm2SD9tS50U7llRmkmNBe7TCyn98pvojsRsWh6b5FkUXJz16ENpltm
 cFgzLIsRCi8tJgzRmNIMEK2S8gYe6Pma6EzrMNok+5mtpIOy2jgWg7Cq/C91eLOOtdoW
 TyNA==
X-Gm-Message-State: APjAAAUPhAjEWGV4GJnf32P2SgW8raqOnw/7l4eXbBQT5unOb5T9tY80
 egf+rYmsKVljG+phFnTnQpLnBZz1xVOyp7QHiUs=
X-Google-Smtp-Source: APXvYqzfMPTtSyDj/8Tta5LHorHFPhB5t5b/0TKfnGtXY/vsjosVFdtjKtSAfhfCxcjU9ABKMWqIFBz1N2vRwwX39l0=
X-Received: by 2002:a17:906:4e46:: with SMTP id
 g6mr4277965ejw.309.1579904226457; 
 Fri, 24 Jan 2020 14:17:06 -0800 (PST)
MIME-Version: 1.0
References: <CAK5Eu=tVQjBn+YvsHOLqSEir5aV8Q0hA1OgFiJZYdqnspdMz-Q@mail.gmail.com>
 <CAK5Eu=snx3s9r9hoeF4Th0V0YXJYa=7PKUqDn3W4NdWZben-zg@mail.gmail.com>
 <CAK5Eu=v2x+zFhCygKq8DPWd+CH5JTpZEayg=k2NvaTY7DUNA9g@mail.gmail.com>
 <CAK5Eu=ucuW6Pp=+j7afPoYgPUdFXjh+PZ-PK6mc+m61M80ZndA@mail.gmail.com>
 <20200119164335.GA11974@workstation>
 <CAK5Eu=sS8kMe5hCPgTx+V6AjzcCo3vN73tEQ1f=kY03Y2_CcJQ@mail.gmail.com>
 <20200120141901.GA32472@workstation>
In-Reply-To: <20200120141901.GA32472@workstation>
From: Daniel Jozsef <daniel.jozsef@gmail.com>
Date: Fri, 24 Jan 2020 22:16:53 +0000
Message-ID: <CAK5Eu=tX=87xD0xt-UdrDWTsxw9Y4xOrvAV8pHKyYC7tau==XA@mail.gmail.com>
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

Hello Takashi,

Thanks for getting involved, I really appreciate it! :D I was away this
week, but today I was able to run the commands you mentioned.

$ ./firewire-request /dev/fw1 fcp 0x01ff3000ffffffff
response: 000: 0c ff 30 07 0f 00 23 27                         ..0...#'
$ ./firewire-request /dev/fw1 fcp 0x01ff3100ffffffff
response: 000: 0c ff 31 00 08 60 ff ff                         ..1..`..
$ ./firewire-request /dev/fw1 fcp 0x01ff0200ffffffff
response: 000: 0c ff 02 00 02 02 04 03                         ........
$ ./firewire-request /dev/fw1 fcp 0x01080200ffffffff
response: 000: 0c 08 02 00 04 01 ff ff                         ........
$ ./firewire-request /dev/fw1 fcp 0x01600200ffffffff
response: 000: 0c 60 02 00 06 05 ff ff                         .`......

From what I gather from the reference you linked, this seems more or less
what's expected, though I'm not entirely sure yet what it means for the
device to have 6 destination and 5 source plugs on the music subunit... :D
(If I read the specs correctly...)

Daniel


On Mon, Jan 20, 2020 at 2:19 PM Takashi Sakamoto <o-takashi@sakamocchi.jp>
wrote:

> Hi Daniel,
>
> On Mon, Jan 20, 2020 at 11:42:34AM +0000, Daniel Jozsef wrote:
> > Thanks for the quick reaction, Takashi :) I ran the command you
> mentioned,
> > and your guess was spot on:
> >
> > daniel@gibbonmoon:~/opt/linux-firewire-utils-0.4/src$ ./firewire-request
> > /dev/fw1 read 0xffffc8020000 60
> > result: 000: 62 72 69 64 67 65 43 6f 03 00 00 00 00 00 00 00
> bridgeCo........
> > result: 010: 00 27 23 00 00 00 00 02 02 00 00 00 00 00 00 00
> .'#.............
> > result: 020: 32 30 31 30 30 35 32 35 31 32 31 35 30 34 20 20
> 20100525121504
> > result: 030: 02 00 02 00 ff ff ff 00 80 00 0c 40 7c e3 13 00
> ...........@|...
> > result: 040: 32 30 30 38 31 32 30 32 31 33 34 34 34 38 20 20
> 20081202134448
> > result: 050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ................
>
> Yep, it's an application of BeBoB solution.
>
> As a next step, please get responses against 5 AV/C commands below:
>
> (AV/C UNIT INFO command)
> $ ./firewire-request /dev/fw1 fcp 0x01ff3000ffffffff
> response: 000: 0c ff 30 07 0f 00 14 96                         ..0.....
>
> (AV/C SUBUNIT INFO command)
> $ ./firewire-request /dev/fw1 fcp 0x01ff3100ffffffff
> response: 000: 0c ff 31 00 08 60 ff ff                         ..1..`..
>
> (AV/C PLUG INFO command for Unit)
> $ ./firewire-request /dev/fw1 fcp 0x01ff0200ffffffff
> response: 000: 0c ff 02 00 02 02 01 01                         ........
>
> (AV/C PLUG INFO command for Audio subunit)
> $ ./firewire-request /dev/fw1 fcp 0x01080200ffffffff
> response: 000: 0c 08 02 00 02 02 ff ff                         ........
>
> (AV/C PLUG INFO command for Music subunit)
> $ ./firewire-request /dev/fw1 fcp 0x01600200ffffffff
> response: 000: 0c 60 02 00 03 03 ff ff                         .`......
>
> If you're interested in their contents, please refer to document published
> by
> 1394 Trading Association:
>
> AV/C Digital Interface Command Set General Specification Version 4.2
> (1394 Trading Association, September 1, 2004)
> http://1394ta.org/wp-content/uploads/2015/07/2004006.pdf
>
>
> Thanks
>
> Takashi Sakamoto
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
