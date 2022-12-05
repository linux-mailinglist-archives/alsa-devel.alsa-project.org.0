Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 160CD6422A3
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 06:21:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7716116E1;
	Mon,  5 Dec 2022 06:20:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7716116E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670217673;
	bh=tN+Ew4srme7GLu+CPjif4UiGaQPZuhYy+q3wWMTlSWo=;
	h=From:To:Subject:Date:References:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Kor5Xgoe1QCbRjLyMRNlY14muuw0Av0z3IixpRR/4e0ckOYiofhMIUTowpP8xsivW
	 1MgipbTRSR8TuCb7rxdlHGmDeZ/tKZmHfosNnDZxAv9dNammlHQ4qt9567FWsbjWXx
	 vh6rglLE/fF4kk/GxhXxRxBDXdf+UO4xhHxsoJoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14242F8014C;
	Mon,  5 Dec 2022 06:20:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41022F80236; Mon,  5 Dec 2022 06:20:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,PRX_APP_IMAGE_GIF,PRX_BODY_135,
 SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C3F1F8014C
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 06:20:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C3F1F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="oIe8esDD"
Received: from epcas3p1.samsung.com (unknown [182.195.41.19])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20221205052003epoutp01d10ec1c7e2e1c5f50bd7671087ca8668~tzg_iU2db2033520335epoutp01c
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 05:20:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20221205052003epoutp01d10ec1c7e2e1c5f50bd7671087ca8668~tzg_iU2db2033520335epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1670217603;
 bh=6Rqz+EvWCVPMxY0cLvVFRApo6ghuuhRag10/Hwe9+CY=;
 h=From:To:Subject:Date:References:From;
 b=oIe8esDD6uKzTl7+AiKiPqSHy0INfsC3vepaJJKAFJ38k6EJiEvxsiXKJeoAMv0GG
 9QFIMuwzwA/Sb5DLKg0zkpGQ/n7CcIFOP8Mu/UBwt7TqXfFWnQ8PbvmN7jmH45MOhS
 XqaMulBxwWL9401EMYaPWPsQyxtij9igmgv3LkUk=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas3p3.samsung.com (KnoxPortal) with ESMTP id
 20221205052003epcas3p33f3e68d09c43dd3425a19ed9be31e5ff~tzg_X3O9v0718707187epcas3p3R;
 Mon,  5 Dec 2022 05:20:03 +0000 (GMT)
Received: from epcpadp3 (unknown [182.195.40.17]) by epsnrtp4.localdomain
 (Postfix) with ESMTP id 4NQX1H16yCz4x9Px; Mon,  5 Dec 2022 05:20:03 +0000
 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20221205051742epcas2p4e4724276da916d308b9c1a4aaccca672~tze7vT1hX2694026940epcas2p4-;
 Mon,  5 Dec 2022 05:17:42 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221205051742epsmtrp1f7333cdf3381a608be069b04f5f74d9e~tze7ujGkn2933429334epsmtrp1n;
 Mon,  5 Dec 2022 05:17:42 +0000 (GMT)
X-AuditID: b6c32a29-a83ff70000003838-89-638d7ef6cc85
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 9D.0F.14392.6FE7D836; Mon,  5 Dec 2022 14:17:42 +0900 (KST)
Received: from KORDO035882 (unknown [12.36.182.71]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20221205051742epsmtip24d85c59ae85d6669ad3cb1c9061ab959~tze7fgxpb0363703637epsmtip23;
 Mon,  5 Dec 2022 05:17:42 +0000 (GMT)
From: =?ks_c_5601-1987?B?sK29xcf8?= <s47.kang@samsung.com>
To: <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
 <tiwai@suse.de>, <lgirdwood@gmail.com>,
 <pierre-louis.bossart@linux.intel.com>, <broonie@kernel.org>,
 <cpgs@samsung.com>
Subject: [PATCH] ASoC: soc-compress: Reposition and add pcm_mutex
Date: Mon, 5 Dec 2022 14:17:42 +0900
Message-ID: <700072760.81670217603154.JavaMail.epsvc@epcpadp3>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdkIUyM7kVZTMc0ySgKMyZcLP9kzGA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpikeLIzCtJLcpLzFFi42LZdlhJXvdbXW+ywcW5hhZXLh5ispj68Amb
 xctDmhavDu9itPh2pYPJ4tf/Z0wWLze/YXJg99jwuYnNY+esu+wem1Z1snnMOxno8e3MRBaP
 vi2rGD02n64OYI/isklJzcksSy3St0vgyng/tY254NtRxoplcxYyNjB+3MzYxcjJISFgInGy
 ZR57FyMXh5DAbkaJ1kU3oBISEt92fmWBsIUl7rccYYUoesYo8extExNIgk3ASuJu0xQ2kISI
 wGlGidtTN7GBJIQFHCUaH8wH62YRUJHofrOEFcTmFbCUuNb5lQnCFpQ4OfMJWA2zQLTEjGV9
 TBDbFCR+Pl0GVi8ioCexddYsdogaEYnZnW3MExj5ZyFpn4WkfRaSMgjbRKLxcDdUjbzE9rdz
 oOLGEheaGhghbG2JZQtfMy9gZF/FKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREcTVqa
 Oxi3r/qgd4iRiYPxEKMEB7OSCK/a4p5kId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwXuk7GCwmk
 J5akZqemFqQWwWSZODilGphO11sVGmrfdGZbL/Ui+9tugbevE65J/3KyDOYOsPhYuvbQhgK+
 aUeOOETI7FnQnFs9f6Zb3B+pcFt5a3ONu+GvZ0poRRhEHeIyV0nwa06dpaK/+Jx2/N7n71OL
 bt00XsR/dRefhPKh7R8cTz9Kv7H33/326FVPBY+bNOt8eXWUZ+fSWyEB1vO29yzrYVUJLdws
 tX4985S7PxeVXPu0PMa572JsyMsQjihV9R2lR2ZOmqNybavhr44p7W7104Q1z0znKLgW+OFs
 oYh6QXhh8LSmDacZ2Ze3s0qmr2tVstgkdMFVv2m1qYj+O7P0DPE1r2dmnNxucXyG6oubB7uy
 itcdLS9wnbWiVXXSksjZTEJKLMUZiYZazEXFiQBO8lqUFQMAAA==
X-CMS-MailID: 20221205051742epcas2p4e4724276da916d308b9c1a4aaccca672
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20221205051742epcas2p4e4724276da916d308b9c1a4aaccca672
References: <CGME20221205051742epcas2p4e4724276da916d308b9c1a4aaccca672@epcas2p4.samsung.com>
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

From 3f8fd1efedd77331d948b16a8e44ffa6cf0e811f Mon Sep 17 00:00:00 2001

From: "s47.kang" <s47.kang@samsung.com>

Date: Fri, 2 Dec 2022 18:32:35 +0900

Subject: [PATCH] [COMMON] ASoC: soc-compress.c: Reposition and add
pcm_mutex.

 

If panic_on_warn is set and compress stream(DPCM) is started,

then kernel panic will occurs because card->pcm_mutex isn't held
appropriately in

soc_compr_set_params_fe, soc_compr_open_fe and soc_compr_free_fe.

So, I reposition and add pcm_mutex to resolve lockdep error.

 

Change-Id: I15981b4f09b0bff37e7e98e6ee1f809339b2bcc4

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

+         mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);

+

         /* calculate valid and active FE <-> BE dpcms */

         dpcm_process_paths(fe, stream, &list, 1);

         fe->dpcm[stream].runtime = fe_substream->runtime;

@@ -184,7 +186,6 @@ static int soc_compr_open_fe(struct snd_compr_stream
*cstream)

         fe->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN;

         fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;

-          mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);

         snd_soc_runtime_activate(fe, stream);

         mutex_unlock(&fe->card->pcm_mutex);

@@ -215,7 +216,6 @@ static int soc_compr_free_fe(struct snd_compr_stream
*cstream)

          mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);

         snd_soc_runtime_deactivate(fe, stream);

-          mutex_unlock(&fe->card->pcm_mutex);

          fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;

@@ -234,6 +234,8 @@ static int soc_compr_free_fe(struct snd_compr_stream
*cstream)

          dpcm_be_disconnect(fe, stream);

+         mutex_unlock(&fe->card->pcm_mutex);

+

         fe->dpcm[stream].runtime = NULL;

          snd_soc_link_compr_shutdown(cstream, 0);

@@ -409,8 +411,9 @@ static int soc_compr_set_params_fe(struct
snd_compr_stream *cstream,

         ret = snd_soc_link_compr_set_params(cstream);

         if (ret < 0)

                    goto out;

-

+         mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);

         dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_START);

+         mutex_unlock(&fe->card->pcm_mutex);

         fe->dpcm[stream].state = SND_SOC_DPCM_STATE_PREPARE;

 out:

--

2.21.0

 

