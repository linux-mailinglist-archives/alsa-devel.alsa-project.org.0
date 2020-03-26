Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C23E193B46
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 09:47:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D21D31668;
	Thu, 26 Mar 2020 09:47:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D21D31668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585212474;
	bh=RVB8r6lIe+puhirTCUt9f2xTPDt64vuhn3LXehl9Xuc=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dC5eFP2NIOLXQggWTpelmVgezhGCd+ISRWbnRxz0Z+wAXtqszYRQySQF1dudbUafl
	 xHp/GQ9SGz/ZIVBO5ZOgPnEpddzUnWJ2HSv73A1cs+HLe9/JDiHQVR+cw9Ss4/O0tj
	 R/rkKPFA20QqekiXxJrL0NlUxlz3XVobDkuVD5+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5F72F80234;
	Thu, 26 Mar 2020 09:46:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8EC0F80227; Thu, 26 Mar 2020 09:46:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE81AF8011B
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 09:46:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE81AF8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="kpsU+8Hz"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200326084600epoutp043cc8b32f8d384631bb10c5ce0ebf9ad7~-zj5TIC_l1815618156epoutp04T
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 08:46:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200326084600epoutp043cc8b32f8d384631bb10c5ce0ebf9ad7~-zj5TIC_l1815618156epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585212360;
 bh=BzXb8C00im1dvwzOywZJE0zECG+Ph30++vBqK5T/MVQ=;
 h=From:To:Cc:Subject:Date:References:From;
 b=kpsU+8HzJkQxGhZhusTZppq525KnyJu0a0vjgW7yzzttndTarJtv05aXPQpTn8gQa
 lJVnFul3ul2KwMIiE5ujzWpmo735tM1rfNEjVWkCKBg+yEvPJBo2NCN65ry4wl2McP
 kdu/dYCwmbA8/y4eZqpsUqR0yndzNkrhRwOBAiuw=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20200326084600epcas2p415dd3a325726adc1bb5ce26cda33b3d0~-zj48uQKU1891918919epcas2p4b;
 Thu, 26 Mar 2020 08:46:00 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.185]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48nz930MP0zMqYkx; Thu, 26 Mar
 2020 08:45:59 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 91.91.04105.5CB6C7E5; Thu, 26 Mar 2020 17:45:57 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20200326084556epcas2p43870d47530ef1381e52e2ca85d196298~-zj1R6FG_1891918919epcas2p4W;
 Thu, 26 Mar 2020 08:45:56 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200326084556epsmtrp2cf960a8f21bb656c3bb43ecc3e940369~-zj1RDUND2800228002epsmtrp2d;
 Thu, 26 Mar 2020 08:45:56 +0000 (GMT)
X-AuditID: b6c32a47-173ff70000001009-ee-5e7c6bc5fd3e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 23.74.04024.4CB6C7E5; Thu, 26 Mar 2020 17:45:56 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200326084556epsmtip170aec3a2c9fea2249b2f7aebee32dce1~-zj1KAYD51856218562epsmtip1K;
 Thu, 26 Mar 2020 08:45:56 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>
Subject: [PATCH 0/1] ASoC: soc-compress: lock pcm_mutex to resolve lockdep
 error
Date: Thu, 26 Mar 2020 17:45:55 +0900
Message-ID: <000001d6034a$f7458540$e5d08fc0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYDRPHUoYNwKO+GQXuXdl19rDmHIg==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRTut93dXR+L29I8CdG8FvRA22bTTVKMrEYGjaI/euC6uIuK293Y
 naHVH8vIfITl6w+XZmUPsCKzZYq9mFlm79DUoEIyyCJLRS2Z2ua9wv77zjnfd875OIcQyyvw
 SCKbdTB2ljZTeDDW0rFWG9OZcyxdOd0co+155xFpqweHcO1kT5FI2zR1E6Vg+qbxAlzf5vok
 1Tc3FuP6W+5ezIDtN2/KYmgTY1cwbIbVlM1mJlFpe4xbjJp4pSpGpdMmUAqWtjBJVOpOQ8y2
 bLNvJqU4TJtzfSkDzXHUhuRNdmuug1FkWTlHEsXYTGabSmWL5WgLl8tmxmZYLYkqpVKt8TEP
 mbN+nXgksXXgeW13ajAnapOUoCACyI3w9sV1vAQFE3KyFUH/lTEpH4whOHmqX8QHkwiqe59K
 FyRdj4ckfOEBgsGKyvlecnIYwexESgkiCJxMhNOllD8dRm6GiadOzI/FZBR89dbO46Xkbnh/
 54/IjzFyNbQ0OJEfy0gdjDdOCXgJPK8ZErRquHy9XsTjlXDvV62Y30cB/75dlfCzYqGzukzK
 c8LgXHGh2L8nkDdwKBnuFASpUDn9EuPxUvjxzC0Yi4TxkQc4LziBYOSVVyhUISgulfM4Dtx1
 3SK/SSCj4clHYbnFUNQxI+XTMigqFNgU3O6eFdgA55uEhnrw1rnRWRTlCnDpCnDpCnDpCnBz
 AWGNaBlj4yyZDKe2xQUeuxnN/+O67a2o5fVODyIJRIXKmnRH0+US+jCXb/EgIMRUmOzbvmPp
 cpmJzj/C2K1Ge66Z4TxI47tCuTgyPMPq+27WYVRp1PHxSp1Gq4lXa6kIWXPIwEE5mUk7mByG
 sTH2BZ2ICIp0ooiEaHZxX4N+jXJob0gyXLtKJPaYyh6vShvN/h4cOvOz/+J+68O86LIdA1Vn
 +nEIWnM3okda2D6+4kOIu33XBt2iR1vvdzk9SuPoQNsB7/fyhFqnYe7vw+S5osnj6pnygpd/
 t4XjHjFd3OroK1y+/vfn4Oo3ii+XRmYmNXXuG4n1FMZl0ap1YjtH/weaTIxwpQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsWy7bCSnO6R7Jo4g91PlCyuXDzEZDH14RM2
 i29XOpgsNnxfy+jA4rHhcxObx85Zd9k9Nq3qZPNYv+UqSwBLFJdNSmpOZllqkb5dAlfG2+b9
 rAWH2Sp2bp7J0sC4k7WLkZNDQsBE4sSBJ0A2F4eQwG5GiVe3G6ASEhIf5p9hh7CFJe63HIEq
 es4ocatpHVMXIwcHm4CVRE+3EkiNiICrxP29DWD1zAKKEo//zGEBsYUFAiR6Fn1mBLFZBFQl
 ti1uALN5BSwlPq/6DmULSpyc+YQFotdEovFwN5QtL7H97RxmiBsUJH4+XcYKsUtP4ujUPqhd
 IhKzO9uYJzAKzkIyahaSUbOQjJqFpGUBI8sqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS95Pzc
 TYzgsNfS3MF4eUn8IUYBDkYlHt4NltVxQqyJZcWVuYcYJTiYlUR4n0bWxAnxpiRWVqUW5ccX
 leakFh9ilOZgURLnfZp3LFJIID2xJDU7NbUgtQgmy8TBKdXAqHypL+bWd+2jAbIRfFqPnqUe
 0byztY9Ha3OhdnKgh8tXdu9trpx7+Yx+Tk33WeQiZNmwaIUlD9uXRed4Q88HMHgzbfm2W+F6
 PDtr7JeOYwJ6NxTOe/3X6gj/ZnfVun1Z9MsTaSrpa1+du8Pz9OCpIiOGk22zwgUNPXbxM35h
 YH3GumxdtVmEEktxRqKhFnNRcSIAThad+ncCAAA=
X-CMS-MailID: 20200326084556epcas2p43870d47530ef1381e52e2ca85d196298
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200326084556epcas2p43870d47530ef1381e52e2ca85d196298
References: <CGME20200326084556epcas2p43870d47530ef1381e52e2ca85d196298@epcas2p4.samsung.com>
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

I'd like to send a patch to fix a problem using soc-compress with DPCM.
soc_compr_open_fe() and soc_compr_free_fe() call snd_soc_runtime_activate()
and snd_soc_runtime_deactivate() but don't lock card->pcm_mutex.
It can cause lockdep error, because snd_soc_runtime_activate/deactivate()
checks whether pcm_mutex is held using lockdep_assert_held().
I'd like to send a patch which adds mutex_lock/unlock()
before and after of the snd_soc_runtime_activate/deactivate() call.
If there is anything should be changed in my patch or email,
please let me know it.
I'll really appreciate it.

Gyeongtaek Lee (1):
  ASoC: soc-compress: lock pcm_mutex to resolve lockdep error

 sound/soc/soc-compress.c | 4 ++++
 1 file changed, 4 insertions(+)


base-commit: 76ccd234269bd05debdbc12c96eafe62dd9a6180
-- 
2.21.0


