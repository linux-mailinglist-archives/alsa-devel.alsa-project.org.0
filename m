Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2DD2A5CEB
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 04:10:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B663416B2;
	Wed,  4 Nov 2020 04:09:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B663416B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604459401;
	bh=JBdBnYlVQi86vOq0pEW8eDqX9Ya497gCvHbR4o6NtWk=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=WA8WP+du1dWKC5+ubRn4Gzv/ESJHjMrVOTpv/Xe3mt14mcqiur1Z7Kx+D5vGegFPU
	 78jC2kj620fUEeEiQKXNK9OpgzDcftxwCahnk0pZ0XKoUpk/i9rDkUWvuRRwtfNukf
	 yQytGhwGXvDa+1Uof0/xtZsA98W5H2uFRFhdvMqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 786D0F8029B;
	Wed,  4 Nov 2020 04:08:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A59FCF80234; Wed,  4 Nov 2020 04:08:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7305F80232
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 04:08:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7305F80232
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="e7Bvad3l"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20201104030804epoutp023be89a0bfbc575b4b5b8aa8782e98aa2~ELzfhWSG82683226832epoutp02P
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 03:08:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20201104030804epoutp023be89a0bfbc575b4b5b8aa8782e98aa2~ELzfhWSG82683226832epoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604459284;
 bh=KwjgKDkDFxMq6k1mHJ1A2MJDttpYamRyehiR2xDvNnk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=e7Bvad3lVdTKECRz9dOLjiQOQFkJ2nQLCBNROxNX/oeCI1Y0qfv8I2XpoX9wwVTui
 edONRP9PaveQHrFmPIec0xEcFfiT55zpU7i5w7j2SWK/wIpfAgh9yRcmOEUjZjtHwe
 hqHkKaK9LitarFvYtmqenZpckn0g3wW9HY/PY3Ew=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20201104030803epcas2p15c0d30f048f704a34792a56d676d4b66~ELzew4jor2708327083epcas2p10;
 Wed,  4 Nov 2020 03:08:03 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.184]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4CQs686rTYzMqYkb; Wed,  4 Nov
 2020 03:08:00 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 2D.59.10621.01B12AF5; Wed,  4 Nov 2020 12:08:00 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20201104030800epcas2p1b74b02554b9174bfafb7ce21accd65f0~ELzcB94iy2708327083epcas2p1p;
 Wed,  4 Nov 2020 03:08:00 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201104030800epsmtrp13d5ec4954de9bfbbfb14cb357fa8e8ab~ELzcBITLW0498704987epsmtrp1j;
 Wed,  4 Nov 2020 03:08:00 +0000 (GMT)
X-AuditID: b6c32a45-337ff7000001297d-80-5fa21b100c46
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 FB.41.08745.01B12AF5; Wed,  4 Nov 2020 12:08:00 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20201104030800epsmtip1cf77c255ac59e4dca5de56b763e65788~ELzbwPqXC2799427994epsmtip13;
 Wed,  4 Nov 2020 03:08:00 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Takashi Iwai'" <tiwai@suse.de>, "'Jaroslav Kysela'" <perex@perex.cz>
Subject: [PATCH v2 0/1] allow pause and resume during draining
Date: Wed, 4 Nov 2020 12:07:59 +0900
Message-ID: <000001d6b257$b3d778b0$1b866a10$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdayV6DOH/P4SbPnQ5CJxqYa0zE4ow==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUwTZxzee9ePg6x6K4W9gz8sh1mGEWg7C9dNdMmQXLZFO5A4zGK50Uth
 lrbrlWWKRj6EURxYZuPWqmToAqPG8Dk+OiUZoEOkLjUwiQPJMikDLDJLFJC5tRxm/Pe8v+f3
 vL/neT8wVNwviMbyDRbGbKD1hCCc19kfn5KAx1zUyP4IKMkRbx9Cftt5ikeW3LcJyMujHQj5
 ZKQSIa3u03xy5V8fQl73XkLI4okyIdny9AogZ9ofIuRAiR0he8YH0XdEVEugVED1OCeEVJvL
 KqDqbn5I9fobBFRNhwtQzR2jPKr9VpEaO6jfmcfQWsYsZQy5Rm2+QZdKvJ+peVejTJbJE+Qq
 MoWQGugCJpVI+0CdkJ6vD1ompJ/T+sJgSU2zLJG0a6fZWGhhpHlG1pJKMCat3iSXmxJZuoAt
 NOgSc40Fb8llMoUy2Jmjz5ssneabqiO++G3RhhaDq5urQBgG8R1w4IdlfhUIx8R4N4DtjsdI
 iBDjjwG89lMRRwQAvP2Nk/9CsTjsEHKEG8Bn9noBt5gB0PO9a00uwBPg4v1xtApgmAR/Dzb7
 3wj1oPgAAi8/WQGhngh8F3x27uEa5uFboX94ThDCIlwFq8tvCDn8CrzpeMALYRTfArv851HO
 hRQuTzWsOZLgifDSRCvgeiTwnLUCDQ2D+FUM3nLf5nGCNNh4p13I4Qg4+0vHOo6GM6crhJyg
 DMB5z+o6YQfQekrM4Tdhx4UhJJQGxeNhszspBCEeBwfurXvbBCv7/xFyZRGsrFgXErB16DnC
 lSGsa1nfm4KPumqFNhDr3BDSuSGkc0MY5/9jvwM8F4hiTGyBjmEVJvnGu24Da695255ucMa/
 kNgHEAz0AYihhER0LLtOIxZp6SNHGbNRYy7UM2wfUAaPvRaNjsw1Br+DwaKRKxXJyTKVklQm
 K0jiVVFWU41GjOtoC3OYYUyM+YUOwcKiixFStzAmdBxQ1nx58uf612Y/Hnw+pRhPV9XPH74W
 tWnfds/o1I1jf6qadluKar1/D/taDg1bL9Y+TduvtflL5rMzXzbR+zs/sZuPt321dTZg905l
 SKInY6p/PDid2fk7dCypGu6uZo2uKLqOnPHap5vj5up7mlbQo78e5/t92pTt6niV57zV2tyq
 TFecuBOY211lcPfaG7U5n720WZfkK89OsY7Jzs5LD2iXVjPOLv/VKKCk+nJf98iDyHjp7FhY
 eK+I4pd9zfPETd6T7bhyveHTfXuXuqcbT5Ta3nYdWlgYzSkdisnqjoxqPal+/W7towwPrq/a
 smfGkvGRWxYbax60Ezw2j5ZvQ80s/R+XgolBVgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsWy7bCSnK6A9KJ4g9WXxS2uXDzEZDFjWzeL
 ReO9CWwWq69uYbL4dqWDyaJzVz+rxa//z5gsjl5czGTRcLeZ3WLD97WMFi83v2GyONI4hcli
 550TzA68Hhs+N7F57Jx1l91j06pONo95JwM99r1dxubRt2UVo8f6LVdZPDafrg7giOKySUnN
 ySxLLdK3S+DKuN/0nLWgV7ji2pcJzA2Me/i7GDk5JARMJL6cmcnexcjFISSwg1Hi8ff17BAJ
 CYkP889A2cIS91uOsEIUPWeUWPHqJxtIgk1AV+LLvTvMILaIgI/EkZP3wYqYBS4wSVw4/xks
 ISxgJ/F79htGEJtFQEXi7ZnXYM28ApYSva3H2CFsQYmTM5+wgNjMAtoST28+hbLlJba/ncMM
 cYWCxM+ny1ghlulJLL67kRGiRkRidmcb8wRGwVlIRs1CMmoWklGzkLQsYGRZxSiZWlCcm55b
 bFhglJdarlecmFtcmpeul5yfu4kRHHlaWjsY96z6oHeIkYmD8RCjBAezkghvTeS8eCHelMTK
 qtSi/Pii0pzU4kOM0hwsSuK8X2ctjBMSSE8sSc1OTS1ILYLJMnFwSjUwRbRtX/X14KdUo0Vs
 WVPLFcR41pSfuf324mkBtk1Wgp0V7OuNmoUy1a+H+M8+HhHqPd1T2EL8SeipIzd2Znd0rdPw
 039+WUdYWHr/7lePVu8XXSr7Mfr0P81PfKZMvYIaJ1y4M0U+hJQzlT96NPFD3I+MjKOyFYoL
 DyrZfd/zPbmGa1+SRGiK0smPd+z2evo23/73+Or147H9f3YGa+2/vcuXn3viw4QrU3duZnb4
 +zthQYrRmUORzfpsfZHFNzznH3/6Rt//ld1epXMnVqa1WhQ6JvxevkB1i2xydEbHR59P/hf3
 pcVFHWVN8Ql83qUl57eCp+jvr9OzX7xqZdh67sLi0Fd/dczLlsx0YL1UocRSnJFoqMVcVJwI
 AF9DUJ4rAwAA
X-CMS-MailID: 20201104030800epcas2p1b74b02554b9174bfafb7ce21accd65f0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201104030800epcas2p1b74b02554b9174bfafb7ce21accd65f0
References: <CGME20201104030800epcas2p1b74b02554b9174bfafb7ce21accd65f0@epcas2p1.samsung.com>
Cc: 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 lgirdwood@gmail.com, tiwai@suse.com, 'Vinod Koul' <vkoul@kernel.org>,
 hmseo@samsung.com, s47.kang@samsung.com, pilsun.jang@samsung.com,
 tkjung@samsung.com
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

On Mon, 26 Oct 2020 18:01:33 +0100, Takashi Iwai wrote:
>On Mon, 26 Oct 2020 10:18:38 +0100,
>Gyeongtaek Lee wrote:
>> 
>> With a stream with low bitrate, user can't pause or resume the stream
>> near the end of the stream because current ALSA doesn't allow it.
>> If the stream has very low bitrate enough to store whole stream into
>> the buffer, user can't do anything except stop the stream and then
>> restart it from the first because most of applications call draining
>> after sending last frame to the kernel.
>> If pause, resume are allowed during draining, user experience can be
>> enhanced.
>> To prevent malfunction in HW drivers which don't support pause
>> during draining, pause during draining will only work if HW driver
>> enable this feature explicitly by calling
>> snd_compr_use_pause_in_draining().
>> 
>> Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
>> Cc: stable@vger.kernel.org
>
>Could you restart the new thread?  It's been hanging too deeply and
>hard to read through.
>
>Since it's the revised patch, please give the revision number (v2 or
>such) and show what's different from the previous patches.
>
Ok. I'll send the patch again with [PATCH v2] prefix.
>About the changes:
>
>> +/**
>> + * snd_compr_use_pause_in_draining - Allow pause and resume in draining state
>> + * @substream: compress substream to set
>> + *
>> + * Allow pause and resume in draining state.
>> + * Only HW driver supports this transition can call this API.
>> + */
>> +static inline void snd_compr_use_pause_in_draining(
>> +					struct snd_compr_stream *substream)
>> +{
>> +	substream->device->use_pause_in_draining = true;
>> +}
>
>How to set the flag is an open question.  A natural way would be to
>set it somehow at creating the component object, but currently there
>seems no way to pass any flags.
Could you explain more about what is your concerning?
For me, calling snd_compr_use_pause_in_draining() in open() callback of 
snd_compr_ops was good enough.
I've tested it and it worked well on linux 5.4.
>
>
>thanks,
>
>Takashi
>

Gyeongtaek Lee (1):
  ALSA: compress: allow pause and resume during draining

 include/sound/compress_driver.h | 17 +++++++++++++
 sound/core/compress_offload.c   | 44 +++++++++++++++++++++++++++------
 2 files changed, 53 insertions(+), 8 deletions(-)


base-commit: 3cea11cd5e3b00d91caf0b4730194039b45c5891
-- 
2.21.0

