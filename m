Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 573FE2734AB
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 23:15:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0164516BC;
	Mon, 21 Sep 2020 23:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0164516BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600722903;
	bh=ovxew7oms8Xxz2nLaOwSS9GJd2bwRR1TzK5YXD5D2nM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SxkwWWQNgmloBQzOvn7qk0y39bkvTzA4L7+7MY9ZP4J8xiMUbjllD4Ih+fRLgZ7gq
	 vVOIEiqcMEJinJONwF2cAwhlqwkxnuEGTCNPLEjsDTRFShEI7rNOpY4FMx7emUzshc
	 OQQMkSFyxVKbDItCZL/usDYv7RI0BeIYKfnDmYFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1927AF8010A;
	Mon, 21 Sep 2020 23:13:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4F45F800B2; Mon, 21 Sep 2020 23:13:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F138F800B2
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 23:13:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F138F800B2
IronPort-SDR: nxJ+w7RL5PVNvrXPl8bBmVFj3X+XRoUq3aYyeGgK/Z1dJnl6B33tWHK61ojYe4/KguHJixp74c
 ZRlsAp6bHltQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="245316455"
X-IronPort-AV: E=Sophos;i="5.77,288,1596524400"; d="scan'208";a="245316455"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 14:13:08 -0700
IronPort-SDR: zdWZbMXPHwiCajVfOqPJ10ql1f0A0Qd/78ln9jz8d/+M02SwS3YqPbeL02w4KFYA7YuEHnhblX
 cLEPu9JmDUng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,288,1596524400"; d="scan'208";a="334725350"
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7])
 by fmsmga004.fm.intel.com with ESMTP; 21 Sep 2020 14:13:06 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx601.ger.corp.intel.com (163.33.146.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Sep 2020 22:13:05 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 21 Sep 2020 22:13:05 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v6 09/14] ASoC: Intel: catpt: Simple sysfs attributes
Thread-Topic: [PATCH v6 09/14] ASoC: Intel: catpt: Simple sysfs attributes
Thread-Index: AQHWjPzCfOElt79Vrk6OmpeehWJryalugCYggAF7MQCAAcgxkIAA9fsAgADjgmA=
Date: Mon, 21 Sep 2020 21:13:04 +0000
Message-ID: <8c5e5cec31aa4fefb6efa63a3caace0a@intel.com>
References: <20200917141242.9081-1-cezary.rojewski@intel.com>
 <20200917141242.9081-10-cezary.rojewski@intel.com>
 <8edff9bc51ea441dac454cbb6869317f@intel.com>
 <20200919144204.GD2712238@kroah.com>
 <dfdb29d1c5f04d88970757e1ec9596d9@intel.com>
 <20200921083514.GA3151537@kroah.com>
In-Reply-To: <20200921083514.GA3151537@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "Kaczmarski, Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Proborszcz, Filip" <filip.proborszcz@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Hejmowski,
 Krzysztof" <krzysztof.hejmowski@intel.com>, "Papierkowski,
 Piotr \(Habana\)" <ppapierkowski@habana.ai>, "Gopal, 
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

On 2020-09-21 10:35 AM, gregkh@linuxfoundation.org wrote:
> On Sun, Sep 20, 2020 at 05:03:00PM +0000, Rojewski, Cezary wrote:
>> On 2020-09-19 4:42 PM, gregkh@linuxfoundation.org wrote:
>>> On Fri, Sep 18, 2020 at 03:22:13PM +0000, Rojewski, Cezary wrote:
...

>>
>> Well, that's just one device driver targeting basically single device
>> available in two flavors. Lack of Documentation/ABI/<sysfs-doc> for
>> solution has been noted though. Will add in v7. As this device is
>> available on /sys/bus/pci0000:00/<dev> is the name for upcoming file:
>> sysfs-bus-pci-devices-catpt ok? Or, would you prevent a different, more
>> explicit one?
>=20
> Why are you putting random driver-specific attributes on a device owned
> by a different bus?  That can cause problems if you are not careful.
>=20
> Does the SoC core not provide you with a sound device to do this for
> instead?
>=20

I know not about any device that ASoC core provides for me for such
tasks.

And the confusion about ADSP device location stems from incomplete
description coming from ACPI tables. I've had a quite lengthy discussion
about this with Andy.
Re: [PATCH v4 02/13] ASoC: Intel: catpt: Define DSP operations
https://www.spinics.net/lists/alsa-devel/msg114651.html

>>
...

>>>
>>> Why are you calling a specific function to do all of this?  Why not
>>> provide a default_groups pointer which allows the driver core to
>>> automatically create/destroy the sysfs files for you in a race-free
>>> manner with userspace?
>>>
>>> That's the recommended way, you should never have to manually create
>>> files.
>>>
>>>
>>
>> Thanks, that's something new. As this is simple device-driver, I believe
>> you meant usage of sysfs_(add|remove)_group() or their "device"
>> equivalents: device_(add|remove)_group(), is that correct? Haven't found
>> any usage of default_group within /sound/ subsystem what cannot be said
>> about the functions I've just mentioned.
>>
>> Feel free to correct me if I'm wrong about this.
>=20
> The bus should provide you with the ability to do this, so look into
> that for your driver.
>=20
> But why are you creating a binary sysfs file?  That's only for passing
> data raw through the kernel to/from the hardware, with no
> parsing/massaging possible.  Is that what is happening here?
>=20
> I guess if there was documentation, it would be easier to review :)
>=20
> thanks,
>=20
> greg k-h
>=20

In v7 I've removed the binary sysfs file, plus the organization has been
simplified - made use of struct device_driver's 'dev_groups' field to
automate creation/ removal process of sysfs files as requested.
Documentation has too been added so things should be clearer.

Thanks,
Czarek

