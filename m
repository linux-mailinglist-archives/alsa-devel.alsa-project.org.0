Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C6C198BE6
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 07:45:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D1471679;
	Tue, 31 Mar 2020 07:44:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D1471679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585633547;
	bh=laE/N+Ik1tsknZ985TFNScJiNiQUovcWuh4Z7W1ZjN4=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X9uwLE3jAfxfmKoRBZMuh7LPT+sJYnwAYxnBylYmjW3EoEaZ+h2DDH0UTxJAhtgax
	 MUh/5P5m1MCuAuIlNDEPq9n1wR4Ak3aSZ6ASwd9rEOASP1tEZjCng05BgyPKkAlLa8
	 uJ6CEXCaMz6CTjrC1yj2ykxncTrK+XcDboIei3Uc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E25FF80290;
	Tue, 31 Mar 2020 07:42:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 127C9F8028F; Tue, 31 Mar 2020 07:42:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C439EF8010C
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 07:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C439EF8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="DRFE9rMZ"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200331054228epoutp03ad2c8a9930a780332afc6c916e8293fb~BTSETHa8N0740507405epoutp03X
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 05:42:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200331054228epoutp03ad2c8a9930a780332afc6c916e8293fb~BTSETHa8N0740507405epoutp03X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585633348;
 bh=v4bOtJOm39CkquAv4YplRjeKmOe8Ygc+elN6V2GdtwQ=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=DRFE9rMZFkTEcqbp3A/YJuCIjHJ2v5NhePsyXNqmF6IJDQht85JmCyF+qkAtNYueU
 aQVjonjWrHOwn0ZalZS3FIyrf3fjYWjeer3UwCU2gaNFzrbB1nggNxwFhZVO98HFaV
 Go5+5EbAR3iZICcDqbTnzPJBctic3MLcFon2sjoQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20200331054227epcas2p3fd6a1a83ca6630781afe0ab696c191a4~BTSD0wRWQ3244532445epcas2p34;
 Tue, 31 Mar 2020 05:42:27 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.183]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48ryry2J3VzMqYks; Tue, 31 Mar
 2020 05:42:26 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 EF.F8.04142.248D28E5; Tue, 31 Mar 2020 14:42:26 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20200331054225epcas2p1f7865db70bc3840e983fa8d79f0722ae~BTSCDnIPy0932409324epcas2p1S;
 Tue, 31 Mar 2020 05:42:25 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200331054225epsmtrp142a8bff67b380e7ffe6de59d8b19cfec~BTSCCzPPq1323013230epsmtrp1f;
 Tue, 31 Mar 2020 05:42:25 +0000 (GMT)
X-AuditID: b6c32a46-3e1ff7000000102e-d7-5e82d8420127
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A6.60.04158.148D28E5; Tue, 31 Mar 2020 14:42:25 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200331054225epsmtip248c8a5dd2279b1b57e1bad9a971edd09~BTSB4IX4E3192331923epsmtip29;
 Tue, 31 Mar 2020 05:42:25 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <broonie@kernel.org>
In-Reply-To: <001001d60665$db7af3e0$9270dba0$@samsung.com>
Subject: [PATCH 3/3] ASoC: fix regwmask
Date: Tue, 31 Mar 2020 14:42:25 +0900
Message-ID: <010b01d6071f$286226b0$79267410$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQLEOIH1sK9HcthW43dBh7e87NpZcwEJSRRNpn1/DiA=
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0gUURjlzszOjtbEtFp9bT/aJsK01J2ttVE0SkOXMlSSfkiogzuouK92
 1sgg8kGmrWUvK7enDyq0SG1TK4zwXVGgGGQPSEgspQclWlHWrrPB/jvf951z7zn3fhSuuk6q
 qXyLQ7RbBBNLBhLtPaH68PiXpZnaURfFjwx1Y3zN2HuSP9/uJPiZkQqM7xtqwPiW2VuI7y05
 g21RGlq+l5KGe663SkNbUyVpOO5uQobb7hdEqiLDFJsnCkbRrhEtOVZjviU3jt2xKyshSx+l
 5cK5aH4Tq7EIZjGO3ZacGp6Yb/L4YDX7BFOhp5UqSBIbuTnWbi10iJo8q+SIY0Wb0WTjOFuE
 JJilQktuRI7VHMNptTq9h5ltyhtrPofZxgP3H/5VQhSjH9RRFEABsxH6G6oUR1EgpWI6EZz+
 dkEpF98Q3Jmqx+ViBsGNQSf6L5k7/RWTB10IOjomfayPCB6MN3r0FEUyMVDlZL2CYAZg+v7g
 vABnTiFo/jAxf1KAh3O2rk7hxUFMCNQ0y5hg1sBs31/Si2kmGm7++unDi+Fx7XvCi3FGB43N
 VzAZr4SOTxdx2Z0Gfo5fU8j9YLhQWY7LJjx3zdbPmwBmgoTqaRfhNQrMNjjympO1QTA54FbK
 WA0fq8uVMr8Mwednv32DMwgqnSoZbwD3pSeYfM5q6H3l87YIKnr+KOU2DRXlPjYLrU/mfGyA
 yy3KE4h1+QVz+QVz+QVz+YW5iogmtFS0SeZcUdLZdP6/3YbmlzQssRM1Pk/uRgyF2IX0uxcl
 mSqFsE8qMncjoHA2mCZTijNVtFEoOiDarVn2QpModSO95+FP4uolOVbPylscWZxeFxWljdbz
 +igdzy6j2xaM7lExuYJDLBBFm2j/r8OoAHUxotf0J8W39qrKHr6ZHA5PuWorFw6NOb8U3Lwb
 uSo1vma4fl1a9lxs8tmLKnfMzO6tov3pgmKqtTpj6pMrdO2EWqr9/G704J+OsKGXakXZ3kct
 iaFd64+R9PRUVdfc8vSUhJDH6Xxl0Yn6HrRzIFMbdHBjWnoSt2IkBzcmlG6nhdssIeUJXBhu
 l4R/7Y8UM7oDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsWy7bCSvK7jjaY4g7PvdS2uXDzEZDH14RM2
 ixnbulksvl3pYLI4enExk8WG72sZLY40TmFyYPfY8LmJzWPnrLvsHptWdbJ59G1ZxeixfstV
 lgDWKC6blNSczLLUIn27BK6Mh6unMxU85apo/dXI0sD4g6OLkZNDQsBE4t/kD0wgtpDAbkaJ
 Z8ccIeISEh/mn2GHsIUl7rccYe1i5AKqec4o8enAdLYuRg4ONgEriZ5uJZAaEaD6L7tOMIHU
 MAvMYpR4NWc2VEM3o8TKiY9YQao4gRqmLVwIZgsLqEtMXQ1hswioSnw/+p8NxOYVsJRY8+sn
 lC0ocXLmExYQmxno0sbD3VC2vMT2t3OYIa5TkPj5dBkrRFxEYnZnGzPERUC7vi9imsAoPAvJ
 qFlIRs1CMmoWkvYFjCyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGCI0pLawfjiRPx
 hxgFOBiVeHgfXG2ME2JNLCuuzD3EKMHBrCTCy+bfECfEm5JYWZValB9fVJqTWnyIUZqDRUmc
 Vz7/WKSQQHpiSWp2ampBahFMlomDU6qBsdj0X6/RP12f+nM/F1++wi/jFvMo3IFf1FG3V0GC
 8+ThRW1nO8RT/OucDvbb/ve3uPDhX9nEvUIFacfKnj1YVnp4Ru6nrZM+PpWfOeV1wg37h/MM
 VuidXMRiGPGRgVegcp3E4u2dLLtmsmTsPF+m+PKtm+n1fR715Z98M0VNnz4Q87uSs6BipRJL
 cUaioRZzUXEiAPhb6SKkAgAA
X-CMS-MailID: 20200331054225epcas2p1f7865db70bc3840e983fa8d79f0722ae
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

If regwshift is 32 and the selected architecture compiles '<<' operator for
signed int literal into rotating shift, '1<<regwshift' became 1 and it
makes regwmask to 0x0.
The literal is set to unsigned long to get intended regwmask.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 sound/soc/soc-ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c index
652657dc6809..55ffb34be95e 100644
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



