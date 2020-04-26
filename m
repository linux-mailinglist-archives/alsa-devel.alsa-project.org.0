Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B471B91F0
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Apr 2020 19:03:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABEAD1663;
	Sun, 26 Apr 2020 19:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABEAD1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587920602;
	bh=MUPsU306dbTDMimvKdP0/q3NBw+LOYLD+RsbuRByH38=;
	h=To:Subject:From:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lxSJ4JMr7V47CRf2xDrH4rE0L5VgaqaxUHOVszoixnuYZY8pVFYZYHXiN0GN8yztI
	 NwrMk3jtCAVify3g1OCWotU5516PpKBJyqrM7D+7iV6nYrH5BKuvQ2WEwn3b1KZXoW
	 V1EOTdRZSwKFwA7fPLy2OlLWcWLTCfakBBa4lSiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5C54F80136;
	Sun, 26 Apr 2020 19:01:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94477F801DB; Sun, 26 Apr 2020 19:01:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE, SPF_PASS autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C5BEF8010A
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 19:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C5BEF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="F5yMopp0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1587920462;
 bh=MUPsU306dbTDMimvKdP0/q3NBw+LOYLD+RsbuRByH38=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=F5yMopp0CJpqF5pUeEudLIMtFfQ2MLaIRyQCNQeM4/J01G1wfGLe3sPQ6IPR4uFTc
 vf9Aiok7aLTQpq4SmRvx3wOQ4LLPXsAF7j+8HqMuJiFJ7BLjddqKaQtr86bWfdL85q
 k1RJXMXojy6axFkp+jo4uJQGH5jWnBS24jHT+4E4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.52.156]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MQvsg-1jdDhA1SGc-00UGaS; Sun, 26
 Apr 2020 19:01:02 +0200
To: Wu Bo <wubo40@huawei.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] sound:hdmi:fix without unlocked before return
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <475cb7a9-0992-3a79-a0ad-d3f8922ba3cb@web.de>
Date: Sun, 26 Apr 2020 19:00:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Vfs6F3fqANSzgHFv3pR2a9iso40vJkZRaKLqbfW3y8Rx0nyez/+
 oyN5O1OAqCsiLtUDyGh7tw7v8eHCgeF9+DD1Txl8KTI93mFn10Mup18EZFmlJ7pNAc2P7kN
 OvYY81k5jcrCPtvU4WNmKV7JyRRWOWjZH3ow5ESWXxCwc8P6ls5Rhyo44PIL5cDkCE3ZJkR
 eF6ofKiByEpEflqhvr6UA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bMUxsOqr8ZY=:p9ILc0b6qfnfMqy+tqFSWH
 yZDF27Fb+b9KHBXakq28+NtMTLuhpZhB/FL34eSjYDpat3U0sWrC5VgLsGxcDf1+U+R28Ptlo
 MRIRhvIapbCchrSSvz5ySfYGi5FiigQr6K9A7i/LdtzwW/8CGCuoGTKxDk1/se8q1Da0RQb/v
 rVZxrTQtc0x3y7Mkgds9aJffETYHM/UHXtpF0+Sjj8hfhxfp10YAcowQnbKrxuQSbUOHSHRRe
 E3c1Dd9/EP0wWzS3H0kyOq2mu8AKebAwNCKJg33a/d8rMDibMeZPilz2N2cxU8WTVpgsTJevH
 5vpXsMcBLWjZQZg7/0XEyXasiVnWevdcD5gflnYr73+lvU9n9XNAzcELquhQqn66FnzFHzp+l
 7NGslflyX9rYeGEkvuMWXi1HpJHw0DBYOt1W5BSz65JY67GJ83IdUwup+rDHV04gELwtCnJih
 2/tza+zF4ly5L39ZmWmt/xkLXf95zfTAVFZF0UF+cQKEAr3q9AQO8jhYxJmwjAn6jvjS/lgdR
 k2RPAW82gNZq5jFc+umDA+lGw3/1oWsBBlIA9iW1At5V/73tpBYRQbpRsoNQ3+PP6oHYa0JdX
 +YqLJaU86O2bS/Y+JPaDDzpBM3HbLjOpMLeHik3xeTprqu0q1N7tkpYoRvV7MFzwqd0gmnRLX
 Q79NbIqvf36DDHrS2jiUT/XRBjp7b6UXmwHzMOvyLOtUy0K9msrgZnNF5LTUMCmSogPFp2TeW
 TGf9/J5Uz2XDS48oHVcTuKAaZOlSz4s97UjrARcWh6IkBs0cmi8qtVhBc4NqAA11hdttDj/aU
 7agtv+Vgd2jQSzAwDEkF3Hzm584fJoubevaPuy5Z3OteGmspxJ2FgxmW/OhbyltbfyLmP6cBd
 DTKcU8tolPDNpPIMioelpv/Y7ZVU7MvVGqmN5fDAOZCwqCk7JaiYZMR5iYjfxLqHIfBByOgyH
 1jRfGbNAOOG9B7WdOqOBVrZCWTEzOSfuaNdD4l9BtGGt5atAGLz3PPb5/4LsmHCnvs9hxnjgd
 NxfMfxgpM0fP4j3qxG+xUsUqkAZshfnFRFku/9cb4uoJyKFWqCPM1MY9/3Mz58SE803OWWOZ/
 RLIVtbN0+3YPpX9oMvLDfIPIMBCDRE3hK+H98MKR6xgfNm5aL1NABed1gGZiAp7ylX7xqCXpQ
 a+BnXQsNbjdfp2wqj1XEdpKXSAPGF0hJcfSoVBJ9hmw3N5i9Zud+fxfD92quuoZEgJ+dknL1H
 onxVorBzsSHCHHvdm
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nikhil Mahale <nmahale@nvidia.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Aaron Plattner <aplattner@nvidia.com>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Feilong Lin <linfeilong@huawei.com>, Libin Yang <libin.yang@linux.intel.com>,
 Zhiqiang Liu <liuzhiqiang26@huawei.com>
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

> After add sanity check to pass klockwork check,
> The spdif_mutex should be unlock before return true
> in check_non_pcm_per_cvt().

How do you think about a wording variant like the following?

   Subject:
   [PATCH v2] ALSA: hda/hdmi: Unlock a mutex always before returning from =
check_non_pcm_per_cvt()

   Change description (according to a solution alternative):
   The exception handling was incomplete in an if branch for
   a null pointer check of the variable =E2=80=9Cspdif=E2=80=9D.
   Thus assign an appropriate value to the local variable =E2=80=9Cnon_pcm=
=E2=80=9D
   by using a conditional operator instead.
   A mutex is also appropriately unlocked then.


=E2=80=A6
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -1848,8 +1848,10 @@ static bool check_non_pcm_per_cvt(struct hda_code=
c *codec, hda_nid_t cvt_nid)
=E2=80=A6
> -	if (WARN_ON(spdif =3D=3D NULL))
> +	if (WARN_ON(spdif =3D=3D NULL)) {
> +		mutex_unlock(&codec->spdif_mutex);
>  		return true;
> +	}
>  	non_pcm =3D !!(spdif->status & IEC958_AES0_NONAUDIO);

-	if (WARN_ON(spdif =3D=3D NULL))
-		return true;
-	non_pcm =3D !!(spdif->status & IEC958_AES0_NONAUDIO);
+	non_pcm =3D WARN_ON(!spdif)
+		  ? true
+		  : !!(spdif->status & IEC958_AES0_NONAUDIO);
 	mutex_unlock(&codec->spdif_mutex);
 	return non_pcm;
 }


Would you like to add the tag =E2=80=9CFixes=E2=80=9D to the change descri=
ption?

Regards,
Markus
