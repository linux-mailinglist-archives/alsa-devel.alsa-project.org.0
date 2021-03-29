Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E752A34C4AC
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 09:16:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 785CA1679;
	Mon, 29 Mar 2021 09:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 785CA1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617002163;
	bh=YVh5Dcej1JvIkN7bnwYGYlYXc7RPYdcHsiPgIxWu3CY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vagoW+i9/9xbgu4ATJERHslvz19nlDlNknDANjJnaN8xge81whrwUmGQXGTD/+jqj
	 AHfdhDWIIc1iaWu6r/djo5RG2weC8Tp2BPfPJKE2NKT2Xxtrksrvuf2Aopu3X0v1Pf
	 4osuHsYC2ywiLDGWJ4Ix+iFcXD8VZ36HE7lvxi1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52F3DF800DD;
	Mon, 29 Mar 2021 09:14:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49478F8020C; Mon, 29 Mar 2021 09:14:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C869BF8016E
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 09:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C869BF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ie1AnPs9"
Received: by mail-ej1-x62d.google.com with SMTP id a7so17806176ejs.3
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 00:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3i61lbYtht1bCl8e/9X51r7cabit5ewoNnhghpFbgB4=;
 b=Ie1AnPs9rGSxNFYqSvt0EusYJvzck2q7ygXAvCLx2RY2J50vtvhFP0y4uA9Q5nxvx9
 PidhP6edYbGS7obwIl9nyLyLOpqEBRTOP84T05EHxQ5zg20rmUubOkc28iX6XE22aYfP
 8i5kqbk49k4OcXC1flXKeeh7vBBJvuRRHapTPEG/FQ9YBUeb3NMPu0n5cfog1+GXWvqk
 X8vShelYAPhGXPytY5mZy9SKV8QQnPIsEcp6jhYCn9vdOJIupz/Mur/RsMO2a+wvpRii
 3jYJzW2Z52GBwnPZ/hzLnF05PtxbiKoFz/iY5TucUhmEx9vuu+5Wj6GVf0YjiqPA5cSe
 ZT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3i61lbYtht1bCl8e/9X51r7cabit5ewoNnhghpFbgB4=;
 b=B163ZooEGqvkp4XlTs/TmSspnRYgg57HB0GWt69F+g2TScr7rrhMxwJL+K1Cv8ydF8
 aetbHNJIsLCJgL+HivODb6kJFWHWyDJzakqnG3q0+rUJZkt+2CHTBm0oz4kg5xxGLBwH
 KLWRLBJVAS5Lqxb4YOpNc8JP8ODqmpvjFuoTz3/ZZM8bIy20tET5dPZHgkwSNwDNU3mA
 cetVbo0xIGwQslvtAMkxM/DifAluEukcohupvJHgmnH/T9GTeEr6BC4LYWxeEwmuNrbg
 2CLN6i1+JrHnAEr3nFlZpRArXtoATeKJuIMb5du+h7arGVRFEy9hT7ESBI1GvOGq9mRB
 kPvw==
X-Gm-Message-State: AOAM532HRJmsn3X7jSzaE4jVXpyBHZAP8Rqp4VrYJbTDF/qRI6vsGEW0
 8mdBG+ewJGlz+u/x6FnwojQ=
X-Google-Smtp-Source: ABdhPJz0Wyo214HyWDDtxNsLzkbmyW4AFgsBR1ewRxx746ERv+oPB8VFTAjV7+GjDSv0aqTEjGU2eQ==
X-Received: by 2002:a17:907:33cd:: with SMTP id
 zk13mr27102009ejb.224.1617002067914; 
 Mon, 29 Mar 2021 00:14:27 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id g25sm8253594edp.95.2021.03.29.00.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 00:14:26 -0700 (PDT)
Date: Mon, 29 Mar 2021 09:14:51 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 13/17] ASoC: tegra: tegra20_das: align function prototypes
Message-ID: <YGF+a+/FXkGvT1WY@orome.fritz.box>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
 <20210326215927.936377-14-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xtdBqiT13sHPbdgA"
Content-Disposition: inline
In-Reply-To: <20210326215927.936377-14-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 broonie@kernel.org,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
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


--xtdBqiT13sHPbdgA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 04:59:23PM -0500, Pierre-Louis Bossart wrote:
> cppcheck warnings:
>=20
> sound/soc/tegra/tegra20_das.c:35:40: style:inconclusive: Function
> 'tegra20_das_connect_dap_to_dac' argument 1 names different:
> declaration 'dap_id' definition 'dap'. [funcArgNamesDifferent]
>=20
> int tegra20_das_connect_dap_to_dac(int dap, int dac)
>                                        ^
> sound/soc/tegra/tegra20_das.h:98:47: note: Function
> 'tegra20_das_connect_dap_to_dac' argument 1 names different:
> declaration 'dap_id' definition 'dap'.
> extern int tegra20_das_connect_dap_to_dac(int dap_id, int dac_sel);
>                                               ^
> sound/soc/tegra/tegra20_das.c:35:40: note: Function
> 'tegra20_das_connect_dap_to_dac' argument 1 names different:
> declaration 'dap_id' definition 'dap'.
> int tegra20_das_connect_dap_to_dac(int dap, int dac)
>                                        ^
> sound/soc/tegra/tegra20_das.c:35:49: style:inconclusive: Function
> 'tegra20_das_connect_dap_to_dac' argument 2 names different:
> declaration 'dac_sel' definition 'dac'. [funcArgNamesDifferent]
> int tegra20_das_connect_dap_to_dac(int dap, int dac)
>                                                 ^
> sound/soc/tegra/tegra20_das.h:98:59: note: Function
> 'tegra20_das_connect_dap_to_dac' argument 2 names different:
> declaration 'dac_sel' definition 'dac'.
> extern int tegra20_das_connect_dap_to_dac(int dap_id, int dac_sel);
>                                                           ^
> sound/soc/tegra/tegra20_das.c:35:49: note: Function 'tegra20_das_connect_=
dap_to_dac' argument 2 names different: declaration 'dac_sel' definition 'd=
ac'.
> int tegra20_das_connect_dap_to_dac(int dap, int dac)
>                                                 ^
> sound/soc/tegra/tegra20_das.c:53:40: style:inconclusive: Function
> 'tegra20_das_connect_dap_to_dap' argument 1 names different:
> declaration 'dap_id' definition 'dap'. [funcArgNamesDifferent]
> int tegra20_das_connect_dap_to_dap(int dap, int otherdap, int master,
>                                        ^
> sound/soc/tegra/tegra20_das.h:108:47: note: Function
> 'tegra20_das_connect_dap_to_dap' argument 1 names different:
> declaration 'dap_id' definition 'dap'.
> extern int tegra20_das_connect_dap_to_dap(int dap_id, int other_dap_sel,
>                                               ^
> sound/soc/tegra/tegra20_das.c:53:40: note: Function
> 'tegra20_das_connect_dap_to_dap' argument 1 names different:
> declaration 'dap_id' definition 'dap'.
> int tegra20_das_connect_dap_to_dap(int dap, int otherdap, int master,
>                                        ^
> sound/soc/tegra/tegra20_das.c:53:49: style:inconclusive: Function
> 'tegra20_das_connect_dap_to_dap' argument 2 names different:
> declaration 'other_dap_sel' definition
> 'otherdap'. [funcArgNamesDifferent]
> int tegra20_das_connect_dap_to_dap(int dap, int otherdap, int master,
>                                                 ^
> sound/soc/tegra/tegra20_das.h:108:59: note: Function
> 'tegra20_das_connect_dap_to_dap' argument 2 names different:
> declaration 'other_dap_sel' definition 'otherdap'.
> extern int tegra20_das_connect_dap_to_dap(int dap_id, int other_dap_sel,
>                                                           ^
> sound/soc/tegra/tegra20_das.c:53:49: note: Function
> 'tegra20_das_connect_dap_to_dap' argument 2 names different:
> declaration 'other_dap_sel' definition 'otherdap'.
> int tegra20_das_connect_dap_to_dap(int dap, int otherdap, int master,
>                                                 ^
> sound/soc/tegra/tegra20_das.c:75:40: style:inconclusive: Function
> 'tegra20_das_connect_dac_to_dap' argument 1 names different:
> declaration 'dac_id' definition 'dac'. [funcArgNamesDifferent]
> int tegra20_das_connect_dac_to_dap(int dac, int dap)
>                                        ^
> sound/soc/tegra/tegra20_das.h:118:47: note: Function
> 'tegra20_das_connect_dac_to_dap' argument 1 names different:
> declaration 'dac_id' definition 'dac'.
> extern int tegra20_das_connect_dac_to_dap(int dac_id, int dap_sel);
>                                               ^
> sound/soc/tegra/tegra20_das.c:75:40: note: Function
> 'tegra20_das_connect_dac_to_dap' argument 1 names different:
> declaration 'dac_id' definition 'dac'.
> int tegra20_das_connect_dac_to_dap(int dac, int dap)
>                                        ^
> sound/soc/tegra/tegra20_das.c:75:49: style:inconclusive: Function
> 'tegra20_das_connect_dac_to_dap' argument 2 names different:
> declaration 'dap_sel' definition 'dap'. [funcArgNamesDifferent]
> int tegra20_das_connect_dac_to_dap(int dac, int dap)
>                                                 ^
> sound/soc/tegra/tegra20_das.h:118:59: note: Function
> 'tegra20_das_connect_dac_to_dap' argument 2 names different:
> declaration 'dap_sel' definition 'dap'.
> extern int tegra20_das_connect_dac_to_dap(int dac_id, int dap_sel);
>                                                           ^
> sound/soc/tegra/tegra20_das.c:75:49: note: Function
> 'tegra20_das_connect_dac_to_dap' argument 2 names different:
> declaration 'dap_sel' definition 'dap'.
> int tegra20_das_connect_dac_to_dap(int dac, int dap)
>                                                 ^
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/tegra/tegra20_das.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--xtdBqiT13sHPbdgA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBhfmsACgkQ3SOs138+
s6HkchAAltA7zPKOIL5EHYwQ8SynrcJVRybPjCnp5hAYOxFdncbR4b5rvEhZ8a2S
Es3+Six6tVloierFTCCftuwK9YUuso9z+8TtkV0DCciC/GFfbW1IO22hROSo2/Nv
g9JQnkjrHAzKhJS+wMRXKIDhhRlQ729bf01cEkINfNPaCvYp/amv0kMyyl2ElymD
yJOx4XBlmMpwgBTKoPlTNVuGaBqkMV4AWi8IlENba8HSridV7NUeP4hxFPnkC1Vk
1O8uG3KoyydD73hy81XqfyDW/pxquC6xA0fxcCpW08b2SnUcjCNMm9haVZQgkoId
3h6IugwleJZvjRcmeuswp/CS+DB/CWo6qHvwDAUAz+ipa5BpovK31VrEKg5B7Zmn
TAfTPCdbDHLTRsjJ4ds5uU7QG7dT3QDPzy87+Lzv5SiIKLK1ZtZowR7wQ41rszjk
k5bPswLndoqDVSK4+9r1aLoYWRdX/7WkzaNNSW+0HcipR3/EZThkAmgAjvoxGDzv
XnhkDtMBoDnN476Xr2GsuzPgbfhQZHjXeZ19YkpVtg3srQpdZha2RG+5gGmmpBAx
HBkJ5BeNwzyboiX/4gXXWaUEoTH54LwMxCFGLE0cIhbXCAeeKtYeThRT+VvxKsNB
F2dIt8OnEynsXoIoTZj/ZvEiki/VOUi3FPIkV3MSOAomuwY5/fM=
=/+6d
-----END PGP SIGNATURE-----

--xtdBqiT13sHPbdgA--
