Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A8E1F4914
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 23:46:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0552A1666;
	Tue,  9 Jun 2020 23:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0552A1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591739160;
	bh=wCZtyR16IOqKLSqQfN20iunkoqDoXCgf2IMn8SreoRY=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ntGh53rLBNZsSXhqJNt7TRas3fmoyGscrScY7voBxAYKghpkNGgDwPR+Gf+5kdf1Z
	 waVOelZhgrrjFaWOvR7hNvTesk5omIlnsUqHn7uYISy2J1Y2o/GGfqTcW4Vbp0Yrp4
	 0HRgSVdGv78bUiUPpC7XyYeRK9AL46fGrh0eByHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 263EBF8028D;
	Tue,  9 Jun 2020 23:44:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9101F80124; Tue,  9 Jun 2020 23:44:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_76,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092065070.outbound.protection.outlook.com [40.92.65.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0CD2F80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 23:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0CD2F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com
 header.b="MgqY3jFo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dx3aYDXFZ3BskHMh5j9rJgpEXkrtZiXZNKymONYVc+oJRjzASfIIqNS8eW/Tywa+tBpdr4BPy85u37OdVDPuxx3u/eIx5hwG4tGCy55TC77AmL/w6BGBUoHqsksNdB0t1Y4fFMVlRL60+RTszjJanNKETLvXdok+cX3I2rjtMvug0mjIL4Ajgw3MN69WgG7PO6st9U3ryzsXdBQuLIOM5bnJPkddshtQ4bZ+RctWOuSlQ9ZxBUgCw47NnTZ8NsBykLNp21VibILqG+qs649bT6/kOrCvAU0WABnTGUqHa6PQ9TU5bq0Gz5Ebvu9IV6EwVQF1PscvS6wpy9NZanrH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKVmTftS+X2MyFwBIS+a9avWFaqTWHDApOpN04no4i4=;
 b=FhCkQnpF6rh0KKkAxWD8YeWqGhWgVOSQAu0zPOxIq5dv9UTEFQPAk7tG3LeVdV9+c8V3ZPs3LneSrOLlcuQBCzFL7SXrH17tI7/gupwxRSppgaLO3+z3CyDDEfOR8wBf2AjVbW1Uu1pAloahXaK4edx4U8hXzuNiq+fDp4aX//uuGEyh97DLxyIvUXLVbgUsPGjS63Pu93vurulX53A+1wXQyDPJzsVYRdPD3cNe8+sAIinPX/aOL8FBQEC6tA54ohWocuOV1ryA42Yn3NhgneE8RX1i250sGYUD6Lf5DFOAWs7Kd3d3TZq1wMWPz5setmZM8ty+jCNB3YVnTPfNFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKVmTftS+X2MyFwBIS+a9avWFaqTWHDApOpN04no4i4=;
 b=MgqY3jFoE+nI+wsfdLna0Cgv14r30f7VFHU8rOmqvXjzDKhkE6MWIp4v/Qt/ldRcjTzFEn5xOdyq8Ml5pqXXQdAN+Hzk2kCM5eNMbMNq/V0OEFkpqxKmGWOTuEdKQF0sE3YGBRzpGEN8CLaUEIB8TQ7pz+IeNK5tZbSWUeXl59OmyjlUa1iL/qoSJwdNEpo1tyqtNDlR+WXlDfg/wryoxPu7kYFqt3YemW7ok8oC14qqzpNrz+qcaUeKbjaRz7vFcYepeYOtkf+rVxDq5ZDOqeON00nu0/FjmKx0JbCw452jzUJEdJqzr5wo7sIIl4NZeIv/oGzRdFFIkV0lV4Yd8Q==
Received: from VE1EUR01FT012.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e19::42) by
 VE1EUR01HT015.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e19::265)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 9 Jun
 2020 21:44:06 +0000
Received: from DB8P191MB0998.EURP191.PROD.OUTLOOK.COM (2a01:111:e400:7e19::49)
 by VE1EUR01FT012.mail.protection.outlook.com
 (2a01:111:e400:7e19::210) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Tue, 9 Jun 2020 21:44:06 +0000
Received: from DB8P191MB0998.EURP191.PROD.OUTLOOK.COM
 ([fe80::a46d:d1e:c5b:9778]) by DB8P191MB0998.EURP191.PROD.OUTLOOK.COM
 ([fe80::a46d:d1e:c5b:9778%9]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 21:44:06 +0000
From: Stuart Naylor <stuartiannaylor@outlook.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: We were woken up with POLLOUT set 
Thread-Topic: We were woken up with POLLOUT set 
Thread-Index: AQHWPqcZ7MCPzzkzdku05vhFTXowTQ==
Date: Tue, 9 Jun 2020 21:44:05 +0000
Message-ID: <DB8P191MB0998103037B01CAE9BCB7AE7A8820@DB8P191MB0998.EURP191.PROD.OUTLOOK.COM>
References: <mailman.10188.1591738703.5591.alsa-devel@alsa-project.org>
In-Reply-To: <mailman.10188.1591738703.5591.alsa-devel@alsa-project.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:A7F812F5CA00426A82A8F1AE4B6A05462432896A690ADFB48F7EC4879B93D68A;
 UpperCasedChecksum:78BF4E02865DDC131A8333A6C374E2B20B0CEB44F772DE85F0B305BA962FD28F;
 SizeAsReceived:6841; Count:44
x-tmn: [TlMoBZ4KFcnBf6KMSIovnrLKtoDZj7DT]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 89c0616d-7eaf-4e1b-bb01-08d80cbe3bdf
x-ms-traffictypediagnostic: VE1EUR01HT015:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lsKB+6LVfPoe5eYAzewozSVTSnb1B6hLdvcVo65T7TQS75MAYTXHJpW8vBNFbnQ6AcbrNYx7IgakxcPdHq0z0t1NltHZPeCBbEPlv3FzseduokSa5NpuABkM5w0d2TqBdemdRUkhZDjlsdc8WeGKuQ3qytlS2rDePFuD2eSDwEhh5mien/4PDrt75H/LoPM6aNnsnNQ35qej8mFq/NbOAdCMOpBWkuCfjToO61vEpTVoRUEAMyMawsPJ1yvledZl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8P191MB0998.EURP191.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: Z/KJZL6TkFoUSHjeh/nOURLTDEX3aLmVW0W2wI5Xh6FINl9WkbjCfCq1Yp2BOXsDCGy6XFO1lXM32ylUc0e4wlGw2lW7mreS5GyYB2p4QU+elFpAJpvnug2IJM67O7EW1Y9VKwgakmXIW1ddPRpigQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c0616d-7eaf-4e1b-bb01-08d80cbe3bdf
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 21:44:05.9717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT015
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Yeah pulseaudio is doing the same on Raspbian with USB devices.

Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s 10

From: alsa-devel-request@alsa-project.org<mailto:alsa-devel-request@alsa-pr=
oject.org>
Sent: 09 June 2020 22:40
To: alsa-devel@alsa-project.org<mailto:alsa-devel@alsa-project.org>
Subject: Alsa-devel Digest, Vol 160, Issue 72

Send Alsa-devel mailing list submissions to
        alsa-devel@alsa-project.org

To subscribe or unsubscribe via the World Wide Web, visit
        https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
or, via email, send a message with subject or body 'help' to
        alsa-devel-request@alsa-project.org

You can reach the person managing the list at
        alsa-devel-owner@alsa-project.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of Alsa-devel digest..."


Today's Topics:

   1. Re: [RFC PATCH 0/2] TAS2563 DSP Firmware Loader (Dan Murphy)
   2. Re: [RFC PATCH 0/2] TAS2563 DSP Firmware Loader (Mark Brown)
   3. Re: [RFC PATCH 1/2] dt-bindings: tas2562: Add firmware
      support for tas2563 (Mark Brown)
   4. Re: [RFC PATCH 1/2] dt-bindings: tas2562: Add firmware
      support for tas2563 (Dan Murphy)
   5. We were woken up with POLLOUT set -- however a subsequent
      snd_pcm_avail() returned 0 or another value < min_avail. Jun 09
      14:31:33 elrond pulseaudio[11933]: Most likely this is a bug in
      the ALSA driver 'snd_usb_audio'. Please report this issue to the
      ALSA developers. Jun 09 14:31:33 elrond pulseaudio[11933]: ALSA
      woke us up to write new data to the device, but there was
      actually nothing to write. (GitHub issues - opened)
   6. We were woken up with POLLOUT set -- however a subsequent
      snd_pcm_avail() returned 0 or another value < min_avail. Jun 09
      14:31:33 elrond pulseaudio[11933]: Most likely this is a bug in
      the ALSA driver 'snd_usb_audio'. Please report this issue to the
      ALSA developers. Jun 09 14:31:33 elrond pulseaudio[11933]: ALSA
      woke us up to write new data to the device, but there was
      actually nothing to write. (GitHub issues - edited)
   7. ALSA journalctl error. (GitHub issues - edited)
   8. ALSA journalctl Error (GitHub issues - edited)


----------------------------------------------------------------------

Message: 1
Date: Tue, 9 Jun 2020 13:07:50 -0500
From: Dan Murphy <dmurphy@ti.com>
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [RFC PATCH 0/2] TAS2563 DSP Firmware Loader
Message-ID: <6d6aaed3-dac8-e1ec-436c-9b04273df2b3@ti.com>
Content-Type: text/plain; charset=3D"windows-1252"; format=3Dflowed

Mark

On 6/9/20 12:52 PM, Mark Brown wrote:
> On Tue, Jun 09, 2020 at 12:28:39PM -0500, Dan Murphy wrote:
>
>> These programs and configurations are selectable via files under the I2C=
 dev
>> node.  There may be a better way to select this through ALSA controls bu=
t I was
>> unable to find a good example of this.  This is why this is an RFC patch=
set.
> I think you can just use enums for most of this - what you want to do I
> think is parse the firmware, build templates for the controls and then
> add them with snd_soc_add_component_controls().  Userspace *should* cope
> with controls being hotplugged.

Yes this was my concern if userspace could cope with dynamic controls.

Dan



------------------------------

Message: 2
Date: Tue, 9 Jun 2020 19:16:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Cc: robh@kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [RFC PATCH 0/2] TAS2563 DSP Firmware Loader
Message-ID: <20200609181615.GR4583@sirena.org.uk>
Content-Type: text/plain; charset=3D"us-ascii"

On Tue, Jun 09, 2020 at 01:07:50PM -0500, Dan Murphy wrote:
> On 6/9/20 12:52 PM, Mark Brown wrote:

> > I think you can just use enums for most of this - what you want to do I
> > think is parse the firmware, build templates for the controls and then
> > add them with snd_soc_add_component_controls().  Userspace *should* cop=
e
> > with controls being hotplugged.

> Yes this was my concern if userspace could cope with dynamic controls.

Things like alsactl definitely do, and obviously anything that starts
after the firmware loads will be fine too.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://mailman.alsa-project.org/pipermail/alsa-devel/attachments/2020=
0609/0cf2f996/attachment-0001.sig>

------------------------------

Message: 3
Date: Tue, 9 Jun 2020 19:47:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Cc: robh@kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [RFC PATCH 1/2] dt-bindings: tas2562: Add firmware
        support for tas2563
Message-ID: <20200609184734.GS4583@sirena.org.uk>
Content-Type: text/plain; charset=3D"iso-8859-1"

On Tue, Jun 09, 2020 at 01:06:50PM -0500, Dan Murphy wrote:

> I could make a default as you suggested to include i2c address and bus in
> the name.? But the TAS2563 does not need the firmware to operate and the
> 2562 does not have a DSP.

That's fine, the driver can just use the compatible string to check this
and not offer any of the DSP related stuff (it should do this regardless
of the method used here).  I'm guessing the regmap configs should also
be different.

> What if there was an ALSA control instead that passed in the firmware nam=
e
> from the user space instead of using the DT?

> Then the control can load and parse the firmware and wait for the user to
> select the program.

> This would solve a user from having ot update the DT to use a firmware.

That's really not very idiomatic for how Linux does stuff and seems to
pretty much guarantee issues with hotplugging controls and ordering -
you'd need special userspace to start up even if it was just a really
simple DSP config doing only speaker correction or something.  I'm not
sure what the advantage would be - what problem is this solving over
static names?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://mailman.alsa-project.org/pipermail/alsa-devel/attachments/2020=
0609/c90c0f22/attachment-0001.sig>

------------------------------

Message: 4
Date: Tue, 9 Jun 2020 14:20:29 -0500
From: Dan Murphy <dmurphy@ti.com>
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [RFC PATCH 1/2] dt-bindings: tas2562: Add firmware
        support for tas2563
Message-ID: <014b85b5-677b-569a-4eb2-74526d3f00bc@ti.com>
Content-Type: text/plain; charset=3D"windows-1252"; format=3Dflowed

Mark

On 6/9/20 1:47 PM, Mark Brown wrote:
> On Tue, Jun 09, 2020 at 01:06:50PM -0500, Dan Murphy wrote:
>
>> I could make a default as you suggested to include i2c address and bus i=
n
>> the name.? But the TAS2563 does not need the firmware to operate and the
>> 2562 does not have a DSP.
> That's fine, the driver can just use the compatible string to check this
> and not offer any of the DSP related stuff (it should do this regardless
> of the method used here).  I'm guessing the regmap configs should also
> be different.

The driver does check the compatible to determine if DSP loading is
available for the device.

The driver also checks to see if the firmware file is declared in the DT.

So it has to pass 2 checks to even load and parse the firmware to
present the controls for the programs and configs.


>> What if there was an ALSA control instead that passed in the firmware na=
me
>> from the user space instead of using the DT?
>> Then the control can load and parse the firmware and wait for the user t=
o
>> select the program.
>> This would solve a user from having ot update the DT to use a firmware.
> That's really not very idiomatic for how Linux does stuff and seems to
> pretty much guarantee issues with hotplugging controls and ordering -
> you'd need special userspace to start up even if it was just a really
> simple DSP config doing only speaker correction or something.  I'm not
> sure what the advantage would be - what problem is this solving over
> static names?

IMO having a static name is the problem. It is an inflexible design.?
Besides the firmware-name property seems to be used in other drivers to
declare firmwares for the boards.

But if no one is complaining or submitting patches within the codecs to
be more flexible with firmware then I can just hard code the name like
other drivers do.

Dan



------------------------------

Message: 5
Date: Tue,  9 Jun 2020 23:37:09 +0200 (CEST)
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Subject: We were woken up with POLLOUT set -- however a subsequent
        snd_pcm_avail() returned 0 or another value < min_avail. Jun 09
        14:31:33 elrond pulseaudio[11933]: Most likely this is a bug in the
        ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA
        developers. Jun 09 14:31:33 elrond pulseaudio[11933]: ALSA woke us =
up
        to write new data to the device, but there was actually nothing to
        write.
Message-ID: <20200609213709.68678F8028C@alsa1.perex.cz>
Content-Type: text/plain; charset=3D"us-ascii"

alsa-project/alsa-lib issue #57 was opened from danieloppenlander:

I ran across an error in my journalctl on Ubuntu 20.04. It said to report a=
 bug. Here is my alsa-info.sh output: http://alsa-project.org/db/?f=3D6b505=
aa5138f2a974037ab5c3a89e1605807df97

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/57
Repository URL: https://github.com/alsa-project/alsa-lib


------------------------------

Message: 6
Date: Tue,  9 Jun 2020 23:37:50 +0200 (CEST)
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Subject: We were woken up with POLLOUT set -- however a subsequent
        snd_pcm_avail() returned 0 or another value < min_avail. Jun 09
        14:31:33 elrond pulseaudio[11933]: Most likely this is a bug in the
        ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA
        developers. Jun 09 14:31:33 elrond pulseaudio[11933]: ALSA woke us =
up
        to write new data to the device, but there was actually nothing to
        write.
Message-ID: <20200609213750.BD8BDF80292@alsa1.perex.cz>
Content-Type: text/plain; charset=3D"us-ascii"

alsa-project/alsa-lib issue #57 was edited from danieloppenlander:

I ran across an error in my journalctl on Ubuntu 20.04. It said to report a=
 bug. Here is my alsa-info.sh output: http://alsa-project.org/db/?f=3D6b505=
aa5138f2a974037ab5c3a89e1605807df97
Here is the journalctl message:

```
We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() r=
eturned 0 or another value < min_avail. Jun 09 14:31:33 elrond pulseaudio[1=
1933]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please=
 report this issue to the ALSA developers. Jun 09 14:31:33 elrond pulseaudi=
o[11933]: ALSA woke us up to write new data to the device, but there was ac=
tually nothing to write.
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/57
Repository URL: https://github.com/alsa-project/alsa-lib


------------------------------

Message: 7
Date: Tue,  9 Jun 2020 23:38:12 +0200 (CEST)
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Subject: ALSA journalctl error.
Message-ID: <20200609213812.E8B5EF8029A@alsa1.perex.cz>
Content-Type: text/plain; charset=3D"us-ascii"

alsa-project/alsa-lib issue #57 was edited from danieloppenlander:

I ran across an error in my journalctl on Ubuntu 20.04. It said to report a=
 bug. Here is my alsa-info.sh output: http://alsa-project.org/db/?f=3D6b505=
aa5138f2a974037ab5c3a89e1605807df97
Here is the journalctl message:

```
We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() r=
eturned 0 or another value < min_avail. Jun 09 14:31:33 elrond pulseaudio[1=
1933]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please=
 report this issue to the ALSA developers. Jun 09 14:31:33 elrond pulseaudi=
o[11933]: ALSA woke us up to write new data to the device, but there was ac=
tually nothing to write.
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/57
Repository URL: https://github.com/alsa-project/alsa-lib


------------------------------

Message: 8
Date: Tue,  9 Jun 2020 23:38:23 +0200 (CEST)
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Subject: ALSA journalctl Error
Message-ID: <20200609213823.4B065F802A7@alsa1.perex.cz>
Content-Type: text/plain; charset=3D"us-ascii"

alsa-project/alsa-lib issue #57 was edited from danieloppenlander:

I ran across an error in my journalctl on Ubuntu 20.04. It said to report a=
 bug. Here is my alsa-info.sh output: http://alsa-project.org/db/?f=3D6b505=
aa5138f2a974037ab5c3a89e1605807df97
Here is the journalctl message:

```
We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() r=
eturned 0 or another value < min_avail. Jun 09 14:31:33 elrond pulseaudio[1=
1933]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please=
 report this issue to the ALSA developers. Jun 09 14:31:33 elrond pulseaudi=
o[11933]: ALSA woke us up to write new data to the device, but there was ac=
tually nothing to write.
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/57
Repository URL: https://github.com/alsa-project/alsa-lib


------------------------------

Subject: Digest Footer

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel


------------------------------

End of Alsa-devel Digest, Vol 160, Issue 72
*******************************************

