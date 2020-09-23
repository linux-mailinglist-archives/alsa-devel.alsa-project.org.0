Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1508F275FC3
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 20:25:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 762AF1781;
	Wed, 23 Sep 2020 20:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 762AF1781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600885524;
	bh=c6vhnUifbcXUzvUL6srk16+A9Zvz4tZ/QMSdnuJZgjg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=APNtdpaS/WHXEll01NrGvjd6fcSJUrwXJqa9JCZXvYfen/akKpGpojKuHNiui5r93
	 vfggQ9MFgnY1+vGhiUmP3zjDvNbLtkbjHLCB94IiN0s48RgfPwib05M2sg1w6QaaSx
	 N5rp4lEaEOzwt+butfSRdhx0zZhxwSRUiE+WCuhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A14B0F8010A;
	Wed, 23 Sep 2020 20:23:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD868F80171; Wed, 23 Sep 2020 20:23:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC0C9F8010A
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 20:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC0C9F8010A
IronPort-SDR: ehQUil6Wjksr0FhnBLRIylqPaAK6G7yz8CbTNGNMLoeTWZu48vhCKVLz56YE262Ng4JlXUxGna
 qqJGC0CCQnFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="161912943"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="161912943"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 11:23:25 -0700
IronPort-SDR: 5xA+jmxdBzAZjrUFSOrSwPtsvwButHMxxQ3kRQgYuVSK7ne3GnCM6P8nxI4tt3fc7NX779LwKg
 mrng5L38mTwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="455016784"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by orsmga004.jf.intel.com with ESMTP; 23 Sep 2020 11:23:23 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 23 Sep 2020 19:23:23 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Wed, 23 Sep 2020 19:23:23 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v8 06/14] ASoC: Intel: catpt: PCM operations
Thread-Topic: [PATCH v8 06/14] ASoC: Intel: catpt: PCM operations
Thread-Index: AQHWkaS+5APyIDnUPUWmt/ijNOLtz6l2LgcAgABaW+A=
Date: Wed, 23 Sep 2020 18:23:22 +0000
Message-ID: <bd5b35fd96be42579bf6d7861379772f@intel.com>
References: <20200923122508.3360-1-cezary.rojewski@intel.com>
 <20200923122508.3360-7-cezary.rojewski@intel.com>
 <20200923135422.GM3956970@smile.fi.intel.com>
In-Reply-To: <20200923135422.GM3956970@smile.fi.intel.com>
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

On 2020-09-23 3:54 PM, Andy Shevchenko wrote:
> On Wed, Sep 23, 2020 at 02:25:00PM +0200, Cezary Rojewski wrote:
>> DSP designed for Lynxpoint and Wildcat Point offers no dynamic topology
>> i.e. all pipelines are already defined within firmware and host is
>> relegated to allocing stream for predefined pins. This is represented by
>> 'catpt_topology' member.
>>

...

>> +static u32 catpt_get_channel_map(enum catpt_channel_config config)
>> +{
>> +	switch (config) {
>> +	case CATPT_CHANNEL_CONFIG_MONO:
>> +		return (GENMASK(31, 4) | CATPT_CHANNEL_CENTER);
>=20
> In all cases outer parentheses are not needed. Also I expected to see DUA=
L MONO
> case here, rather than below.
>=20

Ack for the parentheses but what's wrong with the sweet '_STEREO' name?
This function is based on internal equivalent. As I aim to ease any
further debug/development by aligning with Windows equivalent, name
changes for no real reason do not help with that goal.

If I'm missing something about 'DUAL MONO', feel free to correct me.

>> +	case CATPT_CHANNEL_CONFIG_STEREO:
>> +		return (GENMASK(31, 8) | CATPT_CHANNEL_LEFT
>> +				       | (CATPT_CHANNEL_RIGHT << 4));
>> +
>> +	case CATPT_CHANNEL_CONFIG_2_POINT_1:
>> +		return (GENMASK(31, 12) | CATPT_CHANNEL_LEFT
>> +					| (CATPT_CHANNEL_RIGHT << 4)
>> +					| (CATPT_CHANNEL_LFE << 8));
>> +
>> +	case CATPT_CHANNEL_CONFIG_3_POINT_0:
>> +		return (GENMASK(31, 12) | CATPT_CHANNEL_LEFT
>> +					| (CATPT_CHANNEL_CENTER << 4)
>> +					| (CATPT_CHANNEL_RIGHT << 8));
>> +
>> +	case CATPT_CHANNEL_CONFIG_3_POINT_1:
>> +		return (GENMASK(31, 16) | CATPT_CHANNEL_LEFT
>> +					| (CATPT_CHANNEL_CENTER << 4)
>> +					| (CATPT_CHANNEL_RIGHT << 8)
>> +					| (CATPT_CHANNEL_LFE << 12));
>> +
>> +	case CATPT_CHANNEL_CONFIG_QUATRO:
>> +		return (GENMASK(31, 16) | CATPT_CHANNEL_LEFT
>> +					| (CATPT_CHANNEL_RIGHT << 4)
>> +					| (CATPT_CHANNEL_LEFT_SURROUND << 8)
>> +					| (CATPT_CHANNEL_RIGHT_SURROUND << 12));
>> +
>> +	case CATPT_CHANNEL_CONFIG_4_POINT_0:
>> +		return (GENMASK(31, 16) | CATPT_CHANNEL_LEFT
>> +					| (CATPT_CHANNEL_CENTER << 4)
>> +					| (CATPT_CHANNEL_RIGHT << 8)
>> +					| (CATPT_CHANNEL_CENTER_SURROUND << 12));
>> +
>> +	case CATPT_CHANNEL_CONFIG_5_POINT_0:
>> +		return (GENMASK(31, 20) | CATPT_CHANNEL_LEFT
>> +					| (CATPT_CHANNEL_CENTER << 4)
>> +					| (CATPT_CHANNEL_RIGHT << 8)
>> +					| (CATPT_CHANNEL_LEFT_SURROUND << 12)
>> +					| (CATPT_CHANNEL_RIGHT_SURROUND << 16));
>> +
>> +	case CATPT_CHANNEL_CONFIG_5_POINT_1:
>> +		return (GENMASK(31, 24) | CATPT_CHANNEL_CENTER
>> +					| (CATPT_CHANNEL_LEFT << 4)
>> +					| (CATPT_CHANNEL_RIGHT << 8)
>> +					| (CATPT_CHANNEL_LEFT_SURROUND << 12)
>> +					| (CATPT_CHANNEL_RIGHT_SURROUND << 16)
>> +					| (CATPT_CHANNEL_LFE << 20));
>> +
>> +	case CATPT_CHANNEL_CONFIG_DUAL_MONO:
>> +		return (GENMASK(31, 8) | CATPT_CHANNEL_LEFT
>> +				       | (CATPT_CHANNEL_LEFT << 4));
>> +
>> +	default:
>> +		return U32_MAX;
>> +	}
>> +}
>> +

...

>> +#define DSP_VOLUME_MAX	S32_MAX /* 0db */
>=20
>> +static const u32 volume_map[] =3D {
>> +	DSP_VOLUME_MAX >> 30,
>> +	DSP_VOLUME_MAX >> 29,
>> +	DSP_VOLUME_MAX >> 28,
>> +	DSP_VOLUME_MAX >> 27,
>> +	DSP_VOLUME_MAX >> 26,
>> +	DSP_VOLUME_MAX >> 25,
>> +	DSP_VOLUME_MAX >> 24,
>> +	DSP_VOLUME_MAX >> 23,
>> +	DSP_VOLUME_MAX >> 22,
>> +	DSP_VOLUME_MAX >> 21,
>> +	DSP_VOLUME_MAX >> 20,
>> +	DSP_VOLUME_MAX >> 19,
>> +	DSP_VOLUME_MAX >> 18,
>> +	DSP_VOLUME_MAX >> 17,
>> +	DSP_VOLUME_MAX >> 16,
>> +	DSP_VOLUME_MAX >> 15,
>> +	DSP_VOLUME_MAX >> 14,
>> +	DSP_VOLUME_MAX >> 13,
>> +	DSP_VOLUME_MAX >> 12,
>> +	DSP_VOLUME_MAX >> 11,
>> +	DSP_VOLUME_MAX >> 10,
>> +	DSP_VOLUME_MAX >> 9,
>> +	DSP_VOLUME_MAX >> 8,
>> +	DSP_VOLUME_MAX >> 7,
>> +	DSP_VOLUME_MAX >> 6,
>> +	DSP_VOLUME_MAX >> 5,
>> +	DSP_VOLUME_MAX >> 4,
>> +	DSP_VOLUME_MAX >> 3,
>> +	DSP_VOLUME_MAX >> 2,
>> +	DSP_VOLUME_MAX >> 1,
>> +	DSP_VOLUME_MAX >> 0,
>> +};
>=20
> Why not to get rid of this table completely?
>=20

I don't see anything wrong with this lookup table. If you insist I can
get rid of it - that's the last piece of /haswell/ that survived the
"cleanup" afterall..

>> +static u32 ctlvol_to_dspvol(u32 value)
>> +{
>> +	if (value >=3D ARRAY_SIZE(volume_map))
>> +		value =3D 0;
>> +	return volume_map[value];
>=20
> 	if (value > 30)
> 		value =3D 0;
> 	return DSP_VOLUME_MAX >> (30 - value);
>=20

I suppose 'DSP_VOLUME_STEP_MAX 30' is to be defined right next to
DSP_VOLUME_MAX.

As I said in earlier responses, please note size of this table is
helpful when assigning kcontrol info in catpt_volume_info(). Macro will
take its place then.

>> +}
>> +
>> +static u32 dspvol_to_ctlvol(u32 volume)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(volume_map); i++)
>> +		if (volume_map[i] >=3D volume)
>> +			return i;
>> +	return i - 1;
>=20
> fls() ?
>=20

Well, fls(DSP_VOLUME_MAX) yields 31 which is inappropriate for
kcontrol with value range: 0-30.

Guess you meant: __fls(). Following is the implementation (accounting
for edge cases):
	if (volume > DSP_VOLUME_MAX)
		return DSP_VOLUME_STEP_MAX;
	return volume ? __fls(volume) : 0;


Thanks,
Czarek

