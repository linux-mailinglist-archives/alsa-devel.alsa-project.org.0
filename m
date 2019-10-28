Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DADE6EA2
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 10:02:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 747071F0D;
	Mon, 28 Oct 2019 10:01:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 747071F0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572253339;
	bh=8sg31KAkETczEkaOZqqMG1DEnDUqf5bqZFOM4MuzzKA=;
	h=References:From:To:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pILlEmHB1Zkr/oxnpcZ2XHNi0GDJE8wJobAKVt0FSQSDJOiqr8ooEtXh1hW4+klni
	 LPnMhNXo1HH7CA17Y174+P38nI0kXxA9aI+thlW4bjgbz72SjW2dC2Og36hmgaueaH
	 whLH3f7AwCQQerJL0xp3x+XJcNJSutW/Bw4l0dAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91402F802BD;
	Mon, 28 Oct 2019 10:00:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD0ADF80361; Mon, 28 Oct 2019 10:00:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE, SPF_PASS autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.15.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82C25F800E7
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 10:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82C25F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="YxjNo0QR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1572253224;
 bh=ISZ1ToXiu521AwwdlpIdQQBBys/fe/KeuTmoSpj4ADM=;
 h=X-UI-Sender-Class:Cc:References:Subject:From:To:Date:In-Reply-To;
 b=YxjNo0QRJWXTSZCVQ8eufGHzpwbStwEH0SKvuePLJgygESkwMveT/OJhX6yRYxxIF
 jaa5BSWwUUbPa/n5qqgrKp/A/Mw/q56NIdjWWCqAIxjVwPlm6bpHpYUz14ChqpcfgR
 GYZyNpQ3HWJmjUlad2dY8V9fBxJ0uHfPy2XM8kkI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.155.234]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MOS6H-1iJnpN0RVd-005skP; Mon, 28
 Oct 2019 10:00:24 +0100
References: <s5hmudlmldk.wl-tiwai@suse.de>
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
To: Takashi Iwai <tiwai@suse.de>, Navid Emamdoost <emamd001@umn.edu>,
 alsa-devel@alsa-project.org
Message-ID: <ec3647df-0e54-4aaa-7ec7-b3dec0fa1965@web.de>
Date: Mon, 28 Oct 2019 10:00:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <s5hmudlmldk.wl-tiwai@suse.de>
Content-Language: en-US
X-Provags-ID: V03:K1:a9Vw6F2RhASDtPnlTVi5f0T9FPP8jEdu7eDaAHEo4yD3FSvcvui
 3PcfJCYtR3EhuC6ZmUv6+gp2vbjhT+8JkdEcuTCX92BwIXVHy4mQpgShhX/thiN+ZHspJhE
 b5eSiEfurbaRjuxIvick1PgFF+UwHzAbFCUTtAc0/Dsn/OLNoTmNasoa+f3ol6ebckoJJ+y
 2ZWCPeWlXhS2ibLboyz3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tslcmDesiDE=:jjyWkd4TF4U/bPtCG439fy
 ila4NvXgxhirVNqbVNWzNrgNl/8sEPYSRiTURRsjpnfYjbB6JvB8P577zI34kSrH+q0NDujAI
 EYyWv6wDyO5c/4OfIAVXO3XUcVucefeC9CFHIOWIDXMenjmNA/sEGA2O/9TyX21APDOTzSjnR
 FGvbgtZe6vG9u+uCmFw8H8hKO4Gvx/JVA4AB0wd1HfJJlD8N7dEU7m4HjGf4oRUZ3knSTU9MI
 dyJNFjObycIPQr8ua8oJP3GYzoPkSRxziZwms/CC30iOupgBbu/e0x4FA5FxPpUwWMjfSVeWG
 yUVDbrt3VmYvmTSgrDzJrAcrtHE1ig2JsD7Ze8Y1lMoa7TD9B0LFxCGj5O8g2MBplGEUs25Jw
 Fo80z2dV+JKQBMx5KdTovivK2VPcfrg2yhIReP1Zi8ur/+mfQTrJVGU4HK/uteAt9t/hrK8Wf
 asuLuv83FPx+5G4nxz8oUbUPUOXODJizPJjGOxKsOvUcqrjDPkNF3odtthSEKeU7EdFB37zyi
 fg4mENAfoT1SFXbbkC4PIRBhi6meyxCvzv/7c0dAxiqhzPPkj2HrU9prFm+pi8KXWGhlhZtcg
 X8p8T2obeotx/N1MZwPaTwzmOa6m535hbieav1nbXG1+yVlu/eMrwcew1RemX458SMpYcF72P
 ng5RV/TEeXAx724HsYva7Ez1ggc2qEC8OzLt5ZZ9ZfmEkznqL8xpHH2+T3AZr1bYMV7Q9vWEO
 ypFssibZjovfxoVdxiWNdlw3pgob4YP+QgDM+8HG3LvjaHOh3vWVJ0K+IUa6qGTJKmXQN3Me9
 lZHiu21a9IeJp/gLetAXekjY+kaU+UpERwU1Hsm0ifwT/+vsCzhOnrhh8lfaosnNwiDrZkdK3
 dtmsEGzUvtTRrV7rhlSSNbBHqiFP3Bz3Msken3zcbndtH3abT9JhLm+/ONpDMnvwmVYAwzt6t
 p6brgoaQJuMB3XeVv+C+X9AFSQqkJtMCp+sG4LNesKjhjID+9/j/r/RLVZIq+d5AT8DhTAp7B
 UCWUtK/PBiupJ9szf1Pf77fnkh513k58J79TRzmnZKGu5KB3fP4Z9omfMaPRpbMtu7WVgoZCn
 K0F8oNgYkeTroEtYnDLRzsVNfremR/4kAQbt/OI8hmKs8Dglxmss5lxk+oRbp6IMlTel3WBVb
 fFOF7/cPVmgUB4cVP572ROCzvURASKr6iAYfX88dQX0Z20dqALvQUt/WrSs3mzFYNwG032Prq
 2jevCHBv+4ckP+5ZnmprJujZQSGgqnaDbGCuP4u2q+HAa6jfwa/mkuWTSFfk=
Cc: kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>,
 Stephen McCamant <smccaman@umn.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [alsa-devel] ALSA: korg1212: Checking exception handling in
 snd_korg1212_create()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

> The code path is after snd_device_new() which has its own destructor callback.

Thanks for your reminder.

Can the properties of this programming interface be documented also together
with the function declaration for the safer handling of ALSA components?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/sound/kernel-api/writing-an-alsa-driver.rst?id=d6d5df1db6e9d7f8f76d2911707f7d5877251b02#n567


Can any more API information help to improve automatic source code analysis
around similar functions?

Regards,
Markus
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
