Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F335659BA21
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 09:20:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4E6B1632;
	Mon, 22 Aug 2022 09:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4E6B1632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661152858;
	bh=8BP5Z6pA2etHtE3avgU0ovLmUxEgk/c6+OYDno5R6c8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jVqLZq1Ch9RJkJ2vNIkrb9rM08lrBHXItsOGoabbqQ2yUic1FDMs5H0QTFp2ClKjC
	 aj1RiXEc4HVLtfKmuqIm4L0mze7aNT+o8CirXQRKDzHhVevlVccGUCHXZ2V1MA9hxw
	 YjdJk91IGgomjuJkksEjd9TXE0CrDqK1RZ5QbDrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C341F8026D;
	Mon, 22 Aug 2022 09:19:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DADE9F8026A; Mon, 22 Aug 2022 09:19:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 216E2F800ED
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 09:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 216E2F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NwXnbE4G"
Received: by mail-vs1-xe2a.google.com with SMTP id h67so9221791vsc.11
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 00:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=uxatvw1oMmZldGuWKfHk8SfbEF6u+jGXT+f23MF0Q3I=;
 b=NwXnbE4GepuPygxawUn+K42hHLYu2nBKAn2uPAy3dPPfy4cwCX0ONgl2vhn8zgC+bj
 xWEajuWehYDDqrwbZP3oNbKibi09dHdBM4TlweD1PAYqeAdHJ7QAnc7UnzS1sOoyGhdp
 iyv9VCFx7/rlO3D+XeruSHA/oDXrUApsI/R7sNMQQJmMbSBCXjkl8A1wFpswGqMh2bZj
 3fT4Htm2HcyNkv146sM76yNr4iVxIp8FqRKWserSCdQNVowx3S4P+3Gc3zOnG2xk1yhe
 xFoYZofIar8oBLCKNak77aqtN+hW0MVH4KKKmjfJCJxbWGm1jHxTV/ccckz/9U3UztGn
 zyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=uxatvw1oMmZldGuWKfHk8SfbEF6u+jGXT+f23MF0Q3I=;
 b=hWDz2r2Z/2ZO2sUS2d7Qftpb67M1QxwQYs0kFgANSsdFIOMok1jRTKCiQ6EtU1hGFI
 ZEx7WqWHlM3frpabxueWBRLHOnlsXWxVVGK/rxQeci9OpE5ICUSwT4oW7uPCsIjAOsCv
 gBXY42qJOarVKxef4CyaebBrcxZw2ueCg3ZnHYBzjLIHCYbvy24vcbdFEurxo2r7m/8x
 84bHrG7PGjgiV6U6Z9tLerDJWGUhailgklamQFIybpRewTV+y8FqEEQ99g5gxSOdZkHQ
 twbHHuHGfQKREZVdjOEZ8RCSn8JWPZi2tcHXZ+GILM1qUORliSfYXTP4ljxxVZRCAY4p
 zAMA==
X-Gm-Message-State: ACgBeo0ZWDBHqwZTeu/p13wlFiDaFL1MzP/cm1RisPC+fpXv5RuCe3oT
 C8ZFQVK6cQEVgvw3JhKKAqFwFlS8hFkzyioo867Sb9+I3M90Gg==
X-Google-Smtp-Source: AA6agR4IC9l2G1UhL4QSwOadEDHhqIl7SnVAOT/e5kNyqSNjvYBnibucZRHLDdU9Zi6uP4NCAlQoBJGruRea6xPs4OA=
X-Received: by 2002:a05:6102:c8a:b0:390:232a:8f29 with SMTP id
 f10-20020a0561020c8a00b00390232a8f29mr4732024vst.81.1661152790435; Mon, 22
 Aug 2022 00:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAH3TfsQSBesfMRqGYwcR3kfREE5tvtPxiBw+FbA4tmuj06rzfQ@mail.gmail.com>
In-Reply-To: <CAH3TfsQSBesfMRqGYwcR3kfREE5tvtPxiBw+FbA4tmuj06rzfQ@mail.gmail.com>
From: XiaoYan Li <lxy.lixiaoyan@gmail.com>
Date: Mon, 22 Aug 2022 15:19:39 +0800
Message-ID: <CAH3TfsR=ngT0Xu4Q3iycigg6wNv3Xm-WuYUn90Ce=-3+r=VY_w@mail.gmail.com>
Subject: The cs35l41 driver does not work on several laptop models that lack
 the _DSD block.
To: alsa-devel@alsa-project.org, tanureal@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Cc: cam@neo-zeon.de, faenkhauser@gmail.com, mario.limonciello@amd.com,
 xw897002528@gmail.com
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

Hi,

Several laptop models employ CSC3551 but lack a corresponding _DSD
block in the ACPI table, including but not limited to:
- Zenbook S 13 OLED (UM5302TA)
- HP Envy x360 ey0xxx
- Lenovo Legion 7i Gen 7
Here are some relevant links:
- https://bugzilla.kernel.org/show_bug.cgi?id=216194
- https://lore.kernel.org/all/20220703053225.2203-1-xw897002528@gmail.com/T/#u
- https://lore.kernel.org/all/20220811152923.10143-1-faenkhauser@gmail.com/T/#u

The following is a snippet of the ACPI table from my laptop (UM5302TA):
---
Device (SPKR)
{
    Name (_HID, "CSC3551")  // _HID: Hardware ID
    Name (_SUB, "10431F12")  // _SUB: Subsystem ID
    Name (_UID, One)  // _UID: Unique ID
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            I2cSerialBusV2 (0x0040, ControllerInitiated, 0x000F4240,
                AddressingMode7Bit, "\\_SB.I2CA",
                0x00, ResourceConsumer, , Exclusive,
                )
            I2cSerialBusV2 (0x0041, ControllerInitiated, 0x000F4240,
                AddressingMode7Bit, "\\_SB.I2CA",
                0x00, ResourceConsumer, , Exclusive,
                )
            GpioIo (Exclusive, PullDown, 0x0000, 0x0000,
IoRestrictionOutputOnly,
                "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0004
                }
            GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionInputOnly,
                "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x009B
                }
            GpioIo (Shared, PullUp, 0x0064, 0x0000, IoRestrictionInputOnly,
                "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0009
                }
            GpioInt (Edge, ActiveBoth, Shared, PullUp, 0x0064,
                "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0009
                }
        })
        Return (RBUF) /* \_SB_.I2CA.SPKR._CRS.RBUF */
    }

    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        If ((AMPD == Zero))
        {
            Return (Zero)
        }
        Else
        {
            Return (0x0F)
        }
    }

    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
    {
    }
}
---

The Cirrus driver for Windows works perfectly. I don't see anything
related to the _DSD stuff in the INF files that came with the driver
(if I read them correctly).
For reference, here are the two INF files from UM5302TA:
https://gist.github.com/lixiaoyan/7e1f11b153b38339007f6ec9aa149f81

I think we should support those devices out of the box, as the Windows
driver does. This problem does not appear to be limited to a single
model; rather, it appears to be a widespread issue. At least, we
should add some quirks for the models listed above.

Thanks.

(resend after joining the mailing list)
