Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 288F22700D6
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 17:23:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4930E16DC;
	Fri, 18 Sep 2020 17:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4930E16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600442610;
	bh=r0MyRC2fn8FICeMRgtqJ6sQMW/m3cQQSNVNn+iJ0G/g=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P1Wgv3cKGJB7HHW6tZlcsgYFGgKP2hiP/NoqFjv4A/nLjA5ToUA3SDz1jsVFSr4to
	 omE5cpOXZo6yiIxV1HQBY/sbXADiZARYmdkQl5LJ/4E6BC6erYT7dBKPiE9nd3zGop
	 MqYjN8/NMaw6D4VBinP2DsWHjN5R15STrhPVSi4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A134BF8012D;
	Fri, 18 Sep 2020 17:22:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C496AF8012D; Fri, 18 Sep 2020 17:22:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAF53F8012D
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 17:22:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAF53F8012D
IronPort-SDR: IAxBq595p/q1i0vqyhAbLhX6f3DftETFtBMwDMCnEIpekhpeCslaXftoPkZEbQeVuUYB8yhl+e
 8DZ9ma2nMVHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9748"; a="157351959"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="157351959"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 08:22:17 -0700
IronPort-SDR: xVnlChdUEvt6aXNwxLaXEQ54vyiyMV0610mIm/0uGlRKiCFxvIqqAHy+G0pDoT8hwoOiJuhovc
 Us8Tj1/G0AQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="452782935"
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138])
 by orsmga004.jf.intel.com with ESMTP; 18 Sep 2020 08:22:15 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 18 Sep 2020 16:22:13 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Fri, 18 Sep 2020 16:22:13 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v6 09/14] ASoC: Intel: catpt: Simple sysfs attributes
Thread-Topic: [PATCH v6 09/14] ASoC: Intel: catpt: Simple sysfs attributes
Thread-Index: AQHWjPzCfOElt79Vrk6OmpeehWJryalugCYg
Date: Fri, 18 Sep 2020 15:22:13 +0000
Message-ID: <8edff9bc51ea441dac454cbb6869317f@intel.com>
References: <20200917141242.9081-1-cezary.rojewski@intel.com>
 <20200917141242.9081-10-cezary.rojewski@intel.com>
In-Reply-To: <20200917141242.9081-10-cezary.rojewski@intel.com>
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

On 2020-09-17 4:12 PM, Cezary Rojewski wrote:
> Add sysfs entries for displaying version of FW currently in use as well
> as binary dump of entire version info, including build and log providers
> hashes.
>=20
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>=20
> Changes in v6:
> - functions declaration and usage now part of this patch instead of
>    being separated from it
>=20
> Changes in v2:
> - fixed size provided to memcpy() in fw_build_read() as reported by Mark
>=20

+Greg KH

Greg, would you mind taking a look at these sysfs entries added for new
catpt driver (Audio DSP driver for Haswell and Broadwell machines)?

Link to opening post for the series:
[PATCH v6 00/14] ASoC: Intel: Catpt - Lynx and Wildcat point
https://www.spinics.net/lists/alsa-devel/msg115765.html

Let me give you a quick introduction to the catpt's fs code:
During power-up sequence a handshake is made between host (kernel device
driver) and DSP (firmware) side. Two sysfs entries are generated which
expose running DSP firmware version and its build info - information
obtained during said handshake.

Much like devices (such as those of PCI-type) expose sysfs entries for
their easy identification, catpt provides entries to identify DSP FW it
is dealing with.

Thanks,
Czarek

>   sound/soc/intel/catpt/core.h   |  3 ++
>   sound/soc/intel/catpt/device.c |  6 +++
>   sound/soc/intel/catpt/fs.c     | 79 ++++++++++++++++++++++++++++++++++
>   3 files changed, 88 insertions(+)
>   create mode 100644 sound/soc/intel/catpt/fs.c
>=20
> diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
> index a29b4c0232cb..1f0f1ac92341 100644
> --- a/sound/soc/intel/catpt/core.h
> +++ b/sound/soc/intel/catpt/core.h
> @@ -155,6 +155,9 @@ int catpt_store_module_states(struct catpt_dev *cdev,=
 struct dma_chan *chan);
>   int catpt_store_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)=
;
>   int catpt_coredump(struct catpt_dev *cdev);
>  =20
> +int catpt_sysfs_create(struct catpt_dev *cdev);
> +void catpt_sysfs_remove(struct catpt_dev *cdev);
> +
>   #include <sound/memalloc.h>
>   #include <uapi/sound/asound.h>
>  =20
> diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/devic=
e.c
> index 7c7ddbabaf55..e9b7c1f474e0 100644
> --- a/sound/soc/intel/catpt/device.c
> +++ b/sound/soc/intel/catpt/device.c
> @@ -184,6 +184,10 @@ static int catpt_probe_components(struct catpt_dev *=
cdev)
>   		goto board_err;
>   	}
>  =20
> +	ret =3D catpt_sysfs_create(cdev);
> +	if (ret)
> +		goto board_err;
> +
>   	/* reflect actual ADSP state in pm_runtime */
>   	pm_runtime_set_active(cdev->dev);
>  =20
> @@ -292,6 +296,8 @@ static int catpt_acpi_remove(struct platform_device *=
pdev)
>   	catpt_sram_free(&cdev->iram);
>   	catpt_sram_free(&cdev->dram);
>  =20
> +	catpt_sysfs_remove(cdev);
> +
>   	return 0;
>   }
>  =20
> diff --git a/sound/soc/intel/catpt/fs.c b/sound/soc/intel/catpt/fs.c
> new file mode 100644
> index 000000000000..d73493687f4a
> --- /dev/null
> +++ b/sound/soc/intel/catpt/fs.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0-pcm
> +//
> +// Copyright(c) 2020 Intel Corporation. All rights reserved.
> +//
> +// Author: Cezary Rojewski <cezary.rojewski@intel.com>
> +//
> +
> +#include <linux/pm_runtime.h>
> +#include "core.h"
> +
> +static ssize_t fw_version_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct catpt_dev *cdev =3D dev_get_drvdata(dev);
> +	struct catpt_fw_version version;
> +	int ret;
> +
> +	pm_runtime_get_sync(cdev->dev);
> +
> +	ret =3D catpt_ipc_get_fw_version(cdev, &version);
> +
> +	pm_runtime_mark_last_busy(cdev->dev);
> +	pm_runtime_put_autosuspend(cdev->dev);
> +
> +	if (ret)
> +		return CATPT_IPC_ERROR(ret);
> +
> +	return sprintf(buf, "%d.%d.%d.%d\n", version.type, version.major,
> +		       version.minor, version.build);
> +}
> +
> +static DEVICE_ATTR_RO(fw_version);
> +
> +static ssize_t fw_build_read(struct file *filp, struct kobject *kobj,
> +			     struct bin_attribute *bin_attr, char *buf,
> +			     loff_t off, size_t count)
> +{
> +	struct catpt_dev *cdev =3D dev_get_drvdata(kobj_to_dev(kobj));
> +	struct catpt_fw_version version;
> +	int ret;
> +
> +	pm_runtime_get_sync(cdev->dev);
> +
> +	ret =3D catpt_ipc_get_fw_version(cdev, &version);
> +
> +	pm_runtime_mark_last_busy(cdev->dev);
> +	pm_runtime_put_autosuspend(cdev->dev);
> +
> +	if (ret)
> +		return CATPT_IPC_ERROR(ret);
> +
> +	memcpy(buf, &version, sizeof(version));
> +	return count;
> +}
> +
> +static BIN_ATTR_RO(fw_build, sizeof(struct catpt_fw_version));
> +
> +int catpt_sysfs_create(struct catpt_dev *cdev)
> +{
> +	int ret;
> +
> +	ret =3D sysfs_create_file(&cdev->dev->kobj, &dev_attr_fw_version.attr);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D sysfs_create_bin_file(&cdev->dev->kobj, &bin_attr_fw_build);
> +	if (ret) {
> +		sysfs_remove_file(&cdev->dev->kobj, &dev_attr_fw_version.attr);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +void catpt_sysfs_remove(struct catpt_dev *cdev)
> +{
> +	sysfs_remove_bin_file(&cdev->dev->kobj, &bin_attr_fw_build);
> +	sysfs_remove_file(&cdev->dev->kobj, &dev_attr_fw_version.attr);
> +}
>
