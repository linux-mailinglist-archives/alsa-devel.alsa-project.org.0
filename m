Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBE819A307
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Apr 2020 02:44:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CB841662;
	Wed,  1 Apr 2020 02:43:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CB841662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585701864;
	bh=9ctfZ8n2Ipe+s1/eY+y5lXJdJCz6iKnfPS1ikl+20Vg=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RWRbFigxJbmKPMaSN3gZN2wNEZ6VmabixYin3HgcaWaNEjL/ZqNrhN2N8qZ4768a4
	 8hwLAI96mBvbC8bFjPpkO8qG8xEkg0LEkAYz7W9sbZjQiCtmG3PX3QVMNdVw54uuC/
	 Nang3egCdLUb2xICnGh0pMplKNlkY9TRpcL/mMBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BF2DF8010C;
	Wed,  1 Apr 2020 02:42:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08D36F80146; Wed,  1 Apr 2020 02:42:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7750BF8010C
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 02:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7750BF8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Ead0D85s"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200401004227epoutp0189fe9ef0819b879103e2f4ef8e3a5bb3~Bi1Zs7OPr2361523615epoutp01x
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 00:42:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200401004227epoutp0189fe9ef0819b879103e2f4ef8e3a5bb3~Bi1Zs7OPr2361523615epoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585701747;
 bh=J0OgxZUFvtPnCJffRgZhZh7lujP8jp3o8PMlnhmIO9E=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=Ead0D85sQdGguWgoWlDBI6JzsfvRPhpeI28dcd54hau+SVZPE2NiMIGLa5h0Mh5Xj
 e4au73aKvps7b/ZoGcJ/PDXPTy2EdZO+GRUA7H2Ss8dTmsF236VZwmVO88u2PvOcCC
 1ldj9OiUu7ZOQ/QEvi4R5R2gzC7T0BJkJNyENt6Y=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20200401004226epcas2p20a9f97a3b2fbe528462a875275306cd5~Bi1ZP_LhF2780227802epcas2p2Z;
 Wed,  1 Apr 2020 00:42:26 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.183]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48sS8K2PtjzMqYkY; Wed,  1 Apr
 2020 00:42:25 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 FB.43.04128.073E38E5; Wed,  1 Apr 2020 09:42:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20200401004223epcas2p2a2b0f54f83ea8fa0c1a1b96660cf4b69~Bi1WuZ8JJ2618626186epcas2p2q;
 Wed,  1 Apr 2020 00:42:23 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200401004223epsmtrp2d44ada82f6bf53b11999dc23e0b8008c~Bi1Wr5h3K2773727737epsmtrp2h;
 Wed,  1 Apr 2020 00:42:23 +0000 (GMT)
X-AuditID: b6c32a45-f9bff70000001020-52-5e83e370d199
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 99.AC.04024.F63E38E5; Wed,  1 Apr 2020 09:42:23 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200401004223epsmtip223d57d1001955f7023b22b0d81af369e~Bi1Wiw4Q60787907879epsmtip2W;
 Wed,  1 Apr 2020 00:42:23 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <broonie@kernel.org>
In-Reply-To: 
Subject: [PATCH 2/3] ASoC: topology: use name_prefix for new kcontrol
Date: Wed, 1 Apr 2020 09:42:23 +0900
Message-ID: <004c01d607be$68cd8b50$3a68a1f0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYHJ7VgAsR74+N5SxW9G/2MD9NPogAlly5w
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHfe62u+t0cZsrT35p3OxDhbattq6WUVQyejX6ElLOi97Uuntp
 d0pKlKaYzkhdajrNlEJIqZaOXowKpvYiGAnau2DYq5XmWxaUtHkX7Ns55/n9n/M/53kIkaIF
 jyKyzHbWZmY4CpeJb3at0MdYRwpT1HXNJD3Q78Xo6nfvcbr2ZpmY/jlQgtE9/Zcw2j17FdHd
 BVXYJqnBPXUKN9xxDUkN7a2luOGspxUZrnsGxUmSZG5DJsukszYVa06zpGeZMxKoHfuMW4w6
 vVoTo4mj11EqM2NiE6itO5NiErM4nw9KlcNw2b5SEsPz1OqNG2yWbDuryrTw9gSKtaZzVo3G
 GsszJj7bnBGbZjHFa9Rqrc5HpnKZ5ePtyPpMcsz97DTKRy/EDhRKALkW+t44cQeSEQryNoIr
 TT0iIZlE0FYwIRaSnwgqi6+h/5L7E8MB6h6C04NtgeQLgrf91RIHIgicjIczZZRfoCQBpjsf
 Y35GRDp9137+hPxMKCmHirn1fiaC3AYfz41I/LGYjIbqwQ6pH5GTceDtl/nLcnIhPKl7P29b
 RGrhcttFTIiXwq3vDSLBmwp+f2iRCG21UD9TEOCVUF9aPG8TyK84fOtsxgTBViivcgR2EQGj
 jzxSIY6CqbF7uCAoRDDW9ydwUIWgtEwhxGvAc6EX8xsFchl0vw40WwAlXX+lQlkOJcUBmoIb
 vXMBGqDRLa1AlCtoMlfQZK6gyVxBEzQhcStazFp5UwbLa62a4MduR/N/dOW226j26U4vIglE
 hctV8YUpCgmTw+eavAgIEaWU43vyUxTydCY3j7VZjLZsjuW9SOdbfKUoalGaxffjzXajRqfV
 69VxOlqn19JUpLwj7NUBBZnB2NkjLGtlbf91GBEalY8Sw6N/b3ZNcseLlTJn0xJH9GMt1pOQ
 UnP4UXzIicVLHubS3Ej0y/1nx4uIXbHL7xOj9MRQw0iX3nHh1XDe7I+D4avaIotCntbt/tT1
 rubornWyvpMP1qQVpM4oz7ufb7prVx7qnW0s39+4fWlew9DQy+kBw6+wvWpnmIl3Nmm7k4cp
 MZ/JaFaKbDzzDwYiKTy5AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LZdlhJXjf/cXOcQdMOY4srFw8xWUx9+ITN
 Ysa2bhaLb1c6mCyOXlzMZLHh+1pGiyONU5gc2D02fG5i89g56y67x6ZVnWwefVtWMXqs33KV
 JYA1issmJTUnsyy1SN8ugSuj//0mxoILrBUbLrQzNjBeZ+li5OSQEDCR2PfxATOILSSwm1Hi
 2MdCiLiExIf5Z9ghbGGJ+y1HWCFqnjNKzD4T1sXIwcEmYCXR060EEhYBKv+y6wRTFyMXB7PA
 LEaJV3NmQ9XzSLzasJ8RpJ5TgFdiwj9rkLCwgKvEs8mPwUpYBFQkpl7dzA5SwitgKXHoIhdI
 mFdAUOLkzCdgVzIDXdl4uBvKlpfY/nYOM8RlChI/ny5jhTjBSGL210aoGhGJ2Z1tzBMYhWch
 GTULyahZSEbNQtKygJFlFaNkakFxbnpusWGBYV5quV5xYm5xaV66XnJ+7iZGcCRpae5gvLwk
 /hCjAAejEg+vglVznBBrYllxZe4hRgkOZiURXjb/hjgh3pTEyqrUovz4otKc1OJDjNIcLEri
 vE/zjkUKCaQnlqRmp6YWpBbBZJk4OKUaGNfK73Wbt4LzMxdP+YOMCbM+qwc16tY/3T13xa85
 PY2VspmHhPiWHbWMttrjfiTeoDO4oubkhHlXbxxf8YyxQ+nizP4CBuafn9xmZ5RsOxJ13LBl
 5/Ogubuf3uk7nx8/W9d026vZnyU+Cab8CmIJv1qe2PNVt23LqgNO5bv+Fc9/Ljjd7Yx3jZQS
 S3FGoqEWc1FxIgB6gN7joAIAAA==
X-CMS-MailID: 20200401004223epcas2p2a2b0f54f83ea8fa0c1a1b96660cf4b69
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200401004223epcas2p2a2b0f54f83ea8fa0c1a1b96660cf4b69
References: <CGME20200401004223epcas2p2a2b0f54f83ea8fa0c1a1b96660cf4b69@epcas2p2.samsung.com>
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

Current topology doesn't add prefix of component to new kcontrol.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 575da6aba807..a152409e8746 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -362,7 +362,7 @@ static int soc_tplg_add_kcontrol(struct soc_tplg *tplg,
 	struct snd_soc_component *comp = tplg->comp;
 
 	return soc_tplg_add_dcontrol(comp->card->snd_card,
-				comp->dev, k, NULL, comp, kcontrol);
+				comp->dev, k, comp->name_prefix, comp, kcontrol);
 }
 
 /* remove a mixer kcontrol */
-- 
2.21.0


