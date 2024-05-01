Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CC48B8B7D
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2024 15:56:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47453E72;
	Wed,  1 May 2024 15:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47453E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714571818;
	bh=pFNsRounutZ0watyT0vICiz4MZiX/bMl6TXERH4tJEA=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u5tSgjoNHmJMWUuwJQNtYDvaNFT1dEZB2cGhxQH6DqWiLGv1TMi0N3buFdsAE0FwE
	 WamfXq5CV6S/WbQmNpL0ha8+rjab6zdMzOy4vxH4cozsWOqmYa3N6SBwW4l2hM8MTn
	 1e0shSwPZ1S1dkZl1pVJoAhL0aNzGAU+2V0rytKM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9379FF80589; Wed,  1 May 2024 15:56:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0A0EF8028D;
	Wed,  1 May 2024 15:56:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8A4AF80266; Wed,  1 May 2024 15:56:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1516F8003A
	for <alsa-devel@alsa-project.org>; Wed,  1 May 2024 15:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1516F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=sj0Zz4Z7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1714571742; x=1715176542; i=markus.elfring@web.de;
	bh=tQlEmKt/yFE6pJw5QP1IkuqC5w2AGb1cHSuCQpauzPE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sj0Zz4Z7WwehrcScZnEP2j/CtHXElTLzUJbSFf43oTyrmvSs3qxxoNKvJTfjy9kf
	 eKyVPlU2C6mXjSjLzgg9NwZ+D/jolsDD4ic9/8raeX3Ssde3i5mfhHz6QDH6YIMbU
	 yvyND/btLfkkfD9txKHYPJi0F9z8izKAPGtmfbb6JbeeeK4KXiESJuPeWVqlr0Car
	 nQ+MtAjgB1frlBE4a8H3oiGCKSPLbna5cdtv1t4Dzn1Nqd5BBPvJK+xfwKg6wdoGC
	 hxFK3xu0EI79y5TASZvz7tMAr7M+x8LC7pIKJTNX+GcwAFxPeMBc2r6eEdlGuOzaV
	 aXcilABJudedHnwFEA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MDvDi-1ruVT82i28-00A9tM; Wed, 01
 May 2024 15:55:42 +0200
Message-ID: <745cc56b-0ef4-4cf9-9051-cae318866672@web.de>
Date: Wed, 1 May 2024 15:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shenghao Ding <shenghao-ding@ti.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baojun Xu <Baojun.Xu@fpt.com>, Baojun Xu <baojun.xu@ti.com>,
 Bard Liao <bard.liao@intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>,
 Cameron Berkenpas <cameron.berkenpas@gmail.com>, Gergo Koteles
 <soyer@irl.hu>, Jaroslav Kysela <perex@perex.cz>, Kevin Lu
 <kevin-lu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Liam Girdwood <liam.r.girdwood@intel.com>, mimperial@lenovo.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shenghao Ding <13916275206@139.com>, Takashi Iwai <tiwai@suse.de>
References: <20240501122252.1215-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v2] ALSA: ASoc/tas2781: Fix wrong loading calibrated data
 sequence
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240501122252.1215-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qpHfSCuTjsAcWFdlirrfvRAu9pQCfSGHdw+3AD0m9n0syVrYE01
 R0K/9DdBU5eFNpmX04d7WSAGNRDTpKJ/6hxJ/zTBfzxWHfsz/Izx9X1gQrl0j+yDj3Ngmpn
 UFC8JXaQKSBfrnf7D/rkdHjGtUSQOA7G8l5zFMedtOvx6e9QxFMnTOP5Twu4GKKHd7Ralsr
 hPHDH+DVFFXa5U2bhLYPg==
UI-OutboundReport: notjunk:1;M01:P0:G76/HUMR6xA=;H06TuOOrw5lW9fWGLZgvBGyaf8X
 O1nq13maYQPevtHwMcJueYQQnADEojURhq9Ki8CXofg8Kpfyy4zGwoeXqpmJezdrA3PvgwE++
 26hRi0FlMEt7ORTlluriHHZkiJRTv9ZC+sBkX5733AV30RwBktyo6GN6qvpisGrvuxFZRTPy6
 no1JScLRuH8tZd4T+DXG+UZaAPV41IvhVRnicrEkxaNx9/wt8vdBu8F0xQBSS1ghL7F1cPqaD
 kQeYBbXIVdIlLaeXe8nNNHeh9mP3FhY0mxGzisw+lw8zBqTSfztw/KwSYLNKcTqcZswlAxXRz
 4yDbFEtiZVG6GBUHi4a3OctfsYfVmYfnfvNh0Nk/pHcj9D9bOkrOg6mEA6/XB5DZemuYr+5pl
 E5W1c0nzTkaBwVlZPKWz3fxFlX9oaS3TJEd8PwI7BLuWOkLX6656IsFVoO1WvZPT56kugP0dv
 zrFf5QOhX7SL8hMLRP6OC/oyMAsyZ2wTGCoDndMgc7pYBd7nPJ4jILDBJMFtAkhRkXlNxm03p
 yt7ewUmPXSpC/rosJKrx+zyVvUfDBtv1RDKK2dQ///3a84vOICk7VFUNwDMNu9Z8aP8JKn9xI
 /0TjDpkz6c6bxNAhUexgqmfboi9CqiFZPhu4ewUT7q6X3iV1erUfSenTQ/MQY7pbMDa7HWObX
 LUoSfIO8Qi7sJvhjjfRnw+KEr/ui3HKlZS3HC+wPn61FSLSi91KJre8lCxAK7XUt47tKsiz7x
 oeIPRW0plNaRYG/9uvsjsyrbNlRbqwAjRlxGJAU2ATXPAL0+khcdGd4GVS3fDFLzwODcPgeN6
 Vc91a+7LcKArYW7CIqRAROJgzhm/yil/EUmulyTZFgR18=
Message-ID-Hash: NE2F3QUZ5EG7ZXFEFDRMYMRD7VVDA5KK
X-Message-ID-Hash: NE2F3QUZ5EG7ZXFEFDRMYMRD7VVDA5KK
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NE2F3QUZ5EG7ZXFEFDRMYMRD7VVDA5KK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=E2=80=A6
> +++ b/sound/soc/codecs/tas2781-fmwlib.c
=E2=80=A6
> @@ -2151,6 +2151,20 @@ static int tasdevice_load_data(struct tasdevice_p=
riv *tas_priv,
>  	return ret;
>  }
>
> +static void tasdev_load_calibrated_data(struct tasdevice_priv *priv,
> +	int i)

Please put the second function parameter into the previous line.


=E2=80=A6
> +	if (cal_fmw) {
> +		struct tasdevice_calibration *cal =3D cal_fmw->calibrations;
> +
> +		if (cal)
> +			load_calib_data(priv, &cal->dev_data);
> +		return;

Would this statement be redundant at the moment?


> +	}
> +}


Regards,
Markus
