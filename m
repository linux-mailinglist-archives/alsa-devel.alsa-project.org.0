Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 621E197222
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 08:17:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ECAA1616;
	Wed, 21 Aug 2019 08:16:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ECAA1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566368232;
	bh=/pTHJ4D3vIPNxUZxnN3TcmHKgzvm2aPJ6rUiuj3bGzg=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=anZJ53maZsQHtJLyFc6elfZaMhtXn+B/R0TEh/CK1Rvtf/1h7z989jO2DyRaryAyK
	 aiBbA2N8Fw0yTzImoxUbhHPKt8hQvGsTbY5GlpeYifHfEE+D/Voo36TBNZZOVh9cEt
	 d9gIx1Og7/IlcJFb3GB81zMzzIDVPVAAJbAmfwTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA59BF805A1;
	Wed, 21 Aug 2019 08:14:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC007F80306; Wed, 21 Aug 2019 05:50:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,HK_RANDOM_ENVFROM,
 HK_RANDOM_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78F10F800BF
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 05:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78F10F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PEchX9jI"
Received: by mail-oi1-x232.google.com with SMTP id k22so552886oiw.11
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 20:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=DQ22h0Aey8nOVKWBzG/Exo4IiLTXfWKAcwOFcoIH0II=;
 b=PEchX9jIwViWUynKofi79cH3TtsHtsdAQj0UWQkRU5uSbUsHlJ7cMx5MksCE+MF20i
 mkM0y496ZlzOXb1UyGdEvc+9jojiyDUukd/MKoeQILYUu2cvrN+r1KQdviDt8Ww28BjK
 KCgrVax59FT/3P5zSaPSE2kncE7Ha+wzCjPh691YZqraNGt9nwQ8INecULcJ3jjiJbxJ
 Votqc/fYF5ZjBkQg2xcZVzgxbPibHUN/8JwbJdf2BCPKqtZHAtVEbtTvoILtpO8dgeeT
 kRUpAaueodMgigvZ/24Cg/cjGBHDgYhmE60D6cf+FBQnZqZlLuWGvuQTLev4fbLWLnWh
 nRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DQ22h0Aey8nOVKWBzG/Exo4IiLTXfWKAcwOFcoIH0II=;
 b=OK3AfAQMt6qwLiatxrFpTl9X6msD+MbrjgGb9bzpTadcKARbILj46ltRqf9zB2Mgf3
 QEbxM2/dOoRvqgid3i5+8JpP9Mczbh8OMBThZxM6g4QRmTpTv2PWnZoEpgpWql11O9QB
 Xy7J8bD3/GsJzuAqPQMmay7rRkRaNz3zxfHobwzOn+WWzFQvQ4vY1FxpMODdfLEJd2zS
 rrW0Jookom8RIVNESs/VHRwxHey5KPQLs9KKKoUGXi/iLCgkEVSecNPY1jpcwP/49CWg
 9el6QTa7d/1BxJ1dJmazv9Orxz12sLxTC7sPo+fgzqzZK+TxDjjbF0CokJz14QbQoSTP
 /WSQ==
X-Gm-Message-State: APjAAAWvuez55o1IoyPFwzWW2Jkp/NwBad40l3aa9BhAJbLKivgrhbjc
 1j987Cg56aIOR0XTzCXTa2V23IqMQ4BRhSAEvY7uUBzh8gM=
X-Google-Smtp-Source: APXvYqzyziGJKSq87PtOJqrJV5H59hsuUz/9Eeoud4rdv08nVSYwHODyz5cSJreCd6gy6fNMAgi0I7myQxNBz4+od4Q=
X-Received: by 2002:aca:fc43:: with SMTP id a64mr2439685oii.57.1566359445845; 
 Tue, 20 Aug 2019 20:50:45 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?TWFydMOtbiBNYXJ0w61uZXogUml2ZXJh?= <mrtnz.rvr@gmail.com>
Date: Tue, 20 Aug 2019 20:50:35 -0700
Message-ID: <CAJnWPcZ9C8WY4ihRSBBkOJD7fHLGhfEEmBRhMLimKG+R+h8O2Q@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Wed, 21 Aug 2019 08:14:38 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Master volume not controlling applications' volume.
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

Changing the master volume in pavucontrol (or alsamixer) does not have any
effect. The only way to change the volume is to go into the playback tab
and change it for each application. The volume only changes when I set the
master volume to 0 or when I increase it over 100%. In between there aren't
any changes.

Running arch on a Lenovo X1 Carbon if that's of any use. I am using the
arch default configuration files.

I posted somewhere else and was told to email this list as it could be a
kernel bug.

kernel: 5.2.9-arch1-1-ARCH
pactl info output:

Server String: /run/user/1000/pulse/native
Library Protocol Version: 32
Server Protocol Version: 32
Is Local: yes
Client Index: 13
Tile Size: 65472
User Name: martinmr
Host Name: martinmr-laptop
Server Name: pulseaudio
Server Version: 12.2
Default Sample Specification: s16le 2ch 44100Hz
Default Channel Map: front-left,front-right
Default Sink: alsa_output.pci-0000_00_1f.3.analog-stereo
Default Source: alsa_output.pci-0000_00_1f.3.analog-stereo.monitor
Cookie: 1afa:f937

Let me know if the output from some other command is needed.
Best,

Martin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
