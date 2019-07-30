Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6157B4B6
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 23:02:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B12117A2;
	Tue, 30 Jul 2019 23:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B12117A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564520525;
	bh=qfHTlU4me/NYu+T7E6UY79hCbvfMLqK939Pj+Qis5Fg=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M/e6+TEd91eI91A67FeWxrzUmpm6hp/xUQVe1FMZSxhvUBHdZwdBUL6/Z4rfNlmp1
	 ywaNzmqSHVgQa4l8SGpptzvRDepLY3ivLOtUd0AnC1EUczQx7fZLwhz9PpiZ6QK7XQ
	 w+M0JH3nW3pHKyOL/D2/1dttfzeJoQkmL9S7A1dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D80B1F80482;
	Tue, 30 Jul 2019 23:00:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 526CCF804CA; Tue, 30 Jul 2019 23:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_HK_NAME_FM_MR_MRS autolearn=disabled version=3.4.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD6DAF80214
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 23:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD6DAF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FzaGBTaR"
Received: by mail-ed1-x530.google.com with SMTP id r12so28950369edo.5
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 14:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7R8dBnh+VbEikw9nSrFym8R3/h56u0ityzfGrNf1mXY=;
 b=FzaGBTaR9vvGkdQTU5rEdVPBhCnuHIlXQgHyCQzf7QJRJ/mcnlL8KslEdJXKTjMPKv
 xyAm1QYlBq4cW1XDq2RXxhPgVMIMOFrt4ATCUW+RSWy4KMnvcyVFolTfWNha9QU/lbft
 BcnnPQKE/p7chDrSDy4RagTHpzCLo9alCJjSUpgGdrLtn0qvG/guMnG/aSUM96QS90yM
 BcMuSvL9EsS99197NH830MyA2FdA6OLh82vZq3FjEg0VIX7XAkjxG0x/X13sWbJ2zVi+
 6izDivPKvAlkGbz3zqH9aFLtTeLdoxLckvr5RzqHLq+az0wr2j6P4fR4qBiG0+n7v+1I
 kv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7R8dBnh+VbEikw9nSrFym8R3/h56u0ityzfGrNf1mXY=;
 b=XZE4KLjZMLANIHRmKkqD4WrJnrQir30+HRfdIkLzLr7XNuYoCfOa0/V60E3be6QhvN
 FbkgrxRKYbdoTVsFTRoqgmRV7kigCpvftqfX/m9MUBlNgx3HrJTYwIdgIOKjwuWxeSp2
 eorwk4qUUrWNMo72vYtyjHzVzeW2/mQz4S4ZVAh+0TVSX/0jWlcdRfvuqg492a0vBjqI
 ThNDscQs3ND/PwVzxIZmYwuoKKR5T2OHEnDb5V2dDjbqul0QYTrSG3uMoJU8BYQtuw8C
 yy1l2zxpnLUkTcQTeA4n3qsRZEh7kj+QN78c0kGsOy3Oqx4/T+/vJ3iDYUDTRhvwZtDW
 2Iow==
X-Gm-Message-State: APjAAAXWddDZ3R7F8TUIb1k7wBu9nvex3Qqe7GAdDACFdOtvSwb0b8b6
 lu927hqaTwECle5Wz3cjS7XTFiuA5SfJAk6uUvo1EiVz
X-Google-Smtp-Source: APXvYqzmPVk1UcgFKZSPoMIh3CCjuWcEwb/QJU9O8O1jevcdinRfojdtPtSs5/bKYonCIxDI04+oCMERNn9w5dB8Dxk=
X-Received: by 2002:a50:8b9c:: with SMTP id m28mr105844158edm.53.1564520412475; 
 Tue, 30 Jul 2019 14:00:12 -0700 (PDT)
MIME-Version: 1.0
From: Mr ARM <mrarmdev@gmail.com>
Date: Tue, 30 Jul 2019 23:00:01 +0200
Message-ID: <CAKSqxP9m2ObY94DumdYcnn2bOT0sj1=Lsow5i8sN1oZPQwZJqg@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Handling a device which zeroes the memory on IO start
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

My issue involves a specific device quirk. The device generally uses a
mmap'ed memory regions, however sending a StartIO command (from a trigger)
causes a full buffer erase (which is completed once I get an initial
UpdateTimestamp several milliseconds later), and it seems that alsa fills
the DMA buffer before calling the start trigger. I'm unsure how to
workaround this issue. I have seen the SNDRV_PCM_INFO_DOUBLE flag, however
it didn't help me in my issue as from what I understand it's merely an
information that the driver is using double buffering.

One option is to make the start trigger method copy the buffer, send the
StartIO command, then do a blocking-wait for initial timestamp and restore
the buffer. I don't think I can get rid of the blocking wait here if I use
this temporary-buffer-copy approach as I think that in the time before I
get the timestamp update, a client could try to update the shared memory
resulting in that data being lost after I restore the original contents
later.
Another idea I had is to do the same, but in the open callback, however
that seems totally wrong.

Any ideas are appreciated. I tried grepping for drivers using the
SNDRV_PCM_INFO_DOUBLE flag, however I couldn't find any code workarounding
similar issues.

Thank you,
Paul Pawlowski

PS: I wrote an email yesterday to this mailing list from another email
address, however I have received several SPF failures, so I switched to
gmail. Regarding the previous mail, I have figured out the looping audio
was caused by the lack of a snd_pcm_period_elapsed call. I have missed it
because my device has no proper interrupt handler, and only sends a
confusingly named UpdateTimestamp message once the buffer has been fully
processed. I'm however still unsure as for what I should return from the
_pointer function as the device does not provide a frame pointer.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
