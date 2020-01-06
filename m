Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BD613243C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 11:55:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 540421839;
	Tue,  7 Jan 2020 11:55:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 540421839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578394551;
	bh=LVVmxriyPEk98OAH97e2X8i3fpwFytEhtGX8KaRyS/Y=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZIZ7bSWS8SUDQJqCS7E/y+IGVQjMTuxqwh8Z8pisfhbzwgwIZLW7Rdit79nvU3ijd
	 FJ4xY3TVBEbXKiSwiGTsyoUhLgfclvgrsiwBD/07g9KWKTrHeg2B49376u4IbCwgLV
	 h0q8WK4Sm8s+TPpMt76jmbwoEpc5dtxK4yNZ+vUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86975F801F5;
	Tue,  7 Jan 2020 11:53:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17DF5F80159; Mon,  6 Jan 2020 11:21:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 673BAF80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jan 2020 11:21:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 673BAF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G4O8qzKx"
Received: by mail-wr1-x42f.google.com with SMTP id q10so10051293wrm.11
 for <alsa-devel@alsa-project.org>; Mon, 06 Jan 2020 02:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=U78EkAreQ2rmU9b/KhWK5Or4TUfnpuLAcwK2R/08pig=;
 b=G4O8qzKx661V/bQtdGiuVLG1Sqi2x1v366H1ps/EJHY6NmiOUKh9H10Y+Nqcjp3ms7
 Jtj8NorhAws3OQpkDPwiTX7iwP9sY779/opjWhm0lx5KECmX26999J8jbHcta0aqCvIl
 2nqLlZo5WiiYPQaXgOrzUFXvSAP1yrI+V3taGuQl8CUHkzIDCGKLtdtGtJ3YQkiTNgMx
 lRlmqPrngACIvk0wRnIa96/toMRP+dLXTOc3wJ/8XOJp+4ntxuMmG59tqo20G8rhKunY
 VbUyrf8jPJK0QiF9k9+iFeIbSZrcVHMXOu6QtKmgVjhx+OuDxcsTGH02CDhjGjtkVuao
 fTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=U78EkAreQ2rmU9b/KhWK5Or4TUfnpuLAcwK2R/08pig=;
 b=DlI6Af72+3G3O8Qny54Pzb3PRTbJaPxOFez+NvbxaPcAUlrd0v7cjHoHTHKdmNchQ2
 pqoZhO97IDHjEkQJMh7w8Z6PdDapqVGUrFl7DBncYOMVyvxhANp7oURIm4Ny0PLpW5h+
 gKiPPYW0frpOj1fhl63jBos/5SeUSkQorpC1kU08kI77alrV32e8AOV12cdcXBztFXW0
 /MFrLMmqetRZLmPBrDTzWWk19u6NBvYPzf9EeW5eWdoXuH1Od2Y4rYao2MA8mAxKwpYj
 27pzR36jAIY49KqKwoUxLDOuZtm9gNIlHUQ/iR8ULe9RIu5gKPAlaqvSTde7Wrehzuvw
 ozPA==
X-Gm-Message-State: APjAAAU/y0Q46PG1Zp5jw6Oy2p359SSQa7g5hS9WNZNlKLdTZuna48AZ
 awvxoWTAbawZSLzQPsdp+VjSqTmg
X-Google-Smtp-Source: APXvYqw8R6VNgiMvp+K7bl0O7U2PmxT3NUdut2T4BhLETatUWmDt0hLfTPsWo//80KpN5nnhPke1qg==
X-Received: by 2002:adf:e290:: with SMTP id v16mr106380379wri.16.1578306085919; 
 Mon, 06 Jan 2020 02:21:25 -0800 (PST)
Received: from localhost.localdomain ([46.216.160.87])
 by smtp.gmail.com with ESMTPSA id x18sm71909850wrr.75.2020.01.06.02.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 02:21:25 -0800 (PST)
Received: from [127.0.0.1] (helo=jeknote.loshitsa1.net)
 by localhost.localdomain with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <jekhor@gmail.com>)
 id 1ioPVj-000PMt-Hn; Mon, 06 Jan 2020 13:21:23 +0300
Date: Mon, 6 Jan 2020 13:21:16 +0300
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: alsa-devel@alsa-project.org, Hans de Goede <hdegoede@redhat.com>
Message-ID: <20200106102116.GA96770@jeknote.loshitsa1.net>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 07 Jan 2020 11:53:23 +0100
Subject: [alsa-devel] Right place for defining ACPI GPIO mapping for codec
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

I am working now to get sound working at Lenovo Yoga Book tablet. It is
Intel CherryTrail-based device and has RT5677 sound codec.

The RT5677 codec driver uses two GPIOs to reset and enable the codec,
with names 'realtek,reset' and 'realtek,pow-ldo2'. The ACPI definition lacks a
 _DSD section with GPIO name->CRS ID definition, so I need to manually
define this mapping somewhere using existing
devm_acpi_dev_add_driver_gpios() method (various devices has various _CRS
 definitions order and content, so this is cannot be placed into
rt5677.c codec driver).

The most obvious place for this is ASoC machine driver for my device, but the
codec driver is binded to the ACPI device and initializes before machine
driver.

Can somebody advice how to define such GPIOs mapping for codec in my
case?


The ACPI definition of sound device is below. Second I2C address
definition is for TS3A277E jack detector. The first GPIO in the _CRS is
codec reset, the second is pow-ldo2.

Device (RTEK)
{
    Name (_ADR, Zero)  // _ADR: Address
    Name (_HID, "10EC5677")  // _HID: Hardware ID
    Name (_CID, "10EC5677")  // _CID: Compatible ID
    Name (_DDN, "Realtek IIS Audio Codec")  // _DDN: DOS Device Name
    Name (_SUB, "17AA7005")  // _SUB: Subsystem ID
    Name (_UID, One)  // _UID: Unique ID
    Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
    {
        CLK3
    })
    Name (CHAN, Package (0x02)
    {
        One, 
        0x0124F800
    })
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (SBUF, ResourceTemplate ()
        {
            I2cSerialBusV2 (0x002C, ControllerInitiated, 0x000186A0,
                AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                0x00, ResourceConsumer, , Exclusive,
                )
            I2cSerialBusV2 (0x003B, ControllerInitiated, 0x000186A0,
                AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                0x00, ResourceConsumer, , Exclusive,
                )
            GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
                "\\_SB.GPO3", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0019
                }
            GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
                "\\_SB.GPO3", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0012
                }
            GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
                "\\_SB.GPO3", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0030
                }
            GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0x0000,
                "\\_SB.GPO0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x005B
                }
            GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0x0000,
                "\\_SB.GPO0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x004D
                }
            SpiSerialBusV2 (0x0001, PolarityLow, FourWireMode, 0x08,
                ControllerInitiated, 0x003D0900, ClockPolarityHigh,
                ClockPhaseSecond, "\\_SB.PCI0.SPI1",
                0x00, ResourceConsumer, , Exclusive,
                )
        })
        Return (SBUF) /* \_SB_.PCI0.I2C1.RTEK._CRS.SBUF */
    }

    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (0x0F)
    }

    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
    {
    }
}

-- 
Yauhen Kharuzhy
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
