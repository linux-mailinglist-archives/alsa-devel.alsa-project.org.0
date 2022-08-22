Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC58C59C171
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 16:14:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12E2916CD;
	Mon, 22 Aug 2022 16:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12E2916CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661177697;
	bh=cobwzG85t9NY/2qL/naLRUCyrMv9Xh+d0pOHVx7fOoY=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gpXmi9ZIpsMUKJxHOteJy9nna3L58sfsmugffl4OWjrDMX/mAbNGbptHEjL8Y0pNq
	 E07ES7HS5ibI9V0QQ1lo70/gcIE8elXxpvC8Ix2eTMYP72EkKX/pcstNI8Ya4cX3qk
	 /xf/TaM8up2JmRSswVrYiK6AZnxsgO/MAdGEoInY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CE56F8026D;
	Mon, 22 Aug 2022 16:13:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F48EF8026A; Mon, 22 Aug 2022 08:29:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A384CF800A7
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 08:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A384CF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kMwXQnpl"
Received: by mail-vs1-xe29.google.com with SMTP id l7so9849461vsc.0
 for <alsa-devel@alsa-project.org>; Sun, 21 Aug 2022 23:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=KAY4SC//fGMT6B+E6k4zH4/5RacJrpbBoxA/ghgxB0s=;
 b=kMwXQnplckrIxrPO7lg6/9qke43AalGVLEYZs5ErDXESYnqyuzny3dNQIkMVflayUK
 0I9rGGjgKoS1GMsUU/EeUEb1kDLV8qDoCC+1IrXx2Y28ppebujLWakB8Yn4B2qHZew++
 ML4m5uHXMDW8/C05dzAqVZHvTU5JKoQwGH56/C3IdMWYoLddVlsvtKfuS8Nh1p1fBw38
 VahfCHSr8JdgHzElkyhDzL9UgMcCdFXUwlrX3aTMjD8YuEEJlLJ28GG0KE+URwXJH2H2
 UH8esMYKAQtyP2UDIOqdlx9XIfRqkJ4TQjy9mm9wZ7BfOzDsWsj3KkDOY+/LR52KkUYj
 CTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=KAY4SC//fGMT6B+E6k4zH4/5RacJrpbBoxA/ghgxB0s=;
 b=mJrFhVav2kgD0yZM5HBjkeG5iIuDNtMiBLTwAHU9XU2b01yhmIgU//D53BuHSU99KO
 AMcDGdZgMVrhwXTG9R0tUfW/a3KdAhJ3KyaJFVx7Q2/72XQDO0yw2ucoq1tiPP3w42JC
 w7lWr4c7Cr2VPNJbIoOk98aYR+LFk0Nfv2G9M1QW05HTjqtvn6BND/qm3umTTb5y4aF7
 QdnIvRvMOSImnO3mUxfzK0eB0dGKCUXRJ0QXVef8G1Xfx996+OkQWp78YtoxO+MtJtxr
 4EEVc4IkpKH1iGbmTURZ56omdGqPO6k8n1L0CxDlf6redgl5lSbp9Upqi4V2tXARa1a1
 TbTQ==
X-Gm-Message-State: ACgBeo1IdJQULz35nIspE5UX6vVmlRSs7qniwVJYvY4OTA0JBnwHwduG
 JetyLasPKRUh6+wceAn2Qm1kp8l1KwgUS/OjVQKbJavogvLNhk2/
X-Google-Smtp-Source: AA6agR4/vchUwiDJtJRUHlaBEhG3t++FN7QV173izFP1yMxGbn6yBdOL6o72YX5JJ9hzsICuhNRqG/m6eF/VQCeVRxs=
X-Received: by 2002:a67:f31a:0:b0:390:4924:1209 with SMTP id
 p26-20020a67f31a000000b0039049241209mr2198295vsf.1.1661149784187; Sun, 21 Aug
 2022 23:29:44 -0700 (PDT)
MIME-Version: 1.0
From: XiaoYan Li <lxy.lixiaoyan@gmail.com>
Date: Mon, 22 Aug 2022 14:29:33 +0800
Message-ID: <CAH3TfsQSBesfMRqGYwcR3kfREE5tvtPxiBw+FbA4tmuj06rzfQ@mail.gmail.com>
Subject: The cs35l41 driver does not work on several laptop models that lack
 the _DSD block.
To: alsa-devel@alsa-project.org, tanureal@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 22 Aug 2022 16:13:56 +0200
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
