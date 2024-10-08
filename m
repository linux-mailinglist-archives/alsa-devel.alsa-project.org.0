Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 634D5999FFF
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 11:20:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7BDDE0D;
	Fri, 11 Oct 2024 11:20:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7BDDE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728638411;
	bh=Ck9lrBlztv568oo2Mi4ADPWr/Xr+zajHDMS0SrxWxBU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YDvVW7mIgwJrg+aqce/SZTACO77tl7K4QsD+KD00gu93bkW2HIgVyG0PWUh6Gmjkd
	 J9ROphjyDRl2rut7Q734XsB9RLcdKJ/zv6kw7OIYPC/804NWv6gK01mF9fc01fd/Db
	 10MD3pyS465GSqYkHIYopK4kXPEA23bnBkbqR2ks=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 192F5F805E2; Fri, 11 Oct 2024 11:19:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6E1CF805D9;
	Fri, 11 Oct 2024 11:19:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD6F3F80528; Tue,  8 Oct 2024 22:35:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl
 [IPv6:2a01:7c8:fff8:2b8:5054:ff:fe86:f72d])
	by alsa1.perex.cz (Postfix) with ESMTP id D2AC5F800ED
	for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2024 22:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2AC5F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (4096-bit key,
 unprotected) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.a=rsa-sha256
 header.s=key header.b=Tg1Ru26t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1728419739; bh=Ck9lrBlztv568oo2Mi4ADPWr/Xr+zajHDMS0SrxWxBU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tg1Ru26t7w1tHfes64Kw4tjuOne64RJNwldpQ8HXcS9PkELsfaLa/IJWuAw75nIJ+
	 /mc9YNiuGxvirrGLUmxxkn8aLtbqzY50OTVnwOFoF/gv4O4yAi5heBMjwCCVtEvrFQ
	 XGglzLrFAVKg5+Fuyeqr9DgJVI56VgdzJoIkmbkyTiax1o8PBlS7S9iHwrnA+PIeUh
	 a680p8vXqkgHXRqdoNxW5kKbL3Yw6OCUkJxJGyy5jUm7QYilzq+U7Y1/GNLJEsZ8+A
	 CsHc7wwNK0vYyGmg5Rq3R1ngrHZ8FrpKlqYhY8ezufJZPgYdWfrFsmerEDpuJSDJwr
	 B5JHpdiM4NWZn95VgOeKFwuB2dslnecj2CZAR/5xjmEGFjjfEuomIllaLOXJJDNBeB
	 kC9b146ha5RBK5uWYvAWGa3445g0TdsexSaPK7qMz0PC5q6VjbUFq4V0ZY2SKncHPZ
	 tCNCd0G90/S76C7gquAmFl9bqY50VfUvguba4IlETd9yk39dbWaxIbgaASZlE9b/pP
	 D8tClzNVcgVHB5tItVoSD4uh5u6Oyc0Aod2HLDmnHz6FLTj/bDLi1ICDO7z6FlRPyY
	 R42A8CjvYMWXEYtyQyj5Y0SNxR1d3o+nb/uZgyTiSZEnf1K1OxaTq/9bbFH/9NmTEe
	 YdG6jrz4VfkRAfAdLO8bRgl0=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl
 [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 86DF718D6D9;
	Tue,  8 Oct 2024 22:35:39 +0200 (CEST)
Message-ID: <a1e4e25a-56ef-4f10-8dff-27b9ee9fcef6@ijzerbout.nl>
Date: Tue, 8 Oct 2024 22:35:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: rt721-sdca: Add RT721 SDCA driver
To: Jack Yu <jack.yu@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
 <shumingf@realtek.com>, =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
 <derek.fang@realtek.com>
References: <d18b35f8b6934fc6a2be6c4458a63fe5@realtek.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <d18b35f8b6934fc6a2be6c4458a63fe5@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: kees@ijzerbout.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RWYFV5BFKLHSAPUKQ6GC3VXQIW3AYOU3
X-Message-ID-Hash: RWYFV5BFKLHSAPUKQ6GC3VXQIW3AYOU3
X-Mailman-Approved-At: Fri, 11 Oct 2024 09:19:25 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RWYFV5BFKLHSAPUKQ6GC3VXQIW3AYOU3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Op 01-10-2024 om 11:17 schreef Jack Yu:
> This is the initial codec driver for rt721-sdca.
> It's a three functions (jack,mic,amp) soundwire driver.
>
> Signed-off-by: Jack Yu <jack.yu@realtek.com>
>
> v2: Fix typo in mbq default registers.
> v3: Include soundwire common functions for Realtek.
> ---
>   sound/soc/codecs/Kconfig          |    7 +
>   sound/soc/codecs/Makefile         |    2 +
>   sound/soc/codecs/rt721-sdca-sdw.c |  551 ++++++++++
>   sound/soc/codecs/rt721-sdca-sdw.h |  150 +++
>   sound/soc/codecs/rt721-sdca.c     | 1547 +++++++++++++++++++++++++++++
>   sound/soc/codecs/rt721-sdca.h     |  268 +++++
>   6 files changed, 2525 insertions(+)
>   create mode 100644 sound/soc/codecs/rt721-sdca-sdw.c
>   create mode 100644 sound/soc/codecs/rt721-sdca-sdw.h
>   create mode 100644 sound/soc/codecs/rt721-sdca.c
>   create mode 100644 sound/soc/codecs/rt721-sdca.h
> [...]
> +static void rt721_sdca_jack_detect_handler(struct work_struct *work)
> +{
> +	struct rt721_sdca_priv *rt721 =
> +		container_of(work, struct rt721_sdca_priv, jack_detect_work.work);
> +	int btn_type = 0, ret;
> +
> +	if (!rt721->hs_jack)
> +		return;
> +
> +	if (!rt721->component->card || !rt721->component->card->instantiated)
> +		return;
> +
> +	/* SDW_SCP_SDCA_INT_SDCA_6 is used for jack detection */
> +	if (rt721->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_6) {
> +		rt721->jack_type = rt_sdca_headset_detect(rt721->regmap,
> +							RT721_SDCA_ENT_GE49);
Variable "ret" is not initialized, no assignment.
> +		if (ret < 0)
> +			return;
> +	}
>
