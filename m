Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A07911975DA
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 09:38:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48A60167F;
	Mon, 30 Mar 2020 09:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48A60167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585553931;
	bh=vgEGKcWdRBszd1Ebkb1MIDQXvRIryfW0BFtwL9oxiQY=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=uyTwbOQVYNGA5JIYbkiE4FBZM/3T2ruM0tgmi0DkJYTmOFy0vv3fuxkGCqbEAEwID
	 uZ6pLeQctzSo7Tlb8lnMMRO+K08GdykZ8RMvHoUKw7FFZILHIUnmKz/k3ZsnwB86mm
	 b90vhn+Uwb/ZCMFB728gwtnh6JrspERKuchhQ8yI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 829ECF8015C;
	Mon, 30 Mar 2020 09:36:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DB17F8028E; Mon, 30 Mar 2020 09:36:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F37D9F8015C
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 09:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F37D9F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="WoB/LKwg"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200330073603epoutp04ec2285ac92c8faecd50eaf246875d79c~BBL9RSjU90510705107epoutp04X
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 07:36:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200330073603epoutp04ec2285ac92c8faecd50eaf246875d79c~BBL9RSjU90510705107epoutp04X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585553763;
 bh=lzPzgmyYErUQUjbJ/mVA8q01LoKJoAEaEbRTqUwMNOg=;
 h=From:To:Cc:Subject:Date:References:From;
 b=WoB/LKwg0PVTqjIY2WQrMFVIG4Ii1eDBOuQhu5/QKD3QchnnACcz/l2KLMFlXwc78
 lJoBy9pfrPu4UJ/o9DhqzVdBFC0e8Adkos4lsklTMy7tm6lxZeYl5l775GA1BzJ68a
 sJJzjEXvZM9qCayggCN0D/5yEF6K1g8qqlf8bOR4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20200330073603epcas2p1b98d7aeff4436eaa9e21714ce783077e~BBL9Ed5pl2500925009epcas2p1c;
 Mon, 30 Mar 2020 07:36:03 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.181]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 48rPQV1Vf9zMqYkl; Mon, 30 Mar
 2020 07:36:02 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 99.06.04142.061A18E5; Mon, 30 Mar 2020 16:36:00 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20200330073600epcas2p3712a5e92d86a524bedda790f2e273935~BBL5-C4Lh0567105671epcas2p3a;
 Mon, 30 Mar 2020 07:36:00 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200330073600epsmtrp259cdc87ab280fe8057f61454ae90496e~BBL5_RhzR0961309613epsmtrp2W;
 Mon, 30 Mar 2020 07:36:00 +0000 (GMT)
X-AuditID: b6c32a46-3e1ff7000000102e-ad-5e81a160d8d2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 57.DC.04024.F51A18E5; Mon, 30 Mar 2020 16:35:59 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200330073559epsmtip20b8d0b931c81a018178426efd5ad3e90~BBL5vLCQw2052520525epsmtip20;
 Mon, 30 Mar 2020 07:35:59 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>
Subject: [PATCH 3/3] ASoC: fix regwmask
Date: Mon, 30 Mar 2020 16:35:59 +0900
Message-ID: <001001d60665$db7af3e0$9270dba0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYGZY7021E+9zAOTcWnd9wWOyg9uw==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEJsWRmVeSWpSXmKPExsWy7bCmuW7CwsY4g1/v+S2uXDzEZDH14RM2
 i29XOpgsNnxfy+jA4rHhcxObx85Zd9k9Nq3qZPNYv+UqSwBLVI5NRmpiSmqRQmpecn5KZl66
 rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtBOJYWyxJxSoFBAYnGxkr6dTVF+aUmq
 QkZ+cYmtUmpBSk6BoWGBXnFibnFpXrpecn6ulaGBgZEpUGVCTkbLk17mgidcFa2/GlkaGH9w
 dDFyckgImEjcvnCVuYuRi0NIYAejxI7re9ggnE+MEru63rFCON8YJWbNOc8C03J52kImiMRe
 RonJPxZCtbxklPjV/QeoioODTcBKoqdbCaRBRMBR4uuxBrBmZgFFicd/5oDZwgLqElNXL2QF
 KWcRUJW4MVUYJMwrYClxa9IDdghbUOLkzCdQrUYSS1bPZ4Kw5SW2v53DDHGPgsTPp8tYIVbp
 Sfxc/QyqXkRidmcb2GsSAhvYJHbcPQH1gIvErh8z2CBsYYlXx7ewQ9hSEp/f7WWDaGhmlHh3
 9g9UYgqjRGe3EIRtLLFl7ikmkKMlBJQljtyCWsYn0XH4LztEmFeiow2qWkli46l/UNUSEvM2
 QA30kLj7Zx3LBEbFWUi+nIXky1lIvpyF5JsFjCyrGMVSC4pz01OLjQqMkCN7EyM4PWq57WBc
 cs7nEKMAB6MSD++MrQ1xQqyJZcWVuYcYJTiYlUR42fyBQrwpiZVVqUX58UWlOanFhxhNgZEw
 kVlKNDkfmLrzSuINTY3MzAwsTS1MzYwslMR5N3HfjBESSE8sSc1OTS1ILYLpY+LglGpgPNn7
 wcF/QszWyxtrtfZ/2Wc4Qcq68GPcdf039S2XmjOq44IvCUiy3mV88uf66zmM74KdZhQJF8ut
 D/2l7ZJkMC046Huv74HuKQVB5w48jXppKdg8aUKctE9rUtSMkDcP3x7e37j5EcvxlSdsr5a1
 2Gzm6c9267/nlPs7mXe/mMTnrGKZBY8MlFiKMxINtZiLihMBHnV6f6UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsWy7bCSvG78wsY4g3M/zSyuXDzEZDH14RM2
 i29XOpgsNnxfy+jA4rHhcxObx85Zd9k9Nq3qZPNYv+UqSwBLFJdNSmpOZllqkb5dAldGy5Ne
 5oInXBWtvxpZGhh/cHQxcnJICJhIXJ62kAnEFhLYzSjxbJUPRFxC4sP8M+wQtrDE/ZYjrF2M
 XEA1zxklGu+uB2rg4GATsJLo6VYCqRERcJW4v7cBrJ5ZQFHi8Z85LCC2sIC6xNTVC1lBylkE
 VCVuTBUGCfMKWErcmvSAHcIWlDg58wkLRKuJROPhbihbXmL72znMECcoSPx8uowVYpWexM/V
 z6BqRCRmd7YxT2AUnIVk1Cwko2YhGTULScsCRpZVjJKpBcW56bnFhgWGeanlesWJucWleel6
 yfm5mxjBIa+luYPx8pL4Q4wCHIxKPLwftjfECbEmlhVX5h5ilOBgVhLhZfMHCvGmJFZWpRbl
 xxeV5qQWH2KU5mBREud9mncsUkggPbEkNTs1tSC1CCbLxMEp1cCYpq34vYh1pkLp7iM/IgNV
 p2mKrd3cz9UeniKXyivlfyx8/unDMVoWXD92lLc9UrF6amFmrviVY+dqZfbJm2+v6V96/mlt
 jMezwsxTVrOul75ru2o7T1CN9d993juabLpfP11N+61+6NxJ9841ryrm/3tfHmiuUbfcevv3
 m2oyKZwu6QXVpa+UWIozEg21mIuKEwH7x8YxdQIAAA==
X-CMS-MailID: 20200330073600epcas2p3712a5e92d86a524bedda790f2e273935
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200330073600epcas2p3712a5e92d86a524bedda790f2e273935
References: <CGME20200330073600epcas2p3712a5e92d86a524bedda790f2e273935@epcas2p3.samsung.com>
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

If regwshift is 32 and the selected architecture compiles '<<' operator
for signed int literal into rotating shift, '1<<regwshift' became 1 and
it makes regwmask to 0x0.
The literal is set to unsigned long to get intended regwmask.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 sound/soc/soc-ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 652657dc6809..55ffb34be95e 100644
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


