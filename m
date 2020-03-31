Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9104198C94
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 08:53:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B535886;
	Tue, 31 Mar 2020 08:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B535886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585637626;
	bh=2IVFWnt3waTLjgZPzdYtg3uIY0Zugne4v34l316QAOo=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lOFRHTZYeMKhqqcCLWI8fEYaZsBH95ffr01b+mxaodZKcrbaKBDvQQ2mkPxC9MUdj
	 N8dttaLFukLOEWMf3jeBqmaV8xNw12+HTw2l3lB/2HciQ+wBEcRPNtFRW5LZD/AR46
	 Z7PyyeMxF/BTnf0tt4n39PeJZ2yqKypQBQIrYfs0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FD63F8028D;
	Tue, 31 Mar 2020 08:51:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D70A5F8010D; Tue, 31 Mar 2020 08:51:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9F37F8010D
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 08:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9F37F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="vgngJSvL"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200331065053epoutp01bf7e60d8dd08126be4bc381164bbef35~BUNztmZb33006230062epoutp01L
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 06:50:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200331065053epoutp01bf7e60d8dd08126be4bc381164bbef35~BUNztmZb33006230062epoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585637453;
 bh=QzzIk6BgGxSORHAQt5EdjhRg4BuTX4Cr3D/IUub2cEs=;
 h=From:To:Cc:Subject:Date:References:From;
 b=vgngJSvLWbR7g6B8281fRakey+2oQWPbFb5sCPv//RL7cygB+yphKHSEw69ih5kMr
 c8b6jZ7PHgTGT9Imd4rQqckn/qJBs9WKJJpYvUTL5GHZ9FpOMTExic3oSiyKiUTBUc
 5VRXjuXf10iS+4rwHOrJjoY5olW/ofUFs6NIFhnE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20200331065049epcas2p122a881b0a5cea28641cff3a6e29a3368~BUNwTU-wv2742827428epcas2p1j;
 Tue, 31 Mar 2020 06:50:49 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.186]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 48s0Mr4m0xzMqYkX; Tue, 31 Mar
 2020 06:50:48 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 F9.4D.04142.848E28E5; Tue, 31 Mar 2020 15:50:48 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20200331065047epcas2p23455307bb2eed7b62a04e387e6ebf9c1~BUNtrwlLO1938219382epcas2p2Q;
 Tue, 31 Mar 2020 06:50:47 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200331065047epsmtrp265b773e5cb187ffe4f2f85935cc4ff71~BUNtpZCie0913509135epsmtrp24;
 Tue, 31 Mar 2020 06:50:47 +0000 (GMT)
X-AuditID: b6c32a46-3f9ff7000000102e-ec-5e82e848ad70
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 98.55.04024.648E28E5; Tue, 31 Mar 2020 15:50:47 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200331065046epsmtip1cb91220e99bf1de1594fc8fd024b7760~BUNtfqDVS1602416024epsmtip1B;
 Tue, 31 Mar 2020 06:50:46 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: topology: use name_prefix for new kcontrol
Date: Tue, 31 Mar 2020 15:50:46 +0900
Message-ID: <012701d60728$b4efd0b0$1ecf7210$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AdYHJ7VgAsR74+N5SxW9G/2MD9NPog==
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0gTYRjmu9tul7W4ltWbBM4LkSR1m23dQiPMH8OKhKCkQrvcpdJ2W7st
 KoK0SNSFpanZKrOUDEUzE7PMgmllv4RKKbMomZoaFVQYSkVzN2H/Pe/7Ps/3PQ/vS+KKeiKE
 zOXtnI1nTTQRJGnvXsVEGcaPZ6gmOyOY/pdujKkYHiGYqnanhJnqL8SYhy9rMabldxNievLL
 sQ0yQ8vP44ThjuuDzNDaUEQYStoakOFG24AkTbrTFJfDsUbOpuT4LIsxl8+Opzdty9yYqdWp
 1FFqPbOWVvKsmYunEzenRSXnmrw+aOVB1uTwttJYQaBj1sfZLA47p8yxCPZ4mrMaTVa12hot
 sGbBwWdHZ1nM69QqlUbrZe4x5ZzobcesH6WHqpsrZHnIIylG80ig1sCr5heoGAWRCqoDweOa
 KUIsfiAYfXgLE4spBM++3yfmJPeG3kvFQReCmfpqv2QCwclrTq+EJAlqHZxy0rOCYArg191e
 30s4VYagcfwzmh0sppJg7KxHOsuXUOFQVrl1ti2n9HDaU46LeBE8OT/i84pTGqhrvIyJOBRu
 f72Ii4aUMD16TSr2g+FCUQEu/hsNE5PDPm9AvSHgXOFvqShIhPp7FZiIF8Pk4zaZiEPg57cu
 v+AEgm8v/vgH5QiKnAoRx0Lbpae+kECthJ53fnMLobD7r0xsy6GwwM+m4ebTf342QHWL/0ED
 TPY6ZWdQmCsgpSsgpSsgpSsgWQ2SNKClnFUwZ3OCxqoJ3HYr8h1pZHIHquvb7EYUiegF8k8D
 +RkKKXtQOGx2IyBxOlhObM3LUMiN7OEjnM2SaXOYOMGNtN4llOIhS7Is3pPn7ZlqrUanU+m1
 jFanYehl8tb5g7sVVDZr5/ZznJWzzekwcl5IHhr61dG0cnlKbOrRier3NQVbmirza/rw6bDB
 K+eT3fp9S0rCI8zjw3lfZnRNQVVbUmZm6vd+sO8sT4+ISurSj0yXHEvltIdWd2rMf1PDZX08
 2d/33BOcta3Tkc7vijnQawl9bby6XRlztPSBPXJs/Yrat807rjsvqx954qTxCa8aEmiJkMOq
 I3GbwP4Hml+pxLoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSnK77i6Y4g2P/mCyuXDzEZDH14RM2
 ixnbulksvl3pYLI4enExk8WG72sZLY40TmFyYPfY8LmJzWPnrLvsHptWdbJ59G1ZxeixfstV
 lgDWKC6blNSczLLUIn27BK6M5hPbmArus1bMWzeVvYHxMUsXIyeHhICJxJ7bd1i7GLk4hAR2
 M0pcWf6MESIhIfFh/hl2CFtY4n7LEaii54wSG/rXMnUxcnCwCVhJ9HQrgdSIANV/2XWCCaSG
 WWAWo8SrObNZQRLCAq4SzyY/ZgWpZxFQlZg0zR8kzCtgKdH/eAozhC0ocXLmE7CDmIEOajzc
 DWXLS2x/O4cZ4gYFiZ9Pl7FCxEUkZne2MUPs1ZN4+eoh2wRGwVlIRs1CMmoWklGzkLQvYGRZ
 xSiZWlCcm55bbFhgmJdarlecmFtcmpeul5yfu4kRHB9amjsYLy+JP8QowMGoxMP74GpjnBBr
 YllxZe4hRgkOZiURXjb/hjgh3pTEyqrUovz4otKc1OJDjNIcLErivE/zjkUKCaQnlqRmp6YW
 pBbBZJk4OKUaGCenP0iOWHz8FPOaVdUKPh+i1+w+/SRvQueRmbecE/mWLfXMrng6bavotwdu
 +2/qz03UnJrww+JVX8u7j+YrlerN2Fkz/mT9FQgw/3RUMP6d3quf30p3Htfaelj1zy/7NNNl
 157pTkl6YXvJPKpG6VFR0hZrB9ks/sx09+rOc8d9GmtedJ9l51RiKc5INNRiLipOBABMj2TO
 iwIAAA==
X-CMS-MailID: 20200331065047epcas2p23455307bb2eed7b62a04e387e6ebf9c1
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200331065047epcas2p23455307bb2eed7b62a04e387e6ebf9c1
References: <CGME20200331065047epcas2p23455307bb2eed7b62a04e387e6ebf9c1@epcas2p2.samsung.com>
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

Current topology doesn't add prefix of the component to newly created kcontrol.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c index 575da6aba807..a152409e8746 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -362,7 +362,7 @@ static int soc_tplg_add_kcontrol(struct soc_tplg *tplg,
 	struct snd_soc_component *comp = tplg->comp;
 
 	return soc_tplg_add_dcontrol(comp->card->snd_card,
-				comp->dev, k, NULL, comp, kcontrol);
+				comp->dev, k, comp->name_prefix, comp,
kcontrol);
 }
 
 /* remove a mixer kcontrol */
--
2.21.0



