Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 001949077B2
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:02:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60332F94;
	Thu, 13 Jun 2024 18:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60332F94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294520;
	bh=b0Y5dRLQaYt3mf0VGzfdq8z0+s59RcDFw7CTP55VyrU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R3uuLn+iVr+LtCSyuEnHG29bm24Er79dnZ+q0fl/WYIxmsRbeH/AlOwIWhXPa8FhB
	 UEGB3Mync1Be5TyU758LOOQlAwzYXUK4CXwq/rqgWtYPG2KUHGp1hJJZ27LCvuX9ki
	 oLXsNiNaJsI62mx7sLaOC9BZ3BK4jSnBJXY+XH7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B255F805F0; Thu, 13 Jun 2024 18:00:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05FA2F80632;
	Thu, 13 Jun 2024 18:00:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7BE2F80149; Fri, 31 May 2024 08:11:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A485F80051
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 08:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A485F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=EhfbK691
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44V6AjaJ016213;
	Fri, 31 May 2024 01:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717135845;
	bh=WhEVFbeNknRh1BQSwCnDYk1qPCnB8HaWvQq4y3qw8pU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=EhfbK691DNfBC8sDsKUJ+XctjPTvAXm6Fa6mbOaogFzqQtOu/W+AFLgncCr+WrZ8N
	 tBiKxKA6BiTGYWoEdcuBU2uU3W67s12XMj2BaJPkQMGEi+y/Awgp8kHFswEREC6VoO
	 f1XwBGZ0svfPOEgTN/EOvFAPjnGPUPTj8jJ2dSKI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44V6AjL1047883
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 May 2024 01:10:45 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 01:10:44 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.2507.023; Fri, 31 May 2024 01:10:44 -0500
From: "Xu, Baojun" <baojun.xu@ti.com>
To: "tiwai@suse.de" <tiwai@suse.de>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "Lu, Kevin" <kevin-lu@ti.com>,
        "Ding,
 Shenghao" <shenghao-ding@ti.com>,
        "Navada Kanyana, Mukund" <navada@ti.com>,
        "13916275206@139.com" <13916275206@139.com>,
        "Hampiholi, Vallabha"
	<v-hampiholi@ti.com>,
        "P O, Vijeth" <v-po@ti.com>,
        "Holalu Yogendra,
 Niranjan" <niranjan.hy@ti.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "liam.r.girdwood@intel.com"
	<liam.r.girdwood@intel.com>,
        "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "soyer@irl.hu" <soyer@irl.hu>
Subject: Re: [PATCH v6 0/1] Add tas2781 driver for SPI.
Thread-Topic: [PATCH v6 0/1] Add tas2781 driver for SPI.
Thread-Index: AQHaseDnrvmrnJlJZ0CQY5+1p/UdJbGw25Ri
Date: Fri, 31 May 2024 06:10:44 +0000
Message-ID: <62a298a58b944ecdaa1b2842d51f3a38@ti.com>
References: <20240529155653.3037-1-baojun.xu@ti.com>
In-Reply-To: <20240529155653.3037-1-baojun.xu@ti.com>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.64.41.93]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RBJARSIEXX45ZJBTZQ72OFPK4SS3YTB4
X-Message-ID-Hash: RBJARSIEXX45ZJBTZQ72OFPK4SS3YTB4
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:00:31 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RBJARSIEXX45ZJBTZQ72OFPK4SS3YTB4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

Do you know any different between windows and Ubuntu on SPI inialyze?
We are testing my patch on Laptop (HP-Varcolac, SSID:103C8B92, fly-out SPI =
& I2S cables), no any issue with wondows, but with Linux, second speaker ha=
s no sound, it's initialyze is totally same with first AMP, and relative re=
gisters can be dumped, no problem found.

Best Regards
Jim
________________________________________
From: Xu, Baojun
Sent: 29 May 2024 23:56
To: tiwai@suse.de
Cc: robh+dt@kernel.org; andriy.shevchenko@linux.intel.com; lgirdwood@gmail.=
com; perex@perex.cz; pierre-louis.bossart@linux.intel.com; Lu, Kevin; Ding,=
 Shenghao; Navada Kanyana, Mukund; 13916275206@139.com; Hampiholi, Vallabha=
; P O, Vijeth; Holalu Yogendra, Niranjan; alsa-devel@alsa-project.org; linu=
x-kernel@vger.kernel.org; liam.r.girdwood@intel.com; yung-chuan.liao@linux.=
intel.com; Xu, Baojun; broonie@kernel.org; soyer@irl.hu
Subject: [PATCH v6 0/1] Add tas2781 driver for SPI.

This patch was used to add TAS2781 devices on SPI support in sound/pci/hda.
It use ACPI node descript about parameters of TAS2781 on SPI, it like:
    Scope (_SB.PC00.SPI0)
    {
        Device (GSPK)
        {
            Name (_HID, "TXNW2781")  // _HID: Hardware ID
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    SpiSerialBusV2 (...)
                    SpiSerialBusV2 (...)
                }
            }
        }
    }

And in platform/x86/serial-multi-instantiate.c, those spi devices will be
added into system as a single SPI device, so TAS2781 SPI driver will
probe twice for every single SPI device. And driver will also parser
mono DSP firmware binary and RCA binary for itself.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Baojun Xu (1):
  ALSA: hda/tas2781: Add tas2781 hda driver based on SPI

 drivers/acpi/scan.c                           |    1 +
 .../platform/x86/serial-multi-instantiate.c   |   12 +
 sound/pci/hda/Kconfig                         |   14 +
 sound/pci/hda/Makefile                        |    2 +
 sound/pci/hda/patch_realtek.c                 |   13 +
 sound/pci/hda/tas2781-spi.h                   |  148 ++
 sound/pci/hda/tas2781_hda_spi.c               | 1266 ++++++++++
 sound/pci/hda/tas2781_spi_fwlib.c             | 2101 +++++++++++++++++
 8 files changed, 3557 insertions(+)
 create mode 100644 sound/pci/hda/tas2781-spi.h
 create mode 100644 sound/pci/hda/tas2781_hda_spi.c
 create mode 100644 sound/pci/hda/tas2781_spi_fwlib.c

--
2.40.1

