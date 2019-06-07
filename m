Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9CC39069
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 17:52:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB7CF1660;
	Fri,  7 Jun 2019 17:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB7CF1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559922719;
	bh=lTjnPPh+Qmzs7rpbM4dNWIvpwC/cSCse4/4fxQfmxXs=;
	h=From:To:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RTdKuZFG4SIqgZ7TEgpwJGjUSJcQn24AiyjjeyM/VoPdt8qrEDLFM2RDB5k7QSRhu
	 NlJOmzELQ22ixZMfgcTJq6cuZxh6F7Aw6ALI70i9FKSb5zSuOdLuipUpT9aXwIw0Ip
	 Gb2PJoWIAW5cHi1fT2iMWYnhNYAK3rZltzPSiCs0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71BC4F896DB;
	Fri,  7 Jun 2019 17:50:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47BE0F896DD; Fri,  7 Jun 2019 17:50:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11420F896CE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 17:50:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11420F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="P8vfJ+OM"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20190607155002epoutp01a024b32bd7f0eb3d46761426cee438d9~l9VeJfKVU0678206782epoutp01h;
 Fri,  7 Jun 2019 15:50:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20190607155002epoutp01a024b32bd7f0eb3d46761426cee438d9~l9VeJfKVU0678206782epoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1559922602;
 bh=ZW+7VfjBQILPsn+M21E9CE1xDkGmqjXvCxb7lp14jWk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=P8vfJ+OMVNNHepWhHLNKVIiAx8r4ejLQWIPhDRYsRgKjB13C2VLnvT/6rY/u8NFH4
 iSWY2t4c4Gzspj0uiE++cW06JiSKBNszEKhbgeL8CITbR26V2pUiU+AIdt9RnMjT6+
 wgvNCBGEzWZraZKOZhNDwwL+4asagM49BNUj021s=
Received: from epsmges2p2.samsung.com (unknown [182.195.42.70]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20190607155001epcas2p16927467012f1824976f6138286e7c3b8~l9Vdjz9Vj0361103611epcas2p1k;
 Fri,  7 Jun 2019 15:50:01 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 1F.CC.04207.9A78AFC5; Sat,  8 Jun 2019 00:50:01 +0900 (KST)
Received: from epsmgms2p2new.samsung.com (unknown [182.195.42.143]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20190607155000epcas2p48f3a736f27c39c3b16486c067f8fe11a~l9VcdocWf2859428594epcas2p4e;
 Fri,  7 Jun 2019 15:50:00 +0000 (GMT)
X-AuditID: b6c32a46-d4bff7000000106f-ef-5cfa87a9dc21
Received: from epmmp1.local.host ( [203.254.227.16]) by
 epsmgms2p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 03.26.03620.8A78AFC5; Sat,  8 Jun 2019 00:50:00 +0900 (KST)
Received: from AMDC3061.DIGITAL.local ([106.120.51.75]) by mmp1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5
 2014)) with ESMTPA id <0PSQ00C3AJYSGO70@mmp1.samsung.com>; Sat, 08 Jun 2019
 00:50:00 +0900 (KST)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org
Date: Fri, 07 Jun 2019 17:49:26 +0200
Message-id: <20190607154926.11373-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsWy7bCmhe7K9l8xBh9uqlhcuXiIyWLjjPWs
 FlMfPmGzeHjV3+L8+Q3sFt+udDBZrD1yl93i8Jt2Vos9F1+xO3B6bPjcxOaxc9Zddo8Fm0o9
 Nq3qZPPo27KKMYA1issmJTUnsyy1SN8ugStjZvNxtoIf/BUbmn4zNTCe5u1i5OSQEDCRmLLh
 LWMXIxeHkMAORol/L+azgySEBL4zSiw/ywFTtGjVX1aI+G5GiV87UyEafjJKfD59hRkkwSZg
 KNF7tI8RxBYREJO4PaeTGaSIWeASo8SWGfvZQBLCAp4ST87cYQGxWQRUJXbO7QWaysHBK2At
 8XZ6CcQyeYnVGw6A9UoINLJJNDXdZ4FIuEh0fW5mhLClJZ6t2sgIUdTMKNGz+zY7hDOBUeL+
 8QVQVdYSh49fBLubWYBPouPwX3aQbRICvBIdbUIQJR4SX7r3Qr0cK7H98UbWCYziCxgZVjGK
 pRYU56anFhsVGOkVJ+YWl+al6yXn525iBMeXltsOxiXnfA4xCnAwKvHwvij5FSPEmlhWXJl7
 iFGCg1lJhLfswo8YId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rybuG/GCAmkJ5akZqemFqQWwWSZ
 ODilGhitFqiquClFR3OKz9v9+m5KyqRTqdF3nG1lXq2Q2W2rJng7rnH60RW/ayOEth06e+P0
 HnfuiuB9P8REXt01WrHlf8D+3qPRc1af0looVC7hIt315eN8qxiFJRbFgd/3GGQ57SrkXTfl
 gcsL5fetu5hn3j6RKxS48Petiqx+9qddH+23JzF5yExQYinOSDTUYi4qTgQAd72cDKsCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLJMWRmVeSWpSXmKPExsVy+t9jAd0V7b9iDA4vkLK4cvEQk8XGGetZ
 LaY+fMJm8fCqv8X58xvYLb5d6WCyWHvkLrvF4TftrBZ7Lr5id+D02PC5ic1j56y77B4LNpV6
 bFrVyebRt2UVYwBrFJdNSmpOZllqkb5dAlfGzObjbAU/+Cs2NP1mamA8zdvFyMkhIWAisWjV
 X9YuRi4OIYGdjBKPj6xlhHB+Mko8vHOYFaSKTcBQovdoHyOILSIgJnF7TiczSBGzwCVGiemP
 jjCBJIQFPCWenLnDAmKzCKhK7JzbC9TMwcErYC3xdnoJxDZ5idUbDjBPYORawMiwilEytaA4
 Nz232KjAKC+1XK84Mbe4NC9dLzk/dxMjMFC2Hdbq38H4eEn8IUYBDkYlHt4XJb9ihFgTy4or
 cw8xSnAwK4nwll34ESPEm5JYWZValB9fVJqTWnyIUZqDRUmclz//WKSQQHpiSWp2ampBahFM
 lomDU6qB0Vrjx+S3LA8inVtLn39aydMuVZbisE3l4e/Dazy3xKcc6Lp96WrYanO/LX39rOtM
 HBM3FRhtFVM2uZgsIr/br8yo3ONRxMf4mWsiGMs+V5wOmHAu/sQk8xVmE3QLbL/6q8/YUWhq
 KZxjk9BpyZrl1JO43I9bqOnfxHLG1B2rb8Zst/94qWG2EktxRqKhFnNRcSIASEsBUBACAAA=
X-CMS-MailID: 20190607155000epcas2p48f3a736f27c39c3b16486c067f8fe11a
CMS-TYPE: 102P
X-CMS-RootMailID: 20190607155000epcas2p48f3a736f27c39c3b16486c067f8fe11a
References: <CGME20190607155000epcas2p48f3a736f27c39c3b16486c067f8fe11a@epcas2p4.samsung.com>
Cc: alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, lgirdwood@gmail.com,
 krzk@kernel.org, tzungbi@google.com,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, festevam@gmail.com,
 m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH] ASoC: Remove erroneous
	soc_cleanup_card_resources() call
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When soc_init_dai_link() call at the beginning of snd_soc_instantiate_card
function fails soc_cleanup_card_resources() and then snd_soc_dapm_free()
gets called with an incompletely initialized card->dapm. In particular
card->dapm.card is NULL and it gets dereferenced in dapm_free_widgets().
Also dapm->list is invalid and there is an invalid pointer dereference
from list_del().

The function call stack (deferred probing) on Chromebook Snow where this
issue has shown up in today's -next is:

 snd_soc_dapm_free
 soc_cleanup_card_resources
 snd_soc_instantiate_card
 snd_soc_register_card
 devm_snd_soc_register_card
 snow_probe

In patch 70fc53734e71 "ASoC: core: move DAI pre-links initiation to
snd_soc_instantiate_card" there is an soc_cleanup_platform() call instead
of soc_cleanup_card_resources() as in current -next.

soc_cleanup_platform got renamed to soc_cleanup_legacy, then removed
in commit adb76b5b9c47 "ASoC: soc-core: remove legacy style dai_link".

It seems in merge conflict resolution the soc_cleanup_platform() call got
renamed to soc_cleanup_card_resources(), instead of being removed.

Correct this by removing an unnecessary soc_cleanup_card_resources() call.

Fixes: a8e992342ce4 ("Merge branch 'asoc-5.2' into asoc-5.3")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Suggested-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/soc-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 94a36ee8eb22..f0fa289c90d8 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1986,7 +1986,6 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	for_each_card_prelinks(card, i, dai_link) {
 		ret = soc_init_dai_link(card, dai_link);
 		if (ret) {
-			soc_cleanup_card_resources(card);
 			dev_err(card->dev, "ASoC: failed to init link %s: %d\n",
 				dai_link->name, ret);
 			mutex_unlock(&client_mutex);
--
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
