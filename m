Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B2C1974DD
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 09:08:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFAE61658;
	Mon, 30 Mar 2020 09:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFAE61658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585552117;
	bh=P6Ne9Ntzec/rQt8oWnjXH/STkKukGHm0BIAFOJZmAQM=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kmi8KeV8BnpdpA542q1OecB/9Kml3kq0jEXOKWoFxtTJTcfb60PvMDg20Q5mseSwJ
	 v40naq3/Sq762PTJVMzaU6QY8baWeC7YsYZc0P8LONLOo8fVDD2eIoizETcxesuL8m
	 lo4jqm+lYEoWRysErrsa3xs36nYDzI9BANvNdoVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6591F8014A;
	Mon, 30 Mar 2020 09:06:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80C24F8014A; Mon, 30 Mar 2020 09:06:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C70CF80145
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 09:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C70CF80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="BQYFugF3"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200330070643epoutp025cca8a08af00ec6e7b3ac167dd763f65~BAyWMV2G91207712077epoutp02U
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 07:06:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200330070643epoutp025cca8a08af00ec6e7b3ac167dd763f65~BAyWMV2G91207712077epoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585552003;
 bh=C24PRGO0eSaiRHdUnzlskCe9iho3JnxuI6FPfSbKFg0=;
 h=From:To:Cc:Subject:Date:References:From;
 b=BQYFugF3kl7Rrsqwi7YAwy1sa+Sp8VTgamv4gGePl29bOoJd6S/a32cNIZBi5Br5Y
 IyqRZoV7S9BwtFFk+mAUcS8YUKcmAWoYKNO3ZMyKs9SPtC8hfMMIgJDLzSB4DWM0lt
 y6oLCc1dt6fON4CY6LwJHwPX95eHzEfuarWpjUek=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20200330070642epcas2p17c51d7d67e402797d38f699b69651656~BAyVkxV7O0785507855epcas2p1n;
 Mon, 30 Mar 2020 07:06:42 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.190]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 48rNmd5zz4zMqYkd; Mon, 30 Mar
 2020 07:06:41 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 04.5E.04105.D7A918E5; Mon, 30 Mar 2020 16:06:37 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20200330070637epcas2p4952eac2f04b7e3c175390b0488b4340d~BAyQizAZY3068230682epcas2p4w;
 Mon, 30 Mar 2020 07:06:37 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200330070637epsmtrp1f19f1f3ffda541e1e19858f14109fbdd~BAyQiD59X0238402384epsmtrp14;
 Mon, 30 Mar 2020 07:06:37 +0000 (GMT)
X-AuditID: b6c32a47-15bff70000001009-90-5e819a7d6fa6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D8.5C.04158.D7A918E5; Mon, 30 Mar 2020 16:06:37 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200330070637epsmtip1355fef921a4609c84b80bd6b71d037f0~BAyQZ9zFq1162711627epsmtip1y;
 Mon, 30 Mar 2020 07:06:37 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>
Subject: [PATCH 0/1] ASoC: dpcm: allow started or stop during pause for backend
Date: Mon, 30 Mar 2020 16:06:37 +0900
Message-ID: <000801d60661$c1078c20$4316a460$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYGYGUsSZ3VmvjjTMyekSpnsHg/Lw==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+93d3V211XVZHaRo3d6RdrfampXRu4FBRpQmoV30h7O2u7W7
 SRbVLBBnUVYWa2kvysoIl1gqYuQMTcOeJpVlRS9MepfRu827YP99zuP7O78v59Ay1X4qls4R
 HNgu8GaWiiQvNU3Sx23x5qdzzyp1ho7bfsJw4NkLytDXUUgYfN/Oo7mk0fd5O2Ws8z5WGKsq
 3JSxsvoemUymmWebMJ+F7WosZFqzcoTsRDZpRcaCDJ2e08RpEgwzWLXAW3Aiu3BpctziHHNg
 JqvO5c3OQCqZF0V26pzZdqvTgdUmq+hIZLEty2zTaGzxIm8RnUJ2fKbVMlPDcVpdoHOt2VSf
 /x7ZTpMby74WEi5ULytCETQw0+Gst1ZRhCJpFVOLoO9pkUwKPiEoLy8OVfoQeDpfUf8lpf5z
 lFRoQFDceoaUgh4Ev3u75UWIpilmJuzayQYFMcw8+NrsIoMsY0bD81+l/TyEWQ4e93EiyCQz
 Dj519MiDrGQS4GCZi5A4GloPvQhptXDy3FFC4lFQ87Y05EEN31+Wy6VZ8VD/2oeknhg47C7o
 twOMj4JebychCRZCR3ebXOIh8KalWiFxLPTsKVBIgh0I3rX/ChVKELh3qiSeBtVlbUTQJDBj
 4OrD0OcGQWHTb4WUVkJhQaibhQttf0LdAEd8oQeNsO/OF0UxGu0Nc+kNc+kNc+kNc3MMkRVo
 GLaJlmwsam3TwrddhfoPcvKSWnTpxlI/YmjEDlR+qHGlq+R8rphn8SOgZWyMkloWSCmz+LxN
 2G7NsDvNWPQjXWALe2WxQzOtgfMWHBkanVav5xJ0Bp1ea2CHK6uiHqxRMdm8A6/H2Ibt/3UE
 HRHrQrlljU9e5fQsftssIN9q7u+in0lbbo6IL8lvnIXzUkq3Tndc753UWZGUP2aVqenaBvet
 wSmHlnFyS82xH1H3309Jbx/Q8GiFIs7lPBM9cfy3j3WnzH2blfvWnRrXlZa6O+ry2BMXsSd1
 24SR3c+5lkY6Uhh45Yjn7t66HSu7rIPnc0qBJUUTr5kss4v8P20HmYimAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsWy7bCSnG7trMY4g5On5S2uXDzEZDH14RM2
 i29XOpgsNnxfy+jA4rHhcxObx85Zd9k9Nq3qZPNYv+UqSwBLFJdNSmpOZllqkb5dAlfG7sb3
 jAXLWSrmfu1gamDczdzFyMkhIWAiMefQarYuRi4OIYHdjBKLLv+GSkhIfJh/hh3CFpa433KE
 FaLoOaPEk/MTmLoYOTjYBKwkerqVQGpEBFwl7u9tAKtnFlCUePxnDguILSzgL3Hh9FUwm0VA
 VeLTlZesIDavgKXEtLkNTBC2oMTJmU9YIHpNJBoPd0PZ8hLb386BukdB4ufTZawQu/Qkdj/f
 wAhRIyIxu7ONeQKj4Cwko2YhGTULyahZSFoWMLKsYpRMLSjOTc8tNiwwykst1ytOzC0uzUvX
 S87P3cQIDnstrR2MJ07EH2IU4GBU4uH9sL0hTog1say4MvcQowQHs5IIL5s/UIg3JbGyKrUo
 P76oNCe1+BCjNAeLkjivfP6xSCGB9MSS1OzU1ILUIpgsEwenVANjJo+p08/FEZPUZnWG/L3e
 H6+/TrZ51uc/Oi41B27U/SlQqm+oldxXwe48zT0q5J5C1YyZR/5sEUi5Lv+l4/nW3ykffhuX
 XD0iahwe/PiNHWuFh/Wmv677Fm41dBD80rre8MmzyrsX/9wRWD3pZdXrHa/e3jBc6dYv9J53
 58rNz796iX5ydJnCocRSnJFoqMVcVJwIAJXzMf93AgAA
X-CMS-MailID: 20200330070637epcas2p4952eac2f04b7e3c175390b0488b4340d
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200330070637epcas2p4952eac2f04b7e3c175390b0488b4340d
References: <CGME20200330070637epcas2p4952eac2f04b7e3c175390b0488b4340d@epcas2p4.samsung.com>
Cc: alsa-devel@alsa-project.org
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

Hi,

When compress offload is used with DPCM, error can be occurred on
start or stop after pause.
soc_compr_trigger_fe() allows start or stop after pause_push.
In dpcm_be_dai_trigger(), however, only pause_release is allowed
command after pause_push.

Any feedback will be greatly appreciated.



Gyeongtaek Lee (1):
  ASoC: dpcm: allow start or stop during pause for backend

 sound/soc/soc-pcm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)


base-commit: 76ccd234269bd05debdbc12c96eafe62dd9a6180
-- 
2.21.0


