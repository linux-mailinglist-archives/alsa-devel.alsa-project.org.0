Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E95F41D1FB
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 05:49:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83ACD16E0;
	Thu, 30 Sep 2021 05:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83ACD16E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632973791;
	bh=FY/j399do4m79hRxoGTWhV66FaWZfh2yrNYlLeup0jY=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m2+8J2wtmSgOuIKPWbIi+R9NuMgRa9g5Q5uteu6/2HrocJmjKKQc7bqmP8Q/XezB/
	 x9pdAihaYrSiFDyCs5HpKvJBGjNhxbviCdbDF/zAYKYLRE4CLnMGmA7ahcFiFj9U8P
	 kQhmnRCofiQKPuitNKSZN90ps0YYFYgkPPn+LOq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F332FF80113;
	Thu, 30 Sep 2021 05:48:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9596F804AD; Thu, 30 Sep 2021 05:48:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61AE0F80113
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 05:48:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61AE0F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="guKwO66C"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210930034818epoutp01a16fde392ba04bec35633a039117a320~pfO048rOK2931129311epoutp01V
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 03:48:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210930034818epoutp01a16fde392ba04bec35633a039117a320~pfO048rOK2931129311epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1632973698;
 bh=zExaj6XXC7ZNSSMGCSAWpM0NFV6daknjryNIw55cyl0=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=guKwO66CXgc1Rx/W4n6RD6AiXhXxwpE4k98Wfdp8H0YGCOUj+BpQ7eo77Pu6geqLv
 mMR5xSbpU/5oUzdx0e9W0Jf1gx2+KUMUPorPW5zJzuz9c7zrnUzXJnLoOT0QRF/B0r
 MXDnapSPau9UO6NrzU8uL6rk5fV2WgZ3oE+eG1lo=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20210930034817epcas2p1949ce2d49de825f9b4df309b3901645a~pfO0Rs-SU1632716327epcas2p1c;
 Thu, 30 Sep 2021 03:48:17 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.97]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4HKfND55Q6z4x9QD; Thu, 30 Sep
 2021 03:48:12 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 A5.F3.09472.A7335516; Thu, 30 Sep 2021 12:48:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20210930034810epcas2p490b085bb9fb6f052a849a3590654f510~pfOthHz5F1685416854epcas2p4M;
 Thu, 30 Sep 2021 03:48:10 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210930034810epsmtrp153fad096814a692dc9684380c4c28ee4~pfOtgEael0080000800epsmtrp1c;
 Thu, 30 Sep 2021 03:48:10 +0000 (GMT)
X-AuditID: b6c32a48-d5fff70000002500-2a-6155337a4f9e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B9.31.08750.A7335516; Thu, 30 Sep 2021 12:48:10 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210930034810epsmtip103a4d5d06ba7ad7d3f2d252da2ad81f9~pfOtU_cY62807428074epsmtip1a;
 Thu, 30 Sep 2021 03:48:10 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Pierre-Louis Bossart'" <pierre-louis.bossart@linux.intel.com>,
 "'Takashi Iwai'" <tiwai@suse.de>
In-Reply-To: <d9e09d88-d3f8-2eab-ebe1-1ac8e64e5093@linux.intel.com>
Subject: RE: [PATCH] ASoC: dpcm: fix race condition to dpcm links in
 dpcm_be_dai_trigger
Date: Thu, 30 Sep 2021 12:48:09 +0900
Message-ID: <000401d7b5ad$fc842f90$f58c8eb0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFkUTwqHZ9xE4gHvUVMZxlRxNtSOANaSWqfAlr/o1UBzu5/L6xmcWsw
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBJsWRmVeSWpSXmKPExsWy7bCmqW6VcWiiwdwec4srFw8xWdz9YW4x
 Y1s3i8Xqq1uYLL5d6WCy+PX/GZPF0YuLmSwa7jazW3SvOs1qMfHua3aLl5vfMDlwe2z43MTm
 sXPWXXaPeScDPfq2rGL02Hy6OoA1KtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLC
 XEkhLzE31VbJxSdA1y0zB+gwJYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BeYFe
 cWJucWleul5eaomVoYGBkSlQYUJ2xsqHE9kKZstVLJ73lqWB8ZREFyMnh4SAicTjngcsXYxc
 HEICOxglli1tYYVwPjFKvJx7lB3C+cwoMffwV2aYlieb+6BadjFKrHxzgg0kISTwklHi3R17
 EJtNQFfiy707YA0iAukSXyffYAZpYBZ4yyixdet9VpAEp4CzxJmNH9hBbGGBKInDax8ygdgs
 AqoSGzctAavhFbCU6NvRywZhC0qcnPmEBcRmFtCWWLbwNdRFChI/ny4DqucAWuYm8fMuL0SJ
 iMTszjawvRICazkkttzYzAJR7yJxd9EzRghbWOLV8S3sELaUxMv+NnaIhmagZ87+gUpMYZTo
 7BaCsI0ltsw9xQSyjFlAU2L9Ln0QU0JAWeLILajT+CQ6Dv9lhwjzSnS0QTUqSWw89Y8JIiwh
 MW8D+wRGpVlI/pqF5K9ZSB6YhbBqASPLKkax1ILi3PTUYqMCE3hcJ+fnbmIEJ1ktjx2Ms99+
 0DvEyMTBeIhRgoNZSYT3h3hwohBvSmJlVWpRfnxRaU5q8SFGU2BIT2SWEk3OB6b5vJJ4QxNL
 AxMzM0NzI1MDcyVx3rn/nBKFBNITS1KzU1MLUotg+pg4OKUamHhve1R/nJtTqZa9pJSn8WX1
 Tqcr1bOmzNGvfc11ol/U+oSTn97X5XM/3tC6pZa88DNTk/+Fxk9nO4uPSGaVzdl4o7yyf7qn
 dbJmWYn2tiPV32OZZHJeuSbJPFfrF1n+OU/xsFZ9oJWWcv2yTcd8F8QpeJnOrgkofZYs7fNY
 PX2Go+WudW9mfthbeoyhg81iS/knE9FdES7nHh88u+jhn3N/g7NePmNPYGiY6erwTyOs5Uvp
 vY1bLovtW/Hu0fQHl40COI0ttTYE7AxJnpp2IONb93z957FsvF+engsU2P+XtWrdDTYZa/kf
 f86fTPz/eat6zuPpsQL7jyYqsOmeE/3Qdulj89KPG4JMLp/cNEOJpTgj0VCLuag4EQCYOu0h
 OwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsWy7bCSnG6VcWiiwekdPBZXLh5isrj7w9xi
 xrZuFovVV7cwWXy70sFk8ev/MyaLoxcXM1k03G1mt+hedZrVYuLd1+wWLze/YXLg9tjwuYnN
 Y+esu+we804GevRtWcXosfl0dQBrFJdNSmpOZllqkb5dAlfG2ubFLAXz5SoetNY3MO6S6GLk
 5JAQMJF4srmPpYuRi0NIYAejxJIJTxkhEhISH+afYYewhSXutxxhBbGFBJ4zSpw7YAViswno
 Sny5d4cZxBYRSJf4OvkGM8ggZoHvjBI9+xqgpv5klPix9DMLSBWngLPEmY0fwKYKC0RI3HzV
 DLaNRUBVYuOmJWAbeAUsJfp29LJB2IISJ2c+AetlFtCW6H3YyghjL1v4mhniOgWJn0+XAfVy
 AF3hJvHzLi9EiYjE7M425gmMwrOQTJqFZNIsJJNmIWlZwMiyilEytaA4Nz232LDAKC+1XK84
 Mbe4NC9dLzk/dxMjOOK0tHYw7ln1Qe8QIxMH4yFGCQ5mJRHeH+LBiUK8KYmVValF+fFFpTmp
 xYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUwzbgamffKuPz7U7mzDpaer+ev3aa9
 VJOLJXfK4QjLdxZvLWr8sjZV/S+5cFhPNzdHXGnKvB8rA/t9mUUOCHMoXlB9IOn/6pH275kM
 Itu/7JbsSjO4YP6ifody8dONVtcUFjaXKxiXVv+V97tzWbGu/e4+lvL7HAvLLiQ9bJnjmbIl
 MkTlutC7OoP6fMU3j/j1l+Qoy1yXFr+rzfwm6oOD7UTPygWphll5Rzo7K0XFVbk+K+79yGXb
 s+aZBDe33fLI7nkmyR7nmlsnmOesa+r/YynYkvPxU/GJW/o/5l48eCLqzxLL76vUrYU/TdXR
 z/u11j5mMmPO5L1mhQLTsv9VH+irXH/w1PygmYyfhY8psRRnJBpqMRcVJwIA0O8PXCcDAAA=
X-CMS-MailID: 20210930034810epcas2p490b085bb9fb6f052a849a3590654f510
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210929054921epcas2p2fbe35a6262405e064aac3bd92b22b1aa
References: <CGME20210929054921epcas2p2fbe35a6262405e064aac3bd92b22b1aa@epcas2p2.samsung.com>
 <002f01d7b4f5$c030f4a0$4092dde0$@samsung.com>
 <27786697-1309-8336-6f53-abff32e0b6c2@linux.intel.com>
 <d9e09d88-d3f8-2eab-ebe1-1ac8e64e5093@linux.intel.com>
Cc: alsa-devel@alsa-project.org, kimty@samsung.com, lgirdwood@gmail.com,
 senius.park@samsung.com, donggyun.ko@samsung.com, hmseo@samsung.com,
 seungbin.lee@samsung.com, s47.kang@samsung.com, pilsun.jang@samsung.com
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

>>> If routing change and underrun stop is run at the same time,
>>> data abort can be occurred by the following sequence.
>>>
>>> CPU0: Processing underrun 	CPU1: Processing routing change
>>> dpcm_be_dai_trigger():		dpcm_be_disconnect():
>>>
>>> for_each_dpcm_be(fe, stream, dpcm) =7B
>>>
>>> 				spin_lock_irqsave(&fe->card->dpcm_lock, flags);
>>> 				list_del(&dpcm->list_be);
>>> 				list_del(&dpcm->list_fe);
>>> 				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
>>> 				kfree(dpcm);
>>>
>>> struct snd_soc_pcm_runtime *be =3D dpcm->be; <-- Accessing freed memory
>>>
>>> To prevent this situation, dpcm_lock is needed during accessing
>>> the lists for dpcm links.
>>=20
>> Isn't there still a possible inconsistency here introduced by the
>> duplication of the BE list?
>>=20
>> You protect the list creation, but before you use it in
>> dpcm_be_dai_trigger(), there's a time window where the function could be
>> pre-empted and a disconnect event might have happened. As a result you
>> could trigger a BE that's no longer connected.
>>=20
>> What you identified as a race is likely valid, but how to fix it isn't
>> clear to me - the DPCM code isn't self-explanatory at all with its use
>> in various places of the dpcm_lock spinlock, the pcm mutex, the card mut=
ex.
>>=20
>> Ideally we would need to find a way to prevent changes in connections
>> while we are doing the triggers, but triggers can take a bit of time if
>> they involve any sort of communication over a bus. I really wonder if
>> this dpcm_lock should be a mutex and if the model for DPCM really
>> involves interrupt contexts as the irqsave/irqrestore mentions hint at.
>
>To follow-up on this, I started experimenting with a replacement of the
>'dpcm_lock' spinlock with a 'dpcm_mutex', see
>https://protect2.fireeye.com/v1/url?k=3Dbdfd74d3-e2664dcc-bdfcff9c-000babd=
fecba-6f3671279e770f0b&q=3D1&e=3D7fdf074e-2aa1-44f0-bd52-58f2d26c9bfb&u=3Dh=
ttps%3A%2F%2Fgithub.com%2Fthesofproject%2Flinux%2Fpull%2F3186
>
>If we combine both of our results, the 'right' solution might be to take
>this mutex before every use of for_each_dpcm_be(), and unlock it at the
>end of the loop, which additional changes to avoid re-taking the same
>mutex in helper functions.
>
>there's still a part in DPCM that I can't figure out, there is an
>elaborate trick with an explicit comment
>
>	/* if FE's runtime_update is already set, we're in race;
>	 * process this trigger later at exit
>	 */
>
>Which looks like a missing mutex somewhere, or an overkill solution that
>might never be needed.
>
You are right.
This patch can't resolve inconsistency problem completely.
I thought that even part of the problem can be resolved by this patch and
it could help some other developers and me also.
And I also thought that invalid trigger on disconnected BE DAI can be prote=
cted
by the state check in the trigger function like the below.

int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
			       int cmd)
=7B
	struct snd_soc_dpcm *dpcm;
	int ret =3D 0;

	for_each_dpcm_be(fe, stream, dpcm) =7B
.......
		switch (cmd) =7B
		case SNDRV_PCM_TRIGGER_START:
			/* Following if statement protect invalid control. */
			if ((be->dpcm=5Bstream=5D.state =21=3D SND_SOC_DPCM_STATE_PREPARE) &&
			    (be->dpcm=5Bstream=5D.state =21=3D SND_SOC_DPCM_STATE_STOP) &&
			    (be->dpcm=5Bstream=5D.state =21=3D SND_SOC_DPCM_STATE_PAUSED))
				continue;

			ret =3D dpcm_do_trigger(dpcm, be_substream, cmd);

I really appreciate that there is a project about this problem already.
But if the project needs more time to be merged into the mainline,
I think that this patch can be used until the project is merged.
If you don't mind, would you reconsider this patch one more time?

Thank you,
Gyeongtaek Lee.

