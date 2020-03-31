Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA1B198C93
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 08:53:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A6111673;
	Tue, 31 Mar 2020 08:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A6111673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585637606;
	bh=Kq9Hw5ZG3ufm5ozfL7lQimBN1/pP1TJx6p5BvWuEYXs=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dz7X+n71FBOHDO5NKhG3FZoh1/qOqWivAA8nMooJjvNqS+AlxkHEETbjCZYC1p0sr
	 26LOgeeYFxKNSAZi7KqsZ1ueWRrPfmXvtDhtsxwI4sms8R4GlbhKFUMzjeU01XZIot
	 D8Af3W4ha564RxdAZNc9pOtvIgNqEXIhNwByM8IQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC573F80157;
	Tue, 31 Mar 2020 08:51:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D106F801F2; Tue, 31 Mar 2020 08:51:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E77AAF80140
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 08:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E77AAF80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="QAUmn13w"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200331065051epoutp0470df26c52cafc9a1d80e0bc35f6e6d27~BUNyDT9gN0608606086epoutp04h
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 06:50:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200331065051epoutp0470df26c52cafc9a1d80e0bc35f6e6d27~BUNyDT9gN0608606086epoutp04h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585637451;
 bh=QkVhoe/r4nScAk73kbyEkoWJBzwgsM68Y5qesHFN6ys=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=QAUmn13wX6mWkjye2aBFWumGD/zUXYfyca46uGbVLDkH351zW2LPXgFHcyg3G/8oK
 2acBdwgYcpcQ6RLX58XPm7DdONIPZIwGwKg+tsAgDOFskk+JAvNT5z2lsegEX7AaEl
 uP+LsBfY7sicsxXDAXybuvF2nG7G5Ykz2Bk9Vxfo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20200331065045epcas2p1a92d0c7292097b8e7fe4c29b3560b246~BUNscqsf60802708027epcas2p1N;
 Tue, 31 Mar 2020 06:50:45 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.188]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 48s0Mm4nN1zMqYly; Tue, 31 Mar
 2020 06:50:44 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 26.4D.04142.348E28E5; Tue, 31 Mar 2020 15:50:44 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20200331065039epcas2p44ff6042af85c92150e52e576251a6465~BUNm21SpV0114901149epcas2p4Y;
 Tue, 31 Mar 2020 06:50:39 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200331065039epsmtrp22ab12a8fc95656ce11a822243bbf759c~BUNm1CSzR0892508925epsmtrp2f;
 Tue, 31 Mar 2020 06:50:39 +0000 (GMT)
X-AuditID: b6c32a46-3f9ff7000000102e-dc-5e82e8437e1e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 39.F6.04158.F38E28E5; Tue, 31 Mar 2020 15:50:39 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200331065039epsmtip1683cb81807772187650c83a8875576e0~BUNmqmbCx1390913909epsmtip1J;
 Tue, 31 Mar 2020 06:50:39 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <broonie@kernel.org>
In-Reply-To: 
Subject: [PATCH 1/3] ASoC: dapm: connect virtual mux with default value
Date: Tue, 31 Mar 2020 15:50:39 +0900
Message-ID: <012601d60728$b090bc50$11b234f0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQHT5UBTKtX+5pznRWgpVI/NXVAXlgFfQZWpqFt1jmCAABUx8A==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+Xa2s6M1O02rlyU5ThdQmG2rraNphYkusjRECwnnQU8q7sbO
 tAtFXqi8RFqZ5Lx01UwJTYbZRaFpVlqSoWRFd7tCBk2MbtLmWbD/nvf9ngd+z/d9BCZtxmVE
 rsnGWk2MgcL9hV19oRpF7KfidOXd7fToiFNAn3ozgdOnuyqE9PRoqYC+M3JBQHf8uILo/qJq
 wQaxrsNVjOuu21+IdZ2tZbjumKMV6dodY8IkUZohKodlslirnDVlmrNyTdnR1OZk/Ua9RqtU
 KVQR9BpKbmKMbDQVm5CkiMs1uDEoeQFjyHevkhiOo1aui7Ka822sPMfM2aIp1pJlsKhUlnCO
 MXL5puzwTLMxUqVUqjVuZ4YhZ8g1iSzXiD0NfwdQIRrEy5EfAeRq+P37CCpH/oSU7EbQVT8k
 5IfvCD5/tYv4YRpBw9QH4f/I5ONpb6QHQWXzI4wfPiNwTVx2uwgCJyPhaAXlCQSRAFM37gk8
 How8gaDt00fk8fiREqiaWevxBJLxMFrSMsskJJfDkbFfyKMlZAQU1/aKeD0f7tdOzEJgpBou
 tp0R8DoErn2tx3g4Ofx83yzi90FQV3YY4xlioLHSMQsN5DccBs/VifhALNQMnEe8DoQvdx1i
 XsvANdmD84ESBJMP/3gPqhGUVUh5vQocDYMCTxkgl0L/My9cAJT2/RXzawmUHva6Kbg6OON1
 AzR2iKsQZfdpZvdpZvdpZvdpcxYJW9FC1sIZs1lObVH7vnYnmv2jYXHd6OJwghORBKLmSl6P
 FaVLRUwBt9foREBgVJAETyxMl0qymL37WKtZb803sJwTadw3fxyTLcg0u3+8yaZXadRarTJC
 Q2u0appaJOmc83SnlMxmbGwey1pY6/+cgPCTFaLyyMWN8QW3+4JtKfVbXug3JSYmB1tTXl2q
 3t8UdaDpVFrak5ruBy/JJftHP4QUNtmaFWXjovH+qOFbaOZqQETj1rwd9q1xMaknFdu091MH
 ZLtWrK9J2H3mbYaztved5uDw1McpRXRb4rJD1zv8n5+/2VIa5sww6tt3RiaEFs1z2b/FUkIu
 h1GFYVaO+QfZKjxTuQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsWy7bCSnK79i6Y4g+7l2hZXLh5ispj68Amb
 xYxt3SwW3650MFkcvbiYyWLD97WMFkcapzA5sHts+NzE5rFz1l12j02rOtk8+rasYvRYv+Uq
 SwBrFJdNSmpOZllqkb5dAlfG6c/vGAu2c1TM/XuMsYHxFFsXIyeHhICJxLtL3xi7GLk4hAR2
 M0ps3NPOApGQkPgw/ww7hC0scb/lCCtE0XNGiYZTJ4E6ODjYBKwkerqVQGpEgOq/7DrBBFLD
 LDCLUeLVnNmsIAkhgR5GicarTiD1nAK8EhP+WYOEhQXcJa40rwA7gkVAVaL96i9GEJtXwFKi
 aeY+VghbUOLkzCdg9zADHdp4uBvKlpfY/nYOM8RtChI/ny5jhYiLSMzubGOGuMdJYl7/FsYJ
 jMKzkIyahWTULCSjZiFpX8DIsopRMrWgODc9t9iwwCgvtVyvODG3uDQvXS85P3cTIzietLR2
 MJ44EX+IUYCDUYmH98HVxjgh1sSy4srcQ4wSHMxKIrxs/g1xQrwpiZVVqUX58UWlOanFhxil
 OViUxHnl849FCgmkJ5akZqemFqQWwWSZODilGhj5nwZvTzrS/cdw33dn31OB1xk1DPgSZ8x9
 e7cthTf8+qGSDWITf88WNdxt8H9WWrfq0bvzpsUF3zeWNHC+vLrx37bzOgsvMz+ZkPDzQ/tu
 93UOUxJM58gl7VzBrn/i5cs/S/4rTYkP3Hc/5Ob/lKwCnm7v+uoaHQHHyRdVtS5wr6pSOWvx
 Z0m6EktxRqKhFnNRcSIAeSTAh6MCAAA=
X-CMS-MailID: 20200331065039epcas2p44ff6042af85c92150e52e576251a6465
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200330073548epcas2p3045be9d3c8b76115c76ce27679840b6f
References: <CGME20200330073548epcas2p3045be9d3c8b76115c76ce27679840b6f@epcas2p3.samsung.com>
 <000e01d60665$d48444b0$7d8cce10$@samsung.com> 
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

Since a virtual mixer has no backing registers to decide which path to connect, it will try to match with initial value 0.
This is to ensure that the default mixer choice will be correctly powered up during initialization.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 sound/soc/soc-dapm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c index 9fb54e6fe254..fc55a0534252 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -802,7 +802,16 @@ static void dapm_set_mixer_path_status(struct snd_soc_dapm_path *p, int i,
 			val = max - val;
 		p->connect = !!val;
 	} else {
-		p->connect = 0;
+		/* since a virtual mixer has no backing registers to
+		 * decide which path to connect, it will try to match
+		 * with initial value 0.  This is to ensure
+		 * that the default mixer choice will be
+		 * correctly powered up during initialization.
+		 */
+		val = 0;
+		if (invert)
+			val = max - val;
+		p->connect = !!val;
 	}
 }
 
--
2.21.0



