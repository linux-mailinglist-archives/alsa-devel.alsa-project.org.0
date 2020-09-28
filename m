Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DF627B29C
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 18:54:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1E8B18CF;
	Mon, 28 Sep 2020 18:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1E8B18CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601312082;
	bh=XcHDmwvcQmL8c1dg9QbOiq4En3GgoCDJb6AcKDuwCOg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bIeWgKMBawZ6YpQQQv3wkzTooAap5Y5JyPaqpj2X2FjMX4fqmIej24MimXPYi7l+s
	 osA+pO4BCpDZioYGBEkaw1T6LeEVjGl5NQS2plBG0GQqaSMM+PTQxH2aDSfSygRJ/n
	 B2lMWaHMAyDlaaa/ILUzYYaJNDNHOjuCDJsRHLRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAF1CF800DF;
	Mon, 28 Sep 2020 18:53:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84087F801F9; Mon, 28 Sep 2020 18:52:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7DC7F800DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 18:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7DC7F800DF
IronPort-SDR: KfmXPQs/gfoRanNUT8RGY2HicEzhUwX7l+y3xXnh6o7q/BtRjUaGVhkmchLkRS+k84JEvmJZfi
 P+dFvFb7BWTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="159408416"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="159408416"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 09:52:44 -0700
IronPort-SDR: MwyiIJtpuYJJ71OGnFUeCWwB9VgkiURT0rp6lz+9o5TRfetU3diQ5wqhMHFKwh29vJfxAEkez1
 eFWP2hZIwI6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="350787629"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by orsmga007.jf.intel.com with ESMTP; 28 Sep 2020 09:52:42 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 28 Sep 2020 17:52:41 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 28 Sep 2020 17:52:41 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v9 02/14] ASoC: Intel: catpt: Implement IPC protocol
Thread-Topic: [PATCH v9 02/14] ASoC: Intel: catpt: Implement IPC protocol
Thread-Index: AQHWk+NWwUl83Zep90OOxekHAkyKjKl+AmkAgABD/WA=
Date: Mon, 28 Sep 2020 16:52:41 +0000
Message-ID: <407ca256d3884856b469ba65c0379d91@intel.com>
References: <20200926085910.21948-1-cezary.rojewski@intel.com>
 <20200926085910.21948-3-cezary.rojewski@intel.com>
 <20200928134424.GM3956970@smile.fi.intel.com>
In-Reply-To: <20200928134424.GM3956970@smile.fi.intel.com>
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
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Proborszcz, Filip" <filip.proborszcz@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Hejmowski,
 Krzysztof" <krzysztof.hejmowski@intel.com>,
 "ppapierkowski@habana.ai" <ppapierkowski@habana.ai>, "Gopal, 
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

On 2020-09-28 3:44 PM, Andy Shevchenko wrote:
> On Sat, Sep 26, 2020 at 10:58:58AM +0200, Cezary Rojewski wrote:
>> Implement IRQ handlers for immediate and delayed replies and
>> notifications. Communication is synchronous and allows for serialization
>> of maximum one message at a time.
>>
>> DSP may respond with ADSP_PENDING status for a request - known as
>> delayed reply - and when situation occurs, framework keeps the lock and
>> awaits upcoming response through IPCD channel which is handled in
>> bottom-half. Immediate replies spawn no BH at all as their processing is
>> very short.

...

>> +static int catpt_dsp_do_send_msg(struct catpt_dev *cdev,
>> +				 struct catpt_ipc_msg request,
>> +				 struct catpt_ipc_msg *reply, int timeout)
>> +{
>> +	struct catpt_ipc *ipc =3D &cdev->ipc;
>> +	unsigned long flags;
>> +	int ret;
>> +
>> +	if (!ipc->ready)
>> +		return -EPERM;
>> +	if (request.size > ipc->config.outbox_size ||
>> +	    (reply && reply->size > ipc->config.outbox_size))
>> +		return -EINVAL;
>> +
>> +	spin_lock_irqsave(&ipc->lock, flags);
>> +	catpt_ipc_msg_init(ipc, reply);
>> +	catpt_dsp_send_tx(cdev, &request);
>> +	spin_unlock_irqrestore(&ipc->lock, flags);
>> +
>> +	ret =3D catpt_wait_msg_completion(cdev, timeout);
>> +	if (ret) {
>> +		dev_crit(cdev->dev, "communication severed: %d, rebooting dsp..\n",
>> +			 ret);
>> +		ipc->ready =3D false;
>> +		/* TODO: attempt recovery */
>> +		return ret;
>> +	}
>=20
>> +	ret =3D ipc->rx.rsp.status;
>> +	if (reply) {
>> +		reply->header =3D ipc->rx.header;
>> +		if (!ret && reply->data)
>> +			memcpy(reply->data, ipc->rx.data, reply->size);
>> +	}
>> +
>> +	return ret;
>=20
> One more looking into this... What about
>=20
> 	if (reply)
> 		reply->header =3D ipc->rx.header;
>=20
> 	ret =3D ipc->rx.rsp.status; // or even directly if (status) return statu=
s.
> 	if (ret)
> 		return ret;
>=20
> 	if (reply->data)
> 		memcpy(reply->data, ipc->rx.data, reply->size);
>=20
> 	return 0;
>=20
> It may be verbose but I think readability is better here.
>=20
>> +}
>=20

In your example, last 'if' will cause exception if reply=3D=3DNULL.

Got your point, although that's just few lines which already involve
'if' with { } spacing. After removing size-checks you suggested this
code is quite thin already.

>> +	CATPT_CHANNEL_CONFIG_5_POINT_0	=3D 7, /* L, C, R, Ls & Rs */
>> +	CATPT_CHANNEL_CONFIG_5_POINT_1	=3D 8, /* L, C, R, Ls, Rs & LFE */
>> +	CATPT_CHANNEL_CONFIG_DUAL_MONO	=3D 9, /* One channel replicated in two=
 */
>> +	CATPT_CHANNEL_CONFIG_INVALID	=3D 10,
>=20
> Hmm... I think I got the point why DUAL_MONO was at the end of the switch=
-case.
>=20

Well, well. Indeed we found where Willy is..

>> +enum catpt_module_id {
>> +	CATPT_MODID_BASE_FW =3D 0x0,
>> +	CATPT_MODID_MP3 =3D 0x1,
>> +	CATPT_MODID_AAC_5_1 =3D 0x2,
>> +	CATPT_MODID_AAC_2_0 =3D 0x3,
>> +	CATPT_MODID_SRC =3D 0x4,
>> +	CATPT_MODID_WAVES =3D 0x5,
>> +	CATPT_MODID_DOLBY =3D 0x6,
>> +	CATPT_MODID_BOOST =3D 0x7,
>> +	CATPT_MODID_LPAL =3D 0x8,
>> +	CATPT_MODID_DTS =3D 0x9,
>> +	CATPT_MODID_PCM_CAPTURE =3D 0xA,
>> +	CATPT_MODID_PCM_SYSTEM =3D 0xB,
>> +	CATPT_MODID_PCM_REFERENCE =3D 0xC,
>> +	CATPT_MODID_PCM =3D 0xD, /* offload */
>> +	CATPT_MODID_BLUETOOTH_RENDER =3D 0xE,
>> +	CATPT_MODID_BLUETOOTH_CAPTURE =3D 0xF,
>> +	CATPT_MODID_LAST =3D CATPT_MODID_BLUETOOTH_CAPTURE,
>> +};
>=20
> if you indent the values to be on the same column it will increase readab=
ility.
>=20

Sure, can indent for readability reasons.

>> +enum catpt_mclk_frequency {
>> +	CATPT_MCLK_OFF =3D 0,
>> +	CATPT_MCLK_FREQ_6_MHZ =3D 1,
>> +	CATPT_MCLK_FREQ_21_MHZ =3D 2,
>> +	CATPT_MCLK_FREQ_24_MHZ =3D 3,
>> +};
>=20
> Looks like a 3 MHz as base frequency with multiplicators 0, 2, 7, 8.
>=20

Naming based on FW enum type equivalent.

>> +#define CATPT_STREAM_MSG(msg_type) \
>> +{ \
>> +	.stream_msg_type =3D CATPT_STRM_##msg_type, \
>> +	.global_msg_type =3D CATPT_GLB_STREAM_MESSAGE }
>> +#define CATPT_STAGE_MSG(msg_type) \
>> +{ \
>> +	.stage_action =3D CATPT_STG_##msg_type, \
>> +	.stream_msg_type =3D CATPT_STRM_STAGE_MESSAGE, \
>> +	.global_msg_type =3D CATPT_GLB_STREAM_MESSAGE }
>=20
> Hmm... This split is interesting. I would rather move } to a new line.
>=20

As basically everything in my code, style is based on existing example -
usually stuff from ASoC core - here, it's include/sound/soc.h. It's full
of such definitions so because catpt belongs to ASoC subsystem, I've
used the exact same style. No problem changing if that's your preference.

>> @@ -15,7 +15,6 @@
>>   #define CATPT_SHIM_REGS_SIZE	4096
>>   #define CATPT_DMA_REGS_SIZE	1024
>>   #define CATPT_DMA_COUNT		2
>=20
>> -#define CATPT_SSP_COUNT		2
>=20
> Why is this?
>=20

Declaration of struct catpt_spec in patch 01/14 requires this while the
actual, logical (I'm not sure that's the right word here but I bet you
know what I mean) definition - one based on enum catpt_ssp_iface - is
available only here (02/14), with all other messages structs. I'd rather
modify the location of this constant than play with declaration of
struct catpt_spec between the patches.

Czarek

