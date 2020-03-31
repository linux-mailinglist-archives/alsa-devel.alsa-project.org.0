Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18558198C98
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 08:54:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD6431672;
	Tue, 31 Mar 2020 08:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD6431672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585637666;
	bh=mEL6MMsIQOcY2F7LJKgzg7k5EvB4ly0iU5/qeDEJ/ec=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MRh5nqEiQ8A1vBBe0YFZo6T4gwMXSEnOLfpEX+DCsm0q6tMyGF7QypB5vSdu7Zwrn
	 Khtaw/dh8x5rRehNELGlELlVQnn0BRu/hzphkflwpnQ1uUJwnbqoN6xgBJuSfGQULJ
	 JI51sd11mnchzFyePifIghGIBJjGpFDnulVhzY4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B528F802A0;
	Tue, 31 Mar 2020 08:51:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A4C9F80292; Tue, 31 Mar 2020 08:51:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB3F1F80255
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 08:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB3F1F80255
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="e1UexiW3"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200331065110epoutp0323d3cf7c5de90334d7c5a407fd654b03~BUODYNt0l0501105011epoutp039
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 06:51:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200331065110epoutp0323d3cf7c5de90334d7c5a407fd654b03~BUODYNt0l0501105011epoutp039
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585637470;
 bh=aRgYIAMafSpzH03Rk1eL71xLTLcQu2byvBHNul/9XLM=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=e1UexiW36gVwP2NJf6XzHdT/jMMpHJCQAm1Aqk9K6KrU4ZIPhHeSbW0WyYr8ioVa7
 ZN5tK+zQ01Se05sh2noZBDrqi/ALwa38yg2BoHonOFNhKGHriy3FexS1ELvFCrbGnX
 O6FBHKODfY80M35OyGy7RTxtyT6kT8q2GeFRNu3Y=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20200331065108epcas2p2781c72eab3332a380169b7906e629c66~BUOBtu7EY0787507875epcas2p2U;
 Tue, 31 Mar 2020 06:51:08 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.191]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 48s0NC2BwZzMqYkn; Tue, 31 Mar
 2020 06:51:07 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 A0.86.04128.A58E28E5; Tue, 31 Mar 2020 15:51:06 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20200331065101epcas2p44b2b04ff8965ca0c42a2119e13c7db7d~BUN7c4IDw2901629016epcas2p4s;
 Tue, 31 Mar 2020 06:51:01 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200331065101epsmtrp16f38134c80817e45e1edc7339a0bf817~BUN7bnSSS1710017100epsmtrp1E;
 Tue, 31 Mar 2020 06:51:01 +0000 (GMT)
X-AuditID: b6c32a45-fb3ff70000001020-ec-5e82e85a529d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 CF.F6.04158.558E28E5; Tue, 31 Mar 2020 15:51:01 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200331065101epsmtip260845b075fc1af9ffe64a6ede826ad2c~BUN7Imr1x0822208222epsmtip2j;
 Tue, 31 Mar 2020 06:51:01 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <broonie@kernel.org>
In-Reply-To: 
Subject: [PATCH 3/3] ASoC: fix regwmask
Date: Tue, 31 Mar 2020 15:51:01 +0900
Message-ID: <012801d60728$bdab3a50$3901aef0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQLEOIH1sK9HcthW43dBh7e87NpZcwEJSRRNpn1/DiCAABT84A==
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjuO+fs7Mxanably/60TkRkWNty88y0QksGCQkJ0QXtsB1U2o2d
 Lcz6oabisouZhq0y7QZeMqt1Ryq1MqNA0qQbWFpakGReMitp8yzYv+d73ueB53m/l8IVF0kl
 lW1z8U4bZ2HIMOJm2/LY6O1DBenqd5UM293VirGVHwZItupmKcFOdJdg7KOu8xjb/PMyYtvz
 K7D1UmPzaAFpvON9LzVeq/eQxiO+emS84ushUiXbLfFZPGfmnSreZrKbs22ZCcymLRlJGTq9
 WhOtMbCxjMrGWfkEZkNKanRytsWfg1Ht4SxuP5XKCQKzam280+528aosu+BKYHiH2eLQaBwr
 Bc4quG2ZK012a5xGrdbq/MpdlqyxvgbC0R+WUzSVT+ShSeogklFAx8Do9WryIAqjFPRtBB2+
 ciQ+fiCo+/0tOJnwT5oaif+WvPZhLIAVdAuC3o+5ougLgvIWr99BUSQdB4dKmYAmggYYu9uB
 BTQ4XY6gYWgQBTQyWg5l02sCmnB6GVQ21EoCNEEvBc9pfYCW0wZoaTqCRDwfnp4cmImA01q4
 0HAWE/EiuPXtNC5GU8GvT5ckIh8BpzzFuBghEQoPH5rpAnQ/Cd9r35KiYQPcr+lHIg6Hr098
 UhEr4cvRYqloOIBg+Pmf4KACgadUIeLV4DvTiQVCA70E2t8Ew82Fkra/UpGWQ0lxUM3A1c7p
 oBqgullahhhvSDNvSDNvSDNvSJsaRNSjhbxDsGbygtahCf3ra2jmRKM23kZVL1JaEU0hZo68
 ryc/XSHh9gh7ra0IKJyJkJOb89IVcjO3N5d32jOcbgsvtCKdf/HHcOUCk91/8DZXhkan1evV
 Bh2r02tZJlJ+ffbrnQo6k3Pxu3newTv/+zBKpsxDRSfwtJjsrdUnHmyTXAgb/2yQ1R6vCV/0
 qaPUPeKJVd1LbBk495hrWttdV2E8lyxTWqdGnD0j96aT/r5c15XbXzV75GHccfU8U/tSg8z4
 rC0uJ/lKd82s3qTUtkGljbqRsKTgmG5wRd0+6av945GFi9N67PM66R38EKl9mTPZGOVmCCGL
 00ThToH7BzGmQAa4AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsWy7bCSvG7oi6Y4g2kLtSyuXDzEZDH14RM2
 ixnbulksvl3pYLI4enExk8WG72sZLY40TmFyYPfY8LmJzWPnrLvsHptWdbJ59G1ZxeixfstV
 lgDWKC6blNSczLLUIn27BK6MLw9WsxQ85qpo/dXI0sD4g6OLkZNDQsBEouHIO6YuRi4OIYHd
 jBIL2p6wQCQkJD7MP8MOYQtL3G85wgpR9JxR4vra1UAJDg42ASuJnm4lkBoRoPovu06ADWIW
 mMUo8WrObKiGHkaJe8d3gTVwCvBKTPhnDdIgLKAuMXX1QlaQMIuAqkTnHDOQMK+ApcTedX2M
 ELagxMmZEPcwAx3aeLgbypaX2P52DjPEbQoSP58uY4WIi0jM7mxjhrjHSaKlt4dtAqPwLCSj
 ZiEZNQvJqFlI2hcwsqxilEwtKM5Nzy02LDDKSy3XK07MLS7NS9dLzs/dxAiOJy2tHYwnTsQf
 YhTgYFTi4X1wtTFOiDWxrLgy9xCjBAezkggvm39DnBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe
 +fxjkUIC6YklqdmpqQWpRTBZJg5OqQZGpTCXulY2niO14v+f27WI3vvp6Fzyc09G606vlI87
 +z8ErbhtWXtsTWhIr3M5T/Jn/caWrot84YqRKcfnfe8N+uCszhcz3VzyCU91fuzC1Lw/wkUa
 F4Xq9fa+tE+Tyk0Tui7y0jL13NfgKTkbjm/frOVRcFsvr0jKgc2OgXHvoXUWbFKZlkosxRmJ
 hlrMRcWJAN1ToNSjAgAA
X-CMS-MailID: 20200331065101epcas2p44b2b04ff8965ca0c42a2119e13c7db7d
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200330073600epcas2p3712a5e92d86a524bedda790f2e273935
References: <CGME20200330073600epcas2p3712a5e92d86a524bedda790f2e273935@epcas2p3.samsung.com>
 <001001d60665$db7af3e0$9270dba0$@samsung.com> 
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

If regwshift is 32 and the selected architecture compiles '<<' operator for signed int literal into rotating shift, '1<<regwshift'
became 1 and it makes regwmask to 0x0.
The literal is set to unsigned long to get intended regwmask.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 sound/soc/soc-ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c index 652657dc6809..55ffb34be95e 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -825,7 +825,7 @@ int snd_soc_get_xr_sx(struct snd_kcontrol *kcontrol,
 	unsigned int regbase = mc->regbase;
 	unsigned int regcount = mc->regcount;
 	unsigned int regwshift = component->val_bytes * BITS_PER_BYTE;
-	unsigned int regwmask = (1<<regwshift)-1;
+	unsigned int regwmask = (1UL<<regwshift)-1;
 	unsigned int invert = mc->invert;
 	unsigned long mask = (1UL<<mc->nbits)-1;
 	long min = mc->min;
@@ -874,7 +874,7 @@ int snd_soc_put_xr_sx(struct snd_kcontrol *kcontrol,
 	unsigned int regbase = mc->regbase;
 	unsigned int regcount = mc->regcount;
 	unsigned int regwshift = component->val_bytes * BITS_PER_BYTE;
-	unsigned int regwmask = (1<<regwshift)-1;
+	unsigned int regwmask = (1UL<<regwshift)-1;
 	unsigned int invert = mc->invert;
 	unsigned long mask = (1UL<<mc->nbits)-1;
 	long max = mc->max;
--
2.21.0



