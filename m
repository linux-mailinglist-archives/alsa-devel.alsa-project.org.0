Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 464D437C094
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 16:46:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6395189B;
	Wed, 12 May 2021 16:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6395189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620830799;
	bh=/8papGuCisxVbDRbqvW9Q4TXQOJQATIyddi4FSkU/JM=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kE5VK2rmz9+rNcGp0/olS4E13QZcvx7pzsfTYW4H/BZv5eFhN1eUwWgM2j7Drknwe
	 r5+XrJgoaIjHpVnuYlWsYf/zrdeUkXYa46vPdNjjYMHWiqR+KIem+6pwW7bGj2LMqD
	 eh5hCTgim+HyMECRzDfuohLRhMgEIoLb316fyVV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56FD0F80475;
	Wed, 12 May 2021 16:43:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 903BBF80240; Wed, 12 May 2021 06:44:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72EFFF8013A
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 06:44:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72EFFF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="fzyzWPiG"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210512044446epoutp01fd4630343352409041bb321e41deb8e1~_OC4SwK0f1310513105epoutp01u
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 04:44:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210512044446epoutp01fd4630343352409041bb321e41deb8e1~_OC4SwK0f1310513105epoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1620794686;
 bh=gVG6M0mFSAh/Qb6J2FPn00l9sw90wzwVY0omaape1Lc=;
 h=From:To:Cc:Subject:Date:References:From;
 b=fzyzWPiG15oA8Ituk6Cjquz/7w+h5CdR7nSMOlXQqTi1h0yj/OY+mbokAeDam7O9W
 GLcwaWVFP45rytNRPJ6XUqQxxDRcMpf6E8Hx4HZMUYbAW99735yqLQ7eayPCyaDGrh
 o10Alm5w716BNxjMyLQFa8Bub6qkCiuADT17DzGE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20210512044445epcas2p1b5603dc3107ea0c9591f21638c2ba70b~_OC3tIaF_1532715327epcas2p1D;
 Wed, 12 May 2021 04:44:45 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.187]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Fg2JW3f5Rz4x9Pt; Wed, 12 May
 2021 04:44:43 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 7C.4B.09604.A3D5B906; Wed, 12 May 2021 13:44:42 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20210512044441epcas2p4ad7c01a1dc9048bd96a9973760017d8c~_OC0I2VNI3167031670epcas2p4B;
 Wed, 12 May 2021 04:44:41 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210512044441epsmtrp2ef3881caa72567d071b5309b1f4e3924~_OC0HanEo2755427554epsmtrp2O;
 Wed, 12 May 2021 04:44:41 +0000 (GMT)
X-AuditID: b6c32a45-dc9ff70000002584-87-609b5d3a7452
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 83.A3.08637.93D5B906; Wed, 12 May 2021 13:44:41 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210512044441epsmtip1db3995bf6c355b89093bf237939e3493~_OCz089gy2803128031epsmtip11;
 Wed, 12 May 2021 04:44:41 +0000 (GMT)
From: Chanho Park <chanho61.park@samsung.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: pcm: Need to check whether runtime is valid or not
Date: Wed, 12 May 2021 13:43:23 +0900
Message-Id: <20210512044323.106673-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnk+LIzCtJLcpLzFFi42LZdljTVNcqdnaCwY6v5hZXLh5isri8X9ti
 9aalbBZLJs9ntejc1c9q8ev/MyaLDd/XMlrsvHOC2YHDY8PnJjaPTas62TzmnQz0WPLmEKvH
 vrfL2Dz6tqxi9Fi/5SpLAHtUjk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJe
 Ym6qrZKLT4CuW2YO0FFKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnAJDwwK94sTc
 4tK8dL3k/FwrQwMDI1OgyoScjINrTzMWvGCv+PPjEnMD4wW2LkZODgkBE4nv53YwdTFycQgJ
 7GCU2HzqEjNIQkjgE6PE4UkeEIlvjBIPfj5nhum4d+c6M0RiL6PEkV8dbBDOR0aJvn97WUCq
 2AR0JbY8f8UIYosIOEtM3PsObAczSNGCD3dYQRLCAp4Si1fcAmtgEVCVuDhrHVicV8BeovPm
 PqgD5SVOn7jGCBEXlDg58wlYPTNQvHnrbLAzJAQesUv0bFvDAtHgItG5eBI7hC0s8er4Fihb
 SuLzu71sEA3djBKtj/5DJVYzSnQ2+kDY9hK/pm8BuoIDaIOmxPpd+iCmhICyxJFbUHv5JDoO
 /2WHCPNKdLQJQTSqSxzYPh3qAlmJ7jmfWSFsD4mDZ/4xQoI0VqL3y3XmCYzys5B8MwvJN7MQ
 9i5gZF7FKJZaUJybnlpsVGCIHKubGMEpU8t1B+Pktx/0DjEycTAeYpTgYFYS4Z1bPytBiDcl
 sbIqtSg/vqg0J7X4EKMpMHwnMkuJJucDk3ZeSbyhqZGZmYGlqYWpmZGFkjjvz9S6BCGB9MSS
 1OzU1ILUIpg+Jg5OqQam2f4z5bw93PnKL7MtmXqmRSvbVkCRtcIspIyN5zCX9v7M2p0TNjJ/
 P8u57UK9vHI204qeo2+vvLx5bPEV7ztdsace/Po1kyHGmuni0vBwO6UtykustTefmvb41uOM
 I9qva/eKsGR6MXxYu6MxNPz/5Uus7Xa1ZyQ+au/jie5OKp042za/pETnwNoI5hm5+1+VfTjQ
 JFlfsS3noVem8mWPqDPXd8Xd2BGplfl+2kadZym7lO6cdN60gyk6+/fOExX/XqhYbzmUmZIY
 tFrcqiCjxUNbTyZpwrn1pfdkC5osrBe+XWIa8iaogzvpQOEn16AeF0E++44fi2rvyJ8/9OmE
 05qPYYwvmC9mmH2cntOoxFKckWioxVxUnAgAdnXociIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLLMWRmVeSWpSXmKPExsWy7bCSnK5l7OwEg4af+hZXLh5isri8X9ti
 9aalbBZLJs9ntejc1c9q8ev/MyaLDd/XMlrsvHOC2YHDY8PnJjaPTas62TzmnQz0WPLmEKvH
 vrfL2Dz6tqxi9Fi/5SpLAHsUl01Kak5mWWqRvl0CV8bBtacZC16wV/z5cYm5gfECWxcjJ4eE
 gInEvTvXmbsYuTiEBHYzSpy/v5wZIiEr8ezdDnYIW1jifssRVoii94wSn7r+gCXYBHQltjx/
 xQhiiwi4Sly9dxvMZhb4yigxd605iC0s4CmxeMUtFhCbRUBV4uKsdawgNq+AvUTnzX1QV8hL
 nD5xjREiLihxcuYTFog58hLNW2czT2Dkm4UkNQtJagEj0ypGydSC4tz03GLDAsO81HK94sTc
 4tK8dL3k/NxNjOAQ1tLcwbh91Qe9Q4xMHIyHGCU4mJVEeOfWz0oQ4k1JrKxKLcqPLyrNSS0+
 xCjNwaIkznuh62S8kEB6YklqdmpqQWoRTJaJg1Oqgano3hKHl8n91y1V/0wyc5V3Un+bqjon
 8bzNz42n1M9snihhe+VY1L2oyf8me6ccvyBesOVEiTNX9t89+9Yoml5d5DLJdrXk7POrJiWL
 TW3hy/Fmal/L5h+++MWeLR973YrrfplrPal05HjjP9Og8rPj1pI7k7dscux6fUZdSqhfVOz4
 G7O/KdHPVp15LLl1ZT3bKa1VGZ2PnVyiY57EHGx2ivr3f6KxmF7T53yWVq57nv4vZzI2H937
 77lWv9/tDxZ7F1wpucO947FH6opi6Zu8Upxuks/CbcKLNq/0ru4Va7+rFjpbNeN7q8QdJb+L
 9mXPo4N1F7z+X+WzIeP8lE1eXt1uDc5pO15pz2sP3KjEUpyRaKjFXFScCADXOZJG0AIAAA==
X-CMS-MailID: 20210512044441epcas2p4ad7c01a1dc9048bd96a9973760017d8c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210512044441epcas2p4ad7c01a1dc9048bd96a9973760017d8c
References: <CGME20210512044441epcas2p4ad7c01a1dc9048bd96a9973760017d8c@epcas2p4.samsung.com>
X-Mailman-Approved-At: Wed, 12 May 2021 16:43:39 +0200
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 eunwoo kim <ew.kim@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Chanho Park <chanho61.park@samsung.com>
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

From: eunwoo kim <ew.kim@samsung.com>

Since snd_pcm_ioctl_sw_params_compat has no runtime variable check,
if application call the ioctl after close, it can make kernel crash.
So, snd_pcm_ioctl_sw_params_compat needs to check the runtime variable
at the beginning of the function.

Signed-off-by: eunwoo kim <ew.kim@samsung.com>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 sound/core/pcm_compat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index 590a46a9e78d..ff0de4252ff4 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -90,6 +90,9 @@ static int snd_pcm_ioctl_sw_params_compat(struct snd_pcm_substream *substream,
 	snd_pcm_uframes_t boundary;
 	int err;
 
+	if (!substream->runtime)
+		return -ENOTTY;
+
 	memset(&params, 0, sizeof(params));
 	if (get_user(params.tstamp_mode, &src->tstamp_mode) ||
 	    get_user(params.period_step, &src->period_step) ||
-- 
2.31.1

