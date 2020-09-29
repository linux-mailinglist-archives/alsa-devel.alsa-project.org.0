Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 081CC27CF20
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 15:28:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA8E81868;
	Tue, 29 Sep 2020 15:28:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA8E81868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601386133;
	bh=QVQU/at+BgHgIboZk3w3JmEk+Qm94/lLGRN57+ccqs4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HzpoMZ6xCTMXAaatgM1OUBEpKyBNkzBlY/oqNZ+wl7j/95kty8vI9ZyxSWMrLMjUQ
	 G4GXNxivzCe5RGOTs6AJy4C2s4COw8XMEFNg7BuUf8dXm+hr+uaVAm9vjBbk6pIsFa
	 D5CfaGjBQsKUU+PMesTeqvcmI65lbzq2F5ht7FQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C22DAF800AB;
	Tue, 29 Sep 2020 15:27:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06A8CF801F5; Tue, 29 Sep 2020 15:27:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77A64F800AB
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 15:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77A64F800AB
IronPort-SDR: nOVdSDnWPzOJb1D0EQzQlKiKagFTFKAmhstzQjUudYqjSRF2zjulf/kTDNquJ0pNM1Bi5xc0Up
 HpKnnUAD9w4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="163065508"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="163065508"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 06:26:55 -0700
IronPort-SDR: RGf2SoPT0TmfHO73NMAvOJzwAsZBTW/s2s5I/VRXafsT31vJleeD2rGcwBUgouEsQvedakBylY
 KgO8+qi1OyyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="513877858"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by fmsmga006.fm.intel.com with ESMTP; 29 Sep 2020 06:26:53 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Sep 2020 14:26:51 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Tue, 29 Sep 2020 14:26:51 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v9 06/14] ASoC: Intel: catpt: PCM operations
Thread-Topic: [PATCH v9 06/14] ASoC: Intel: catpt: PCM operations
Thread-Index: AQHWk+Ngd9ITX0RvPk+O34dp+4JViql/cDcAgAAv7WA=
Date: Tue, 29 Sep 2020 13:26:51 +0000
Message-ID: <80336977ccb643b49559492fa9ca5927@intel.com>
References: <20200926085910.21948-1-cezary.rojewski@intel.com>
 <20200926085910.21948-7-cezary.rojewski@intel.com>
 <20200929113340.GH3956970@smile.fi.intel.com>
In-Reply-To: <20200929113340.GH3956970@smile.fi.intel.com>
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

On 2020-09-29 1:33 PM, Andy Shevchenko wrote:
> On Sat, Sep 26, 2020 at 10:59:02AM +0200, Cezary Rojewski wrote:
>> DSP designed for Lynxpoint and Wildcat Point offers no dynamic topology
>> i.e. all pipelines are already defined within firmware and host is
>> relegated to allocing stream for predefined pins. This is represented by
>> 'catpt_topology' member.
>>
>> Implementation covers all available pin types:
>> - system playback and capture
>> - two offload streams
>> - loopback (reference)
>> - bluetooth playback and capture
>>
>> PCM DAI operations differentiate between those pins as some (mainly
>> offload) are to be handled differently - DSP expects wp updates on each
>> notify_position notification.
>>
>> System playback has no volume control capability as it is routed to
>> mixer stream directly. Other primary streams - capture and two offloads
>> - offer individual volume controls.
>>
>> Compared to sound/soc/intel/haswell this configures SSP device format
>> automatically on pcm creation.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> Some thoughts below, but it shouldn't prevent v10 to appear.
>=20
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

...

>> +static u32 catpt_get_channel_map(enum catpt_channel_config config)
>> +{
>> +	switch (config) {
>> +	case CATPT_CHANNEL_CONFIG_MONO:
>> +		return GENMASK(31, 4) | CATPT_CHANNEL_CENTER;
>=20
>> +	case CATPT_CHANNEL_CONFIG_DUAL_MONO:
>> +		return GENMASK(31, 8) | CATPT_CHANNEL_LEFT
>> +				      | (CATPT_CHANNEL_LEFT << 4);
>=20
> Now we know why it used to be at the end of the switch-case. Up to you to=
 leave
> here or move back.
>=20

Reverting to previous relocation in v10.

...

>> +static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
>> +				     struct catpt_stream_runtime *stream)
>> +{
>> +	struct catpt_dev *cdev =3D dev_get_drvdata(dai->dev);
>> +	struct snd_soc_component *component =3D dai->component;
>> +	struct snd_kcontrol *pos, *kctl =3D NULL;
>> +	const char *name;
>> +	int ret;
>> +	u32 id =3D stream->info.stream_hw_id;
>> +
>> +	/* only selected streams have individual controls */
>> +	switch (id) {
>> +	case CATPT_PIN_ID_OFFLOAD1:
>> +		name =3D "Media0 Playback Volume";
>> +		break;
>> +	case CATPT_PIN_ID_OFFLOAD2:
>> +		name =3D "Media1 Playback Volume";
>> +		break;
>> +	case CATPT_PIN_ID_CAPTURE1:
>> +		name =3D "Mic Capture Volume";
>> +		break;
>> +	case CATPT_PIN_ID_REFERENCE:
>> +		name =3D "Loopback Mute";
>> +		break;
>> +	default:
>> +		return 0;
>> +	};
>> +
>> +	list_for_each_entry(pos, &component->card->snd_card->controls, list) {
>> +		if (pos->private_data =3D=3D component &&
>> +		    !strncmp(name, pos->id.name, sizeof(pos->id.name))) {
>> +			kctl =3D pos;
>> +			break;
>> +		}
>> +	}
>> +	if (!kctl)
>> +		return -ENOENT;
>=20
> Hmm... Seems we lack of something like
>=20
> /*
>   * list_entry_is_head() - Test if the entry points to the head of the li=
st
>   * ...
>   */
> #define list_entry_is_head(pos, head, member)	(&pos->member =3D=3D head)
>=20
> Up to you to consider. In above case we may drop pos from above loop and =
use kctl directly
>=20
> 	struct snd_kcontrol *kctl;
> 	...
> 	list_for_each_entry(kctl, &component->card->snd_card->controls, list) {
> 		if (kctl->private_data =3D=3D component &&
> 		    !strncmp(name, kctl->id.name, sizeof(kctl->id.name)))
> 			break;
> 	}
> 	if (list_entry_is_head(kctl, &component->card->snd_card->controls, list)=
)
> 		return -ENOENT;
>=20
> Note, you usually don't need any special Acks to modify list.h this way,
> although Andrew's name pops up WRT library stuff.
>=20

Since you've already proposed the solution to LKML, once it's added to
the kernel, it will be re-used in catpt just like resource_union().

Good ideas all around, Andy. It's rather surprising to me how many good
ideas came during the upstream process of this small driver.

Czarek

