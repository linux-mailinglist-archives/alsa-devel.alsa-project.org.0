Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F67527162F
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 19:04:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DAD2167C;
	Sun, 20 Sep 2020 19:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DAD2167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600621498;
	bh=yZA0w4i6qszPu6TQmd7mbMefmSgeNwlSMBFUmXvG/uk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g6s9E6hIPschkuZOlP6P1R0kQjEqlO0AS3taMcdDzhqckLpPFeh+jMVr/WQn3aUBr
	 j5on9kLeO5Gy7otEtZchT9rDWMjyHPp2D1LVbL3VlOQkDaCkJIdZ1OoEWDPUyGomgm
	 Do3miGNfq/yT3DqqICgBfm+1I9zzW8C5AfTcvyC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEC85F80234;
	Sun, 20 Sep 2020 19:03:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11922F80232; Sun, 20 Sep 2020 19:03:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BDDFF801EC
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 19:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BDDFF801EC
IronPort-SDR: Q+jCgJ7T1U5LPWrRQMA7E7tuYpwwdC1Koc9PzMKBaaomEwHMOBAh/AVgC8KVmRLlaaYNnQ4s64
 c/asgl4HhDvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="178333263"
X-IronPort-AV: E=Sophos;i="5.77,283,1596524400"; d="scan'208";a="178333263"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2020 10:03:03 -0700
IronPort-SDR: 2CsGBPnHmBOhyfWsgOR5i6j+lZZN+V3UkQYAwe3bhi58J2VclM87UOcZsrzgJgJ7D04+WP3MDy
 4bKO/wSQ+VVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,283,1596524400"; d="scan'208";a="509382396"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by fmsmga006.fm.intel.com with ESMTP; 20 Sep 2020 10:03:01 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 20 Sep 2020 18:03:00 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Sun, 20 Sep 2020 18:03:00 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v6 09/14] ASoC: Intel: catpt: Simple sysfs attributes
Thread-Topic: [PATCH v6 09/14] ASoC: Intel: catpt: Simple sysfs attributes
Thread-Index: AQHWjPzCfOElt79Vrk6OmpeehWJryalugCYggAF7MQCAAcgxkA==
Date: Sun, 20 Sep 2020 17:03:00 +0000
Message-ID: <dfdb29d1c5f04d88970757e1ec9596d9@intel.com>
References: <20200917141242.9081-1-cezary.rojewski@intel.com>
 <20200917141242.9081-10-cezary.rojewski@intel.com>
 <8edff9bc51ea441dac454cbb6869317f@intel.com>
 <20200919144204.GD2712238@kroah.com>
In-Reply-To: <20200919144204.GD2712238@kroah.com>
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

On 2020-09-19 4:42 PM, gregkh@linuxfoundation.org wrote:
> On Fri, Sep 18, 2020 at 03:22:13PM +0000, Rojewski, Cezary wrote:
>> On 2020-09-17 4:12 PM, Cezary Rojewski wrote:
>>> Add sysfs entries for displaying version of FW currently in use as well
>>> as binary dump of entire version info, including build and log provider=
s
>>> hashes.
>>>
>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>> ---
>>>
>>> Changes in v6:
>>> - functions declaration and usage now part of this patch instead of
>>>     being separated from it
>>>
>>> Changes in v2:
>>> - fixed size provided to memcpy() in fw_build_read() as reported by Mar=
k
>>>
>>
>> +Greg KH
>>
>> Greg, would you mind taking a look at these sysfs entries added for new
>> catpt driver (Audio DSP driver for Haswell and Broadwell machines)?
>=20
> Why me?
>=20

Andy (CC'ed) suggested that it's best if sysfs code is routed through you.
Given your input, I believe he was right.

>> Link to opening post for the series:
>> [PATCH v6 00/14] ASoC: Intel: Catpt - Lynx and Wildcat point
>> https://www.spinics.net/lists/alsa-devel/msg115765.html
>=20
> Does lore.kernel.org handle alsa-devel yet?
>=20

Believe it does as alsa-devel archive can be found on lore.kernel.org.
Not really the guy to answer integration questions, though.

>>
>> Let me give you a quick introduction to the catpt's fs code:
>> During power-up sequence a handshake is made between host (kernel device
>> driver) and DSP (firmware) side. Two sysfs entries are generated which
>> expose running DSP firmware version and its build info - information
>> obtained during said handshake.
>>
>> Much like devices (such as those of PCI-type) expose sysfs entries for
>> their easy identification, catpt provides entries to identify DSP FW it
>> is dealing with.
>=20
> No Documentation/ABI/ entry for these new devices explaining what they
> do and are for?  That would be a good first step, and has always been a
> requirement for sysfs files.  Do that and resend the series and cc: me
> and ask for my review and I will be glad to give it.
>=20
> Oh, a few notes below:
>=20

Well, that's just one device driver targeting basically single device
available in two flavors. Lack of Documentation/ABI/<sysfs-doc> for
solution has been noted though. Will add in v7. As this device is
available on /sys/bus/pci0000:00/<dev> is the name for upcoming file:
sysfs-bus-pci-devices-catpt ok? Or, would you prevent a different, more
explicit one?

>>>    sound/soc/intel/catpt/core.h   |  3 ++
>>>    sound/soc/intel/catpt/device.c |  6 +++
>>>    sound/soc/intel/catpt/fs.c     | 79 ++++++++++++++++++++++++++++++++=
++
>>>    3 files changed, 88 insertions(+)
>>>    create mode 100644 sound/soc/intel/catpt/fs.c
>>>
>>> diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.=
h
>>> index a29b4c0232cb..1f0f1ac92341 100644
>>> --- a/sound/soc/intel/catpt/core.h
>>> +++ b/sound/soc/intel/catpt/core.h
>>> @@ -155,6 +155,9 @@ int catpt_store_module_states(struct catpt_dev *cde=
v, struct dma_chan *chan);
>>>    int catpt_store_memdumps(struct catpt_dev *cdev, struct dma_chan *ch=
an);
>>>    int catpt_coredump(struct catpt_dev *cdev);
>>>   =20
>>> +int catpt_sysfs_create(struct catpt_dev *cdev);
>>> +void catpt_sysfs_remove(struct catpt_dev *cdev);
>>> +
>>>    #include <sound/memalloc.h>
>>>    #include <uapi/sound/asound.h>
>>>   =20
>>> diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/dev=
ice.c
>>> index 7c7ddbabaf55..e9b7c1f474e0 100644
>>> --- a/sound/soc/intel/catpt/device.c
>>> +++ b/sound/soc/intel/catpt/device.c
>>> @@ -184,6 +184,10 @@ static int catpt_probe_components(struct catpt_dev=
 *cdev)
>>>    		goto board_err;
>>>    	}
>>>   =20
>>> +	ret =3D catpt_sysfs_create(cdev);
>>> +	if (ret)
>>> +		goto board_err;
>=20
> Why are you calling a specific function to do all of this?  Why not
> provide a default_groups pointer which allows the driver core to
> automatically create/destroy the sysfs files for you in a race-free
> manner with userspace?
>=20
> That's the recommended way, you should never have to manually create
> files.
>=20
>=20

Thanks, that's something new. As this is simple device-driver, I believe
you meant usage of sysfs_(add|remove)_group() or their "device"
equivalents: device_(add|remove)_group(), is that correct? Haven't found
any usage of default_group within /sound/ subsystem what cannot be said
about the functions I've just mentioned.

Feel free to correct me if I'm wrong about this.

>>> +
>>>    	/* reflect actual ADSP state in pm_runtime */
>>>    	pm_runtime_set_active(cdev->dev);
>>>   =20
>>> @@ -292,6 +296,8 @@ static int catpt_acpi_remove(struct platform_device=
 *pdev)
>>>    	catpt_sram_free(&cdev->iram);
>>>    	catpt_sram_free(&cdev->dram);
>>>   =20
>>> +	catpt_sysfs_remove(cdev);
>>> +
>>>    	return 0;
>>>    }
>>>   =20
>>> diff --git a/sound/soc/intel/catpt/fs.c b/sound/soc/intel/catpt/fs.c
>>> new file mode 100644
>>> index 000000000000..d73493687f4a
>>> --- /dev/null
>>> +++ b/sound/soc/intel/catpt/fs.c
>>> @@ -0,0 +1,79 @@
>>> +// SPDX-License-Identifier: GPL-2.0-pcm
>=20
> What is "GPL-2.0-pcm" for a SPDX identifier?  We don't have that listed
> in LICENSES, do we?
>=20
> Did this pass the spdxcheck tool in scripts?
>=20
> thanks,
>=20
> greg k-h
>=20

Well, after s/pcm/only/ is does : )
Mark already mentioned this mistake, my bad for letting it into v6..

Thanks for your input, much appreciated.

Czarek

