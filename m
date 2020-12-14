Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E202D94A2
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 10:16:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FB5216B9;
	Mon, 14 Dec 2020 10:15:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FB5216B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607937370;
	bh=ZLmoEzYUhldKlX4+P4zP+nPDBGQ2Yp/DrmkyCbs3WOs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JiMPzzniaOixbQsYbiFAWFGp//dB26bjZBU8Hb+Ho4a0FDIAEMWIeJRzm5VCU6M8Z
	 isWU07HdMdM9LAURhNykyQ0t4nkU5HU8ohbHYBfPeDNqa0vG4WW2FKeCbt1PVYET4F
	 r9vGYwDnS8SvLIHzhzOuLrdmEnVul81H3YGTEhsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EAA6F80171;
	Mon, 14 Dec 2020 10:14:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0856F801F7; Mon, 14 Dec 2020 10:14:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 904EAF80121
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 10:14:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 904EAF80121
IronPort-SDR: 4YBxhwSDmbDGqAky4D6PdG5Anxo2SRIZSgB2VPF8ERPSxe+sExUXllcub487sgc+SjgR9JjMyS
 hSIOn+Ir7Q/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="259404425"
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; d="scan'208";a="259404425"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 01:14:16 -0800
IronPort-SDR: KgJfu/QpCzhGGlZr3SVDuyySYw/8AvYX6Y6Z0KUmtSmB84uDZC3b9P5/7lGhytUD2v5v+McGH1
 KrBFYjgbuNTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; d="scan'208";a="335891428"
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137])
 by orsmga003.jf.intel.com with ESMTP; 14 Dec 2020 01:14:14 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX604.ger.corp.intel.com (163.33.146.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 14 Dec 2020 09:14:13 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 14 Dec 2020 09:14:13 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v1] catpt: Switch to use list_entry_is_head() helper
Thread-Topic: [PATCH v1] catpt: Switch to use list_entry_is_head() helper
Thread-Index: AQHWzUyfPxOhODz4j0quXnboN7DkTan2WAcw
Date: Mon, 14 Dec 2020 09:14:13 +0000
Message-ID: <7b7ad24505604110aeeebb2a0b30e573@intel.com>
References: <20201208102637.1168-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201208102637.1168-1-andriy.shevchenko@linux.intel.com>
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
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 2020-12-08 11:26 AM, Andy Shevchenko wrote:
> Since we got list_entry_is_head() helper in the generic header,
> we may switch catpt to use it. It removes the need in additional variable=
.

Thanks for the patch, Andy. One nitpick below.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   sound/soc/intel/catpt/pcm.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
> index e5d54bb1c42a..1c7260db3238 100644
> --- a/sound/soc/intel/catpt/pcm.c
> +++ b/sound/soc/intel/catpt/pcm.c
> @@ -331,10 +331,10 @@ static int catpt_dai_apply_usettings(struct snd_soc=
_dai *dai,
>   {
>   	struct catpt_dev *cdev =3D dev_get_drvdata(dai->dev);
>   	struct snd_soc_component *component =3D dai->component;
> -	struct snd_kcontrol *pos, *kctl =3D NULL;
>   	const char *name;
>   	int ret;
>   	u32 id =3D stream->info.stream_hw_id;
> +	struct snd_kcontrol *pos;

Shouldn't structs be declared before any primitive-types?

>  =20
>   	/* only selected streams have individual controls */
>   	switch (id) {
> @@ -356,17 +356,15 @@ static int catpt_dai_apply_usettings(struct snd_soc=
_dai *dai,
>  =20
>   	list_for_each_entry(pos, &component->card->snd_card->controls, list) {
>   		if (pos->private_data =3D=3D component &&
> -		    !strncmp(name, pos->id.name, sizeof(pos->id.name))) {
> -			kctl =3D pos;
> +		    !strncmp(name, pos->id.name, sizeof(pos->id.name)))
>   			break;
> -		}
>   	}
> -	if (!kctl)
> +	if (list_entry_is_head(pos, &component->card->snd_card->controls, list)=
)
>   		return -ENOENT;
>  =20
>   	if (stream->template->type !=3D CATPT_STRM_TYPE_LOOPBACK)
> -		return catpt_set_dspvol(cdev, id, (long *)kctl->private_value);
> -	ret =3D catpt_ipc_mute_loopback(cdev, id, *(bool *)kctl->private_value)=
;
> +		return catpt_set_dspvol(cdev, id, (long *)pos->private_value);
> +	ret =3D catpt_ipc_mute_loopback(cdev, id, *(bool *)pos->private_value);
>   	if (ret)
>   		return CATPT_IPC_ERROR(ret);
>   	return 0;
>
