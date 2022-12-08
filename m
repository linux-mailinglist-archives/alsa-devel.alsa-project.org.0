Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90728646870
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 06:19:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1297818A8;
	Thu,  8 Dec 2022 06:18:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1297818A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670476770;
	bh=n8WJabO/c5MwDedjqMq+o8wN7+EyXWNczg/srmrOwUM=;
	h=From:To:In-Reply-To:Subject:Date:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lA1rEMKq1fsQ4M8AHo+wmSD91Hun6EM/+5odRW46aUfvkAe0kCggCWhAZngwBAvKI
	 /IAs3ybFXrZ+RO/iLJGiYs7FL6quS+b2rWw2XJgB2+RS4jCTOKeuTF+B5KYOuZdunN
	 kSPA/Kexa+qf9+gV32VZTNcdpK93doQwn6MVsyas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BDE6F8024C;
	Thu,  8 Dec 2022 06:18:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CB98F8024C; Thu,  8 Dec 2022 06:18:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4626AF80121
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 06:18:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4626AF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="ImQS4x/v"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20221208051819epoutp035ab7fb2cb1bc131e46b4bddd860742a3~uubUvx1fr1345713457epoutp03f
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 05:18:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20221208051819epoutp035ab7fb2cb1bc131e46b4bddd860742a3~uubUvx1fr1345713457epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1670476699;
 bh=gnk1LRxzHVnDkFIFikVCyTZC5sZuztuGr2AipDMqDtY=;
 h=From:To:In-Reply-To:Subject:Date:References:From;
 b=ImQS4x/vNb296/0tfc8NQyv38RJ8Y30EbrtqKxcCaq6Nt75eEImxyx/DkqIF2rDT0
 wfNJciNx3luf30+rtULpo+Jzp/Oxb8doJbU2bKC9hHiFyg0TmOf5taUfivX5qMSTYh
 k4R/CfQfJ7SvN8U5r3yaF5LaUamby6CTZnEMhY6g=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20221208051819epcas2p1eaaff16f29cc0d44c1d95ddacced9b7a~uubUcn_Bk0573205732epcas2p1C;
 Thu,  8 Dec 2022 05:18:19 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.88]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4NSMqv0Cjkz4x9Q1; Thu,  8 Dec
 2022 05:18:19 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 D7.A1.08487.A9371936; Thu,  8 Dec 2022 14:18:18 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20221208051818epcas2p122a0ce58691ac70d8a77b5e922e81fea~uubT0UpaW0570705707epcas2p1-;
 Thu,  8 Dec 2022 05:18:18 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221208051818epsmtrp2a6c4685d4335c36fddf21bcd6eaa071f~uubTzpEtq0616406164epsmtrp2E;
 Thu,  8 Dec 2022 05:18:18 +0000 (GMT)
X-AuditID: b6c32a47-873ff70000002127-c8-6391739a90a7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B1.3B.14392.A9371936; Thu,  8 Dec 2022 14:18:18 +0900 (KST)
Received: from KORDO035882 (unknown [12.36.182.71]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20221208051818epsmtip1f4e6ee8294d56a7d156e28062194a802~uubTqMiX-0729407294epsmtip1O;
 Thu,  8 Dec 2022 05:18:18 +0000 (GMT)
From: =?ks_c_5601-1987?B?sK29xcf8?= <s47.kang@samsung.com>
To: <alsa-devel@alsa-project.org>, <tiwai@suse.de>, <lgirdwood@gmail.com>,
 <pierre-louis.bossart@linux.intel.com>, <broonie@kernel.org>,
 <cpgs@samsung.com>
In-Reply-To: 
Subject: [PATCH] ASoC: soc-compress: Reposition and add pcm_mutex
Date: Thu, 8 Dec 2022 14:18:18 +0900
Message-ID: <016401d90ac4$7b6848c0$7238da40$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdkIfZUmQIy5r27gRA6zsfpgxG9cbACRpj0w
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOJsWRmVeSWpSXmKPExsWy7bCmue6s4onJBsfem1tcuXiIyWLqwyds
 Fi8PaVp8u9LBZPHr/zMmi5eb3zA5sHls+NzE5rFz1l12j02rOtk85p0M9OjbsorRY/Pp6gC2
 qGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKAjlBTK
 EnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF5gV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZ
 Ge9WXGcpmKdQceZ8F2sD4ybpLkZODgkBE4mdsyezdTFycQgJ7GCU2LdzEyuE84lR4srhVYwQ
 zjdGiZudn5hhWloPXIRq2csosflLJzuE84JR4uCSBnaQKjYBK4m7TVPAqkQE5jNKfNp0jKmL
 kYODU4BXYsI/a5AaYQFHicYH81lAbBYBFYlj21aB2bwClhKtR/eyQdiCEidnPgGLMwsYSSxZ
 PZ8JwpaX2P52DtRFChI/ny5jBbFFgGq+PDnCClEjIjG7s40Z5AYJgU4OieuXJ7JBNLhItG7/
 zgphC0u8Or6FHcKWkvj8bi9UTb7EzGsb2CGaGxgl3s6eywiRMJbYMvcU2DMSAsoSR26xQIR5
 JRo2/maHWMwn0XH4LztECa9ER5sQhKkkMfGvKkS1hMSxLw3sExiVZiH5chaSL2ch+XIWkm8W
 MLKsYhRLLSjOTU8tNiowhkd3cn7uJkZwCtVy38E44+0HvUOMTByMhxglOJiVRHhfbOxNFuJN
 SaysSi3Kjy8qzUktPsRoCgz4icxSosn5wCSeVxJvaGJpYGJmZmhuZGpgriTOO3tKR7KQQHpi
 SWp2ampBahFMHxMHp1QDE2MI/7lprq+rakSNwq1lFuQ6zdhnJy9TMsFjkVnr/ZN7/97OcvX2
 4BM4Gemul514Ly095tviH4rbghUlfi2bw1ogULVUafaVCXyvDDj5gzR/iTie/tekxxYo/eXO
 0Z6lu87mbPw78/vntt26ayeKG09o+Xea5UlbrdhTtr0Bpw7Vz/hWOX0B05nfdjP3CLQvvvbS
 atULHu+sfa93ikge+K0Y4cKtxPl9YUm06ALe+sdiodNma2oXbTy57XdKkWybR0BAgYdH3YJI
 jS3siq6puyetj3ri5f/fIna38zq+zUWJPV53HpcIWE/aEXT6vVy+ROlGdxPdHULmYjFM1nOD
 LZ26Q987WPhWbbKexdOuxFKckWioxVxUnAgA3oM6ZioEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsWy7bCSnO6s4onJBltmKltcuXiIyWLqwyds
 Fi8PaVp8u9LBZPHr/zMmi5eb3zA5sHls+NzE5rFz1l12j02rOtk85p0M9OjbsorRY/Pp6gC2
 KC6blNSczLLUIn27BK6MdyuusxTMU6g4c76LtYFxk3QXIyeHhICJROuBi2xdjFwcQgK7GSXa
 52xmhEhISHzb+ZUFwhaWuN9yhBWi6BmjxOanv5lBEmwCVhJ3m6aAdYsILGWU6F43mwkkISTA
 I/Fqw36gSRwcnAK8EhP+WYOEhQUcJRofzAcbyiKgInFs2yowm1fAUqL16F42CFtQ4uTMJ2Bx
 ZqDrGg93Q9nyEtvfzmGGOEhB4ufTZawgtoiAkcSXJ0dYIWpEJGZ3tjFPYBSahWTULCSjZiEZ
 NQtJywJGllWMkqkFxbnpucWGBYZ5qeV6xYm5xaV56XrJ+bmbGMExo6W5g3H7qg96hxiZOBgP
 MUpwMCuJ8L7Y2JssxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC18l4IYH0xJLU7NTUgtQimCwT
 B6dUA5OoSSHHbzO+vRvyw/bt28+y+t28eGM7qWCPNw0LHX5ek7y08dIf5ZXXJK98sHl///Ys
 s+N/YrYfKxPg/ipX9KOH4dKVk575k1bKcwbIWX9mWn16jv5UX95tusxmih5s5j8FWr6cPdic
 bSWQn9Jf61s64aT2xFenY8rkLW/IcJQpZnWWKf+9f/TM3Zjtmkc2HjbYLP/PdqLT8RMpXiJB
 h+VMlqdbHd7fp7N764+vvw8XGWtM4E4POuOSasJwYs/BCXHVD46+rnQ8Jpr9xE1u0WFhTm37
 T5eSUus9dJve/VVmbBXZGbt9msl0x/wZRzLn2q81fD1xmf8sPf6cb8ws979lJ1/ODOSbWV/D
 75Mcb6fEUpyRaKjFXFScCAAwqYHNCAMAAA==
X-CMS-MailID: 20221208051818epcas2p122a0ce58691ac70d8a77b5e922e81fea
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221208051818epcas2p122a0ce58691ac70d8a77b5e922e81fea
References: <CGME20221208051818epcas2p122a0ce58691ac70d8a77b5e922e81fea@epcas2p1.samsung.com>
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

If panic_on_warn is set and compress stream(DPCM) is started,
then kernel panic occurred because card->pcm_mutex isn't held appropriately.
In the following functions, warning were issued at this line
"snd_soc_dpcm_mutex_assert_held".

static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
		struct snd_soc_pcm_runtime *be, int stream)
{
	...
	snd_soc_dpcm_mutex_assert_held(fe);
	...
}

void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
{
	...
	snd_soc_dpcm_mutex_assert_held(fe);
	...
}

void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
			    int stream, int action)
{
	...
	snd_soc_dpcm_mutex_assert_held(rtd);
	...
}

int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir,
	int event)
{
	...
	snd_soc_dpcm_mutex_assert_held(fe);
	...
}

These functions are called by soc_compr_set_params_fe, soc_compr_open_fe
and soc_compr_free_fe
without pcm_mutex locking. And this is call stack.

[  414.527841][ T2179] pc : dpcm_process_paths+0x5a4/0x750
[  414.527848][ T2179] lr : dpcm_process_paths+0x37c/0x750
[  414.527945][ T2179] Call trace:
[  414.527949][ T2179]  dpcm_process_paths+0x5a4/0x750
[  414.527955][ T2179]  soc_compr_open_fe+0xb0/0x2cc
[  414.527972][ T2179]  snd_compr_open+0x180/0x248
[  414.527981][ T2179]  snd_open+0x15c/0x194
[  414.528003][ T2179]  chrdev_open+0x1b0/0x220
[  414.528023][ T2179]  do_dentry_open+0x30c/0x594
[  414.528045][ T2179]  vfs_open+0x34/0x44
[  414.528053][ T2179]  path_openat+0x914/0xb08
[  414.528062][ T2179]  do_filp_open+0xc0/0x170
[  414.528068][ T2179]  do_sys_openat2+0x94/0x18c
[  414.528076][ T2179]  __arm64_sys_openat+0x78/0xa4
[  414.528084][ T2179]  invoke_syscall+0x48/0x10c
[  414.528094][ T2179]  el0_svc_common+0xbc/0x104
[  414.528099][ T2179]  do_el0_svc+0x34/0xd8
[  414.528103][ T2179]  el0_svc+0x34/0xc4
[  414.528125][ T2179]  el0t_64_sync_handler+0x8c/0xfc
[  414.528133][ T2179]  el0t_64_sync+0x1a0/0x1a4
[  414.528142][ T2179] Kernel panic - not syncing: panic_on_warn set ...

So, I reposition and add pcm_mutex to resolve lockdep error.

Signed-off-by: Shinhyung Kang <s47.kang@samsung.com>
---
 sound/soc/soc-compress.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 870f13e1d389..7bce5088b455 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -149,6 +149,8 @@ static int soc_compr_open_fe(struct snd_compr_stream
*cstream)
 	if (ret < 0)
 		goto be_err;
 
+	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
+
 	/* calculate valid and active FE <-> BE dpcms */
 	dpcm_process_paths(fe, stream, &list, 1);
 	fe->dpcm[stream].runtime = fe_substream->runtime;
@@ -184,7 +186,6 @@ static int soc_compr_open_fe(struct snd_compr_stream
*cstream)
 	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN;
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
 
-	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
 	snd_soc_runtime_activate(fe, stream);
 	mutex_unlock(&fe->card->pcm_mutex);
 
@@ -215,7 +216,6 @@ static int soc_compr_free_fe(struct snd_compr_stream
*cstream)
 
 	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
 	snd_soc_runtime_deactivate(fe, stream);
-	mutex_unlock(&fe->card->pcm_mutex);
 
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
 
@@ -234,6 +234,8 @@ static int soc_compr_free_fe(struct snd_compr_stream
*cstream)
 
 	dpcm_be_disconnect(fe, stream);
 
+	mutex_unlock(&fe->card->pcm_mutex);
+
 	fe->dpcm[stream].runtime = NULL;
 
 	snd_soc_link_compr_shutdown(cstream, 0);
@@ -409,8 +411,9 @@ static int soc_compr_set_params_fe(struct
snd_compr_stream *cstream,
 	ret = snd_soc_link_compr_set_params(cstream);
 	if (ret < 0)
 		goto out;
-
+	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
 	dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_START);
+	mutex_unlock(&fe->card->pcm_mutex);
 	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_PREPARE;
 
 out:
-- 
2.21.0

