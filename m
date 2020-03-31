Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A739B198DC9
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 09:57:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25DC71666;
	Tue, 31 Mar 2020 09:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25DC71666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585641436;
	bh=jXkYY3Umz7UF+DKUUJ0/Vs05XTITxgBb79TYZCkgxkU=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tCr8EhtfaBu40eN7ACH746h00JQVol0viCdVCf5xD9fn4R4n8Kmf31ufQaYcfgCBn
	 DKfWyqjCNQX2iLnGLLp6IM5Zc5H68tjfFmMXymRU/hOChYmo+/6hLOePccp9t/l5kS
	 rO8/fOErCBJ57y8WTaaJ57cX2lAyFNVFiNVlirWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36D71F8010D;
	Tue, 31 Mar 2020 09:55:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F351F80146; Tue, 31 Mar 2020 09:55:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE88DF8010D
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 09:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE88DF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="RkfWgJ0A"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200331075518epoutp0231922dd54b94bec9d699a77760a3ca4d~BVGDek7dn1352313523epoutp02-
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 07:55:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200331075518epoutp0231922dd54b94bec9d699a77760a3ca4d~BVGDek7dn1352313523epoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585641318;
 bh=kqzG/GxEc6cKAxc3tVH2MwPtpQSbdsJG6E7MfSuBp5w=;
 h=From:To:Cc:Subject:Date:References:From;
 b=RkfWgJ0A+nu9gP1CSbKm8vrNIeg6NftsG820bu2ED6LQQk4XAhgzVRcgohyCQtqJu
 RYA1HG7cfAUBt+si/YkyY9eYkWAmfEMgglcj+h9JqagveryD3VTxfi0ZNqC7P+TTcV
 Ez06ijJ8lwBe1LV3l6P5Ff2TOOKyrhotiKH/ZgD4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20200331075518epcas2p2e7006bfefac465461a1abe2774e9e2cb~BVGDNr1Jt0643506435epcas2p2d;
 Tue, 31 Mar 2020 07:55:18 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.186]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 48s1pF29wJzMqYkV; Tue, 31 Mar
 2020 07:55:17 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 2F.0F.04024.467F28E5; Tue, 31 Mar 2020 16:55:16 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20200331075516epcas2p354433b07d679bb24f86b67369ea77259~BVGBL38Kh0159101591epcas2p37;
 Tue, 31 Mar 2020 07:55:16 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200331075516epsmtrp1835a7a60dba2a4684a7767bd4a646e43~BVGBLIx-H1932219322epsmtrp1G;
 Tue, 31 Mar 2020 07:55:16 +0000 (GMT)
X-AuditID: b6c32a48-5a9ff70000000fb8-9d-5e82f76433cc
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 C4.9A.04024.467F28E5; Tue, 31 Mar 2020 16:55:16 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200331075516epsmtip2c87b85302474ec7674c0aa20470650ca~BVGA8Yqbk0750407504epsmtip24;
 Tue, 31 Mar 2020 07:55:16 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: "'Lars-Peter Clausen'" <lars@metafoo.de>, <broonie@kernel.org>
Subject: [PATCH v2 1/3] ASoC: dapm: connect virtual mux with default value
Date: Tue, 31 Mar 2020 16:55:16 +0900
Message-ID: <01a301d60731$b724ea10$256ebe30$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AdYHMFUJ7rRwvOBtSgGSkgZVB+6O2A==
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUwTYRD1291uF7VmraATNFrXaIIIttXiloAnmkZRSfxhvKgbumkbe6zd
 gleMRQ3hEPGARKsCCXgEgwJBRKNBC0ZFVFTQaKJBRUXjfZRAvLpuTfrvzZs338z7ZihcfZaM
 pewuL+9xcQ6GHEo0tcYZEiz9OzO1T15PYbvuBTC27HkvyR5qKiLY6oMVCjbYlY+x1+5VYWxd
 fy1i23JLsbmUqe7bTtJ0wf9UaWqoKSBN1e8DCtPexhpkOtvYTWSQqx0pNp6z8B4N78pyW+wu
 ayqzZIV5gdmQpNUl6IzsLEbj4px8KpOWnpGwyO4ITcRocjhHdojK4ESRmT47xePO9vIam1v0
 pjK8YHEIOp2QKHJOMdtlTcxyO5N1Wq3eEFKud9gqLx7EhZaozQ/6PhE+1KosRFEU0DOhuP6Z
 ohANpdR0M4KvnUFSDr4i8HX2hIMggvIHPlSIqH8lzQ81Mn8ZQeXdO2HRWwQfLx7CJRFJJ8Oe
 IkZqEU3Phz1vypGkwekDCM7l9iEpMYpeDINluzAJE/RkqC14gUm1KtoIL8/ESbSKHgk3D/cS
 EsZpPVSfrsBkPAHOfziKyxY0MPDqhELmo+FIQR4u902EA8UdhNQX6JckdJd1kLKBNPh9KUOu
 HQXvrjeGvyIW3pbkKWX9rpCX2z/DiVIEBUVqGc+AxmPtmPzOJGh7Ep5tBOS3/lLKtAry88Jq
 Burbf4fVAOV14QdN0NOZS+5DE/0RJv0RJv0RJv0RxioRUYNG84LotPKiXpgZuesG9O9Yp5qa
 0ZU76QFEU4gZrurpzs1UK7gccYszgIDCmWgVudyXqVZZuC1beY/b7Ml28GIAGUI72I/HxmS5
 Q6fv8pp1Bn1SktZoYA1JepYZo2oY9nitmrZyXn4Dzwu8538dRkXF+pC1q233yVLj5Ku19nHd
 +2L6nfErjVWDrzDh1I80c3FwjN5W8mjV1R330ed5ypy44wO9C8sGviy78X3suo31GwViO3a6
 WTU/Z3zLYeKW9sOQbcE/5waTswZv3ZjTgWlSpo2Ln9QzULGJiJmyZnPJifpj9g3TuL5Ly+8T
 w7gUY/BU+9IWhhBtnG4q7hG5v8fh633CAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgkeLIzCtJLcpLzFFi42LZdlhJXjfle1OcwYnX/BZXLh5ispj68Amb
 xYxt3SwWSybPZ7X4dqWDyeLoxcVMFhu+r2W0ONI4hcmBw2PD5yY2j52z7rJ7bFrVyeax5M0h
 Vo++LasYPdZvucoSwBbFZZOSmpNZllqkb5fAlbFg12Tmgv2cFZdfvGdpYDzM3sXIwSEhYCKx
 45pCFyMXh5DAbkaJ05Nb2LoYOYHiEhIf5p9hh7CFJe63HGGFKHrOKDHxRA8jSDObgJVET7cS
 SI2IgIvE00lrweqZBWYxSpxtkQOxhQW8JH5NbWYCsVkEVCXWdj5iAmnlFbCUeLxOEyTMKyAo
 cXLmExaIVhOJxsPdULa8xPa3c5ghTlCQ+Pl0GStEXERidmcbM8RaPYlJvWdYJjAKzkIyahaS
 UbOQjJqFpH0BI8sqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzgeNHS3MF4eUn8IUYB
 DkYlHt4HVxvjhFgTy4orcw8xSnAwK4nwsvk3xAnxpiRWVqUW5ccXleakFh9ilOZgURLnfZp3
 LFJIID2xJDU7NbUgtQgmy8TBKdXA2OLc2xJ1lGOi/PWlu0wam9QKIi/7rJv4lmPVdf9L1mXp
 93r2aJ8VU1rV+n279dnlPGqhudNOupqf2KfIxcv09GfmlqnFC6RT1Y87dTr5s3P+0f3s533w
 Chdji84n/hbz7/Oemv0qmfnsRMi/2uaCmD17TLgiHtYL+m3dVXjZtmiDdPVviY4ZSizFGYmG
 WsxFxYkApMIAqpMCAAA=
X-CMS-MailID: 20200331075516epcas2p354433b07d679bb24f86b67369ea77259
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200331075516epcas2p354433b07d679bb24f86b67369ea77259
References: <CGME20200331075516epcas2p354433b07d679bb24f86b67369ea77259@epcas2p3.samsung.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 hmseo@samsung.com, tkjung@samsung.com, pilsun.jang@samsung.com
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

Since a virtual mixer has no backing registers
to decide which path to connect,
it will try to match with initial state.
This is to ensure that the default mixer choice will be
correctly powered up during initialization.
Invert flag is used to select initial state of the virtual switch.
Since actual hardware can't be disconnected by virtual switch,
connected is better choice as initial state in many cases.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 sound/soc/soc-dapm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 9fb54e6fe254..17962564866d 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -802,7 +802,13 @@ static void dapm_set_mixer_path_status(struct snd_soc_dapm_path *p, int i,
 			val = max - val;
 		p->connect = !!val;
 	} else {
-		p->connect = 0;
+		/* since a virtual mixer has no backing registers to
+		 * decide which path to connect, it will try to match
+		 * with initial state.  This is to ensure
+		 * that the default mixer choice will be
+		 * correctly powered up during initialization.
+		 */
+		p->connect = invert;
 	}
 }
 
-- 
2.21.0


