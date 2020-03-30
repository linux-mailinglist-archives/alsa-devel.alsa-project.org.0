Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7111975D3
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 09:37:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54F64166D;
	Mon, 30 Mar 2020 09:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54F64166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585553830;
	bh=3c2k8bENq3mmuPPhJl0hBubHaLBFjokI2prnqp6hg4k=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Sdvq4WQXjke6jn2HTAHISTgUWv7MKETkyUSfznr5qe0GG8zIy+egqyQCbeIkYGmTK
	 mLQBbhEAFV+OtA+WZX7Z8LD1img5eO2CTq43hgpKp9KhPBJwlb7fryMbS4YilzU/No
	 aY8T+zLShaE46Lr5z3kQq0eH3k+h3aGhQ+uo/TCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C037F8014A;
	Mon, 30 Mar 2020 09:35:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44A44F80148; Mon, 30 Mar 2020 09:35:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67930F800AA
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 09:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67930F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="vBYD9mhO"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200330073517epoutp04298e8084588ade4d6c18642d28d3574e~BBLSErk0q0558005580epoutp04K
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 07:35:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200330073517epoutp04298e8084588ade4d6c18642d28d3574e~BBLSErk0q0558005580epoutp04K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585553717;
 bh=SszRmXux7IRugv5j0/sOCKNLwMsdhf5W39E+comTlSE=;
 h=From:To:Cc:Subject:Date:References:From;
 b=vBYD9mhOx7aKM1wKYvV3Yy3VMSBIfbNn/NA9Hf1tBCkH338kpqgnfW/DgxqTHYJxh
 wp8HVo8ChOQH2tBBmG4O5TuTQR+1aR+wKnLzm7YKuV7xm/QIyx/hJN2BsRaepPvrog
 a5NBulDxCwL+6JhEsZHIxoJITBJDFygYCoe1D3+c=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20200330073516epcas2p43144ccced2855f49b391d72c3969a906~BBLRdiYYT1761517615epcas2p4S;
 Mon, 30 Mar 2020 07:35:16 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.185]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 48rPPZ4XwbzMqYm0; Mon, 30 Mar
 2020 07:35:14 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 52.A5.04142.031A18E5; Mon, 30 Mar 2020 16:35:12 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20200330073511epcas2p2dd0a6e9dca67734192f0d55b86104cbb~BBLM0DRZj1942719427epcas2p2r;
 Mon, 30 Mar 2020 07:35:11 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200330073511epsmtrp21d8a9701cfa4926aa30b8759d3741397~BBLMylNVg0961209612epsmtrp28;
 Mon, 30 Mar 2020 07:35:11 +0000 (GMT)
X-AuditID: b6c32a46-3f9ff7000000102e-e0-5e81a130f545
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 16.CC.04024.F21A18E5; Mon, 30 Mar 2020 16:35:11 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200330073511epsmtip2ddc7aba5024782e3ec56480927a61f38~BBLMlAGNt2051720517epsmtip2h;
 Mon, 30 Mar 2020 07:35:11 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>
Subject: [PATCH 0/3] fixes for topology
Date: Mon, 30 Mar 2020 16:35:11 +0900
Message-ID: <000d01d60665$be93a920$3bbafb60$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYGYvyrH0qwNT3RQHyuZlUsr//4ow==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHe3fOzo7W7LSsnvyQ85hFgbbNZmeh0kVkoZhRFIWoBz04cTfO
 2SyLYhWYNyK72tKulmVUU6y0G7ZJkpAZaHmhD6J+KNFCuxgsa+6s2Lff+7z///u8f56HxBTV
 RARZaLZxvJk10kQo/sizZkOs6trRbFXnOMX0vnNLmHPDowTzo7dMwrh+3kObcL1r+hihb3N+
 lOmbG8sJ/YOWPjwT32dMNHBsPscrOXOeJb/QXJBEp+3M2ZqjTVCpY9U6ZgOtNLMmLolOSc+M
 TS00+nrSymLWaPeVMllBoNclJ/IWu41TGiyCLYnmrPlGq1ptjRNYk2A3F8TlWUwb1SqVRutT
 5hoN3+q+IGszfuC6h3egR1gFCiGBWg9f208TFSiUVFCtCF5OfUXiYQqBo9GNiYcfCJ48vfbf
 cqfH62cF9RzBzIRNFH1C4Lxw1XdBkgS1Eaoq6TlNOLUZvr9y4HOMUVEw4q3182JqNZyoGSLm
 GKdiYGbqk5/llA4aHe9lIi+C1xdHA14N1N+9IhE5Eh5P1Ab+o4RfY7ekYq84uD/eFdCHw6Xy
 Un8AoFwE9Pe14aIhBRoGhpDIi+FzZ4tM5AiYnnxOiIbjCCbfeAMXZxGUVypEjoeWui7JXEig
 oqFjMNAsDMo8v2ViWQ5lpQE1DU1dswE1wGVX4EE9eNynpKdQlDMopTMopTMopTMozVWEN6Kl
 nFUwFXCCxqoJnnUz8q/j2tRWVN+d7kYUiegF8pqHjmyFlC0WSkxuBCRGh8uJ7b6SPJ8tOcjx
 lhzebuQEN9L6plCNRSzJs/iW22zLUWs1CQkqnZbRJmgYepm8ef5AloIqYG1cEcdZOf6fT0KG
 RDhQ2q7ohowMo/rwiv2zE6nLj+w+WmeRFoeTGeSZky8mtzHnhxd26eJdUZ52h8mbtfLDqtZZ
 wxZb//74G2di9uT27pVtbcrLfbWDHXMs/dPdM/jW1tZhP5ievOfmvC/M+qbSQ6Ep0wtSbz/z
 ap6F3aspWp55HOv7NjJeFRsSs4qPfIrxNC4YWPVajBfYv49Rjp6kAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWy7bCSvK7+wsY4g/mzJC2uXDzEZDH14RM2
 i29XOpgsNnxfy+jA4rHhcxObx85Zd9k9Nq3qZPNYv+UqSwBLFJdNSmpOZllqkb5dAlfGl7nv
 GQs2sVQsOlzUwLiNuYuRk0NCwERi5YU/QDYXh5DAbkaJizNWMkEkJCQ+zD/DDmELS9xvOcIK
 UfScUWLHtBMsXYwcHGwCVhI93UogNSICrhL39zaA1TMLKEo8/jOHBcQWFlCXaJ9xmw3EZhFQ
 lfjx6SWYzStgKbGq4Ro7hC0ocXLmExaIXhOJxsPdULa8xPa3c6AOVZD4+XQZK8QuPYl1r09B
 1YhIzO5sY57AKDgLyahZSEbNQjJqFpKWBYwsqxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLz
 czcxgoNeS3MH4+Ul8YcYBTgYlXh4P2xviBNiTSwrrsw9xCjBwawkwsvmDxTiTUmsrEotyo8v
 Ks1JLT7EKM3BoiTO+zTvWKSQQHpiSWp2ampBahFMlomDU6qBcdHtaTEnUiY/OmgdefXryx/x
 zkeaX9Zd0lX+v9JlY7LeHfl1r8V8sw2PvfjU+iziTsLUpaqF1/5q7Zgb7zjxp8ukpwsuiznb
 O9a3BNnEPaj7fjP155ECs/dmXVtkQmylVtX8l2S4P++J9R/vU9rirB2n5bIvv52zNiztDN/G
 V+k+YVxndh3y+q3EUpyRaKjFXFScCADCQ4iYdgIAAA==
X-CMS-MailID: 20200330073511epcas2p2dd0a6e9dca67734192f0d55b86104cbb
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200330073511epcas2p2dd0a6e9dca67734192f0d55b86104cbb
References: <CGME20200330073511epcas2p2dd0a6e9dca67734192f0d55b86104cbb@epcas2p2.samsung.com>
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

I'd like to submit couple of patches which will fix few problems
in corner case scenarios using topology.
Any feedback will be greatly appreciated.

Lee

Gyeongtaek Lee (3):
  ASoC: dapm: connect virtual mux with default value
  ASoC: topology: use name_prefix for new kcontrol
  ASoC: fix regwmask

 sound/soc/soc-dapm.c     | 11 ++++++++++-
 sound/soc/soc-ops.c      |  4 ++--
 sound/soc/soc-topology.c |  2 +-
 3 files changed, 13 insertions(+), 4 deletions(-)


base-commit: 76ccd234269bd05debdbc12c96eafe62dd9a6180
-- 
2.21.0


