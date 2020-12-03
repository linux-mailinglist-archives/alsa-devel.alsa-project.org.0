Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D05DE2CCEB4
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 06:37:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AACC1832;
	Thu,  3 Dec 2020 06:36:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AACC1832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606973822;
	bh=X4ZkVgx8K4dbzS7T561ZhYBklsNGPKwrDhe3Ad4JFj4=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=VqRYhGH+5R23L7ToI//IipvkQs3b73PF5sRwCDuRnBflz1xQShJvbiRHTVMoSo5xc
	 EGFE0Vna20xtV8LTHcmXSzmXJCAOsNbezH1+3t/Bt3nUeowch5hR44e1oSkHRO8TVU
	 6crDIL0fUp/j6f1eAxD3xd4oTyC9lRZGczjr6EHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89D94F80276;
	Thu,  3 Dec 2020 06:35:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63F1BF8025F; Thu,  3 Dec 2020 06:35:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D12F4F80082
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 06:35:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D12F4F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="kcdcIEBB"
Received: from epcas3p1.samsung.com (unknown [182.195.41.19])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20201203053502epoutp02c83623917fba83b88520fcc1883b6c9a~NHhFg-gNH2164821648epoutp02W
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 05:35:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20201203053502epoutp02c83623917fba83b88520fcc1883b6c9a~NHhFg-gNH2164821648epoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1606973702;
 bh=vdeHPsfHrZyOGNKdJPU0JMXwLSSBAGB7qrQsssr3lCA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=kcdcIEBBs3sCSLCp8tH7EikraVfhBlsxXjTjiexMNtm5UcoKCYy5bG7xA+1p9iwwh
 3WOmySbuNaHf1gX4AOzq/GnXh4p9xFGGwP6GBybZkJD2W8XMHX3tCBIg5GM+6AUIYw
 HtySrejDwgFyzF+CtDlW1sH4BD3uWVKDGqU8DR+s=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas3p4.samsung.com (KnoxPortal) with ESMTP id
 20201203053501epcas3p43f34c0d9a94c8923a92a2bed680b752d~NHhFNeJfH1866618666epcas3p4N;
 Thu,  3 Dec 2020 05:35:01 +0000 (GMT)
Received: from epcpadp3 (unknown [182.195.40.17]) by epsnrtp1.localdomain
 (Postfix) with ESMTP id 4Cml0P4mn7z4x9Px; Thu,  3 Dec 2020 05:35:01 +0000
 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20201203053224epcas2p1fa702ea12a9869f5c73ec60c760a3131~NHeyv8M5j0387003870epcas2p1W;
 Thu,  3 Dec 2020 05:32:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201203053224epsmtrp2d3ec9fa58f6a2fb8bde7441c5f7d2664~NHeyvDoDH0373403734epsmtrp2O;
 Thu,  3 Dec 2020 05:32:24 +0000 (GMT)
X-AuditID: b6c32a29-f3fff7000000349e-82-5fc87868be89
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 97.EB.13470.86878CF5; Thu,  3 Dec 2020 14:32:24 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20201203053224epsmtip2d87032b6e75e9739ca6a5d0933df18c7~NHeyiTQWT2399123991epsmtip2V;
 Thu,  3 Dec 2020 05:32:24 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Kuninori Morimoto'" <kuninori.morimoto.gx@renesas.com>,
 <cpgs@samsung.com>
Subject: [PATCH v2 0/1] ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()
Date: Thu, 3 Dec 2020 14:32:23 +0900
Message-ID: <2038148563.21606973701670.JavaMail.epsvc@epcpadp3>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdbJL+4kLaRovKIjTQOjmB/n5rVIiA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeLIzCtJLcpLzFFi42LZdlhJXjej4kS8wZS3IhZXLh5isnh5SNPi
 7g9zixnbulksGu9NYLNYfXULk8Wrw7sYLb5d6WCy+PX/GZPF0YuLmSwa7jazW7zc/IbJ4kjj
 FCYHXo8Nn5vYPHbOusvuMe9koMe3MxNZPPq2rGL02Hy6OoAtissmJTUnsyy1SN8ugSvj6MHV
 bAXnBSsuX73I3MC4k6+LkZNDQsBEoq9jAlMXIxeHkMBuRokVi9uYIBISEh/mn2GHsIUl7rcc
 YYUoes4oMfXgeTaQBJuArsSXe3eYQWwRgSCJBUv/ghUxC7xjkrj6awXYJGEBL4ldy5cwgtgs
 AioSBxcvBrN5BSwlFuzYyAJhC0qcnPkEzGYW0JbofdjKCGMvW/iaGeIKBYmfT5exQizTk3i+
 6wE7RI2IxOzONuYJjIKzkIyahWTULCSjZiFpWcDIsopRMrWgODc9t9iwwDAvtVyvODG3uDQv
 XS85P3cTIzjCtDR3MG5f9UHvECMTB+MhRgkOZiURXpZ/R+KFeFMSK6tSi/Lji0pzUosPMUpz
 sCiJ894oXBgnJJCeWJKanZpakFoEk2Xi4JRqYAr/OJ9l8aGc1d/Uaj94TRN5v0bhaLh7pc/q
 iMpPGw4lBkjnt9+cnuUSNHnhuyuTvlfEWiyRu7pscaPBT8ugAz881e5bVvPPsePQnc0ZwvhL
 z/7g3PrdK+W2y88PqzQXNZfkvVrhZGl17NPt11s9lr30ddqnqPXs7UNvYaneFD//SzmCiccf
 Zh6aM1dLwObEnR8yi3zOSq3LMdvpkWzclCge/Ms9qzOzkZl95+XId5m1Bn9nzW6d+iw4geFC
 14wL6ya8/volYevsm2+Dzz/ccErgSkPnVbUX///yct/P0TPUW3bJUWzm/lP8L6yOZD1Ifm+b
 dF8v4UyCwoppBmYyUvpvY6ubf/H80LuW8TXEf4YSS3FGoqEWc1FxIgAwEoJUHwMAAA==
X-CMS-MailID: 20201203053224epcas2p1fa702ea12a9869f5c73ec60c760a3131
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20201203053224epcas2p1fa702ea12a9869f5c73ec60c760a3131
References: <CGME20201203053224epcas2p1fa702ea12a9869f5c73ec60c760a3131@epcas2p1.samsung.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, 'Takashi
 Iwai' <tiwai@suse.de>,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, kimty@samsung.com, donggyun.ko@samsung.com,
 hmseo@samsung.com, cpgs@samsung.com, s47.kang@samsung.com,
 pilsun.jang@samsung.com, tkjung@samsung.com
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

On 03 Dec 2020 07:33:03 +0900, Kuninori Morimoto wrote:
>Hi Gyeongtaek
>
>Thank you for your patch
>
>> If stop by underrun and DPCM BE disconnection is run simultaneously,
>> data abort can be occurred by the sequence below.
>>=20
>> /* In core X, running dpcm_be_dai_trigger() */
>> for_each_dpcm_be(fe, stream, dpcm) {
>> /* In core Y, running dpcm_be_disconnect() */
>> spin_lock_irqsave(&fe->card->dpcm_lock, flags);
>> list_del(&dpcm->list_be);
>> list_del(&dpcm->list_fe);
>> spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
>> kfree(dpcm);
>> /* In core X, running dpcm_be_dai_trigger() */
>> struct snd_soc_pcm_runtime *be =3D dpcm->be;   <=3D=3D Accessing freed m=
emory
>
>It is easy to read/understand if this code has alignment.
>
>> To prevent this situation, dpcm_lock should be acquired during
>> iteration of dpcm list in dpcm_do_trigger().
>>=20
>> Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
>> Cc: stable@vger.kernel.org
>> ---
>
>Is this bugfix patch for some recent commit ?
>If so, having Fixes: tag is helpful.
>
>Thank you for your help !!
I tried to find out some change from the history.
However, I saw that dpcm_lock never be held in dpcm_be_dai_trigger() from t=
he beginning.
So, I just fixed some miss from the commit comment and resend.
If you have another suggestion or request, just let me know.

And I have a question.
This patch can=E2=80=99t be applied to stable branches directly by conflict=
.
I found out following commits are needed to apply this patch into the 5.4 s=
table.
 ASoC: soc-pcm: remove snd_soc_dpcm_be_get/set_state()
 ASoC: soc-pcm: add snd_soc_dpcm_can_be() and remove duplicate code
In this case, what should I do when stable maintainer requests resolving co=
nflict to me?
Should I send those patches to the maintainer?
Or rewrite the patch on the latest of the each stable?

Thank you!
Gyeongtaek Lee
>
>Best regards
>---
>Kuninori Morimoto
>

Gyeongtaek Lee (1):
  ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()

 sound/soc/soc-pcm.c | 62 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 18 deletions(-)


base-commit: fa02fcd94b0c8dff6cc65714510cf25ad194b90d
--=20
2.21.0



