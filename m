Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8611F198BE0
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 07:45:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FF9C1607;
	Tue, 31 Mar 2020 07:44:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FF9C1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585633507;
	bh=tw1vmuJf6G5orF/K92Uiukz/nevBh6sqzjrzcDXYWmI=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=f46YJ+GW5tER1xsDlYhuuh5Z3V7iP2g8L9qH7O5kZ/w3aUGBaNBsy1zm8M/S8hFuG
	 K67wu00C81mL7KT7ldppp/m4bzwkz5y7k+tTk6m9++5aceJZVqJHapWG1YM7KfHjqh
	 jOdKeFFpR2u6KvAMpbv7hz2P4jxSwU8jNs6J7eJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62008F8028C;
	Tue, 31 Mar 2020 07:42:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A133F8028B; Tue, 31 Mar 2020 07:42:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DDB2F801F2
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 07:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DDB2F801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Sz6kcBpD"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200331054221epoutp02ede4c4769e4c3ff8838890079a352e4d~BTR9va5aa1712517125epoutp02T
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 05:42:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200331054221epoutp02ede4c4769e4c3ff8838890079a352e4d~BTR9va5aa1712517125epoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585633341;
 bh=Oj52SX15IbcqpUldgqSaoVxMVdbL3bTRN4VW+DIf8cU=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Sz6kcBpDRnW0qMXQbbZbL2ezH1ZNMp35jqpjcr6o2hNVIHmRYDohSRZjLEhKK2Eea
 45n5gakMnZuQmKE5kMSg64NRpgjD2jHMteyQ9WUMgpzAiY2YJKYKOPnu6waJy6l975
 NfER2TUr4fuZwwFwm6RztS1zGc6XbJIhgIyFfoTw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20200331054220epcas2p1ee9c49e6e9d8fb3b16d53aa12a36fe81~BTR9bF49X0935009350epcas2p1I;
 Tue, 31 Mar 2020 05:42:20 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.191]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 48ryrq4CjWzMqYkk; Tue, 31 Mar
 2020 05:42:19 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 3D.E8.04142.938D28E5; Tue, 31 Mar 2020 14:42:17 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20200331054217epcas2p3e98c724d8be292bf9d71f78119547646~BTR6SZ2ms3244532445epcas2p3Q;
 Tue, 31 Mar 2020 05:42:17 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200331054217epsmtrp2b9c2bf885115a0a28226312cb8fdd354~BTR6RspFj0531905319epsmtrp2W;
 Tue, 31 Mar 2020 05:42:17 +0000 (GMT)
X-AuditID: b6c32a46-3e1ff7000000102e-b9-5e82d839bc76
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 2B.AE.04024.938D28E5; Tue, 31 Mar 2020 14:42:17 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200331054217epsmtip26cac2a1520b5628f662ff451b76b3d63~BTR6Gku0H0324703247epsmtip2B;
 Tue, 31 Mar 2020 05:42:17 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: topology: use name_prefix for new kcontrol
Date: Tue, 31 Mar 2020 14:42:17 +0900
Message-ID: <010a01d6071f$2368ce20$6a3a6a60$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AdYHHsEcGeN1rpkpQQel+BKb0Y+e+g==
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRTmt3t3d7VWt2l5kKB1o0JD21bTu1ApUllkKPQgNFwXd9mkvdqd
 YlLkg2xqSQ+lWvmIpMBK56PUaP2xjFIoktTKijIrU2p/qBnRc+su2n/fOd/5zjkf55CY7AoR
 TeZbHJzdwppoIhy/eTcmMU7zrCxXUd6qYYYGvSKmbuwdwZy9WY0zc0NOEXNv8JKIcX+9jpi+
 0lrRRonWPVNGaHtdryTajpZKQlvT1YK0bV3DeJY425Rk5Fg9Z5dzljyrPt9iSKa3btdt1qkT
 FMo4pYZJpOUW1swl06kZWXHp+Sb/HrS8kDUV+FNZLM/Ta1OS7NYCByc3WnlHMs3Z9CabUmmL
 51kzX2AxxOdZzRuUCoVK7a/cazJ2ej8h25i4qKG1TlKCxvEqFEYCtR6utZeJq1A4KaN6EFzr
 7CeEYBrB9zOvkRDMIZg4/l9yrsYXJDwIjr7wBCWTCM50X/EzJElQG+BYNR0QRFIAs7ceiAI1
 GHUKwdWPEyhARFBp8OH0uDiAcWolVHg6JQEspTRQ1jSCCXgR9J9793cyRqmg+WqjSMDLoPvz
 BUzYSA7f3l8WC/lIOF9ZgQmD4+HhrSY8MBioJwTUTF/EA8sBlQrOXzsEbQRM3e+SCDgaZnyC
 GaDKEfge/ggStQgqq2UCXgdd9QMioc8K6BsN7rYAnHd/SoS0FJwVwWoa2gd+BasBGtzBhlp4
 6nQRJ9ByV4hJV4hJV4hJV4ixJoS3oCWcjTcbOF5lU4VeuwP9fdLY9B7U/CjDiygS0fOlb4ZL
 c2VitpA/YPYiIDE6UkpkluTKpHr2QDFnt+rsBSaO9yK1/wgnsejFeVb/y1scOqValZCg0KgZ
 dYKKoaOkHfOe75FRBtbB7eM4G2f/pxORYdEl6DZszHSUWsV1a7crYldP6ncnFR9eeHDwvXLO
 p2puHm1nw3vAGrPAM8W87NzJGeYefXLrUfrvG86hS1GOTblfsNE1Ww65Pe7TS+U/ix/X29NS
 G7e17t+Vhvf2NojvlHb3NZ6s6pW0Zn9NuTG1eqv66ZEcX85bxUjRqtna5W+OTrfROG9klbGY
 nWf/AIAec7C6AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsWy7bCSvK7ljaY4gzWXJSyuXDzEZDH14RM2
 ixnbulksvl3pYLI4enExk8WG72sZLY40TmFyYPfY8LmJzWPnrLvsHptWdbJ59G1ZxeixfstV
 lgDWKC6blNSczLLUIn27BK6MzYfeMBY8ZK2Yt24qewPjY5YuRk4OCQETiZl97xi7GLk4hAR2
 M0osX7WGDSIhIfFh/hl2CFtY4n7LEVaIoueMEl8Pvgcq4uBgE7CS6OlWAqkRAar/susEE0gN
 s8AsRolXc2azgiSEBVwlnk1+DGazCKhKtO3dDDaUV8BSomnBNWYIW1Di5MwnYBcxA13UeLgb
 ypaX2P52DjPEEQoSP58uY4WIi0jM7mxjhlisJ3F21wKWCYyCs5CMmoVk1Cwko2YhaV/AyLKK
 UTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM4QrQ0dzBeXhJ/iFGAg1GJh/fB1cY4IdbE
 suLK3EOMEhzMSiK8bP4NcUK8KYmVValF+fFFpTmpxYcYpTlYlMR5n+YdixQSSE8sSc1OTS1I
 LYLJMnFwSjUwhu8uLp5pY16hs97Fxp7h4sVv9ksMbt2qtfCZGp5sv1hv4dYFfTujE+d/O9Js
 5W20cdbU4wKrt+pcX/aaWW5PA3+v9bNg6wlcXZaC87zYyzg2P3+nuCA+70rXljNZi9qvLg7q
 DuUIXOJf/CfqpaaF8O3DtduST4XJSej4COSXCu9YJeyzTGSSEktxRqKhFnNRcSIANvmYSIwC
 AAA=
X-CMS-MailID: 20200331054217epcas2p3e98c724d8be292bf9d71f78119547646
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200331054217epcas2p3e98c724d8be292bf9d71f78119547646
References: <CGME20200331054217epcas2p3e98c724d8be292bf9d71f78119547646@epcas2p3.samsung.com>
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

Current topology doesn't add prefix of the component to newly created
kcontrol.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c index
575da6aba807..a152409e8746 100644
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



